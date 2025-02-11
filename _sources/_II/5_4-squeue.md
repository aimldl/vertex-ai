# 5.4. squeue
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-10 (Mon)

`squeue` shows information about jobs and is typically the second command to check the job queue status.

## Idle
```bash
$ squeue
```
```bash
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
$
```
indicates that there is no submitted job.

The following example shows the 32 worker nodes are taken by user `thekim_g`.
```bash
$ squeue
```
```bash
 JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
   444       a3p nemo-meg thekim_g  R       5:05     32 slurm0a3p-a3pnodeset-[0-31]
$
```
All the nodes in the a3p* partition are taken. What should I do now?

Recall Slurm is a cluster management and job scheduling system for Linux clusters. A job can be sumitted and queued. That's why the `squeue` command meant for. 