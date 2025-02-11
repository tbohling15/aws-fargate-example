#!/bin/bash
echo "Deploying github iam role ..."
DELETE=$1

STAGE_LIST=( develop )

for i in "${STAGE_LIST[@]}"
do
    STAGE=$i
    REGION="us-east-2"
    if [ "$STAGE" = "develop" ];then
        REGION="us-east-2"
    fi
    echo "Deploying $RESOURCE_FOLDER to $STAGE in $REGION ..."
    if [ "$DELETE" = "remove" ];then
        sls remove --stage ${STAGE} --region ${REGION}
    else
        sls deploy --stage ${STAGE} --region ${REGION}
    fi
done
