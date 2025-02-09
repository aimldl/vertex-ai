# 2_5. Initialize `gcloud`
* Created: 2025-02-04 (Tue)
* Updated: 2025-02-09 (Sun)

## `gcloud init` 
```bash
$ gcloud init
```

## Example output
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

## `vertex` failed
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
