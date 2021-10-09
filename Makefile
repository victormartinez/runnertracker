help:
	@echo "All Commands:"
	@echo "    format - Format code applying black, unify and isort"
	@echo "    check - Check code (black, flake, isort, mypy and bandit)"

format:
	@poetry run black .
	@poetry run unify --in-place --recursive .
	@poetry run isort .

check:
	@poetry run black --check .
	@poetry run flake8
	@poetry run isort --check-only .
	@poetry run mypy --strict runnertracker
	@poetry run bandit -r runnertracker

update-version-patch:
	@git checkout main && git pull
	@poetry run bumpversion patch --dry-run --no-commit --list | grep new_version= | sed -e 's/new_version=//' | xargs -n 1 poetry run towncrier --yes --version
	@git commit -am 'Update CHANGELOG'
	@poetry run bumpversion patch
	@echo "\nChangelog and patch version updated successfully"

update-version-minor:
	@git checkout main && git pull
	@poetry run bumpversion minor --dry-run --no-commit --list | grep new_version= | sed -e 's/new_version=//' | xargs -n 1 poetry run towncrier --yes --version
	@git commit -am 'Update CHANGELOG'
	@poetry run bumpversion minor
	@echo "\nChangelog and minor version updated successfully"

update-version-major:
	@git checkout main && git pull
	@poetry run bumpversion major --dry-run --no-commit --list | grep new_version= | sed -e 's/new_version=//' | xargs -n 1 poetry run towncrier --yes --version
	@git commit -am 'Update CHANGELOG'
	@poetry run bumpversion major
	@echo "\nChangelog and major version updated successfully"

