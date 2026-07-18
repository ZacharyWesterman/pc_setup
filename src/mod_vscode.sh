#!/usr/bin/env bash
cd "${BASH_SOURCE%/*}" || exit 1

! which code &>/dev/null && echo -e "\033[0;31mERROR: VSCode is not installed, so extensions were not installed for it.\033[0m" && exit 1

# Install all the extensions I want.
extensions=()
while read -r i; do
    extensions+=("--install-extension=$i")
done < ../config/vscode.txt
code "${extensions[@]}"

# Default user preferences
echo '{
    "terminal.integrated.stickyScroll.enabled": false,
    "workbench.startupEditor": "none",
    "github.copilot.enable": {
        "*": false,
        "plaintext": false,
        "markdown": false,
        "scminput": false
    },
    "[python]": {
        "editor.defaultFormatter": "ms-python.autopep8"
    },
    "git.addAICoAuthor": "off",
    "chat.viewSessions.orientation": "stacked",
    "editor.stickyScroll.enabled": false,
    "terminal.integrated.allowChords": false,
    "makefile.configureOnOpen": true,
    "explorer.confirmDragAndDrop": false,
    "explorer.confirmDelete": false,
    "workbench.secondarySideBar.defaultVisibility": "hidden"
}' > ~/.config/Code/User/settings.json
