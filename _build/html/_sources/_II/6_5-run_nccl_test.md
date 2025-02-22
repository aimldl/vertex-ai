# 6.5. [Run NCCL test](https://cloud.google.com/cluster-toolkit/docs/machine-learning/a3-mega-enable-gpudirect-tcpxo#run_nccl_test)
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-11 (Tue)

## [Build NCCL test binaries](https://cloud.google.com/cluster-toolkit/docs/machine-learning/a3-mega-enable-gpudirect-tcpxo#build_nccl_test)

```bash
CONTAINER_IMAGE=./nvidia+pytorch+24.04-py3.sqsh

git clone https://github.com/NVIDIA/nccl-tests.git

srun --partition a3mega \
      --ntasks-per-node=1 \
      --gpus-per-node=8 \
      --container-mounts="$PWD:/nccl" \
      --container-image=${CONTAINER_IMAGE} \
      bash -c "
          cd /nccl/nccl-tests/ &&
          MPI=1 CC=mpicc CXX=mpicxx make -j
        "
```

## Commands-in-action
```bash
$ CONTAINER_IMAGE=./nvidia+pytorch+24.04-py3.sqsh
$
```
```bash
$ git clone https://github.com/NVIDIA/nccl-tests.git
```
```bash
Cloning into 'nccl-tests'...
remote: Enumerating objects: 396, done.
remote: Counting objects: 100% (258/258), done.
remote: Compressing objects: 100% (107/107), done.
remote: Total 396 (delta 222), reused 157 (delta 151), pack-reused 138 (from 2)
Receiving objects: 100% (396/396), 147.01 KiB | 5.25 MiB/s, done.
Resolving deltas: 100% (262/262), done.
$
```
Directory `nccl-tests` is created. 
```bash
$ ls 
  ...  nccl-tests  ...
$ tree -d  nccl-tests/
nccl-tests/
├── doc
├── src
└── verifiable

4 directories
$
```

`--container-mounts="$PWD:/nccl"`
The `--container-mounts` option mounts `$PWD` to `/nccl` inside the container. 

As the current working directory is mapped to the `/nccl` directory, the command `bash -c "cd /nccl/nccl-tests/ ...` is the same as going into the downloaded github repository's directory `nccl-tests`.

```bash
$ srun --partition a3mega \
       --ntasks-per-node=1 \
       --gpus-per-node=8 \
       --container-mounts="$PWD:/nccl" \
       --container-image=${CONTAINER_IMAGE} \
       bash -c "
           cd /nccl/nccl-tests/ &&
           MPI=1 CC=mpicc CXX=mpicxx make -j
         "
```
```bash
make -C src build BUILDDIR=/nccl/nccl-tests/build
make[1]: Entering directory '/nccl/nccl-tests/src'
Compiling  timer.cc                            > /nccl/nccl-tests/build/timer.o
Compiling /nccl/nccl-tests/build/verifiable/verifiable.o
Compiling  all_reduce.cu                       > /nccl/nccl-tests/build/all_reduce.o
Compiling  common.cu                           > /nccl/nccl-tests/build/common.o
Compiling  all_gather.cu                       > /nccl/nccl-tests/build/all_gather.o
Compiling  broadcast.cu                        > /nccl/nccl-tests/build/broadcast.o
Compiling  reduce_scatter.cu                   > /nccl/nccl-tests/build/reduce_scatter.o
Compiling  reduce.cu                           > /nccl/nccl-tests/build/reduce.o
Compiling  alltoall.cu                         > /nccl/nccl-tests/build/alltoall.o
Compiling  scatter.cu                          > /nccl/nccl-tests/build/scatter.o
Compiling  gather.cu                           > /nccl/nccl-tests/build/gather.o
Compiling  sendrecv.cu                         > /nccl/nccl-tests/build/sendrecv.o
Compiling  hypercube.cu                        > /nccl/nccl-tests/build/hypercube.o
Linking  /nccl/nccl-tests/build/all_reduce.o > /nccl/nccl-tests/build/all_reduce_perf
Linking  /nccl/nccl-tests/build/all_gather.o > /nccl/nccl-tests/build/all_gather_perf
Linking  /nccl/nccl-tests/build/broadcast.o  > /nccl/nccl-tests/build/broadcast_perf
Linking  /nccl/nccl-tests/build/reduce_scatter.o > /nccl/nccl-tests/build/reduce_scatter_perf
Linking  /nccl/nccl-tests/build/reduce.o     > /nccl/nccl-tests/build/reduce_perf
Linking  /nccl/nccl-tests/build/alltoall.o   > /nccl/nccl-tests/build/alltoall_perf
Linking  /nccl/nccl-tests/build/scatter.o    > /nccl/nccl-tests/build/scatter_perf
Linking  /nccl/nccl-tests/build/gather.o     > /nccl/nccl-tests/build/gather_perf
Linking  /nccl/nccl-tests/build/sendrecv.o   > /nccl/nccl-tests/build/sendrecv_perf
Linking  /nccl/nccl-tests/build/hypercube.o  > /nccl/nccl-tests/build/hypercube_perf
make[1]: Leaving directory '/nccl/nccl-tests/src'
$
```

Double-check that the `nccl-tests/build` directory contains binaries files., including all_gather_perf.

```bash
thekim_google_com@a3m123-controller:~$ tree nccl-tests/build/
```
```bash
nccl-tests/build/
├── all_gather_perf
├── all_reduce_perf
├── alltoall_perf
├── broadcast_perf
├── gather_perf
├── hypercube_perf
├── reduce_perf
├── reduce_scatter_perf
├── scatter_perf
├── sendrecv_perf
├── timer.o
└── verifiable
    └── verifiable.o

2 directories, 12 files
thekim_google_com@a3m123-controller:~$
```
## Error without the NCCL test binaries

The next step to run the `run-nccl-tests.sh` script will fail as follows.
```bash
$ sbatch run-nccl-tests.sh
Submitted batch job 1786
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              1786    a3mega run-nccl thekim_g  R       0:21      2 a3m123-a3meganodeset-[1,14]
$ ls
  ...  run-nccl-tests.sh  ...  slurm-1786.out ...
$ cat slurm-1786.out
+ CONTAINER_IMAGE=./nvidia+pytorch+24.04-py3.sqsh
+ NCCL_LIB_DIR=/var/lib/tcpxo/lib64
  ...
15: slurmstepd: error: Failed to invoke spank plugin stack
 8: slurmstepd: error: pyxis: child 710091 failed with error cod
$
```
Note: the `squeue` command terminates too quickly after less than 1 minute.
```bash
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
$
```

## Create `run-nccl-tests.sh` with a text editor
```bash
#!/bin/bash
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#SBATCH --partition=a3mega
#SBATCH --mem=0
#SBATCH -N 2
#SBATCH --gpus-per-node=8
#SBATCH --ntasks-per-node=8

# Usage: sbatch run-nccl-tests.sh

set -x
# This should be set to the squashfs file that you created for your application
CONTAINER_IMAGE=./nvidia+pytorch+24.04-py3.sqsh

# Set up NCCL Environment variables
# The following two can be useful for debugging
# export NCCL_DEBUG=INFO
# export NCCL_DEBUG_SUBSYS=INIT,NET

# These parameters should not be modified
NCCL_LIB_DIR="/var/lib/tcpxo/lib64" source /var/lib/tcpxo/lib64/nccl-env-profile.sh
export NCCL_FASTRAK_CTRL_DEV=enp0s12
export NCCL_FASTRAK_IFNAME=enp6s0,enp7s0,enp13s0,enp14s0,enp134s0,enp135s0,enp141s0,enp142s0
export NCCL_SOCKET_IFNAME=enp0s12
export NCCL_FASTRAK_LLCM_DEVICE_DIRECTORY=/dev/aperture_devices

# Here we grab all the environment variables that need to be
# passed down into the container. Slurm would otherwise only pass these env vars
# to the job environment on the host.
# shellcheck disable=SC2001
HOST_VARS=$(sed 's/ \{1,\}/,/g' <<<"${!NCCL*}")

# Mount /var/tmp to allow the rest of the enroot container to be read-only, and
# mount current $PWD to /nccl to for accessing nccl-tests binary
CONTAINER_MOUNTS="/var/tmp:/var/tmp"

# Mount PWD to /nccl in the enroot container
CONTAINER_MOUNTS=${CONTAINER_MOUNTS},"$PWD:/nccl"

# Mount required directories for GPUDirect-TCPXO functionality
CONTAINER_MOUNTS=${CONTAINER_MOUNTS},"/var/lib/tcpxo/lib64/"

# Run the workload
srun -l \
	-N "${SLURM_NNODES}" \
	--mpi=pmi2 \
	--ntasks-per-node=8 \
	--container-image="${CONTAINER_IMAGE}" \
	--container-env="${HOST_VARS}" \
	--container-mounts="${CONTAINER_MOUNTS}" \
	sh -c "
  export LD_LIBRARY_PATH=/var/lib/tcpxo/lib64:/usr/lib/x86_64-linux-gnu:\$LD_LIBRARY_PATH;
  /nccl/nccl-tests/build/all_gather_perf -b 8M -e 8G -f 2 -g 1 -w 5 --iters 200 -c 0;
  "
```

```bash
$ ls
cluster-toolkit  run-nccl-tests.sh  ...
$
```

## Submit the script.
```bash
$ sbatch run-nccl-tests.sh
```
```bash
Submitted batch job 1790
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              1790    a3mega run-nccl thekim_g  R       0:02      2 a3m123-a3meganodeset-[1,14]
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              1790    a3mega run-nccl thekim_g CG       3:04      2 a3m123-a3meganodeset-[1,14]
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
$
```
The status of the `squeue` command changes over time:
- R or running,
- CG or Completing.

```bash
$ ls
cluster-toolkit  nccl-tests  nvidia+pytorch+24.04-py3.sqsh  run-nccl-tests.sh  ...  slurm-1790.out ...
$
```
Notice the output file is created.

## Sample output
```bash
$ cat slurm-1790.out
```
```bash
  ...
0: #                                                              out-of-place                       in-place          
 0: #       size         count      type   redop    root     time   algbw   busbw #wrong     time   algbw   busbw #wrong
 0: #        (B)    (elements)                               (us)  (GB/s)  (GB/s)            (us)  (GB/s)  (GB/s)       
 0:      8388608        131072     float    none      -1    309.5   27.11   25.41    N/A    306.9   27.33   25.63    N/A
 0:     16777216        262144     float    none      -1    412.6   40.66   38.12    N/A    413.9   40.53   38.00    N/A
 0:     33554432        524288     float    none      -1    457.4   73.37   68.78    N/A    458.8   73.13   68.56    N/A
 0:     67108864       1048576     float    none      -1    667.7  100.50   94.22    N/A    670.0  100.16   93.90    N/A
 0:    134217728       2097152     float    none      -1   1061.1  126.49  118.59    N/A   1058.4  126.82  118.89    N/A
 0:    268435456       4194304     float    none      -1   1670.9  160.66  150.62    N/A   1672.3  160.52  150.49    N/A
 0:    536870912       8388608     float    none      -1   2858.2  187.84  176.10    N/A   2865.0  187.39  175.68    N/A
 0:   1073741824      16777216     float    none      -1   5516.7  194.63  182.47    N/A   5513.4  194.75  182.58    N/A
 0:   2147483648      33554432     float    none      -1    10822  198.43  186.03    N/A    10816  198.55  186.14    N/A
 0:   4294967296      67108864     float    none      -1    21431  200.41  187.88    N/A    21414  200.56  188.03    N/A
 0:   8589934592     134217728     float    none      -1    42637  201.47  188.88    N/A    42610  201.59  188.99    N/A
 0: # Out of bounds values : 0 OK
 0: # Avg bus bandwidth    : 128.817 
 0: #
 0: 
 $
```
