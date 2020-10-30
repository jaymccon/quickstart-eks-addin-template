.PHONY: init dev eks docs lint

AWS_PROFILE ?= default
CLUSTER_NAME ?= eks-dev
AWS_REGION ?= $(shell aws configure get region --profile $(PROFILE))
AWS_KEYPAIR ?=
PROJECT_NAME ?=
PPNAMELD = $(shell echo "$(PROJECT_NAME)" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
PPNAMEC = $(shell echo "$(PROJECT_NAME)" | sed -r 's/(^| )([a-z])/\U\2/g' | sed 's/ //g')

init:
	PROJECT_NAME="$(PROJECT_NAME)" PPNAMELD=$(PPNAMELD) PPNAMEC=$(PPNAMEC) ./build/init.sh

dev:
	./build/dev.sh

eks:
	./build/eks.sh

docs:
	./build/docs.sh

lint:
	cfn-lint ./templates/*
