# Hangrok Home Assistant Add-on Repository

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
