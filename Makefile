MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := serve
.DELETE_ON_ERROR:
.SUFFIXES:

.PHONY: serve
serve: image
	docker run --rm -it --volume="${PWD}:/srv/jekyll" -p 4000:4000 corvus-ch/corvus-ch.name jekyll serve

.PHONY: image
image: Dockerfile Gemfile Gemfile.lock
	docker build -t corvus-ch/corvus-ch.name .

.PHONY: clean
clean:
	docker rmi corvus-ch/corvus-ch.name
