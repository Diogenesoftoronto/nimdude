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
	nimVersions := []string{"latest"}
	// goVersions := []string{"1.18", "1.19"}

	// initialize Dagger client
	client, err := dagger.Connect(ctx, dagger.WithLogOutput(os.Stdout), dagger.WithWorkdir(".."))
	if err != nil {
		return err
	}
	defer client.Close()

	// get reference to the local project
	src := client.Host().Directory(".")
	fmt.Printf("src: %s\n", *src)

	// create empty directory to put build outputs
	// TODO: this directory should be named after the project
	outputs := client.Directory()
	for _, nimVersion := range nimVersions {
		fmt.Printf("Build for Nim versions: %s\n", nimVersion)
		// for _, goVersion := range goVersions {
		// fmt.Printf("Build for Go versions: %s\n", goVersion)
		// get `golang` image for specified Go version
		// goImageTag := fmt.Sprintf("golang:%s", goVersion)
		// golang := client.Container().From(goImageTag)

		// get nim image for specified nim version
		nimImageTag := "nimlang/nim"
		nimlang := client.Container().From(nimImageTag)

		// mount cloned repository into `golang` image
		// golang = golang.WithMountedDirectory("/src", src).WithWorkdir("/src")
		// mount cloned repository into `nim` image
		nimlang = nimlang.WithMountedDirectory("/src", src).WithWorkdir("/src")

		// create a directory for each os, arch and version
		path := fmt.Sprintf("build/%s/%s/", nimVersion, "alpine")

		// build application
		// gobuild := golang.WithExec([]string{"go", "build", "-o", path})
		nimbuild := nimlang.WithExec([]string{"nim", "js", "--out:" + path, "./frontend/app.nim"})
		// copy build artifacts to root directory of the project
		fmt.Println("Copying build artifacts to root directory of the project")
		// fmt.Printf("gobuild: %v\n", *gobuild)
		fmt.Printf("nimbuild: %v\n", *nimbuild)
		// get alpline image
		// alpine := client.Container().From("alpine")
		// mount cloned repository into `alpine` image
		// alpine = alpine.WithMountedDirectory("/src", src).WithWorkdir("/src")
		// copy build artifacts to root directory of the project
		// gobuild.WithExec([]string{"cp", path, "."})
		// nimbuild.WithExec([]string{"cp", path, "."})

		// get reference to build output directory in container
		// outputs = outputs.WithDirectory(path, golang.Directory(path))
		// fmt.Printf("golang outputs: %v\n", outputs)

		outputs = outputs.WithDirectory(path, nimlang.Directory(path))
		fmt.Printf("nimlang outputs: %v\n", *outputs)

		// }
	}
	// write build artifacts to host
	_, err = outputs.Export(ctx, ".")
	if err != nil {
		return err
	}
	return nil
}
// Create a new Dagger client
// ctx := context.Background()
// daggerClient, err := dagger.Connect(ctx, dagger.WithLogOutput(os.Stdout))
// if err != nil {
// 	panic(err)
// }
// defer daggerClient.Close()

// // Get the working directory on the host
// source := daggerClient.Host().Directory(".", dagger.HostDirectoryOpts{
// 	Exclude: []string{"ci"},
// })

// // Build the Go binary
// builder := daggerClient.Container(dagger.ContainerOpts{Platform: "linux/amd64"}).
// 	From("golang:1.17-alpine").
// 	WithMountedDirectory("/app", source).
// 	WithWorkdir("/app").
// 	WithExec([]string{"go", "build", "-o", "build"}).
// 	WithFile("/app/.env", source.File(".env"))

// // Create the final container image
// image := builder.
// 	CopyFrom("/app/build", "/app/build").
// 	From("alpine:latest").
// 	WithFile("/app/.env", builder.File("/app/.env")).
// 	WithEntrypoint([]string{"/app/build"}).
// 	WithExposedPort(8080)

// // Publish the container image to a registry
// publishAddress := "my-registry.com/my-image"
// imageRef, err := image.Publish(ctx, publishAddress)
// if err != nil {
// 	panic(err)
// }

// // Print the Docker image reference
// fmt.Println("Published at:", imageRef)