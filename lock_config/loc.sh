#!/usr/bin/env bash

LOCK_DIR="locks"
PKG_DIR="packages"
LOG_DIR="logfile"

python3 -m pip install --upgrade pip pip-tools


mkdir -p "$LOCK_DIR"
mkdir -p "$LOG_DIR"

compile_locks() {
    echo "Generating lock files..."
    for f in "$PKG_DIR"/*.in; do
        name=$(basename "$f" .in)
        pip-compile --generate-hashes -o "$LOCK_DIR/$name.txt" "$f"
    done
    echo "Lock files generated."
}

upgrade_locks() {
    echo "Upgrading lock files..."
    for f in "$PKG_DIR"/*.in; do
        name=$(basename "$f" .in)
        pip-compile --upgrade --generate-hashes -o "$LOCK_DIR/$name.txt" "$f"
    done
    echo "Lock files upgraded."
}

while true
do
    clear
    echo
    echo "=============================="
    echo "  lock configuration"
    echo "=============================="
    echo "1) Generate Lock Files"
    echo "2) Upgrade Lock Files"
    echo "3) back to category selection"
    echo
    read -r -p "Choose an option: " choice

    if [ "$choice" = "1" ]; then
        compile_locks

    elif [ "$choice" = "2" ]; then
        upgrade_locks

    elif [ "$choice" = "3" ]; then
        echo "Returning to category selection..."
        break

    else
        echo "Invalid option."
    fi
done
