# Claude Code Project Manager Manual

This manual explains how to use the Claude Code Project Manager to set up Claude for your projects.

## Getting Started

To get started, copy the `claude-manager.sh` script into the root directory of your project. Then, run the following command in your terminal:

```bash
./claude-manager.sh
```

This will open a menu with options to manage your project's Claude configurations.

## Initializing a Project

Select the "Initialize Claude Code for this project" option to create the following:

*   `.claude/commands/`: A directory to store your custom commands.
*   `CLAUDE.md`: A file to provide guidance to Claude about your project.

### `CLAUDE.md` Best Practices

Your `CLAUDE.md` file should contain the following sections:

*   **Common Development Commands**: A list of commands for building, testing, and running your project.
*   **Architecture Overview**: A brief description of your project's architecture.
*   **Key File Structure**: An overview of the most important files and directories.
*   **Development Notes**: Any other relevant information, such as coding conventions or specific configurations.

## Custom Commands

You can create custom commands to automate common tasks. To add a custom command, select the "Add a Custom Command" option. You will be prompted to provide a name, description, and prompt for the command.

The command will be saved as a markdown file in the `.claude/commands/` directory.

## Local Configuration

For user-specific configurations that you don't want to commit to your repository, you can create a `CLAUDE.local.md` file. This file will be automatically added to your `.gitignore` file to prevent it from being tracked by Git.
