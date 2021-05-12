#!/bin/sh

function send_test_failure_notification {
    if [[ -z "${SLACK_URL}" ]]; then
        echo "Emulating sendTestFailureNotification"
        
    else
        curl -X POST -H 'Content-type: application/json' \
            --data '{"text":":warning: Geocoder smoke tests had failures. See logs for details."}' \
            $SLACK_URL
    fi
}

yarn run $1

if [ $? -eq 0 ]
then
  echo "Successfully test run"
  exit 0
else
  echo "Some tests failed" >&2
  send_test_failure_notification
  exit 1
fi