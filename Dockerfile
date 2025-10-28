FROM google/cloud-sdk:alpine

ENV NODE_VERSION=24.10.0

RUN apk add --no-cache curl

RUN ARCH=$( [ "$TARGETARCH" = "arm64" ] && echo "arm64" || echo "x64" ) && \
    curl -fsSL "https://unofficial-builds.nodejs.org/download/release/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${ARCH}-musl.tar.xz" \
      | tar -xJ -C /usr/local --strip-components=1

RUN addgroup appuser && adduser --disabled-password appuser --ingroup appuser

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

RUN chown -R appuser:appuser /usr/src/app

USER appuser

RUN npm install

ENTRYPOINT ["./entrypoint.sh"]
