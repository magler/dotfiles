# magler's dotfiles
This is my attempt to make a set of dotfiles.

The goal is to make them so that I can load them on a Windows or Linux machine and have a common configuration across platforms. I will be relying heavily on WSL because I prefer the Linux environment over all others, but unfortunately I am not always able to use it.

## Configuration
### Setup WSL for Windows environments

https://docs.microsoft.com/en-us/windows/wsl/install-on-server

First thing that needs to happen is that WSL will need to be setup if this is Windows. Until I have a way to automate this, I will rely on manual setup.

```
# First make sure that PowerShell is running as Administrator.
## Enable Hyper V(not sure if this is actually required)

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Once that is done you will need to restart. If it is already enabled then skip reboot.

Restart-Computer
```
Next step is to actually enable WSL.

```
# First make sure that PowerShell is running as Administrator.

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# Once that is done you will need to restart. If it is already enabled then skip reboot.

Restart-Computer
```

Once WSL is enabled I will install ubuntu WSL distro.
```
Invoke-WebRequest -Uri https://aka.ms/wslubuntu -OutFile Ubuntu.appx -UseBasicParsing

Add-AppxPackage .\app_name.appx
 ```

### configure WSL
Need to make sure that docker is started when wsl starts.
`sudo vim /etc/wsl.conf`

```
# Set a command to run when a new WSL instance launches. This example starts the Docker container service.
[boot]
command = service docker start
```

#### Backing up WSL
Once WSL is installed and working, you will need to make sure that you are regularly backing up the distro so you can restore if there is ever an issue.

DO THIS OFTEN!

```
# The format for the command looks somthing lie this
wsl --export <distro_name> ./wsl_<date>_<distro_name>.tar

# For example, this is the format that I would use to backup my WSL distro.
wsl --export Ubuntu-20.04 ./wsl_05102022_Ubuntu-20.04.tar
```
At some point I would like to automate this, but for now I have a oneliner that I run manually.

#### Restoring WSL
Importing is as easy at exporting.

```
# command format is as follows.
wsl --import <exported_distro> <install_location> .\wsl_<date>_<distro_name>.tar

# here is an example of a restore that I ran
wsl --import Ubuntu-20.04_05062022 c:\wsl_Ubuntu-2004_05062022 .\wsl_05062022_Ubuntu-20.04.tar
```

# Bitbucket auth

For setting up auth to Bitbucket I use the instructions from the Bitbucket Docs.

https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/

Skip Step 2, Setting up the key access to the repo should be done local, using the instructions below.
https://stackoverflow.com/a/41947805

### Setup GCM for github permissions

If I need to auth anything on github, For WSL I use the Debian/Ubuntu install:

Releases
```
$ curl -v "https://api.github.com/repos/GitCredentialManager/git-credential-manager/releases/latest"
```

https://github.com/GitCredentialManager/git-credential-manager#ubuntudebian-distributions

```
git config --global credential.credentialStore cache
```
Then run `git push` and paste in the generated token from the link below.

https://github.com/settings/tokens

For windows you need to use the helper store instead.

```
git config --global credential.helper store
```

### Git config settings

```
# Set Vim as the default editor.
git config --global core.editor "vim"
```


## Docker install and config.
### Docker install

```
sudo apt update

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

apt-cache policy docker-ce

# Set the user permissions:
sudo usermod -aG docker ${USER}

sudo apt install docker-ce

sudo service docker start
```


### Docker config
In some networks there are conflicts, so I configure my own ip range for local dev.

```
sudo cat > /etc/docker/daemon.json <<EOL
need to add this to /etc/docker/daemon.json:
{
  "default-address-pools":
  [
    {"base":"10.0.0.0/16","size":24}
  ]
}
sudo service docker restart
```

## Git 
### Add Git to path
In order to use Vim-plug in GVim, Need to add git to the path.
install git https://git-scm.com/download/win

Then to avoid the error:
> [vim-plug] `git` executable not found.
1. Open Powershell in Admin mode and run the following command to add git to the path
```
$newpath = 'C:\Program Files\Git\bin;C:\Program Files\Git\cmd'
$oldPath = [Environment]::GetEnvironmentVariable('PATH', 'Machine');
[Environment]::SetEnvironmentVariable('PATH', "$newPath;$oldPath",'Machine');

# DEPRECATED - don't use this:
setx /M path "%path%;C:\Program Files\Git\bin;C:\Program Files\Git\cmd"
```
This will allow you to run git from the command line in windows.

```

```
## To Do:
* Add windows bat file https://stackoverflow.com/a/21040825
* Add in automation for some configuration options.
* Add color scheme for Alacritty: https://github.com/eendroroy/alacritty-theme
* Add dircolors: https://github.com/arcticicestudio/nord-dircolors
* Add instructions for installing pyenv: https://github.com/pyenv/pyenv#getting-pyenv
  * Use ~/.profile
  * Install Python: https://realpython.com/intro-to-pyenv/
* Add instructions for installing Docker: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
* Add instructions for updating the docker subnet pool: https://support.getjoan.com/knowledge/How-to-change-the-Docker-default-subnet-IP-address
* Add instructions for installing docker-compose: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04
* Add instructions for WSL network config: https://www.jorgebernhardt.com/how-to-disable-ipv6-network-adapter-using-powershell/
* Add instructions for backing up wsl distro.
