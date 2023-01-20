#!/bin/sh

CHOOSE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore")

SCOPE=$(gum input --placeholder "scope")

# Since the scope is optional, wrap it in () if it has a value
test -n "$SCOPE" && SCOPE="($SCOPE)"

# Pre-populate the input with type(scope):
SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")

# Commit these changes
gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
