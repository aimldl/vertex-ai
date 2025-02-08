# 2-3. Create a New Project
* Created: 2025-02-04 (Tue)
* Updated: 2025-02-04 (Tue)

# TODO:
## Problem
The CLI commands failed on argolis.

```bash
 (vertex) $ gcloud projects create vertex
ERROR: (gcloud.projects.create) Project creation failed. The project ID you specified is already in use by another project. Please try an alternative ID.
(vertex) $ 
```
Add the account name `thekim` to make the project ID unique.
```bash
(vertex) $ gcloud projects create thekim-vertex
```
```bash
Create in progress for [https://cloudresourcemanager.googleapis.com/v1/projects/thekim-vertex].
Waiting for [operations/cp. ... ] to finish...done.
Enabling service [cloudapis.googleapis.com] on project [thekim-vertex]...
Operation "operations/acat.p2- ... " finished successfully.
(vertex) $
```

For more details, refer to the official guide. Resouce Manager > Doc. > Guides > [Creating and managing projects](https://cloud.google.com/resource-manager/docs/creating-managing-projects)

## Hint
