# CEIBO

CEIBO is a command-line interface (CLI) tool designed to list, visualize, and run your bash and git aliases.

## Features

- List all your bash or git aliases in a user-friendly interface
- Visualize your aliases with descriptions (if available)
- Quick execution of selected aliases
- Filter options to view only git or bash aliases
- Customizable paths for bash and git alias files

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/ceibo.git
   cd ceibo
   ```

2. Make sure you have Ruby installed on your system.

3. Install the [fzf (Fuzzy Finder)](https://github.com/junegunn/fzf#installation) dependency. CEIBO uses `fzf` to provide an interactive interface for selecting aliases.

4. Make the script executable:
   ```
   chmod +x ceibo.rb
   ```

5. Set up environment variables (see Configuration section below).

## Configuration

CEIBO requires two environment variables to be set:

- `CEIBO_BASH_ALIASES_PATH`: Path to your bash aliases file (default is usually `~/.bashrc`)
- `CEIBO_GIT_ALIASES_PATH`: Path to your git config file (default is usually `~/.gitconfig`)

You can set these variables in your shell configuration file (e.g., `~/.bashrc`, `~/.zshrc`)

## Usage

Run CEIBO with the following command:

```
./ceibo.rb [options]
```

### Options:

- `-g`, `--git`: Show git aliases
- `-a`, `--aliases`: Show bash aliases
- `-h`, `--help`: Display help information

If no options are provided, CEIBO will display all available aliases (both git and bash).

## How It Works

CEIBO reads your git aliases from the file specified by `CEIBO_GIT_ALIASES_PATH` and bash aliases from the file specified by `CEIBO_BASH_ALIASES_PATH`. 
It then presents these aliases in an interactive fzf interface, allowing you to search, select, and execute aliases quickly.

## Acknowledgments

- [fzf](https://github.com/junegunn/fzf) for providing the interactive fuzzy search functionality.

## [The Ceibo Tree](https://en.wikipedia.org/wiki/Erythrina_crista-galli)

![Ceibo image](https://upload.wikimedia.org/wikipedia/commons/3/32/Cockspur_Coral_Tree_%28Erythrina_crista-galli%292.jpg)

> [Erythrina crista-galli - by Tatters](https://commons.wikimedia.org/wiki/Category:Erythrina_crista-galli#/media/File:Cockspur_Coral_Tree_(Erythrina_crista-galli)2.jpg)
