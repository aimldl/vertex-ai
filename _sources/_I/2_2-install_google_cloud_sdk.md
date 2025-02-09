# 2.2. Install Google Cloud SDK
* Created: 2025-02-04 (Tue)
* Updated: 2025-02-09 (Sun)

## Introducing Google Cloud SDK (Software Development Kit)
Google Cloud SDK is the overall suite of development tools, including the gcloud CLI. You can use the gcloud CLI to manage various Google Cloud resources and services directly from your terminal.

```
Q: What are the supported GUI and CLI for Google Cloud?
A: Vertex AI supports both GUI (Graphic User Interface) and CLI (Command Line Interface).

   GUI = (Google) Cloud Console
   * The Cloud Console is the GUI for the entire Google Cloud Platform.
   * Vertex AI is a part of Google Cloud Platform.
   * Therefore, Cloud Console is the GUI supported also for Vertex AI.

   CLI = Cloud Shell
   * Cloud Shell is available automatically on Cloud Console.
   * Google Cloud SDK comes preinstalled within Cloud Shell.
   * Therefore, Cloud Shell can be said it's the CLI for the GUI (Cloud Console).

   CLI = Google Cloud SDK
   * This SDK can be installed on local machines.
   * After the installation, it should be initialized to provide the basic information such as the target project ID.
   * Otherwise, there is no way that the SDK knows what project the user is targeting to connect.
   * Note: The Cloud Shell launched within Cloud Console (GUI) knows the project because it's launched in the Project ID.
``` 
## Double-check if the `gcloud` command has already been installed.
Open the local terminal and run any command with the gcloud command. For example,
```bash
# Check the installed version
$ gcloud version
```
An error will occur if the SDK is not installed.
```bash
Command gcloud not found
$
```

If it's installed, the output should look like:
```bash
Google Cloud SDK 509.0.0
bq 2.1.12
bundled-python3-unix 3.12.8
core 2025.01.31
gcloud-crc32c 1.0.0
gsutil 5.33
$ 
```

## Download and install Google Cloud SDK
If the Google Cloud SDK is not installed, follow the instructions in [Download and install the gcloud CLI](https://cloud.google.com/sdk/docs/install).

```bash
# Download
$ curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
$ tar -xf google-cloud-cli-linux-x86_64.tar.gz

# Install
$ ./google-cloud-sdk/install.sh
```

The full output message should look like: 
```bash
$ curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  141M  100  141M    0     0  37.7M      0  0:00:03  0:00:03 --:--:-- 37.7M
$ tar -xf google-cloud-cli-linux-x86_64.tar.gz
$ ./google-cloud-sdk/install.sh
Welcome to the Google Cloud CLI!

To help improve the quality of this product, we collect anonymized usage data
and anonymized stacktraces when crashes are encountered; additional information
is available at <https://cloud.google.com/sdk/usage-statistics>. This data is
handled in accordance with our privacy policy
<https://cloud.google.com/terms/cloud-privacy-notice>. You may choose to opt in this
collection now (by choosing 'Y' at the below prompt), or at any time in the
future by running the following command:

    gcloud config set disable_usage_reporting false

Do you want to help improve the Google Cloud CLI (y/N)?  y
  ...
Modify profile to update your $PATH and enable shell command completion?

Do you want to continue (Y/n)? y

Enter a path to an rc file to update, or leave blank to use [/home/thekim/.bashrc]:  
Backing up [/home/thekim/.bashrc] to [/home/thekim/.bashrc.backup].
[/home/thekim/.bashrc] has been updated.

==> Start a new shell for the changes to take effect.

For more information on how to get started, please visit:
  https://cloud.google.com/sdk/docs/quickstarts

$
```
The Bash shell should be restarted to make it visible. Re-open the terminal or run
```bash
$ bash
```
to relaunch the Bash shell.

To double-check, run any `gcloud` command. For example,
```bash
$ gcloud version
```
