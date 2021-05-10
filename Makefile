.ONESHELL:
.SHELL := /usr/bin/bash
RANDOM := $(shell bash -c 'echo $$RANDOM')
BACKEND?=../../smart-backend
ENV?=dev

# cnf ?= .env
# include $(cnf)
# export $(shell sed 's/=.*//' $(cnf))

# Get the latest tag
TAG=$(shell git describe --tags --abbrev=0)
GIT_COMMIT=$(shell git log -1 --format=%h)

CASE?=case


.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

example:
	@mkdir -p examples/${CASE}
	@touch main.tf variables.tf output.tf