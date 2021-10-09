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
	@poetry run bumpversion patch
	@echo "\nPatch version updated successfully"

update-version-minor:
	@git checkout main && git pull
	@poetry run bumpversion minor
	@echo "\Minor version updated successfully"

update-version-major:
	@git checkout main && git pull
	@poetry run bumpversion major
	@echo "\nMajor version updated successfully"
