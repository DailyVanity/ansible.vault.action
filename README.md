# ansible-playbook-docker-action
[![Actions Status](https://github.com/saubermacherag/ansible-playbook-docker-action/workflows/Ansible%20Playbook/badge.svg)](https://github.com/saubermacherag/ansible-playbook-docker-action/actions)

Github Action to execute Ansible Playbooks using fixed Ansible versions.

## Inputs
### `filesToDecrypt`
**Required** Files to be decrypted.
### `keyFileVaultPass`
**Required** Ansible Vault password.

## Example Usage
```yaml
uses: DailyVanity/ansible.vault.action@master
with:
  filesToDecrypt: 'inventories/production/group_vars/*'
  keyFileVaultPass: '{{ secrets.VAULT_PASSWORD }}'
``` 