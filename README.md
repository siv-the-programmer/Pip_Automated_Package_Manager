# Pip Automated Package Manager

![GitHub top language](https://img.shields.io/github/languages/top/siv-the-programmer/Pip_Automated_Package_Manager?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/siv-the-programmer/Pip_Automated_Package_Manager?style=for-the-badge)
![GitHub license](https://img.shields.io/github/license/siv-the-programmer/Pip_Automated_Package_Manager?style=for-the-badge)
![Python Version](https://img.shields.io/badge/python-3.8%2B-blue?style=for-the-badge)
![Repo Size](https://img.shields.io/github/repo-size/siv-the-programmer/Pip_Automated_Package_Manager?style=for-the-badge)

A Bash-based automated Python package manager


A structured, Bash-based Python environment installer designed to automate categorized dependency management for AWS automation, DevOps workflows, CLI tooling, API services, and data/reporting environments.

This tool standardizes Python environment setup by installing curated package groups into an isolated virtual environment, reducing manual configuration and improving consistency across development setups.

<img src="pics/pic1.png" width="600" alt="addpic">

# Overview

The Pip Automated Package Manager provides a controlled, modular system for installing categorized Python packages. Instead of manually installing individual libraries, users select predefined categories aligned with specific engineering workflows.

# The system automatically:

Creates a virtual environment if it does not exist

Installs selected package groups

Displays installation progress

Logs installation output for auditing

Supports optional dependency locking for reproducibility

This project demonstrates practical Bash scripting, dependency orchestration, and environment automation.

# Features

Categorized package management

Automatic virtual environment creation

Live terminal feedback during installation

Persistent logging of all installation activity

Modular configuration via category files

Optional reproducible dependency locking

Linux and WSL compatible

# Project Structure
```
pip_menu.sh
packages/
    aws_core.in
    aws_iac.in
    aws_testing.in
    dev_quality.in
    cli_tools.in
    web_api.in
    data_reporting.in
locks/                  # Optional (generated pinned dependencies)
logfile/
```

# Installation

Clone the repository:
```
git clone https://github.com/your-username/pip_automated_package_manager.git
cd pip_automated_package_manager
```

Make the installer executable:
```
chmod +x pip_menu.sh
```

Run the installer:
```
./pip_menu.sh
```
# Usage

Launch the installer script.

Select the desired package category.

The script creates a virtual environment (.venv) if it does not already exist.

The selected packages are installed into the isolated environment.

Installation output is displayed in real time and recorded in log files.

Logging

# All installation activity is recorded in the logfile/ directory:

logfile/venv_creation.txt
logfile/installed.txt
logfile/all_installed.txt


Logs provide traceability, auditing capability, and troubleshooting support.

# *Dependency Locking* (Still working on it)

For reproducible environments, .in files can be compiled into fully pinned dependency lock files using pip-tools.
Just to make sure we get the updated versions 

Install pip-tools:
```
python -m pip install --upgrade pip pip-tools
```

# Requirements

Linux or WSL environment

Python 3.8 or higher

Bash shell

Internet access for package installation

# License

MIT License

Copyright (c) 2026 Sivario

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.






