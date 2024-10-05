# Current State

- Got basic structure to work

- ran into problem where i will want to enable sth both systemwide and in HM, like hyprland, but am unsure how to structure that
  - maybe i have a seperate system module and a HM module, and you need to include both in the respective places?



# What do i need where?

## CLI
- git
- gpg
- neovim
- direnv
- pass?

## Server
- CLI
- web server
- game server
- file server
- SPECIAL: might want multiple users

## Laptop
- extends CLI
- WM (hyprland)
- Application Launcher (wofi)
- Terminal (kitty)
- password manager
- browser
- fonts
- email
- calendar

## Desktop
- extends Laptop
- games (steam, prismlauncher)
- streamdeck
- obs


# Configuration Parts

## Host
- Disk Configuration, Filesystems
- Networking, Hostname
- Hardware Configuration

## System
- Set up stuff like audio, display server, users etc

## User
- User specific configuration

## Programs
- Program configurations
    - to be imported (and modified) by a user
