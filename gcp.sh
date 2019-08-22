#!/bin/bash

set -e

# install Google Cloud SDK
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
gcloud auth login
