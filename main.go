package main

import (
	"errors"
	"html/template"
	"log"
	"net/http"
	"os"

	conf "github.com/spf13/viper"
)

var tmpls = template.Must(template.ParseFiles("public/index.html"))

func Index(w http.ResponseWriter, r *http.Request) {
	err := tmpls.ExecuteTemplate(w, "index.html", nil)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		log.Fatalf("error executing template: %s", err)
	}

}

func main() {
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
