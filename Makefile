.PHONY: notebooks clear pdfs requirements venv test lab lint format

ALL_PDFS=$(patsubst src/%,pdfs/%,$(wildcard src/*.pdf))
ALL_NOTEBOOKS=$(wildcard notebooks/*.ipynb)

pdfs/%: src/%
	mutool clean -c $< $@ 

clear:
	find pdfs -type f -exec rm {} \;

pdfs: $(ALL_PDFS)

requirements: config/requirements.in
	@cd config && uv pip compile requirements.in > requirements.txt

venv: config/requirements.txt
	@uv venv
	@uv pip install -r config/requirements.txt

test:
	nbexec notebooks

lab:
	jupyter lab

lint:
	nbqa black --check notebooks
	nbqa isort --check notebooks
	nbqa flake8 notebooks --max-line-length 88

format:
	nbqa black notebooks
	nbqa isort notebooks

notebooks:
	nbexec notebooks
