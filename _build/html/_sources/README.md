# A Practical Guide to Machine Learning with Google Cloud
* Created: 2024-12-11 (Wed)
* Updated: 2025-02-05 (Wed)

This repository contains the files for a Jupyter Book project. The published book can be viewed at [https://aimldl.github.io/vertex-ai/](https://aimldl.github.io/vertex-ai/)

## Setting up this Jupyter Book project
Details on setting up this Jupyter Book project are available in these guides:
- [A Quick Start to Jupyter Book](https://docs.google.com/document/d/1PXdBtuoIniWVbuAqwCFzM44fuYRyVbnd84CvRVcIA3M/edit?tab=t.0#heading=h.nghxr9spi7kt)
- [Happy Book Writing with Jupyter Book for a Programmer](https://docs.google.com/document/d/1XQWcRHX990Od6lShArrVzlKUOTdtHs3uFVqvJEp8rqM/edit?tab=t.0)

<img src="img/jupyter_book-entire_process.png">

The following instructions assume the project is already configured.

## Building the Book

The book building process involves three steps:

1. **Content Creation:** Create the content and organize it using folders, files, and a configuration file.
2. **Book Building:** Generate the book in either HTML or PDF format.
3. **"Git Push":** Push changes to the remote repository.
4. **Publishing:** Deploy the generated book online.

## 1. Updating Content
Open a terminal to update the book's content locally.

```bash
(base) $ conda activate jb
(jb) $ cd ~/github/vertex-ai
(jb) $ git pull

# Launch JupyterLab
(jb) $ jupyter lab
```

Modify files and directories using JupyterLab.

## 2. Building the Book
Open a separate terminal. Note the prompt starts in the same directory as your previous terminal session (e.g., `~/github/vertex-ai`).
```bash
# Example prompt
# (base) your_account:~/github/vertex-ai$ 
```
Execute the following commands:
```bash
(base) $ conda activate jb
(jb) $ jb clean . --all
(jb) $ jb build .

# Optional: View the built book locally
(jb) $ google-chrome _build/html/index.html
```

Alternatively, run:
```bash
(jb) $ ./jb_clean_build.sh
```

## 3. Pushing Changes to the Remote Repository
```bash
(jb) $ cd ~/github/vertex-ai
(jb) $ jb clean . --all
(jb) $ jb build .

# Prerequisite: The remote repository has already been configured.
# See below for a secure way to handle tokens.
(jb) $ cat ../token
# See below for a secure way to handle tokens.
(jb) $ git add ./*
(jb) $ git commit -m "Update the content"
(jb) $ git push
```
Consider a more secure way to handle tokens than `cat ../token`. For example, use environment variables or a dedicated secrets management solution.

Alternatively, run:
```bash
(jb) $ ./jb_git_push.sh
```

## 4. Publishing the Book

```bash
(jb) $ ghp-import -n -p -f _build/html/
```
Or run:
```bash
(jb) $ ./jb_publish.sh
```

The published book will be available at https://aimldl.github.io/vertex-ai/

## References
### Jupyter Book Official Documents
* [Structure the Table of Contents](https://jupyterbook.org/en/stable/structure/toc.html)
  - [Structure of a Book](https://jupyterbook.org/en/stable/structure/toc.html#structure-of-a-book)
  - [Use chapter sub-sections](https://jupyterbook.org/en/stable/structure/toc.html#use-chapter-sub-sections)
  - [Use parts to organize chapters](https://jupyterbook.org/en/stable/structure/toc.html#use-parts-to-organize-chapters)