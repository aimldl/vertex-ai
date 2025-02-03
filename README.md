# A Practical Guide to Machine Learning with Google Cloud
- Created 2024-12-11 (Wed)
- Updated 2024-12-11 (Wed)

This repository stores files for a Jupyter Book project. 
For the published result, go to https://aimldl.github.io/vertex-ai/.

## Overview: the book building process
There are three steps:
- 1. Create the content (and structure it with folders, files, and configuration).
- 2. Build the book (into either an HTML or a PDF file).
- 3. Publish it online.
 

## Update the content 
At the local machine, update the content.
```bash
(base) $ conda activate jb
(jb) $ cd ~/github/vertex-ai
(jb) $ jupyter lab
```

## Push the files to the remote repo
 
```bash
(jb) $ cd ~/github/vertex-ai
(jb) $ jb clean . --all
(jb) $ jb build .
(jb) $ git add ./*
(jb) $ git commit -m "Update the content"
(jb) $ cat ../token
(jb) $ git push
```
## To publish it,

```bash
(jb) $ ghp-import -n -p -f _build/html/
```
