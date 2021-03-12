FROM node:12.14.1-alpine

RUN addgroup appuser && adduser --disabled-password appuser --ingroup appuser

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

RUN chown -R appuser:appuser /usr/src/app

USER appuser

RUN yarn

ENTRYPOINT ["./entrypoint.sh"]
