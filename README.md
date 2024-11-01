# SAJ_Installer

This Batch script provides a user-friendly menu interface to install multiple programs on Windows. You can select individual programs or choose to install all at once. The script directly downloads and runs installers from official sources, eliminating the need for a package manager like Chocolatey.

## Features

- Menu-driven interface to select/deselect programs for installation
- Option to install all listed programs at once
- Program categories include browsers, messaging, security, developer tools, gaming, compression tools, file sharing, and media

## Programs Included

| Category           | Program               |
|--------------------|-----------------------|
| Browsers           | Google Chrome, Brave Browser, Mozilla Firefox, Opera Browser |
| Messaging          | Discord               |
| Security           | Malwarebytes          |
| Developer Tools    | Python 3, Node.js, Visual Studio Code |
| Gaming             | Steam, Epic Games Launcher |
| Compression Tools  | 7-Zip, WinRAR         |
| File Sharing       | qBittorrent           |
| Media              | Spotify               |

## Requirements

- No external package manager required. The script handles downloads and installations directly.

## Installation

1. **Download or Clone the Repository**:
   - Download the `.bat` file or clone this repository.

2. **Run the Script**:
   - Open Command Prompt as Administrator.
   - Run the `.bat` file to open the installation menu.

## Usage

1. **Menu Navigation**:
   - **Select/Deselect Programs**: Type the number next to each program to toggle its selection.
   - **Install All**: Press `A` to select all programs for installation.
   - **Start Installation**: Press `S` to start installing the selected programs.
   - **Exit**: Press `Q` to quit without installing.

2. **Installation Process**:
   - The script will download and install each selected program. Installation status for each program will be displayed in the console.

## Notes

- Make sure to run the script with administrator privileges to allow program installations.
- Some installers may require additional arguments for silent installation. Please ensure to check each program's installation requirements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
