
GIT_COMMIT:=$(shell git rev-parse --short HEAD)

.PHONY: build
build: Dockerfile
	docker build -t anoop/apollo-workshop .

.PHONY: push
push: build
	docker tag anoop/apollo-workshop anoop/apollo-workshop:$(GIT_COMMIT)
	docker push anoop/apollo-workshop:$(GIT_COMMIT)

.PHONY: deploy
deploy: push
	bin/apollo deploy -e production -m bikroy -t $(GIT_COMMIT)
