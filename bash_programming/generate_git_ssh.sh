#!/bin/bash

echo "Checking xclip..."
command -v xclip 2>&1 || echo "Please install xclip. Aborting..."
if [ $? -eq 0 ]
then
	echo "Proceding."
fi
echo "Enter email: "
read mail
if [ -z "$mail" ]
then
	echo "Enter an email addr"
	exit 1
fi
echo "Creating key..."
ssh-keygen -t rsa -b 4096 -C "$mail"
echo "Starting ssh-agent..."
eval "$(ssh-agent -s)"
echo "Adding private key to ssh-agent..."
ssh-add ~/.ssh/id_rsa
if [ $? -eq 0 ]
then
	echo "Done."
fi
echo "copying public key to clipboard..."
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "Done."

