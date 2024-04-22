.PHONY: docker docker-run

docker:
	docker build -t spiceai-homebrew-update-version .

docker-run: docker
	docker run -v $(PWD):/root -it spiceai-homebrew-update-version $(version)
