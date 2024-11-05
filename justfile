# ----- MAIN JUSTFILE -----

# avoid errors on duplicate variable and recipes, usefull for tmpdir management
set allow-duplicate-variables
set allow-duplicate-recipes

import "just/base-tools.just"
import "just/dev-tools.just"
import "just/other-tools.just"

[private]
default:
	@just --list

# list available recipes
help: default

# install base environment: base environment
base-env: base-tools

# install dev  environment: base environment + dev tools
dev-env: base-tools dev-tools

# install full environment: base environment + dev tools + additional tools
full-env: base-tools dev-tools other-tools

