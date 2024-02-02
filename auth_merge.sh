#!/bin/bash

# Get the contents of DOCKER_AUTH environment variable
docker_auth="$DOCKER_AUTH"

# Get the contents of ~/.docker/config.json
config_file="$HOME/.docker/config.json"
config_contents=$(cat "$config_file")

# Print the values
echo "docker_auth: $docker_auth"
echo "config_contents: $config_contents"

# Check if the variables are not null
if [ -z "$docker_auth" ] || [ -z "$config_contents" ]; then
    echo "One or both of the variables are null"
    exit 1
fi

# Merge the contents
merged_contents=$(jq -s '.[0].auths * .[1].auths | {auths: .}' <<<"$docker_auth $config_contents")
echo "merged_contents: $merged_contents"

# Save the merged contents back into ~/.docker/config.json
# Before save, backup the original file
cp "$config_file" "$config_file.bak"
echo "$merged_contents" > "$config_file"
