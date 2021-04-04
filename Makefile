IMAGE_NAME=mastergalen/libpostal-rest

# HELP
# This will output the help for each task
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

pull: ## Download the latest container from the container registry
	docker pull $(IMAGE_NAME)

build: ## Build the container
	docker build \
	--build-arg=COMMIT=master \
	-t $(IMAGE_NAME) .

publish: build ## Publish latest version
	docker push $(IMAGE_NAME):latest
