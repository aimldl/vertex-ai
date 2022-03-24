# README
* First written: 2022-03-24 (Thu)

Step 1. Clone this repository and copy Bash scripts in this directory to the user home.
```bash
$ git clone https://github.com/aimldl/vertex-ai.git
$ cp vertex-ai/projects/facebook-dino/* .
$ rm README.md 
```

Step 2. Upload your Kaggle API credentials `kaggle.json`.

Click the upload button and select `kaggle.json`

<img src='../images/vertex_ai-workbend-upload.png' width='30%'>

`kaggle.json` is located in the user home directory.

<img src='../images/vertex_ai-workbend-uploaded_kaggle_json.png' width='30%'>

Step 3. Execute `run`.

```
The prerequisite to execute run is to get kaggle.json in advance.
run takes care of kaggle.json assuming it's located in the user home directory.
kaggle.json is necessary because the ImageNet dataset is downloaded from Kaggle.
```

```bash
$ chmod +x run
$ ./run
```
which will automatically execute the rest of Bash scripts. That is,
```bash
$ ./create_conda_virtual_environment
$ ./prep_to_run_vit
$ ./run_vit
```
