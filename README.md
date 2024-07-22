# Infrastructure

## Overview

I use this repository for my personal applications. It uses a combination of Docker and Makefile targets to provide a smooth DX. Feel free to fork/use as you wish!

## Prerequisites

To use this repository make sure you have the following installed:

1. [Docker](https://docs.docker.com/get-docker/)
2. [make](https://formulae.brew.sh/formula/make)

**Note:** Make sure you are using the latest version of make (which is installed as gmake). Instructions are available in the link above on the Homebrew Formulae page.

## How To Use

You can see a list of available commands by executing:

```sh
make
```

### Example Commands

```sh
# Setup all services
make setup
# Open a Redis CLI
make redis/cli
# Open Vault Web UI
make vault/web
```
