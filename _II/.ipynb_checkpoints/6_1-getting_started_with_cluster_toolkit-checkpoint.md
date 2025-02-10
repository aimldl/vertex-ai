# 6.1. Getting Started with Cluster Toolkit
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-10 (Mon)

## Deploy an HPC cluster with Slurm
To build the `gcluster` binary, run:

```bash
git clone https://github.com/GoogleCloudPlatform/cluster-toolkit
cd cluster-toolkit
make
./gcluster --version
./gcluster --help
```
Install the `tree` command.
```bash
$ sudo apt install -y tree
```

```bash
$ git clone https://github.com/GoogleCloudPlatform/cluster-toolkit
Cloning into 'cluster-toolkit'...
remote: Enumerating objects: 65329, done.
  ...
Updating files: 100% (1472/1472), done.
$ ls
cluster-toolkit  ...
$ cd cluster-toolkit
$ ls
CONTRIBUTING.md  Makefile   SECURITY.md  community  examples     go.mod  modules  tests
LICENSE          README.md  cmd          docs       gcluster.go  go.sum  pkg      tools
$ make
./gcluster --version
./gcluster --help
```
## Problem
```bash
$ make
Makefile:131: *** ERROR: could not find go in PATH, visit: https://go.dev/doc/install.  Stop.
$
```

## Hint
The error message indicates that "can't find the Go programming language installation on your system."

### Install Go.
https://go.dev/doc/install

```bash
$ wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz
```
```bash
go1.23.6.linux-amd64.t 100%[===========================>]  70.23M  21.4MB/s    in 4.2s    

2025-02-10 15:35:04 (16.7 MB/s) - ‘go1.23.6.linux-amd64.tar.gz’ saved [73643139/73643139]
$
```
```bash
$ sudo tar -xzf go1.23.6.linux-amd64.tar.gz -C /usr/local
$
```

Bash: ~/.bashrc or ~/.bash_profile

```bash
$ nano ~/.bash_profile
$
```
Add Go to your PATH:
```bash
export PATH=$PATH:/usr/local/go/bin
```

TODO

```bash

```
```bash

```
```bash

```
```bash

```
## 
