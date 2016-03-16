
GIT_COMMIT:=$(shell git rev-parse --short HEAD)

.PHONY: build
build: Dockerfile
	docker build -t anoopprasad/apollo-workshop .

.PHONY: push
push: build
	docker tag anoopprasad/apollo-workshop anoopprasad/apollo-workshop:$(GIT_COMMIT)
	docker push anoopprasad/apollo-workshop:$(GIT_COMMIT)

.PHONY: deploy
deploy: push
	apollo deploy -e production -m bikroy -t $(GIT_COMMIT)
