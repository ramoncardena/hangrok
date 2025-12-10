ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH

# Install ngrok
RUN apk add --no-cache curl \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "i386" ]; then ARCH="386"; fi \
    && curl -Lo /ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-${ARCH}.tgz \
    && tar -xzf /ngrok.tgz -C /usr/local/bin \
    && rm /ngrok.tgz

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
