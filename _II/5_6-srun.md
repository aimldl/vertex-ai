# 5.6. srun
* Created: 2024-05-15 (Wed)
* Updated: 2025-02-10 (Mon)

```bash
$ srun -N 3 hostname
```

```bash
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              1785    a3mega hostname thekim_g  R       0:08      3 a3m123-a3meganodeset-[1,14-15]
$
```

In several seconds,
```bash
$ srun -N 3 hostname
a3m123-a3meganodeset-1
a3m123-a3meganodeset-14
a3m123-a3meganodeset-15
$s
```

```bash

```

```bash

```

