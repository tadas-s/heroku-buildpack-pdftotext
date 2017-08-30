build: build-heroku-16 build-cedar-14 build-cedar-10

build-heroku-16:
	@echo "Building pdftotext in docker for heroku-16..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-16" heroku/heroku:16-build bash -c 'cd /buildpack; scripts/build_pdftotext /buildpack/bin/pdftotext-heroku-16'
	@echo ""

build-cedar-14:
	@echo "Building pdftotext in docker for cedar-14..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=cedar-14" heroku/cedar:14 bash -c 'cd /buildpack; scripts/build_pdftotext /buildpack/bin/pdftotext-cedar-14'
	@echo ""

build-cedar-10:
	@echo "Building pdftotext in docker for cedar..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=cedar" heroku/cedar bash -c 'cd /buildpack; scripts/build_pdftotext /buildpack/bin/pdftotext-cedar'
	@echo ""

shell:
	@echo "Opening heroku-16 shell..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-16" -e "PORT=5000" heroku/heroku:16-build bash -c 'cd /buildpack; bash'
	@echo ""
