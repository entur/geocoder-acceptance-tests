#!/bin/sh

set -e

: ${LOCAL=""}

log_url="https://console.cloud.google.com/logs/query;query=resource.type%3D%22k8s_container%22%0Aresource.labels.project_id%3D%22$GOOGLE_PROJECT_ID%22%0Aresource.labels.pod_name%3D~%22geocoder-acceptance-tests-.*%22;timeRange=PT1H?project=$GOOGLE_PROJECT_ID"

function send_test_failure_notification {
    if [[ -z "${SLACK_URL}" ]]; then
        echo "Emulating sendTestFailureNotification"
        
    else
        curl -X POST -H 'Content-type: application/json' \
            --data '{"text":":warning: Geocoder smoke tests had failures. See logs for details: '$log_url'"}' \
            $SLACK_URL
    fi
}

if [[ ! -z ${LOCAL} ]]; then
  echo "Waiting for elasticsearch"
  while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:9200/_cluster/health\?wait_for_status=yellow\&timeout=120s)" != "200" ]];
  do
    echo "Waiting for elasticsearch"
    sleep 5
  done
  echo "Done waiting for elasticsearch"
fi

yarn run $1

#if [[ ! -z ${LOCAL} ]]; then
  # send pubsub message to kakka with test results
#fi

if [ $? -eq 0 ]
then
  echo "Successfully test run"
else
  echo "Some tests failed" >&2
  send_test_failure_notification
fi