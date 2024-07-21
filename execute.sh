#!/bin/bash

# Check if the user provided a parameter
if [ -z "$1" ]; then
	echo "Usage: $0 <gradience_file.json>"
	exit 1
fi

# Define the target directories and
# check if adw-gtk3 is located inside the target directory
if [ "$EUID" -eq 0 ] && [ -d "/usr/share/themes/adw-gtk3/" ] && [ -d "/usr/share/themes/adw-gtk3-dark/" ]; then
	TARGET_DIR1="/usr/share/themes/adw-gtk3/"
	TARGET_DIR2="/usr/share/themes/adw-gtk3-dark/"
elif [ -d "~/.themes/adw-gtk3/" ] && [ -d "~/.themes/adw-gtk3-dark/" ]; then
	TARGET_DIR1="~/.themes/adw-gtk3/"
	TARGET_DIR2="~/.themes/adw-gtk3-dark/"
elif [ -d "~/.local/share/themes/adw-gtk3/" ] && [ -d "~/.local/share/themes/adw-gtk3-dark/" ]; then
	TARGET_DIR1="~/.local/share/tahemes/adw-gtk3/"
	TARGET_DIR2="~/.local/share/themes/adw-gtk3-dark/"
else
	echo "The adw-gtk3 theme could not be found or is installed incorrectly!"
	exit 1
fi

# Define the source directory
SOURCE_DIR="$(pwd)/adw-gtk2/adw-gtk3/gtk-2.0"

# Check if the first target directory does not exist
if [ ! -d "$TARGET_DIR1/gtk-2.0" ]; then
    # Copy the source directory to the first target directory
    echo "GTK2 theme not found on adw-gtk3. Copying..."
    sudo cp -rf "$SOURCE_DIR" "$TARGET_DIR1"
fi

# Check if the second target directory does not exist
if [ ! -d "$TARGET_DIR2/gtk-2.0" ]; then
    # Copy the source directory to the second target directory
    echo "GTK2 theme not found on adw-gtk3-dark. Copying..."
    sudo cp -rf "$SOURCE_DIR" "$TARGET_DIR2"
fi

# Assign the user-provided parameter to the variable 'foo'
foo=$1

# Execute the command with the user-provided parameter
python3 colorize.py -f "$foo" -r adw-gtk2/ -t /usr/share/themes/

# Exit message
if [ $? -eq 0 ]; then
	echo "Successfully applied $1 GTK2 theme to adw-gtk3!"
else
	echo "Error ocurred while trying to apply theme"
fi
