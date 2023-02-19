package main

import (
	"context"
	"fmt"
	"os"

	"dagger.io/dagger"
)

func main() {
	if err := build(context.Background()); err != nil {
		fmt.Println(err)
	}
}

func build(ctx context.Context) error {
	fmt.Println("Building with Dagger")

	// define build matrix
	nimVersions := []string{"1.6.0"}
	goVersions := []string{"1.18", "1.19"}

	// initialize Dagger client
	client, err := dagger.Connect(ctx, dagger.WithLogOutput(os.Stdout), dagger.WithWorkdir(".."))
	if err != nil {
		return err
	}
	defer client.Close()

	// get reference to the local project
	src := client.Host().Directory(".")

	// create empty directory to put build outputs
	// TODO: this directory should be named after the project
	outputs := client.Directory()
	for _, nimVersion := range nimVersions {
		for _, goVersion := range goVersions {
			// get `golang` image for specified Go version
			goImageTag := fmt.Sprintf("golang:%s", goVersion)
			golang := client.Container().From(goImageTag)

			// get nim image for specified nim version
			nimImageTag := fmt.Sprintf("golang:%s", nimVersion)
			nim := client.Container().From(nimImageTag)
			
			// mount cloned repository into `golang` image
			golang = golang.WithMountedDirectory("/src", src).WithWorkdir("/src")
			nim = nim.WithMountedDirectory("/src", src).WithWorkdir("/src")

			// create a directory for each os, arch and version
			path := fmt.Sprintf("build/%s/%s/%s/", nimVersion, goVersion, "linux")
			
			// build application
			build = build.WithExec([]string{"go", "build", "-o", path})
			build = build.WithExec([]string{"karen", "r", "-o:" + path, "main.nim"})

			// get reference to build output directory in container
			outputs = outputs.WithDirectory(path, build.Directory(path))
		}
	}
	// write build artifacts to host
	_, err = outputs.Export(ctx, ".")
	if err != nil {
		return err
	}
	return nil
}
