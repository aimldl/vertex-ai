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

## Prerequisite: the Go programming language
Install the Go programming language first. See https://go.dev/doc/install for the full instructions.

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
Re-start the terminal or log back in again to see:
```bash
$ go version
```
```bash
go version go1.23.6 linux/amd64
```

## Commands-in-action
### [Clone the Cluster Toolkit GitHub repository](https://cloud.google.com/cluster-toolkit/docs/quickstarts/slurm-cluster#clone_the_github_repository)
```bash
$ git clone https://github.com/GoogleCloudPlatform/cluster-toolkit
```
```bash
Cloning into 'cluster-toolkit'...
remote: Enumerating objects: 65329, done.
  ...
Updating files: 100% (1472/1472), done.
$ ls
cluster-toolkit  ...
```
```bash
$ cd cluster-toolkit
```
```bash
$ ls
CONTRIBUTING.md  Makefile   SECURITY.md  community  examples     go.mod  modules  tests
LICENSE          README.md  cmd          docs       gcluster.go  go.sum  pkg      tools
```

### [Build the Cluster Toolkit binary](https://cloud.google.com/cluster-toolkit/docs/quickstarts/slurm-cluster#build_the_binary)

The Go programming language is necessary to build this. Otherwise,

```bash
$ make
Makefile:131: *** ERROR: could not find go in PATH, visit: https://go.dev/doc/install.  Stop.
$
```
Run
```bash
$ make
```
```bash
Makefile:154: WARNING: terraform not installed and deployments will not work in this machine, visit https://learn.hashicorp.com/tutorials/terraform/install-cli
Makefile:202: WARNING: packer not installed, visit https://learn.hashicorp.com/tutorials/packer/get-started-install-cli
**************** building gcluster ************************
go: downloading github.com/hashicorp/go-getter v1.7.8
  ...
go: downloading github.com/census-instrumentation/opencensus-proto v0.4.1
$
```
```bash
$ ls
```
```bash
CONTRIBUTING.md  SECURITY.md  examples     go.mod                       pkg
LICENSE          cmd          gcluster     go.sum                       tests
Makefile         community    gcluster.go  go1.23.6.linux-amd64.tar.gz  tools
README.md        docs         ghpc         modules
$
```

```bash
./gcluster --version
```
```bash
gcluster version - not built from official release
Built from 'main' branch.
Commit info: v1.46.0-1-ge727f261
$
```
```bash
./gcluster --help
```
```bash
gHPC provides a flexible and simple to use interface to accelerate
HPC deployments on the Google Cloud Platform.

Usage:
  gcluster [flags]
  gcluster [command]

Available Commands:
  completion     Generate completion script
  create         Create a new deployment.
  deploy         deploy all resources in a Toolkit deployment directory.
  destroy        destroy all resources in a Toolkit deployment directory.
  expand         Expand the Environment Blueprint.
  export-outputs Export outputs from deployment group.
  help           Help about any command
  import-inputs  Import input values from previous deployment groups.

Flags:
  -h, --help       help for gcluster
      --no-color   Disable colorized output.
  -v, --version    version for gcluster

Use "gcluster [command] --help" for more information about a command.
$
```
