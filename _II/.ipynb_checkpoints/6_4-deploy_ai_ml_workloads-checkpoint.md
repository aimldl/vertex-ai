# 6.4. Deploy AI/ML Workloads on A3 Mega Slurm Cluster
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-11 (Tue)

## [A3 Mega Slurm cluster overview](https://cloud.google.com/cluster-toolkit/docs/deploy/a3-mega-cluster-overview)
Eight NVIDIA H100 GPUs, offers 80 GB GPU memory per GPU and can be configured to use GPUDirect-TCPXO

Deployment architecture
* Cluster blueprints
* Deployment files

 Network performance components
* GPUDirect-TCPXO
* The Receive Data Path Manager (RxDM)
* The cluster deployment blueprint

## Deploy an A3 Mega Slurm cluster for ML training
Install Cluster Toolkit
* Install dependencies
* 

Go to the Cluster Toolkit directory
```bash
$ cd cluster-toolkit
```

Set up Cloud Storage bucket

Create a reservation

Update the base deployment file

Set up Virtual Private Cloud and Filestore

Update the cluster deployment file

Build the custom OS image

Make additional updates

Provision the Slurm cluster

Connect to the A3 Mega Slurm cluster

## Enable GPUDirect-TCPXO optimized NCCL communication
```
As part of the cluster deployment process, a Slurm prolog and epilog are installed which handles automatic installation of both a custom libnccl-net.so and the running of a sidecar process that enables GPUDirect-TCPXO optimized communication.

To run any job run on an A3 Mega cluster, several environment variables must be set in order to enable high performance networking with GPUDirect-TCPXO. Because we use enroot containers in this procedure to launch workloads, these variables must be set in the container environment as opposed to the host environm

```

[Connect to the A3 Mega Slurm cluster](https://cloud.google.com/cluster-toolkit/docs/machine-learning/a3-mega-enable-gpudirect-tcpxo#connect_to_the_a3_mega_slurm_cluster)


### [Create an enroot container](https://cloud.google.com/cluster-toolkit/docs/machine-learning/a3-mega-enable-gpudirect-tcpxo#create_an_enroot_container)

```bash
thekim_google_com@a3m123-controller:~$ srun -N 1 enroot import docker://nvcr.io#nvidia/pytorch:24.04-py3
```
```bash
[INFO] Querying registry for permission grant
[INFO] Authenticating with user: <anonymous>
[INFO] Authentication succeeded
[INFO] Fetching image manifest list
[INFO] Fetching image manifest
[INFO] Downloading 52 missing layers...
[INFO] Extracting image layers...
[INFO] Converting whiteouts...
[INFO] Creating squashfs filesystem...
Parallel mksquashfs: Using 208 processors
Creating 4.0 filesystem on /home/thekim_google_com/nvidia+pytorch+24.04-py3.sqsh, block size 131072.

Exportable Squashfs 4.0 filesystem, lzo compressed, data block size 131072
        uncompressed data, compressed metadata, compressed fragments,
        compressed xattrs, compressed ids
        duplicates are removed
Filesystem size 17132710.44 Kbytes (16731.16 Mbytes)
        89.05% of uncompressed filesystem size (19240183.19 Kbytes)
Inode table size 4118931 bytes (4022.39 Kbytes)
        34.33% of uncompressed inode table size (11998157 bytes)
Directory table size 4522472 bytes (4416.48 Kbytes)
        39.49% of uncompressed directory table size (11451210 bytes)
Number of duplicate files found 53409
Number of inodes 354645
Number of files 319555
Number of fragments 17285
Number of symbolic links 1684
Number of device nodes 0
Number of fifo nodes 0
Number of socket nodes 0
Number of directories 33406
Number of hard-links 123
Number of ids (unique uids + gids) 1
Number of uids 1
        root (0)
Number of gids 1
        root (0)
thekim_google_com@a3m123-controller:~$
```
This runs on one of your a3-megagpu-8g nodes that has more CPU and memory than the login node, which enroot can use to more quickly import the container. When the import completes, you should have a file named nvidia+pytorch+24.04-py3.sqsh in the directory where you ran the command.

```bash
$ ls
```
```bash
  ... nvidia+pytorch+24.04-py3.sqsh  ...
$
```
