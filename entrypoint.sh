#!/bin/sh

log_url="https://console.cloud.google.com/logs/query;query=resource.type%3D%22k8s_container%22%0Aresource.labels.project_id%3D%22$GOOGLE_PROJECT_ID%22%0Alabels.k8s-pod%2Fapp%3D%22geocoder-acceptance-tests%22;timeRange=PT1H?project=entur-dev-1287"

function send_test_failure_notification {
    if [[ -z "${SLACK_URL}" ]]; then
        echo "Emulating sendTestFailureNotification"
        
    else
        curl -X POST -H 'Content-type: application/json' \
            --data '{"text":":warning: Geocoder smoke tests had failures. See logs for details: '$log_url'"}' \
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