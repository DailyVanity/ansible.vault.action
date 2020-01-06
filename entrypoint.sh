#!/bin/sh

set -e

# Evaluate vaultfile
export VAULTFILE=
if [ ! -z "$INPUT_KEYFILEVAULTPASS" ]
then
  echo "Using \$INPUT_KEYFILE_VAULT_PASS to decrypt keyfile."
  mkdir -p ~/.ssh
  echo "${INPUT_KEYFILEVAULTPASS}" > ~/.ssh/vault_key
  export VAULTFILE="--vault-password-file ~/.ssh/vault_key"
  export ANSIBLE_VAULT_PASSWORD_FILE="~/.ssh/vault_key"
  echo "\$INPUT_KEYFILEVAULTPASS is set. Setting environment variable ANSIBLE_VAULT_PASSWORD_FILE."
else
  echo "\$INPUT_KEYFILEVAULTPASS not set. No vault set."
fi

# Evaluate extra vars file
export FILES=
if [ -z "$INPUT_FILESTODECRYPT" ]
then
  echo "\$INPUT_FILESTODECRYPT not set. Nothing to decrypt."
else
  echo "\$INPUT_FILESTODECRYPT is set. Will be decrypting."
  export FILES="${INPUT_EXTRAFILE}"
  echo "going to execute: "
  echo ansible-vault decrypt ${FILES}
  ansible-vault decrypt ${FILES}
fi

