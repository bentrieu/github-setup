#!/bin/bash

# Generate an SSH keypair
ssh-keygen -t rsa -b 4096 -C "s3878466@rmit.edu.vn"

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add SSH private key to the ssh-agent
ssh-add ~/.ssh/id_rsa

# Add GitHub to the known hosts
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Print the SSH key to add it to GitHub
echo "Your SSH public key:"
cat ~/.ssh/id_rsa.pub
echo
echo "Copy the key above, navigate to your GitHub account settings:"
echo "- Go to 'SSH and GPG keys'"
echo "- Click on 'New SSH key'"
echo "- Give it a title (e.g., 'My Ubuntu Machine')"
echo "- Paste the key and save it"
echo
echo "Test the connection using the following command:"
echo "ssh -T git@github.com"
