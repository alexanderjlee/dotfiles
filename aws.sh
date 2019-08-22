#!/bin/bash

set -e

# install AWS CLI
wget -O ${HOME}/Downloads/awscli-bundle.zip https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
cd ${HOME}/Downloads
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
