# Nimdude

[![Go Report Card](https://goreportcard.com/badge/github.com/brandonc/nimdude)](https://goreportcard.com/report/github.com/brandonc/nimdude)
[![Go Reference](https://pkg.go.dev/badge/github.com/brandonc/nimdude.svg)](https://pkg.go.dev/github.com/brandonc/nimdude)
[![License](https://img.shields.io/github/license/brandonc/nimdude)]

## Description

Nimdude is a personal site built with [Nim](https://nim-lang.org/) and Go (for the backend). It uses [karax](https://github.com/karaxnim/karax) as a frontend ui library. It's a work in progress, but it's a good example of how to use Go and Karax together.

## Table of Contents

- [Nimdude](#nimdude)
  - [Description](#description)
  - [Table of Contents](#table-of-contents)
  - [Long Description](#long-description)
  - [Movitivation](#movitivation)
  - [Features](#features)
  - [Installation](#installation)
    - [Installation from source](#installation-from-source)
    - [Installation from Docker](#installation-from-docker)
  - [Documentation](#documentation)
  - [Contributing](#contributing)


## Long Description

I initially started this project with using prologue but I decided against as server side generation of code is not what I am looking for. Instead I am going to be using karax to generate the html, and the nim rst2html library to generate the blog posts. I will also be using the nimble package manager to manage the dependencies. I will then use a Go backend to serve the static files and handle the api calls. Probably with encore as that is what I am currently using but I am considering just using the standard http library. Especially as I am not using any of the special features of encore for this project. I want to get more familiar with using the standard library and the basics. I can always continue using encore later.

The same is the case for creating dockerfiles. I initially thought of doing so using Dagger, but I found this to be a bit difficult and maybe overkill for this project. A normal dockerfile generate via go should be fine and I can always use Dagger later aswell.

The current plan is to take the generated rst2html and then pipe that through the html2karax to generate the karax code. I will then use the karax code to generate the html. If that sounds convulted and unnecessary it makes more sense if you think of it like taking a static base and adding the dynamic content to it later. I am not sure if this is the best way to do it, but it is the way I am going to do it for now. I will probably change it later.

## Movitivation

I built this site because I was having major issues working with the vugu library in the go world. Decided to try out Nim and Prologue since I was already using Go for the backend. It gives me a chance to see how well the two languages work together and how well I like using nim. I always wanted to try out nim, but I never had a good reason to use it. I'm hoping this will be a good reason.

## Features

- Custom Cyberpunk Theme: The site features a unique and immersive cyberpunk theme, with a focus on incorporating futuristic and glitchy elements inspired by classic 80's video games.__WIP__
- Search Component: The site includes a powerful search component that allows visitors to quickly find specific content on the site.
- Hero Section: The hero section is a visually impactful area at the top of the site that immediately captures the attention of visitors and highlights key information about me and my skills.
- About Section: The about section provides visitors with a brief overview of my background and experience as a software engineer.
- Projects Section: The projects section showcases my most recent and notable projects, providing visitors with a quick overview of each project and a link to the project's GitHub repository.
- Blog Section: The blog section features a collection of my most recent blog posts, providing visitors with a quick overview of each post and a link to the post's page on the site.
- Contact Section: The contact section provides visitors with a variety of ways to get in touch with me, including my email address, GitHub profile, and LinkedIn profile.
- Social Media Links: The site includes links to my GitHub, GitLab, and LinkedIn profiles, providing visitors with a quick and easy way to connect with me on social media.
- GitHub and GitLab Stats: The site displays real-time statistics from my GitHub and GitLab profiles, providing visitors with an up-to-date look at my activity and contributions to the open source community. __WIP__

## Installation

### Installation from source

You'll need to install Nim, nimble and Go. Then you can run the following commands:

```sh
git clone <this_repo>
```

```sh
cd nimdude
```

```sh
nimble install karax
```

```sh
nim js -o:./public/js/app.js  ./frontend/app.nim   
```

```sh
go mod tidy
```

```sh
go run main.go
```

Alternatively, the project can be built using main, this builds a docker container as well and automagically launches the server. 

_This is the preferred method of running the project._

```sh
go run main.go -build
```

### Installation from Docker

You'll need to install Docker. Then you can run the following commands:

```sh
docker pull nimdude
```

```sh
docker run -p 8080:8080 nimdude
```

Note that the Docker image is now __available__!

__Keep in mind that this was built using Nim 1.6.0 and Go 1.18.1. It may not work with older versions of Nim or Go. Haven't tested it with newer versions yet__.

Nimdude should be running on [http://localhost:8080](http://localhost:8080) unless changed in the .env file.

## Documentation

For more information on how to use Prologue and Karax, visit their respective websites:

Prologue documentation
Karax documentation
Additionally, you may find the Nim documentation helpful as you work with Nimdude:

Nim documentation
If you have any questions or comments about Nimdude, please feel free to contact the Nimdude team via the email address listed in the Contact section of the site.

## Contributing

You're crazy if you want to contribute to Nimdude, but if you're feeling extra spicy and want to jump in, go ahead and open a PR. Just know that we have a strict "no clowns allowed" policy. Head to the [TODO.md](TODO.md) file for a list of things that need to be done.

If you're brave enough to contribute, here are some tips:

- Make sure to wear your lucky socks while coding.
- You must include at least one cyberpunk reference in your code.
- If you're feeling stuck, take a break and watch Blade Runner for inspiration.
- I only accept contributions written in haiku form.
- Don't forget to pet your cat every time you make a new commit.

Happy contributing!
