# Automatically generate config
rubocop --auto-gen-config


# Diff against master
git diff-tree -r --no-commit-id --name-only head origin/master | xargs rubocop

# Run rubocop for Uncommited changes
git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop

# Speed up the execution
rubocop --format offenses
