package main

import (
	"errors"
	"flag"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"

	conf "github.com/spf13/viper"
)

var tmpls = template.Must(template.ParseFiles("public/index.html"))

func Index(w http.ResponseWriter, r *http.Request) {
	data := struct {
		Title string
	}{
		Title: "Index Page",
	}
	err := tmpls.ExecuteTemplate(w, "index.html", data)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		log.Fatalf("error executing template: %s", err)
	}

}

func startServer() {
	// Serve the index.html file when a request is made to the root URL
	http.HandleFunc("/", Index)
	http.HandleFunc("/js/", http.StripPrefix("/js/", http.FileServer(http.Dir("public/js/"))).ServeHTTP)
	http.HandleFunc("/css/", http.StripPrefix("/css/", http.FileServer(http.Dir("public/css/"))).ServeHTTP)

	port := confEnvVariable("port", nil)
	if debug := confEnvVariable("debug", nil); debug != "true" {
		file, err := os.OpenFile("logs.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0666)
		if err != nil {
			log.Fatal(err)
		}
		log.SetOutput(file)
	}

	log.Printf("Listening on http://localhost:%s...\n", port)
	err := http.ListenAndServe(":"+port, nil)
	if errors.Is(err, http.ErrServerClosed) {
		log.Printf("server closed\n")
	} else if err != nil {
		log.Fatalf("error starting server: %s\n", err)
	}
}

func main() {
	// Create a struct with server configuration
	type Config struct {
		Port  string
		Debug bool
		Build bool
		help  bool
	}

	var conf Config

	// add the port number as a flag
	flag.StringVar(&conf.Port, "port", "8080", "port number to listen on, overrided by the config file")
	flag.BoolVar(&conf.Debug, "debug", false, "starts the server in debug mode, overrided by the config file")
	flag.BoolVar(&conf.Build, "build", false, "builds docker image, overrided by the config file")
	flag.BoolVar(&conf.help, "help", false, "Get a list of all the commands")
	flag.Parse()

	if conf.help {
		fmt.Println("Welcome to Nimdude!")
		fmt.Println("Available commands:")
		flag.PrintDefaults()
		os.Exit(0)
	}

	if conf.Build {
		Build()
		os.Exit(0)
	}
	
	// Start the server and listen for incoming requests
	startServer()

}

func confEnvVariable(key string, config *string) string {

	if config == nil {
		str := ".env"
		config = &str
	}
	configstr := *config
	// Set the file name of the configuration file
	conf.SetConfigFile(configstr)
	if err := conf.ReadInConfig(); err != nil {
		log.Fatalf("Error reading config file, %s", err)
	}

	// Use env variables to set the port and other variables
	v, ok := conf.Get(key).(string)
	if !ok {
		log.Fatalf("Invalid type assertion")
	}
	// Start the server and listen for incoming requests
	return v
}
