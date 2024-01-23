FROM node:12.14.1-alpine as node

FROM google/cloud-sdk:408.0.1

COPY --from=node . .

RUN apk add curl

RUN addgroup appuser && adduser --disabled-password appuser --ingroup appuser

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

RUN chown -R appuser:appuser /usr/src/app

USER appuser

RUN yarn

ENTRYPOINT ["./entrypoint.sh"]
