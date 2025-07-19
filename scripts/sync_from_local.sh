#! /bin/bash

rsync -avz --delete _site/ $GCP_USERNAME@$GCP_INSTANCE_IP:$TARGET_DEPLOY_PATH
