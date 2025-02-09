# 2-1. Conda Environment: Create and Activate
* Created: 2025-02-04 (Tue)
* Updated: 2025-02-05 (Wed)

## Create a New Conda Environment

```bash
(base) $ conda create -n vertex
```
```bash
Retrieving notices: done
Channels:
 - conda-forge
 - defaults
Platform: linux-64
Collecting package metadata (repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/thekim/anaconda3/envs/vertex

Proceed ([y]/n)?
```

Enter `y`

```bash
Proceed ([y]/n)? y


Downloading and Extracting Packages:

Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate vertex
#
# To deactivate an active environment, use
#
#     $ conda deactivate

(base) $
```

## Activate the New Conda Environment

```bash
(base) $ conda activate vertex
(vertex) $
```
