#!/bin/sh

NVIM_CONFIG_DIR="$HOME/.config/nvim"
SCRIPT_DIR="$(dirname "$(realpath "$0")")" # Gets the directory where the script is located
echo "You forgot your spf. Time to get.."
echo ""
echo " █████████                        █████                                                  █████"
echo "███░░░░░███                      ░░███                                                  ░░███ "
echo "███    ░░░  █████ ████ ████████   ░███████  █████ ████ ████████  ████████    ██████   ███████ "
echo "░█████████ ░░███ ░███ ░░███░░███  ░███░░███░░███ ░███ ░░███░░███░░███░░███  ███░░███ ███░░███ "
echo "░░░░░░░░███ ░███ ░███  ░███ ░███  ░███ ░███ ░███ ░███  ░███ ░░░  ░███ ░███ ░███████ ░███ ░███ "
echo "███    ░███ ░███ ░███  ░███ ░███  ░███ ░███ ░███ ░███  ░███      ░███ ░███ ░███░░░  ░███ ░███ "
echo "░█████████  ░░████████ ████ █████ ████████  ░░████████ █████     ████ █████░░██████ ░░████████"
echo "░░░░░░░░░    ░░░░░░░░ ░░░░ ░░░░░ ░░░░░░░░    ░░░░░░░░ ░░░░░     ░░░░ ░░░░░  ░░░░░░   ░░░░░░░░ "
echo ""

if [ -d "$NVIM_CONFIG_DIR" ]; then
    printf "The Neovim configuration folder '%s' already exists.\n" "$NVIM_CONFIG_DIR"
    read -p "Do you want to delete it? (y/N): " REPLY
    echo ""
    case "$REPLY" in
        [yY]|[yY][eE][sS])
            echo "* Deleting '$NVIM_CONFIG_DIR'..."
            rm -rf "$NVIM_CONFIG_DIR"
            ;;
        *)
            echo "* Exiting without deleting the folder."
            exit 1
            ;;
    esac
fi

# Create the new Neovim configuration folder
echo "* Creating new Neovim configuration folder: '$NVIM_CONFIG_DIR'..."
mkdir -p "$NVIM_CONFIG_DIR"

# Copy the contents of the script's directory into the new Neovim config folder
echo "* Copying contents from '$SCRIPT_DIR' to '$NVIM_CONFIG_DIR'..."
cp -r "$SCRIPT_DIR"/* "$NVIM_CONFIG_DIR"/

echo "* Finished!"
echo "" 
echo "You're toasted~! Time to peel."
echo ""
echo "You can now run nvim, which will go through some setup."
echo "After it's finished you can exit by writing ':qa'".
exit 0
