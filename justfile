_default:
  just --list

# run linting and typecheking over the solutions
@lint:
	ruff solutions
	pyright

