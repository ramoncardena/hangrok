# Home Assistant ngrok Add-on

This add-on allows you to expose your Home Assistant instance to the internet using ngrok.

## Installation

1. Add this repository to your Home Assistant Add-on Store: `https://github.com/ramoncardena/hangrok`
2. Install the "ngrok" add-on.
3. Configure the `auth_token` in the Configuration tab.
4. Start the add-on.

## Configuration

## Configuration

**auth_token**: Your ngrok authtoken. Get it from your [ngrok dashboard](https://dashboard.ngrok.com/get-started/your-authtoken).

### Optional Configuration

**region**: The region where the tunnel will be established (e.g., `us`, `eu`, `ap`, `au`, `sa`, `jp`, `in`). Default is `us`.
**domain**: A custom domain if you have a paid ngrok plan (e.g., `my-home.ngrok.app`).
**host**: The host to forward to (default: `homeassistant`).

## Web Interface

This add-on supports Ingress. You can click the **"Open Web UI"** button to view the ngrok status dashboard directly within Home Assistant.
