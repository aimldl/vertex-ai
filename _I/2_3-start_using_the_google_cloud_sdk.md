# 2-3. Start using the Google Cloud SDK
* Created: 2025-02-04 (Tue)
* Updated: 2025-02-09 (Sun)

For more details, see [Google Cloud Command Line Interface (gcloud CLI)](https://cloud.google.com/cli?hl=en#:~:text=Pricing-,Pricing,with%20a%20Google%20Cloud%20account.&text=) and [gcloud CLI overview](https://cloud.google.com/sdk/gcloud#:~:text=You%20can%20also%20use%20the,configuration%2C%20and%20perform%20other%20tasks.).

## Example commands
```bash
$ gcloud config set project PROJECT_ID
$ gcloud config set compute/zone NAME
$ gcloud compute project-info describe --project=hpc-toolkit-gsc --format="value(osLogin)"
```

OS Login
```bash
$ gcloud compute ssh
$ gcloud compute config-ssh
$ gcloud cloud-shell ssh
$ gcloud workstations ssh
$ gcloud bms ssh-keys add
$ gcloud bms ssh-keys list
$ gcloud bms ssh-keys remove
$ gcloud compute os-login ssh-keys add
$ gcloud compute os-login ssh-keys describe
$ gcloud compute os-login ssh-keys list
```
Compute Engine > Doc. > Guides > [Troubleshooting OS Login](https://cloud.google.com/compute/docs/troubleshooting/troubleshoot-os-login]



