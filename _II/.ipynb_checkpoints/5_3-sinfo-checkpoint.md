# 5.3. sinfo
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-22 (Sat)

`sinfo` displays node and partition information and is typically the first command used after connecting to a Slurm cluster.

## `$ sinfo`
displays
- partition name (a3p*, debug)
- cluster's health (STATE idle)
- number of nodes in each partition (NODES 32 vs. 8)

The Common node states
- idle 		Currently not in use and available
- alloc 	Allocated to one or more jobs and not available
- mix 		Partially allocated
- down 		Currently not responding or unavailable

## Examples: healthy conditions
### An example cluster with 16 worker nodes

```bash
thekim_google_com@a3m123-controller:~$ sinfo
```
```bash
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
a3mega*      up   infinite     16   idle a3m123-a3meganodeset-[0-15]
debug        up   infinite      4  idle~ a3m123-debugnodeset-[0-3]
$
```
### An example cluster with 32 worker nodes
```bash
$ sinfo
```
```bash
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
a3p*         up   infinite     32   idle slurm0a3p-a3pnodeset-[0-31]
debug        up   infinite      4  idle~ slurm0a3p-debugnodeset-[0-3]
$
```

### An example cluster with 64 worker nodes
```bash
$ sinfo
```
```bash
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
a3mega*      up    6:00:00     61   idle a3mega-a3meganodeset-[0-63]
debug        up   infinite      4  idle~ a3mega-debugnodeset-[0-3]
$
```

## Examples with unhealthy conditions
```bash
$ sinfo
```
```bash
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
a3mega*      up    6:00:00      3  drain a3mega-a3meganodeset-[18,35,40]
a3mega*      up    6:00:00     61   idle a3mega-a3meganodeset-[0-17,19-34,36-39,41-63]
debug        up   infinite      4  idle~ a3mega-debugnodeset-[0-3]
$
```
Three nodes are drained. See the node index `[18,35,40]` to figure out which nodes are drained. Reach out to the system administrator to fix the problem.

The situation is severe in the following case. 
```bash
$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
a3mega*      up   infinite     14  drain a3m123-a3meganodeset-[0-2,4-12,14-15]
a3mega*      up   infinite      2   idle a3m123-a3meganodeset-[3,13]
debug        up   infinite      4  idle~ a3m123-debugnodeset-[0-3]
$
```
14 out of 16 nodes are drained. An action must be taken to fix the situations.