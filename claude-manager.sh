#!/bin/bash

# Claude Code Project Initializer

# Functions
initialize_claude() {
    echo "Initializing Claude Code for the current project..."
    mkdir -p .claude/commands
    touch CLAUDE.md
    echo "Created .claude/commands directory and CLAUDE.md file."
}

add_custom_command() {
    read -p "Enter command name (e.g., 'test'): " command_name
    read -p "Enter a description for the command: " command_description
    echo "Enter the command prompt (press Ctrl+D when finished):"
    command_prompt=$(cat)

    command_file=".claude/commands/$command_name.md"
    echo -e "---\ndescription: $command_description
---\n$command_prompt" > "$command_file"

    echo "Created custom command: $command_file"
}

create_local_config() {
    touch CLAUDE.local.md
    if [ -f .gitignore ]; then
        if ! grep -q "CLAUDE.local.md" .gitignore; then
            echo "CLAUDE.local.md" >> .gitignore
            echo "Added CLAUDE.local.md to .gitignore."
        fi
    else
        echo "CLAUDE.local.md" > .gitignore
        echo "Created .gitignore and added CLAUDE.local.md."
    fi
    echo "Created CLAUDE.local.md for your local overrides."
}

# Main Menu
while true; do
    echo "--- Claude Code Project Manager ---"
    echo "1. Initialize Claude Code for this project"
    echo "2. Add a Custom Command"
    echo "3. Create a Local Configuration (CLAUDE.local.md)"
    echo "4. Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) initialize_claude ;;
        2) add_custom_command ;;
        3) create_local_config ;;
        4) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
