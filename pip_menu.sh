#!/usr/bin/env bash


# Creates logfile && .txt files
# If it does not create it in WSL after you delete it, Exit to cmd and go back into WSL

mkdir -p logfile 

# if on windows 
# type nul >> logfile\venv_creation.txt
# type nul >> logfile\installed.txt
# type nul >> logfile\all_installed.txt

# FOr linux or WSL
touch logfile/venv_creation.txt logfile/installed.txt logfile/all_installed.txt


color2="\e[33m"
color3="\e[32m"
reset="\e[0m"


while true
do

    clear
    echo -e """${color3}PIP MENU INSTALLER"
    echo -e "             By Sivario.B ${reset}"
    echo "-------------------------"
    echo
    echo -e "${color2}Type 'h' or 'help' to review the category file before installation.${reset}"
    echo 
    echo "0) Lock Configuration and Management"
    echo "1) AWS CORE"
    echo "2) AWS IAC"
    echo "3) TESTING"
    echo "4) CLI TOOLS"
    echo "5) Data REPORTING"
    echo "6) DEV_QUALITY"
    echo "7) PACKAGING"
    echo "8) WEB API"
    echo "9) ALL"
    echo -e "q) Exit ${reset}"
    echo
    echo -e "${color2}Type 'Git' to Visit my Github page${reset}"
    echo

    read -r -p "Selection>: " choice

    if [ ! -d ".venv" ]; then
        echo "Do you want to create a virtual environment? (y/n)"
        read -r -p "Enter 'y' to create or any other key to skip: " REPLY
        if [ "$REPLY" = "y" ]; then
            echo "Creating virtual environment..."
            sleep 2
            echo "This might take a moment..."
            sleep 2
            echo "Make some coffee in the meantime"
            sleep 2 
            echo "This is a good time to check out the README.md for usage instructions"

            python3 -m venv .venv 2>&1 | tee -a logfile/venv_creation.txt
            echo "Virtual environment finally created."

            # shellcheck source=/dev/null
            source .venv/bin/activate

            .venv/bin/python -m pip install --upgrade pip

            else echo "Virtual enviroment needed, dont fuck your OS up"
            exit 1
        fi
    fi
        # shellcheck source=/dev/null
        source .venv/bin/activate
    
    if [ "$choice" = "0" ]; then
        ./lock_config/loc.sh

    elif [ "$choice" = "h" ] || [ "$choice" = "help" ] ; then
        cat helpfile/README.txt

    elif [ "$choice" = "git" ] || [ "$choice" = "Git" ] ; then
        explorer.exe https://github.com/siv-the-programmer


    elif [ "$choice" = "1" ]; then
        echo "Installing AWS CORE packages..."
        .venv/bin/python -m pip install -r locks/aws_core.txt 2>&1 | tee -a logfile/installed.txt
        echo
        printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"

    elif [ "$choice" = "2" ]; then
        echo "Installing AWS IAC packages..."
        .venv/bin/python -m pip install -r locks/aws_iac.txt 2>&1 | tee -a logfile/installed.txt
        echo
        printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"

    elif [ "$choice" = "3" ]; then
        echo "Installing AWS TESTING packages..."
        .venv/bin/python -m pip install -r locks/aws_testing.txt 2>&1 | tee -a logfile/installed.txt
        echo
        printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"

    elif [ "$choice" = "4" ]; then
        echo "Installing CLI TOOLS packages..."
        .venv/bin/python -m pip install -r locks/cli_tools.txt 2>&1 | tee -a logfile/installed.txt
        echo
        printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"

    elif [ "$choice" = "5" ]; then
        echo "Installing Data REPORTING packages..."
        .venv/bin/python -m pip install -r locks/data_reporting.txt 2>&1 | tee -a logfile/installed.txt
        echo
        printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"

    elif [ "$choice" = "6" ]; then
        echo "Installing DEV_QUALITY packages..."
        .venv/bin/python -m pip install -r locks/dev_quality.txt 2>&1 | tee -a logfile/installed.txt
        echo
        printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"

    elif [ "$choice" = "7" ]; then
        echo "Installing PACKAGING packages..."
        .venv/bin/python -m pip install -r locks/packaging.txt 2>&1 | tee -a logfile/installed.txt
        echo
        printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"

    elif [ "$choice" = "8" ]; then
        echo "Installing WEB API packages..."
        .venv/bin/python -m pip install -r locks/web_api.txt 2>&1 | tee -a logfile/installed.txt
        echo
        printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"

    elif [ "$choice" = "9" ]; then
        echo "Installing ALL packages..."
        {
            echo "Installing AWS CORE packages..."
            .venv/bin/python -m pip install -r locks/aws_core.txt 2>&1 | tee -a logfile/installed.txt

            echo "Installing AWS IAC packages..."
            .venv/bin/python -m pip install -r locks/aws_iac.txt 2>&1 | tee -a logfile/installed.txt

            echo "Installing AWS TESTING packages..."
            .venv/bin/python -m pip install -r locks/aws_testing.txt 2>&1 | tee -a logfile/installed.txt

            echo "Installing CLI TOOLS packages..."
            .venv/bin/python -m pip install -r locks/cli_tools.txt 2>&1 | tee -a logfile/installed.txt

            echo "Installing Data REPORTING packages..."
            .venv/bin/python -m pip install -r locks/data_reporting.txt 2>&1 | tee -a logfile/installed.txt

            echo "Installing DEV_QUALITY packages..."
            .venv/bin/python -m pip install -r locks/dev_quality.txt 2>&1 | tee -a logfile/installed.txt

            echo "Installing PACKAGING packages..."
            .venv/bin/python -m pip install -r locks/packaging.txt 2>&1 | tee -a logfile/installed.txt

            echo "Installing WEB API packages..."
            .venv/bin/python -m pip install -r locks/web_api.txt 2>&1 | tee -a logfile/installed.txt
        }
            printf "\e[1;32mInstall complete, check the logfile for more details\e[0m\n"
    elif [ "$choice" = "q" ]; then
        deactivate
        echo "Goodbye."
        break

    else
        echo "Invalid option."
    fi

    echo
    read -r -p "Press Enter to continue..."
done
