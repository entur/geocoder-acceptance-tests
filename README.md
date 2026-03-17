# Geocoder acceptance tests

Acceptance tests for the Entur geocoder, run as smoke tests in the build pipeline using [pelias-fuzzy-tester](https://github.com/pelias/fuzzy-tester).

## Usage

    npm install
    npm run dev|tst|prd

Tests are available for multiple API versions:

| Version | Environments | Test cases |
|---------|-------------|------------|
| v1 | `dev`, `tst`, `prd`, `local` | `test_cases/` |
| v2 | `v2dev`, `v2tst`, `v2prd`, `v2local` | `test_cases/` |
| v3 | `v3dev`, `v3tst`, `v3prd`, `v3local` | `v3/test_cases/` |

Example:

    npm run v3dev

## Docker

    docker build -t geocoder-acceptance-tests .
    docker run geocoder-acceptance-tests dev|tst|prd

## Kubernetes

The tests are deployed as a Helm chart (see `helm/`) and run as a CronJob.

## Writing tests

Test cases are JSON files in `test_cases/` (v1/v2) and `v3/test_cases/` (v3). See the [guide to writing solid tests](https://github.com/pelias/acceptance-tests/wiki/Guide-to-writing-solid-tests).

## Links

- https://github.com/entur/geocoder
