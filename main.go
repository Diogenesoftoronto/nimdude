package main

import (
	"errors"
	"flag"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"
	"os/exec"
	"strings"

	conf "github.com/spf13/viper"
)

type Config struct {
	Port  string
	Debug bool
	Build bool
	File  string
	help  bool
}

var tmpls = template.Must(template.ParseFiles("public/index.html"))

func Index(w http.ResponseWriter, r *http.Request) {
	data := struct {
		Title string
	}{
		Title: "Index Page",
	}
	log.Printf("Request: %v\n", r)
	log.Printf("Request URL: %s", r.RequestURI)
	// if request is for a file check the mime type
	// Get the file extension from the URL
	// Get the MIME type for the file extension
	if strings.Contains(r.RequestURI, ".js") {
		w.Header().Set("Content-Type", "application/javascript")
	} else if strings.Contains(r.RequestURI, ".css") {
		w.Header().Set("Content-Type", "text/css")
	} else if strings.Contains(r.RequestURI, ".png") {
		w.Header().Set("Content-Type", "image/png")
	} else if strings.Contains(r.RequestURI, ".jpg") {
		w.Header().Set("Content-Type", "image/jpg")
	} else if strings.Contains(r.RequestURI, ".svg") {
		w.Header().Set("Content-Type", "image/svg+xml")
	} else if strings.Contains(r.RequestURI, ".ico") {
		w.Header().Set("Content-Type", "image/x-icon")
	}

	err := tmpls.ExecuteTemplate(w, "index.html", data)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		log.Fatalf("error executing template: %s", err)
	}
}

// add detect mimetypes for js files
func serveJs(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/javascript")
	http.StripPrefix("/js/", http.FileServer(http.Dir("public/js/"))).ServeHTTP(w, r)
	log.Printf("Request Header: %s\n", w.Header())
}

func startServer(c Config) {
	// Serve the index.html file when a request is made to the root URL
	mux := http.NewServeMux()
	mux.HandleFunc("/", Index)
	mux.HandleFunc("/js/", serveJs)
	mux.HandleFunc("/css/", http.StripPrefix("/css/", http.FileServer(http.Dir("public/css/"))).ServeHTTP)
	mux.HandleFunc("/static/images/", http.StripPrefix("/static/images/", http.FileServer(http.Dir("public/static/images/"))).ServeHTTP)

	port := confEnvVariable("port", &c.File)
	if c.Port == "" {
		c.Port = port
	}
	
	if port == "" {
		var ok bool
		c.Port, ok = os.LookupEnv("PORT")
		if !ok {
			c.Port = "9090"
		}
	}

	debug := confEnvVariable("debug", &c.File)
	if !c.Debug && debug == "" {
		c.Debug = false
	} else if debug == "true" {
		c.Debug = true
	}

	if c.Debug {
		file, err := os.OpenFile("logs.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0666)
		if err != nil {
			log.Fatal(err)
		}
		log.SetOutput(file)
	}

	log.Printf("Listening on http://localhost:%s...\n", c.Port)
	err := http.ListenAndServe(":"+c.Port, mux)
	if errors.Is(err, http.ErrServerClosed) {
		log.Printf("server closed\n")
	} else if err != nil {
		log.Fatalf("error starting server: %s\n", err)
	}
}

func main() {
	fmt.Println("Welcome to Nimdude!")
	// Create a struct with server configuration

	var Conf Config

	// add the port number as a flag
	flag.StringVar(&Conf.Port, "port", "", "port number to listen on, overrides the config file")
	flag.BoolVar(&Conf.Debug, "debug", false, "starts the server in debug mode, overrides the config file")
	flag.BoolVar(&Conf.Build, "build", false, "builds docker image, overrides the config file")
	flag.BoolVar(&Conf.help, "help", false, "Get a list of all the commands")
	// add config file as a flag
	flag.StringVar(&Conf.File, "config", "", "config file (default is .env)")
	flag.Parse()

	if Conf.help {
		fmt.Println("Available commands:")
		flag.PrintDefaults()
		os.Exit(0)
	}

	if Conf.Build {
		if err := build(); err != nil {
			panic(err)
		}
	}

	// Start the server and listen for incoming requests
	startServer(Conf)

}

func confEnvVariable(key string, config *string) string {

	if config == nil || *config == "" {
		str := ".env"
		config = &str
	}
	configstr := *config
	// Set the file name of the configuration file
	conf.SetConfigFile(configstr)
	if err := conf.ReadInConfig(); err != nil {
		log.Printf("error reading config file: %s\n using default instead", err)
		return ""
	}

	// Use env variables to set the port and other variables
	value, ok := conf.Get(key).(string)
	if !ok {
		log.Fatalf("Invalid type assertion")
	}
	// Start the server and listen for incoming requests
	return value
}

func build() error {
	// Set the working directory
	fmt.Print(os.Getwd())
	// os.Chdir("/")

	// if the build directory doesn't exist, create it
	if _, err := os.Stat("build"); os.IsNotExist(err) {
		if err := os.Mkdir("build", 0755); err != nil {
			return fmt.Errorf("error creating build directory: %v", err)
		}
	}
	// Install dependencies
	if err := exec.Command("nimble", "install", "karax", "-y").Run(); err != nil {
		return fmt.Errorf("error installing dependencies: %v", err)
	}

	if err := exec.Command("go", "mod", "tidy").Run(); err != nil {
		return fmt.Errorf("error installing dependencies: %v", err)
	}

	// Build the application
	if err := exec.Command("nim", "js", "-d:size",  "-o:./public/js/app.js", "./frontend/app.nim").Run(); err != nil {
		return fmt.Errorf("error building application: %v", err)
	}

	if err := exec.Command("go", "build", "-o", "build").Run(); err != nil {
		return fmt.Errorf("error building application: %v", err)
	}

	// Create the Dockerfile
	file, err := os.Create("Dockerfile")
	if err != nil {
		return fmt.Errorf("error creating Dockerfile: %v", err)
	}
	defer file.Close()

	// Write the contents of the Dockerfile
	file.WriteString(`# This is a generated Dockerfile
FROM ubuntu:latest
FROM golang:1.18

WORKDIR /app

COPY ./go.mod .

COPY ./go.sum .

COPY ./public ./public

COPY main.go .

ARG PORT

ENV PORT $PORT

RUN go build -o build

RUN go mod download
EXPOSE 8080

# Set the command to start the app
CMD ["./build"]`)

	// Build the Docker image
	cmd := exec.Command("docker", "build", "-t", "nimdude", "--build-arg", "PORT=$PORT", ".")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err = cmd.Run()
	if err != nil {
		panic(fmt.Errorf("error building Docker image: %v", err))
	}

	fmt.Println("Docker image built successfully!")

	return nil
}
