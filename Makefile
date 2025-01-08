defualt: build

build:


init_venv:
	echo 'Init poetry virtual environment'
	poetry config warnings.export false
	poetry install --no-root
	pre-commit install

delete_venv:
	echo 'Delete poetry virtual environment'
	poetry env remove --all
	rm -rf ./poetry.lock
	deactivate
	exit

update_venv:
	echo 'Update poetry virtual environment'
poetry lock
poetry update --version
poetry update
poetry export --format requirements.txt --output ./requirements.txt --without-hashes
poetry export --format requirements.txt --output ./requirements_colab.txt --without-hashes --without dev --without test
poetry export --format requirements.txt --output ./.binder/requirements.txt --without-hashes --without dev --without=test
pre-commit autoupdate --freeze
poetry show --top-level --outdated

precommit:
	echo 'Run pre-commit'
pre-commit run --all-files

jupyter:
	Start Jupyter Lab without token'
export JUPYTERLAB_SETTINGS_DIR=./.jupyterlab_config/user-settings
export JUPYTERLAB_WORKSPACES_DIR=./.jupyterlab_config/workspaces
python -m jupyter lab --allow-root --NotebookApp.token='' --NotebookApp.password=''

spyder:
	Start Spyder
spyder --workdir=./ --window-title bookseer-booktemp --project ./ --conf-dir ./.spyder_config

build_book:
	echo 'Build book'
jupyter-book build --all --builder html ./book/

publish_book:
	echo 'Build and publish book'
poetry exec build_book
ghp-import ./book/_build/html --no-jekyll --push --force --cname=booktemp.bookseer.org

clean_book:
	echo 'Clean book'
rm -rf book/_build


