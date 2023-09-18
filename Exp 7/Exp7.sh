#!/bin/bash

while true; 
do
    clear
    echo "Directory Management Menu"
    echo "1. Create Directory"
    echo "2. Modify Directory"
    echo "3. Navigate"
    echo "4. List Directories"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter directory name: " dirname
            if [ -d "$dirname" ]; then
                echo "Directory already exists."
            else
                mkdir "$dirname"
                echo "Directory created: $dirname"
            fi
            ;;
        2)
            echo "Modify Directory:"
            echo "1. Rename"
            echo "2. Move"
            echo "3. Remove"
            echo "4. Update Permissions"
            echo "5. Copy"
            echo "6. Create File"
            read -p "Enter your choice: " subchoice2

            read -p "Enter directory name: " dirname

            case $subchoice2 in
                1)
                    read -p "Enter new name: " newname
                    mv "$dirname" "$newname"
                    echo "Directory renamed to: $newname"
                    ;;
                2)
                    read -p "Enter destination path: " destination
                    mv "$dirname" "$destination/"
                    echo "Directory moved to: $destination"
                    ;;
                3)
                    rm -r "$dirname"
                    echo "Directory removed: $dirname"
                    ;;
                4)
                    read -p "Enter new permissions (e.g., 755): " permissions
                    chmod "$permissions" "$dirname"
                    echo "Permissions updated for $dirname"
                    ;;
                5)
                    read -p "Enter destination path: " destination
                    cp -r "$dirname" "$destination/"
                    echo "Directory copied to: $destination"
                    ;;
                6)
                    read -p "Enter file name: " filename
                    touch "$dirname/$filename"
                    echo "File created in $dirname: $filename"
                    ;;
                *)
                    echo "Invalid choice."
                    ;;
            esac
            ;;
        3)
            echo "Navigate:"
            echo "1. Go back (cd ..)"
            echo "2. Change directory (cd path)"
            echo "3. Present working directory (pwd)"
            read -p "Enter your choice: " subchoice3

            case $subchoice3 in
                1)
                    cd ..
                    ;;
                2)
                    read -p "Enter path: " path
                    cd "$path"
                    ;;
                3)
                    pwd
                    ;;
                *)
                    echo "Invalid choice."
                    ;;
            esac
            ;;
        4)
            echo "List Directories:"
            echo "1. List (ls)"
            echo "2. List all (ls -a)"
            read -p "Enter your choice: " subchoice4

            case $subchoice4 in
                1)
                    ls
                    ;;
                2)
                    ls -a
                    ;;
                *)
                    echo "Invalid choice."
                    ;;
            esac
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

    read -p "Press Enter to continue..."
done