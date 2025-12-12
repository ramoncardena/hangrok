#!/usr/bin/with-contenv bashio

echo "Starting ngrok..."

AUTH_TOKEN=$(bashio::config 'auth_token')
HOST=$(bashio::config 'host')
REGION=$(bashio::config 'region')
DOMAIN=$(bashio::config 'domain')

if [ -z "$AUTH_TOKEN" ]; then
    bashio::log.error "No auth_token provided. Please configure the add-on."
    exit 1
fi

if [ -z "$HOST" ]; then
    bashio::log.error "No host provided. Please configure the add-on."
    exit 1
fi

mkdir -p /root/.config/ngrok
cat > /root/.config/ngrok/ngrok.yml <<EOF
version: "3"
agent:
  authtoken: $AUTH_TOKEN
  web_addr: 127.0.0.1:4040
  web_allow_hosts: []
EOF

CMD_ARGS=""
if [ -n "$REGION" ]; then
    bashio::log.info "Using region: $REGION"
    CMD_ARGS="$CMD_ARGS --region=$REGION"
fi

if [ -n "$DOMAIN" ]; then
    bashio::log.info "Using custom domain: $DOMAIN"
    CMD_ARGS="$CMD_ARGS --domain=$DOMAIN"
fi

bashio::log.info "Starting nginx for Ingress..."
nginx -c /nginx.conf &

bashio::log.info "Starting ngrok tunnel..."

# Start ngrok in background
ngrok http $HOST:8123 $CMD_ARGS --log stdout &
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

if [ "$PUBLIC_URL" != "null" ] && [ -n "$PUBLIC_URL" ]; then
    bashio::log.info "---------------------------------------------------"
    bashio::log.info "   "
    bashio::log.info "   Ngrok Tunnel started!"
    bashio::log.info "   Public URL: $PUBLIC_URL"
    bashio::log.info "   "
    bashio::log.info "---------------------------------------------------"
else
    bashio::log.warning "Could not retrieve public URL from ngrok API."
fi

wait $NGROK_PID
