# 2-4. Update Google Cloud SDK
* Created: 2025-02-04 (Tue)
* Updated: 2025-02-09 (Sun)

## Check the current version.
```bash
$ gcloud version
```
(example output)
```bash
Google Cloud SDK 498.0.0
  ...
gsutil 5.31
$
```
##  Run the `gcloud components update` command
```bash
$ gcloud components update
```
```bash
  ...
Do you want to opt-in (y/N)? y
```

## Double-check the updated version numbers
Run:
```bash
$ gcloud version
```
(example output)
```bash
Google Cloud SDK 509.0.0
  ...
gsutil 5.33
$
```

Notice the versions are upgraded 
* from 498.0.0 to 509.0.0 for `Google Cloud SDK` and
* from 5.31 to 5.33 for `gsutil`.