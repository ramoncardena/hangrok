#!/usr/bin/with-contenv bashio

echo "Starting ngrok..."

AUTH_TOKEN=$(bashio::config 'auth_token')

if [ -z "$AUTH_TOKEN" ]; then
    bashio::log.error "No auth_token provided. Please configure the add-on."
    exit 1
fi

ngrok config add-authtoken "$AUTH_TOKEN"

bashio::log.info "Starting ngrok tunnel..."

# Start ngrok in background
ngrok http homeassistant:8123 --log stdout > /dev/null &
NGROK_PID=$!

# Wait for API to be available
for i in $(seq 1 30); do
    if curl -s http://localhost:4040/api/tunnels > /dev/null; then
        break
    fi
    sleep 1
done

# Get URL
PUBLIC_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
TUNNEL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0]')

if [ "$PUBLIC_URL" != "null" ] && [ -n "$PUBLIC_URL" ]; then
    bashio::log.info "---------------------------------------------------"
    bashio::log.info "   "
    bashio::log.info "   Ngrok Tunnel started!"
    bashio::log.info "   Public URL: $PUBLIC_URL"
    bashio::log.info "   Tunnels: $TUNNEL"
    bashio::log.info "   "
    bashio::log.info "---------------------------------------------------"
else
    bashio::log.warning "Could not retrieve public URL from ngrok API."
fi

wait $NGROK_PID
