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
