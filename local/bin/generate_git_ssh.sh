#!/bin/bash
#: Description	: checks if xclip and openssh are installed
#		: generates a rsa key with 4096 bits
#		: adds it to ssh-agent and copies key to clipboard


checkssh="$(command -v ssh-add ssh-agent ssh-keygen 2>&1)"

echo "Checking xclip..."
command -v xclip 2>&1 || (echo "Please install xclip. Aborting..." && exit 1)
if [ $? -eq 0 ]
then
	echo "Proceding."
fi
echo "Checking openssh..."
echo "${checkssh}" || (echo "Please install openssh. Aborting..." && exit 1)
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

