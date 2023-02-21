package nimdude

import (
	"fmt"
	"os"
	"os/exec"
)

func Build() {
	// Set the working directory
	// os.Chdir("/")

	// Install dependencies
	if err := exec.Command("nimble", "install").Run(); err != nil {
		panic(fmt.Errorf("error installing dependencies: %v", err))
	}

	if err := exec.Command("go", "mod", "tidy").Run(); err != nil {
		panic(fmt.Errorf("error installing dependencies: %v", err))
	}

	// Build the application
	if err := exec.Command("nim", "js", "-o:./public/js/app.js", "./frontend/app.nim").Run(); err != nil {
		panic(fmt.Errorf("error building application: %v", err))
	}

	if err := exec.Command("go", "build", "-o", "build").Run(); err != nil {
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
	file.WriteString("FROM nimlang:nim\n")
	file.WriteString("COPY build /build\n")
	file.WriteString("CMD [\"/build\"]\n")

	// Build the Docker image
	cmd := exec.Command("docker", "build", "-t", "nimdude:latest", ".")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err = cmd.Run()
	if err != nil {
		panic(fmt.Errorf("error building Docker image: %v", err))
	}

	fmt.Println("Docker image built successfully!")
}
