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
```bash

```
```bash

```
```bash

```
```bash

```
```bash

```
```bash

```
```bash

```
```bash

```
```bash

```
```bash

```
```bash

```
```bash

```
