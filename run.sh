#!/usr/bin/with-contenv bashio

echo "Starting ngrok..."

AUTH_TOKEN=$(bashio::config 'auth_token')

if [ -z "$AUTH_TOKEN" ]; then
    bashio::log.error "No auth_token provided. Please configure the add-on."
    exit 1
fi

ngrok config add-authtoken "$AUTH_TOKEN"

# Start ngrok on port 8123 (HA default)
# We use nohup to keep it running or just exec depending on if we want other things.
# For a simple addon, exec is fine.
# ngrok http 8123
# However, to see logs properly we might want to tweak this. 
# Using bashio to log nicely.

bashio::log.info "Starting ngrok tunnel..."
exec ngrok http 8123
