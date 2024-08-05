#!/bin/bash

# Delete all private keys
for key in $(gpg --list-secret-keys --keyid-format LONG | grep "^sec" | awk '{print $2}' | cut -d'/' -f2); do
    gpg --batch --yes --delete-secret-key $key
done

# Delete all public keys
for key in $(gpg --list-keys --keyid-format LONG | grep "^pub" | awk '{print $2}' | cut -d'/' -f2); do
    gpg --batch --yes --delete-key $key
done

