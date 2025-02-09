# 3. Connecting to a VM via SSH
* Created: 2025-02-09 (Sun)
* Updated: 2025-02-09 (Sun)

## Prerequisite
* The `gcloud` command is pre-installed on the local machine. 
* The `gcloud` command was initialized. That is, the `gcloud init` command was run and configured.

## `ssh-keygen`
Run the ssh-keygen command.

```bash
$ ssh-keygen -t rsa -f ~/.ssh/KEY_FILENAME -C USERNAME -b 2048
```
For example,
```bash
$ ssh-keygen -t rsa -f ~/.ssh/hpc-toolkit-gsc -C thekim -b 2048
```

## `gcloud compute config-ssh`
This command configures SSH access to your Google Compute Engine (GCE) instances. It generates an SSH key pair (if one doesn't exist) and adds the public key to your project's metadata. This allows you to connect to GCE instances using the gcloud compute ssh command without needing to manually manage SSH keys. However, this command is not what you should be using for your Slurm cluster. It's designed for connecting to individual GCE VMs, not a pre-configured cluster.

## `gcloud compute os-login ssh-keys add --key-file=$HOME/.ssh/google_compute_engine.pub --project=$PROJECT_ID`

This command adds your public SSH key to the OS Login configuration for your Google Cloud project. OS Login is a service that manages SSH access to VMs. This is the **correct way to add your key for SSH access to your Slurm controller**. It associates your key with your Google Cloud user account.

## Fixing the `Permission denied (publickey)` error

The error "Permission denied (publickey)" means that the remote server, e.g. he Slurm controller, doesn't have your public key authorized for access. Although you have added the key to the project with gcloud compute os-login ssh-keys add, you still need to make sure OS Login is enabled on the instances in your Slurm cluster.

Here's how to fix it:

Verify OS Login is Enabled:  OS Login must be enabled at the project or instance level.  Your system administrator likely needs to do this. They should check that OS Login is enabled for the VMs in the Slurm cluster.  If it's not, they need to enable it. You cannot do this yourself unless you have the appropriate project permissions.

Metadata vs. OS Login:  The older method of managing SSH keys on GCE was using project or instance metadata.  OS Login is the recommended approach now.  Make sure your system admin isn't trying to manage keys through metadata in addition to OS Login, as this can cause conflicts.

Check User Permissions:  Ensure your Google Cloud user account has the necessary permissions to use OS Login. The "roles/oslogin.osLogin" role should be sufficient.  Again, your system administrator would manage this.

gcloud auth login: Ensure you're logged into the correct Google account using gcloud auth login. Sometimes, cached credentials can cause issues.

Re-add the Key (Just in Case):  Try re-adding your public key using the command you already used:

Bash

gcloud compute os-login ssh-keys add --key-file=/home/thekim/.ssh/google_compute_engine.pub --project=hpc-toolkit-gsc
Check for Typos:  Double-check for any typos in the username (thekim in your example) or the hostname (nic0.a3m123-controller...).  Even a small mistake can lead to authentication failures.

Contact Your System Administrator: The most likely scenario is that OS Login is not correctly configured on the Slurm cluster's VMs.  Contact your system administrator to confirm that OS Login is enabled and that your user account has the correct permissions. They are the best resource for troubleshooting issues within the cluster environment.