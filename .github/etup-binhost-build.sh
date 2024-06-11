#!/bin/bash

# Step 1: Copy bashrc and gh-upload.py script
wget https://raw.githubusercontent.com/necrose99/gentoo-binhost/master/etc/portage/bashrc -P /etc/portage/bashrc
chmod +x /etc/portage/bashrc

wget https://raw.githubusercontent.com/necrose99/gentoo-binhost/master/etc/portage/binhost/gh-upload.py -P /etc/portage/binhost
chmod +x /etc/portage/binhost/gh-upload.py

# Step 2: Update gh-upload.py script to use GH_API_KEY environment variable in github docker actions 
sed -i 's/gh_token = '<your github access token>'/gh_token = os.getenv('GH_API_KEY')/' /etc/portage/binhost/gh-upload.py

# Step 3: Run the Docker container with the GH_API_KEY environment variable
docker run -e GH_API_KEY=<your-github-api-key> <image-name>
