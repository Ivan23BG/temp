#!/usr/bin/env bash
set -euo pipefail

# Run this once in a fresh extraction of the template to create a local Git
# repository with two tagged releases (v1.0.0 and v1.1.0). Do not rerun it after
# Git has been initialized, and do not run it in a clone that already has
# history from GitHub.

if [ -e .git ]; then
    echo "A Git repository already exists here; refusing to reinitialize it." >&2
    exit 1
fi

command -v git >/dev/null 2>&1 || {
    echo "Git is required but was not found on PATH." >&2
    exit 1
}

git init -b main
git config user.name "latex_handler template"
git config user.email "tp@example.invalid"

git add .gitignore README.md template.toml latex_handler.toml setup-local-repo.sh \
    assets src examples
git commit -m "Add tp v1.0.0"
git tag v1.0.0

# Create a second tagged revision so `latex_handler template versions` has more
# than one result and `template update` has a newer stable release to select.
sed -i.bak 's/^version = "1\.0\.0"$/version = "1.1.0"/' template.toml
rm -f template.toml.bak
git add template.toml
git commit -m "Release tp v1.1.0"
git tag v1.1.0

echo
echo "Local template repository ready."
echo "Tags:"
git tag --list
