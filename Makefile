.PHONY: requirements test upgrade

requirements: ## install development environment requirements
	uv sync --locked --group dev

test: ## run tests with coverage in the current virtualenv
	coverage run test_project/manage.py test --settings=test_project.settings require -v 2

upgrade: ## update python dependencies
	uv run --with edx-lint edx_lint write_uv_constraints pyproject.toml
	uv lock --upgrade
