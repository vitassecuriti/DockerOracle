#!/bin/bash

__create_user() {
# Create a user to SSH into as.
groupadd oinstall
groupadd dba
useradd -g oinstall -G dba oracle
SSH_USERPASS=oracle
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin oracle)
echo ssh oracle password: $SSH_USERPASS
export DISPLAY=:0.0
}

# Call all functions
__create_user