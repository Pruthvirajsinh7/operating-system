#!/bin/bash

current_dir=$(pwd)

while true; do
    clear
    echo "Current Directory: $current_dir"
    echo "Directory Management Menu:"
    echo "1. List Directories"
    echo "2. Create Directory"
    echo "3. Modify Directory"
    echo "4. Navigate"
    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "List Options:"
            echo "a. List All Files and Directories (including hidden)"
            echo "d. List Directories Only"
            read -p "Enter your list choice (a/d): " list_choice

            case $list_choice in
                a)
                    echo "All files and directories in '$current_dir':"
                    ls -la "$current_dir"
                    ;;
                d)
                    echo "ls '$current_dir':"
                    ls 
                    ;;
                *)
                    echo "Invalid choice. Please try again."
                    ;;
            esac
            read -p "Press Enter to continue..."
            ;;
        2)
            read -p "Enter directory name: " new_dir
            mkdir "$current_dir/$new_dir"
            echo "Directory '$new_dir' created."
            read -p "Press Enter to continue..."
            ;;
        3)
            echo "Modify Directory Options:"
            echo "r. Rename Directory"
            echo "p. Change Permissions"
            echo "m. Move Directory"
            echo "rm. Remove Directory"
            read -p "Enter your modify choice (r/p/m/rm): " modify_choice

            case $modify_choice in
                r)
                    read -p "Enter new directory name: " new_name
                    mv "$current_dir" "$current_dir/../$new_name"
                    current_dir="$current_dir/../$new_name"
                    echo "Directory renamed to '$new_name'."
                    ;;
                p)
                    read -p "Enter new permissions (e.g., 755): " new_permissions
                    chmod "$new_permissions" "$current_dir"
                    echo "Permissions changed to '$new_permissions'."
                    ;;
                m)
                    read -p "Enter target directory path: " target_path
                    mv "$current_dir" "$target_path"
                    current_dir="$target_path"
                    echo "Directory moved to '$target_path'."
                    ;;
                rm)
                    rm -r "$current_dir"
                    echo "Directory removed."
                    current_dir=$(dirname "$current_dir")
                    ;;
                *)
                    echo "Invalid choice. Please try again."
                    ;;
            esac
            read -p "Press Enter to continue..."
            ;;
        4)
            # Navigate
            echo "Navigation Options:"
            echo "pwd. Print Current Working Directory"
            echo "cd. Change Directory Path"
            echo "back. Go Back Multiple Levels"
            read -p "Enter your navigate choice (pwd/cd/back): " navigate_choice

            case $navigate_choice in
                pwd)
                    # Print Current Working Directory
                    echo "Current Working Directory: $current_dir"
                    ;;
                cd)
                    # Change Directory Path
                    read -p "Enter new directory path: " new_path
                    if [ -d "$new_path" ]; then
                        current_dir="$new_path"
                        echo "Directory path changed to '$new_path'."
                    else
                        echo "Directory '$new_path' not found."
                    fi
                    ;;
                back)
                    # Go Back Multiple Levels
                    read -p "Enter the number of levels to go back: " levels
                    while [ "$levels" -gt 0 ]; do
                        current_dir=$(dirname "$current_dir")
                        levels=$((levels - 1))
                    done
                    ;;
                *)
                    echo "Invalid choice. Please try again."
                    ;;
            esac
            read -p "Press Enter to continue..."
            ;;
        5)
            # Exit
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            read -p "Press Enter to continue..."
            ;;
    esac
done
