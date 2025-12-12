# Hangrok Home Assistant Add-on Repository

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Framoncardena%2Fhangrok)

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/ramoncardena/hangrok?style=flat-square)](https://github.com/ramoncardena/hangrok/releases)

This repository contains the "ngrok" add-on for Home Assistant, which allows you to securely expose your Home Assistant instance to the internet using ngrok's tunneling service.

## Add-ons

- **[ngrok](ngrok/README.md)**: Expose your Home Assistant instance to the internet securely through ngrok tunnels. This add-on provides an easy way to access your Home Assistant from anywhere without complex network configuration.

## Features

- **Secure Remote Access**: Create secure tunnels to your Home Assistant instance
- **Easy Configuration**: Simple setup with just your ngrok authentication token
- **No Port Forwarding**: Avoid complex router configurations
- **HTTPS Support**: Automatic HTTPS tunnels for secure connections
- **Custom Domains**: Support for custom domains (premium ngrok feature)
- **Region Selection**: Choose from multiple ngrok regions for optimal performance
- **Web Interface**: Monitor tunnel status directly within Home Assistant

## Installation

1. Add this repository URL to your Home Assistant Add-on Store:
   `https://github.com/ramoncardena/hangrok`
2. Install the "ngrok" add-on from the store
3. Configure your ngrok authentication token in the add-on configuration
4. Start the add-on and access your Home Assistant securely from anywhere

## Requirements

- Home Assistant installation (Supervised, Core, or Container)
- Valid ngrok account (free or paid)
- Internet connection

## Support

For issues, questions, or feature requests, please open an issue on the GitHub repository.
