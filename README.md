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
### Setup GCM for github permissions

For WSL I use the Debian/Ubuntu install:

https://github.com/GitCredentialManager/git-credential-manager#ubuntudebian-distributions

```
git config --global credential.credentialStore cache
```
Then run `git push` and paste in the generated token from the link below.

https://github.com/settings/tokens


## Install Alacritty
https://github.com/alacritty/alacritty#installation


## To Do:
* Add color scheme for Alacritty: https://github.com/eendroroy/alacritty-theme
* Add dircolors: https://github.com/arcticicestudio/nord-dircolors,
