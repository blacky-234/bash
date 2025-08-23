#!/bin/bash


for key in ~/.ssh/*; do
  [[ $key == *.pub || $key == *.pem || $key == *config || $key == *known_hosts || $key == *known_hosts.old ]] && continue
  echo "Adding SSH key: $key"
    ssh-add "$key" 2>/dev/null
done

echo "SSH keys added."
echo "agen Footprint List"
ssh-add -l