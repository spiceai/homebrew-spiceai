.PHONY: docker docker-run

docker:
	docker build -t spiceai-homebrew-update-version - < Dockerfile

docker-run: docker
	docker run -v $(PWD):/root -it spiceai-homebrew-update-version $(version)
	@git diff
	@echo "===== see above diff ======"
	@echo "you can do a git commit now"
