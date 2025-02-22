# 5. Slurm Essentials for Cluster Toolkit and Vertex AI Infinipod
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-10 (Mon)

## Slurm (Simple Linux Utility for Resource Management)
Slurm is a workload manager for high-performance computing (HPC) systems that efficiently schedule jobs across multiple compute nodes. 

Slurm is a Cluster Workload Manager
<img src="images/slurm-logo.png">
Slurm is an open source, fault-tolerant, and highly scalable cluster management and job scheduling system for large and small Linux clusters. - source: https://slurm.schedmd.com/quickstart.html

## Purpose: Just enough to use Slurm
This part aims to introduce Slurm just enough to use Cluster Toolkit and Vertex AI Infinipod. So it's a quick start that explains the essential concepts and frequently used client commands.

### Scope: Slurm > Doc. > Slurm Users
The [official documentation](https://slurm.schedmd.com/documentation.html) ([Slurm > Doc.](https://slurm.schedmd.com/documentation.html)). The [Slurm > Doc.](https://slurm.schedmd.com/documentation.html) consists of three parts:

* Slurm Users
* Slurm Administrators
* Slurm Developers

and our scope is to cover a part of Slurm Users. Specifically,

* Slurm > Doc. > Slurm Users
  - [Quick Start User Guide](https://slurm.schedmd.com/quickstart.html)
  - [Command/option Summary (two pages)](https://slurm.schedmd.com/pdfs/summary.pdf)

* Github Repository
  - https://github.com/GoogleCloudPlatform/cluster-toolkit
  - https://github.com/GoogleCloudPlatform/scientific-computing-examples
      - [Example: HPC Toolkit Support Slurm and Docker](https://github.com/GoogleCloudPlatform/scientific-computing-examples/blob/main/slurm-cookbook/docker/README.md)


