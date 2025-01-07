all: build

defualt: build

build:


clean: book/_build
	rm -rf book/_build

install:
	echo 'Init this repo'
	poetry config warnings.export false
	poetry install --no-root
	pre-commit install

clean: book/_build
	echo 'Clear poetry virtual environment'
	book/_build
	rm -rf $(poetry env info --path)
	rm -rf ./poetry.lock
"""
