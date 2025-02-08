# 2.2. Install Google Cloud SDK
* Created: 2025-02-04 (Tue)
* Updated: 2025-02-05 (Wed)

## GUI + CLI
Vertex AI supports both GUI (Graphic User Interface) and CLI (Command Line Interface).

### GUI: (Google) Cloud Console
The Cloud Console is the GUI for the entire Google Cloud Platform and Vertex AI is a part of Google Cloud Platform.

### CLI on the GUI: Cloud Shell
Cloud Shell is available automatically on Cloud Console. Installation and initialization are not necessary.

### CLI: Google Cloud SDK
[Download and install the gcloud CLI](https://cloud.google.com/sdk/docs/install) in the local terminal and initialize it.

Google Cloud SDK (Software Development Kit) is the overall suite of development tools, including the gcloud CLI. You can use the gcloud CLI to manage various Google Cloud resources and services directly from your terminal.

For details, refer to [Google Cloud Command Line Interface (gcloud CLI)](https://cloud.google.com/cli?hl=en#:~:text=Pricing-,Pricing,with%20a%20Google%20Cloud%20account.&text=). And see [gcloud CLI overview](https://cloud.google.com/sdk/gcloud#:~:text=You%20can%20also%20use%20the,configuration%2C%20and%20perform%20other%20tasks.)

## Double-check if the `gcloud` command is ready to use

### Check the installed version

```bash
$ gcloud version
```

```bash
Google Cloud SDK 498.0.0
alpha 2024.10.18
beta 2024.10.18
bq 2.1.9
bundled-python3-unix 3.11.9
core 2024.10.18
gcloud-crc32c 1.0.0
gsutil 5.31
$
```

In the local terminal, run:
```bash
$ gcloud components update
  ...
Do you want to opt-in (y/N)? y
```
After the update, make sure the version numbers are updated.
```bash
$ gcloud version
```

```bash
Google Cloud SDK 509.0.0
alpha 2025.01.31
beta 2025.01.31
bq 2.1.12
bundled-python3-unix 3.12.8
core 2025.01.31
gcloud-crc32c 1.0.0
gsutil 5.33
$
```

### Initialize `gcloud`

Run 
```bash
$ gcloud init
```

```bash
Welcome! This command will take you through the configuration of gcloud.

  ...

Pick configuration to use:
 [1] Create a new configuration
 [2] Switch to and re-initialize existing configuration: [default]
Please enter your numeric choice:  
```

```bash
Please enter your numeric choice:  1

Enter configuration name. Names start with a lower case letter and contain only lower case letters a-z, digits 0-9, and hyphens '-':  vertex
Your current configuration has been set to: [vertex]
   ...

   Select an account:
 [1] admin@my.id.com
 [2] Sign in with a new Google Account
 [3] Skip this step
Please enter your numeric choice: 1
```

```bash
Enter a Project ID. Note that a Project ID CANNOT be changed later.
Project IDs must be 6-30 characters (lowercase ASCII, digits, or
hyphens) in length and start with a lowercase letter.
```

I chose the project ID to be "vertex". This project is about Vertex AI, but a name like "vertex-ai" will be confusing with `~/github/vertex-ai` and other stuff.

```bash
WARNING: Project creation failed: HttpError accessing 
  ...
"error": {
    "code": 409,
    "message": "Requested entity already exists",
    "status": "ALREADY_EXISTS"
  }
}
>
Please make sure to create the project [vertex] using
    $ gcloud projects create vertex
or change to another project using
    $ gcloud config set project <PROJECT ID>
The Google Cloud CLI is configured and ready to use!

* Commands that require authentication will use admin@thekim.altostrat.com by default
Run `gcloud help config` to learn how to change individual settings

This gcloud configuration is called [vertex]. You can create additional configurations if you work with multiple accounts and/or projects.
Run `gcloud topic configurations` to learn more.

Some things to try next:

* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command.
* Run `gcloud topic --help` to learn about advanced features of the CLI like arg files and output formatting
* Run `gcloud cheat-sheet` to see a roster of go-to `gcloud` commands.
$
```