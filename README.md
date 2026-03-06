[![StepSecurity Maintained Action](https://raw.githubusercontent.com/step-security/maintained-actions-assets/main/assets/maintained-action-banner.png)](https://docs.stepsecurity.io/actions/stepsecurity-maintained-actions)

# github-actions-ansible-vault

Ansible Vault for GitHub Actions.

## Inputs

### `command`

**Required** Command to execute. Default `ansible-vault --version`.

### `vault_key`

**Required** Your vault key. Default `''`.

## Example usage

```yaml
steps:
  - name: Retrieve runner uid and gid
    id: uid-gid
    run: |
      echo "uid=$(id -u)" >> $GITHUB_OUTPUT
      echo "gid=$(id -g)" >> $GITHUB_OUTPUT
  - name: decrypt files with ansible-vault
    uses: step-security/github-actions-ansible-vault@v1
    env:
      UID: ${{ steps.uid-gid.outputs.uid }}
      GID: ${{ steps.uid-gid.outputs.gid }}
    with:
      vault_key: ${{ secrets.VAULT_KEY }}
      command: |
        ansible-vault encrypt foo.yml
        chown $UID:$GID foo.yml
```