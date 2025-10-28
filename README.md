# Geocoder acceptance tests [![CircleCI](https://circleci.com/gh/entur/geocoder-acceptance-tests.svg?style=svg&circle-token=06bc92fa350171da8c30f460ff5696edeb1ad579)](https://circleci.com/gh/entur/geocoder-acceptance-tests)

Proof-of-concept for creating a baseline set of tests for the geocoder that can be run as smoke tests in the geocoder build pipeline, using https://github.com/pelias/fuzzy-tester to run test cases.

Usage:

    npm install
    npm run dev|staging|production

Or inside docker:

    docker build -t geocoder-acceptance-tests .
    docker run geocoder-acceptance-tests dev|staging|production

Run as kubernetes job:

    kubectl apply -f job.yaml

Test cases should live in test_cases folder. There is a sample file there now. We should refere to the following guide for writing tests: https://github.com/pelias/acceptance-tests/wiki/Guide-to-writing-solid-tests.
