#!/bin/sh

TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore")
VERSION=$(gum input --placeholder "version")

# Since the scope is optional, wrap it in () if it has a value
test -n "$VERSION" && VERSION="($VERSION)"

# Pre-populate the input with type(scope):
SUMMARY=$(gum input --value "$TYPE$VERSION: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

# Commit these changes
gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
