#!/bin/bash

##########################
# Author: Aayush 
# Date: 13/12/2024
#
# This Script outputs the node health
#
# Version:V1
# ########################

set -x #debug mode
set -e #exit script when there is an error
set -o pipefail #display error when a pipe command fails


df -h

free -g

nproc

ps -ef | grep "amazon" | awk -F" " '{print $2}'


