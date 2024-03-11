#!/bin/bash

# Check if the script is being run with superuser privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root (sudo)." 1>&2
  exit 1
fi

# Define the new content
new_content="# sudo: auth account password session
auth       include        sudo_local
auth       sufficient     pam_tid.so
auth       sufficient     pam_smartcard.so
auth       required       pam_opendirectory.so
account    required       pam_permit.so
password   required       pam_deny.so
session    required       pam_permit.so"

# Backup the original sudo PAM configuration file
cp /etc/pam.d/sudo /etc/pam.d/sudo.bak

# Overwrite /etc/pam.d/sudo with the new content
echo "$new_content" > /etc/pam.d/sudo

echo "The /etc/pam.d/sudo file has been updated with the new configuration."

# Display a message indicating the backup location
echo "A backup of the original configuration has been created at /etc/pam.d/sudo.bak"
