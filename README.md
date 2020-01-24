# Geocoder acceptance tests

Proof-of-concept for creating a baseline set of tests for the geocoder that can be run as smoke tests in the geocoder build pipeline, using https://github.com/pelias/fuzzy-tester to run test cases.

Usage:

    yarn
    yarn run dev|staging|production

Or inside docker:

    docker build -t geocoder-acceptance-tests .
    docker run geocoder-acceptance-tests dev|staging|production

Test cases should live in test_cases folder. There is a sample file there now. We should refere to the following guide for writing tests: https://github.com/pelias/acceptance-tests/wiki/Guide-to-writing-solid-tests.
