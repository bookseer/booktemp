rm -f poetry.lock
poetry env remove --all

sed -i 's/execute_notebooks: auto/execute_notebooks: force/g' ./book/_config.yml

sed -i 's/black = "~24.4"/black = "~24.8"/g' pyproject.toml
sed -i 's/mypy = "~1.10"/mypy = "~1.11"/g'   pyproject.toml
sed -i 's/lxml = "~5.2"/lxml = "~5.3"/g' pyproject.toml
sed -i 's/nbqa = "~1.8"/nbqa = "~1.9"/g' pyproject.toml
sed -i 's/pre-commit = "~3.7"/pre-commit = "~3.8"/g' pyproject.toml
sed -i 's/pylint = "~3.2"/pylint = "~3.3"/g' pyproject.toml
sed -i 's/pytest = "~8.2"/pytest = "~8.3"/g' pyproject.toml
sed -i 's/pyupgrade = "~3.16"/pyupgrade = "~3.17"/g' pyproject.toml
sed -i 's/sphinx-proof = "~0.1"/sphinx-proof = "~0.2"/g' pyproject.toml

sed -i 's/-->$/-->\n\n## 2024.09.29\n### Изменено:\n- Обновлены зависимости проекта\n---/g' CHANGELOG.md

poetry install --no-root
poetry show --outdated --top-level
pre-commit install


export POETRY_ENV=`poetry env info -p`/bin/activate && . ${POETRY_ENV}

poetry exec install
poetry exec update
poetry exec precommit
poetry version 2024.09.29
poetry exec build


sed -i 's/execute_notebooks: force/execute_notebooks: auto/g' ./book/_config.yml
poetry exec publish


git add .
git commit -m 'Изменено: Обновлены зависимости проекта'
git push origin
