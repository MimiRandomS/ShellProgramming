#!/bin/sh
clear

welcome() {
    echo "-----------------------------------------------------"
    echo "|                                                   |"
    echo "|                      @                             |"
    echo "|                    @ @                             |"
    echo "|                  @     @                           |"
    echo "|                @         @                         |"
    echo "|             @              @                       |"
    echo "|            @                @                      |"
    echo "|           @  ¡WELCOME, UNIX USER!  @               |"
    echo "|            @                @                      |"
    echo "|             @              @                       |"
    echo "|               @           @                        |"
    echo "|                @        @                          |"
    echo "|                  @     @                           |"
    echo "|                    @ @                             |"
    echo "|                      @                             |"
    echo "|                                                    |"
    echo "-----------------------------------------------------"
    sleep 1.5
    clear
}

show_menu() {
    echo "|----------------------------------------------------------|"
    echo "|          Shell Scripts Menu - Choose an option:          |"
    echo "|----------------------------------------------------------|"
    echo "|  1.  Hello World                       (punto1.sh)       |"
    echo "|  2.  Number of lines in /etc/profile   (punto2.sh)       |"
    echo "|  3.  Search word in file               (punto3.sh)       |"
    echo "|  4a. Create users                      (crearUsuarios.sh)|"
    echo "|  4b. Users info                        (punto4.sh)       |"     
    echo "|  5.  List files with permissions       (punto5.sh)       |"
    echo "|  7a. Check file or directory           (punto7a.sh)      |"
    echo "|  7b. Check failed root logins          (punto7b.sh)      |"
    echo "|  0.  Exit                                                |"
    echo "|----------------------------------------------------------|"
}

run_script() {
    script_name=$1
    if [ -f "$script_name" ]; then
        chmod +x "$script_name"
        shift
        ./"$script_name" "$@"
    else
        echo "Error: $script_name not found."
    fi
}

welcome
while true; do
    welcome
    show_menu
    read -p "Enter your choice: " choice
    
    case $choice in
        1)
            echo "Running punto1.sh..."
            run_script "punto1.sh"
            ;;

        2)
            echo "Running punto2.sh..."
            run_script "punto2.sh"
            ;;

        3)
            read -p "Enter the word to search for: " word
            read -p "Enter the path to the file: " path
            
            echo "Running punto3.sh with parameters '$word' and '$path'..."
            run_script "punto3.sh" "$word" "$path"
            ;;

        4a)
            echo "Running Users Script 4a (crearUsuarios.sh)..."
            run_script "crearUsuarios.sh"
            ;;


        4b)
            echo "Running Users Info 4b (punto4.sh)..."
            run_script "punto4.sh"
            ;;

        5)
            read -p "Enter the directory to search in: " directory
            read -p "Enter the permissions to search for (e.g., -rw-r--r--): " permissions
            
            echo "Running punto5.sh with parameters '$directory' and '$permissions'..."
            run_script "punto5.sh" "$directory" "$permissions"
            ;;

        7a)
            read -p "Enter the name of the item: " name
            read -p "Enter the directory to search in: " directory
            
            echo "Running punto7a.sh with parameters '$name' and '$directory'..."
            run_script "punto7a.sh" "$name" "$directory"
            ;;

        7b)
            echo "Running punto7b.sh to check failed root logins..."
            run_script "punto7b.sh"
            ;;


        0)
            echo "Exiting the program."
            break
            ;;

        *)
            clear
            echo "Invalid option. Please try again."
            ;;
    esac
done