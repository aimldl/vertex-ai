# 5.5. sbatch
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-10 (Mon)

`sbatch` submits a batch script for later execution. 

## test-hostname.sh
A simple script running the `hostname` command is below.
```bash
#!/bin/bash
#  test-hostname.sh

#SBATCH --job-name=test_job
#SBATCH --output=test_job.out
#SBATCH --error=test_job.err

echo "Hello from the Slurm cluster!"
hostname
echo "Testing job finished."
```

Save it in a file.
```bash
thekim_google_com@a3m123-controller:~$ nano test-hostname.sh
```

```bash
thekim_google_com@a3m123-controller:~$ ls
test-hostname.sh
thekim_google_com@a3m123-controller:~$ 
```

```bash
$ chmod +x test-hostname.sh
$ ./test-hostname.sh
```
```bash
Hello from the Slurm cluster!
a3m123-controller
Testing job finished.
$
```

```bash
$ sbatch test-hostname.sh
```
```bash
Submitted batch job 1783
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              1783    a3mega test_job thekim_g CG       0:01      1 a3m123-a3meganodeset-15
$ squeue
  JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
$ ls
test-hostname.sh test_job.err test_job.out
$ cat test_job.out
Hello from the Slurm cluster!
a3m123-a3meganodeset-15
Testing job finished.
$ cat test_job.err
$
```
## test-sbatch.sh
**Problem**
To distribute the `hostname` command to all allocated nodes, change the existing script on four different nodes.

```bash
#!/bin/bash
#  test-sbatch.sh

#SBATCH --job-name=test_job
#SBATCH --output=test_job.out
#SBATCH --error=test_job.err
#SBATCH --nodes=4

echo "Hello from the Slurm cluster!"
srun hostname  # Distribute it to allocated nodes
echo "Testing job finished."
```

```bash
$ sbatch test-sbatch.sh
Submitted batch job 1784
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              1784    a3mega test_job thekim_g  R       0:05      4 a3m123-a3meganodeset-[1,7,10,14]
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              1784    a3mega test_job thekim_g CG       0:24      4 a3m123-a3meganodeset-[1,7,10,14]
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
$
```
`ST`=State, `R`=Running, `CG`=CompletinG

```bash
$ cat test_job.out
Hello from the Slurm cluster!
a3m123-a3meganodeset-1
a3m123-a3meganodeset-10
a3m123-a3meganodeset-7
a3m123-a3meganodeset-14
Testing job finished.
$ cat test_job.err
$
```

## Run a command in a Docker container.
```bash
$ mkdir tests
$ cd tests/
$
```
And run 
```bash
tee hello.job << JOB
#!/bin/bash
#SBATCH --job-name=dkr_ex
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2
#SBATCH --partition=a3mega
#SBATCH --array=1-10
#SBATCH --output=out_%3A_%3a.txt
#SBATCH --error=err_%3A_%3a.txt

docker run hello-world
JOB
```
Note: change partition to yours. My partition name is `a3mega`.

`#SBATCH --partition=a3mega`

```bash
$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
a3mega*      up   infinite     16   idle a3m123-a3meganodeset-[0-15]
debug        up   infinite      4  idle~ a3m123-debugnodeset-[0-3]
$
```

For other example, see [Run a job in the cluster](https://github.com/GoogleCloudPlatform/scientific-computing-examples/blob/main/slurm-cookbook/docker/README.md).

```bash
$ ls
hello.job
$
```

```bash
$ cat hello.job  
```
```bash
#!/bin/bash
#SBATCH --job-name=dkr_ex
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2
#SBATCH --partition=a3mega
#SBATCH --array=1-10
#SBATCH --output=out_%3A_%3a.txt
#SBATCH --error=err_%3A_%3a.txt

docker run hello-world
$
```

```bash
$ sbatch hello.job
```
```bash
Submitted batch job 1791
$
```
```bash
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
            1791_2    a3mega   dkr_ex thekim_g CG       0:02      1 a3m123-a3meganodeset-0
            1791_3    a3mega   dkr_ex thekim_g CG       0:02      1 a3m123-a3meganodeset-9
            1791_4    a3mega   dkr_ex thekim_g CG       0:02      1 a3m123-a3meganodeset-2
            1791_5    a3mega   dkr_ex thekim_g CG       0:02      1 a3m123-a3meganodeset-4
            1791_6    a3mega   dkr_ex thekim_g CG       0:02      1 a3m123-a3meganodeset-11
            1791_7    a3mega   dkr_ex thekim_g CG       0:02      1 a3m123-a3meganodeset-1
            1791_8    a3mega   dkr_ex thekim_g CG       0:02      1 a3m123-a3meganodeset-14
            1791_9    a3mega   dkr_ex thekim_g CG       0:01      1 a3m123-a3meganodeset-7
           1791_10    a3mega   dkr_ex thekim_g CG       0:01      1 a3m123-a3meganodeset-10
            1791_1    a3mega   dkr_ex thekim_g CG       0:02      1 a3m123-a3meganodeset-15
$

```
```bash
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
$
```
```bash
$ ls
```
```bash
err_1791_001.txt  err_1791_004.txt  err_1791_007.txt  err_1791_010.txt  out_1791_002.txt  out_1791_005.txt  out_1791_008.txt
err_1791_002.txt  err_1791_005.txt  err_1791_008.txt  hello.job         out_1791_003.txt  out_1791_006.txt  out_1791_009.txt
err_1791_003.txt  err_1791_006.txt  err_1791_009.txt  out_1791_001.txt  out_1791_004.txt  out_1791_007.txt  out_1791_010.txt
$
```

## Check the output

```bash
$ cat out_1791_001.txt
```
```bash

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

$
```

```bash
$ cat out_1791_010.txt
```
```bash
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
$

```
The same output.



```bash
$ cat err_1791_001.txt
```
```bash
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
e6590344b1a5: Pulling fs layer
e6590344b1a5: Verifying Checksum
e6590344b1a5: Download complete
e6590344b1a5: Pull complete
Digest: sha256:d715f14f9eca81473d9112df50457893aa4d099adeb4729f679006bf5ea12407
Status: Downloaded newer image for hello-world:latest
$
```

```bash
$ cat err_1791_010.txt
```
```bash
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
e6590344b1a5: Pulling fs layer
e6590344b1a5: Verifying Checksum
e6590344b1a5: Download complete
e6590344b1a5: Pull complete
Digest: sha256:d715f14f9eca81473d9112df50457893aa4d099adeb4729f679006bf5ea12407
Status: Downloaded newer image for hello-world:latest
$
```