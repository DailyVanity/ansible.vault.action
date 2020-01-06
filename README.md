# ansible.vault.action
Github Action to execute Ansible Vault.

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