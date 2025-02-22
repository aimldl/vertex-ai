# Deploy the HPC cluster using Terraform
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-11 (Tue)

If a cluster has already been deployed, this part should be skipped and move to the next step.

The relevant sub-sections in the official document are:
* [Create the cluster deployment folder](https://cloud.google.com/cluster-toolkit/docs/quickstarts/slurm-cluster#create_the_cluster_deployment_folder)
* [Deploy the HPC cluster using Terraform](https://cloud.google.com/cluster-toolkit/docs/quickstarts/slurm-cluster#deploy_the_hpc_cluster_using_terraform)

## Double-check to see if a Slurm cluster is deployed.
To double-check, run:
```bash
thekim_google_com@a3m123-controller:~$ sinfo
```
```bash
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
a3mega*      up   infinite     16   idle a3m123-a3meganodeset-[0-15]
debug        up   infinite      4  idle~ a3m123-debugnodeset-[0-3]
$
```
A Slurm cluster with 16 worker nodes has already been deployed above.
