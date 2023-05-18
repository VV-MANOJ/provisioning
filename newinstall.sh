#!/bin/bash

packages=(
    git
    nc

)

# Update the package manager and install the specified packages
sudo yum update -y

for package in "${packages[@]}"
do
    sudo yum install -y "$package"
    $package --version
    if [ $? -eq 0 ]; then
      echo "$package install succeeded!"
    else
      echo "$package install failed!"
    fi
done

sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform version
if [ $? -eq 0 ]; then
      echo "terraform install succeeded!"
else
      echo "terraform install failed!"
fi

sudo yum  python3-pip python3-devel libffi-devel
sudo pip3 install ansible==2.9.20
ansible --version
if [ $? -eq 0 ]; then
      echo "ansible install succeeded!"
else
      echo "ansible install failed!"
fi
