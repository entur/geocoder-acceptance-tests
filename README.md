# Geocoder acceptance tests

Proof-of-concept for creating a baseline set of tests for the geocoder that can be run as smoke tests in the geocoder build pipeline, using https://github.com/pelias/fuzzy-tester to run test cases.

Usage:

    npm install
    npm run dev|tst|prd

Or inside docker:

    docker build -t geocoder-acceptance-tests .
    docker run geocoder-acceptance-tests dev|tst|prd

Run as kubernetes job:

    kubectl apply -f job.yaml

Test cases should live in test_cases folder. There is a sample file there now. We should refere to the following guide for writing tests: https://github.com/pelias/acceptance-tests/wiki/Guide-to-writing-solid-tests.

### Links

See also https://github.com/entur/geocoder
