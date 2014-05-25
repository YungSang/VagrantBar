# Vagrant Bar

## Overview

Vagrant Bar is a simple wrapper to the Vagrant command line tool to manage machines registered with Vagrant

![Screenshot](https://raw.githubusercontent.com/BipSync/VagrantBar/master/Screenshot.png)

## Requirements

* OS X 10.9
* Vagrant 1.6+ 
 * http://www.vagrantup.com

## Download

https://github.com/BipSync/VagrantBar/releases/download/1.4/Vagrant.Bar.zip


Version History|Notes
----|----
1.4 | Configurable icon, SSH application, check for updates. Updated icons. Now check for updates a maximum of once an hour
1.3 | Update notification
1.2 | Connect to a machine via SSH
1.1 | Vagrant Bar now verifies the Vagrant version on startup
1.0 | First release

## Installation
1. Copy "Vagrant Bar.app" to /Applications
2. Run from there
3. Optionally drag into "Login Items" under "System Preferences"/"Users & Groups"

## Configuration

Value|Command
---|---
Mono status bar icon|`defaults write bipsync.Vagrant-Bar monoIcon -bool true`
Use a different Terminal|`defaults write bipsync.Vagrant-Bar terminalAppName -string TERMINALAPPNAME`
Disable update checking|`defaults write bipsync.Vagrant-Bar checkForUpdates -bool false`