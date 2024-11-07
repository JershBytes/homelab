<h2 align="center"> API Token Authentication </h2>

API Token authentication can be used to authenticate with the Proxmox API without the need to provide a password. In combination with the `ssh` block and `ssh-agent` support, this allows for a fully password-less authentication.

You can create an API Token for a user via the Proxmox UI, or via the command line on the Proxmox host or cluster:

* Create a user:

```bash
sudo pveum user add terraform@pve
```

* Create a role for the user (you can skip this step if you want to use any of the existing roles):

```bash
sudo pveum role add Terraform -privs "Datastore.Allocate Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify SDN.Use VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt User.Modify"
```

> [!NOTE] 
> The list of privileges above is only an example, please review it and adjust to your needs. Refer to the [privileges documentation](https://pve.proxmox.com/pve-docs/pveum.1.html#_privileges) for more details.

* Assign the role to the previously created user:

```bash
sudo pveum aclmod / -user terraform@pve -role Terraform
```

* Create an API token for the user:

```bash
sudo pveum user token add terraform@pve provider --privsep=0
```


Full docs can be found [here](https://registry.terraform.io/providers/bpg/proxmox/latest/docs#api-token-authentication).
