package main

import (
	"fmt"
	"os"
	"os/exec"
)

func Build() {
	// Set the working directory
	// os.Chdir("/")

	// Build the application

	if err := exec.Command("go", "build", "-o", "bin").Run(); err != nil {
		panic(fmt.Errorf("error building application: %v", err))
	}

	if err := exec.Command("nim", "js", "-o", "app").Run(); err != nil {
		panic(fmt.Errorf("error building application: %v", err))
	}

	// Create the Dockerfile
	file, err := os.Create("Dockerfile")
	if err != nil {
		panic(fmt.Errorf("error creating Dockerfile: %v", err))
	}
	defer file.Close()

	// Write the contents of the Dockerfile
	file.WriteString("FROM golang:1.18\n")
	file.WriteString("COPY app /app\n")
	file.WriteString("CMD [\"/app\"]\n")

	// Build the Docker image
	cmd := exec.Command("docker", "build", "-t", "myapp:latest", ".")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err = cmd.Run()
	if err != nil {
		panic(fmt.Errorf("error building Docker image: %v", err))
	}

	fmt.Println("Docker image built successfully!")
}
