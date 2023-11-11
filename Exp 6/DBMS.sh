#!/bin/bash

# Define the database file
DB_FILE="database.txt"

# Main menu
while true; do
    echo "Database Management System"
    echo "1. Insert Record"
    echo "2. Delete Record"
    echo "3. Update Record"
    echo "4. Display Records"
    echo "5. Exit"
    read choice

    case $choice in
        1)
            echo "Enter new roll no:"
            read nrn
            echo "Enter new name:"
            read nn
            echo "Enter new address:"
            read na
            echo -e "$nrn\t$nn\t$na" >> "$DB_FILE"
            echo "Record added successfully."
            ;;
        2)
            echo "Enter roll no to delete:"
            read drno
            grep -v "^$drno[[:space:]]" "$DB_FILE" > temp.txt
            mv temp.txt "$DB_FILE"
            echo "Record with roll no $drno deleted."
            ;;
        3)
            echo "Update Record Menu"
            echo "1. Update Roll No"
            echo "2. Update Name"
            echo "3. Update Address"
            echo "4. Update All (Roll No, Name, Address)"
            read update_choice

            if [[ $update_choice -eq 1 ]]; then
                echo "Enter roll no to update:"
                read urno
                if grep -q "^$urno[[:space:]]" "$DB_FILE"; then
                    echo "Enter new roll no:"
                    read new_roll
                    awk -v roll="$urno" -v new_roll="$new_roll" 'BEGIN{OFS="\t"} $1 == roll {$1 = new_roll} 1' "$DB_FILE" > temp.txt
                    mv temp.txt "$DB_FILE"
                    echo "Roll No for record with roll no $urno updated."
                else
                    echo "Record with roll no $urno not found."
                fi
            fi

            if [[ $update_choice -eq 2 ]]; then
                # Update Name code (similar to above)
                echo "Enter roll no to update name:"
                read urno
                if grep -q "^$urno[[:space:]]" "$DB_FILE"; then
                    echo "Enter new name:"
                    read new_name
                    awk -v roll="$urno" -v new_name="$new_name" 'BEGIN{OFS="\t"} $1 == roll {$2 = new_name} 1' "$DB_FILE" > temp.txt
                    mv temp.txt "$DB_FILE"
                    echo "Name for record with roll no $urno updated."
                else
                    echo "Record with roll no $urno not found."
                fi
            fi

            if [[ $update_choice -eq 3 ]]; then
                # Update Address code (similar to above)
                echo "Enter roll no to update address:"
                read urno
                if grep -q "^$urno[[:space:]]" "$DB_FILE"; then
                    echo "Enter new address:"
                    read new_addr
                    awk -v roll="$urno" -v new_addr="$new_addr" 'BEGIN{OFS="\t"} $1 == roll {$3 = new_addr} 1' "$DB_FILE" > temp.txt
                    mv temp.txt "$DB_FILE"
                    echo "Address for record with roll no $urno updated."
                else
                    echo "Record with roll no $urno not found."
                fi
            fi

            if [[ $update_choice -eq 4 ]]; then
                # Update All fields code
                echo "Enter roll no to update all fields:"
                read urno
                if grep -q "^$urno[[:space:]]" "$DB_FILE"; then
                    echo "Enter new roll no:"
                    read new_roll
                    echo "Enter new name:"
                    read new_name
                    echo "Enter new address:"
                    read new_addr
                    awk -v roll="$urno" -v new_roll="$new_roll" -v new_name="$new_name" -v new_addr="$new_addr" 'BEGIN{OFS="\t"} $1 == roll {$1 = new_roll; $2 = new_name; $3 = new_addr} 1' "$DB_FILE" > temp.txt
                    mv temp.txt "$DB_FILE"
                    echo "All fields for record with roll no $urno updated."
                else
                    echo "Record with roll no $urno not found."
                fi
            fi
            ;;
        4)
            echo "Roll No   Name       Address"
            echo "-------   ---------  ------------------"
            cat "$DB_FILE" | sort -n -k 1 | awk -F'\t' '{printf "%-9s %-10s %-s\n", $1, $2, $3}'
            ;;
        5)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
