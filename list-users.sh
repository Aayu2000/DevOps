#!/bin/bash
###############################
# Author: Aayush
# Date: 14/05/2024
# Version: V1
# This script will list he usernames of github users who has access to the specified repository
#
# Usage - Before using the script you need to export your github username using - export username="<github username>" and the token which you
# would have to create in github under development options and export it using - export token="<token from github>"
###############################
#set -x
#set -e
#set -o

check_arguments() {
    if [ "$#" -ne 2 ]; then
        echo "Please use the script in this format: $0 <Organisation Name> <Repository Name>"
        exit 1
    fi
}
check_arguments "$@"

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}


# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
