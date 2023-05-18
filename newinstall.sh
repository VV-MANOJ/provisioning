#!/bin/bash

packages=(
    git
    nc

)

# Update the package manager and install the specified packages
sudo apt update -y

for package in "${packages[@]}"
do
    sudo apt install -y "$package"
    $package --version
    if [ $? -eq 0 ]; then
      echo "$package install succeeded!"
    else
      echo "$package install failed!"
    fi
done

sudo apt install -y yum-utils shadow-utils
sudo apt-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo apt -y install terraform
terraform version
if [ $? -eq 0 ]; then
      echo "terraform install succeeded!"
else
      echo "terraform install failed!"
fi

sudo apt  python3-pip python3-devel libffi-devel
sudo pip3 install ansible==2.9.20
ansible --version
if [ $? -eq 0 ]; then
      echo "ansible install succeeded!"
else
      echo "ansible install failed!"
fi
