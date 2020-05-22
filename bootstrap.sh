handler () {
    set -e
    aws ecs update-service --cluster gs-cluster --service gs-container-service --desired-count 1
    # compress this file $zip runtime.zip bootstrap.sh
    # add a layer under the Lambda functions (howto: https://github.com/gkrizek/bash-lambda-layer#ARN)
}

