#Requires -RunAsAdministrator

# Install or update Scoop -- https://scoop.sh/
if (Get-Command scoop -ErrorAction SilentlyContinue) {
    scoop update
} else {
    Set-ExecutionPolicy RemoteSigned -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh'))
}

# Install or update Chocolatey -- https://chocolatey.org/
if (Get-Command choco -ErrorAction SilentlyContinue) {
    choco upgrade chocolatey
} else {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Make `refreshenv` available right away, by defining the $env:ChocolateyInstall variable
# and importing the Chocolatey profile module.
$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).path)\..\.."
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

# refreshenv is now an alias for Update-SessionEnvironment
# (rather than invoking refreshenv.cmd, the *batch file* for use with cmd.exe)
# This should make git.exe accessible via the refreshed $env:PATH, so that it can be 
# called by name only.
refreshenv

#-- Install core utilities --#
scoop install sudo
choco install cmder -y
choco install sysinternals -y
choco install openssl.light -y
choco install curl -y
choco install 7zip -y
choco install git -y
choco install git-lfs.install -y
choco install poshgit -y
choco install openssh -y
choco install make -y
choco install rdm -y #Remote desktop manager
scoop install grep
scoop install concfg 
concfg import solarized small
scoop install pshazz
scoop install touch
scoop install time

#--Browsers--#
choco install googlechrome -y

#--Editors--#
choco install notepadplusplus -y
choco install vscode -y
choco install vim -y

#--Virutalization & Containers--#
choco install virtualbox -y
choco install vagrant -y
choco install docker-toolbox -y
choco install vscode-docker -y

#--Databases and tools--#
choco install sqlite -y
choco install sql-server-management-studio -y
choco install dbeaver -y
#mysql
#mysql-workbench

#--Node dev--#
choco install nodejs -y
refreshenv
npm install -g typescript
npm install -g gulp-cli
npm install -g @angular/cli

#-- .NET dev --#
#choco install visualstudio2017community -y
choco install dotnetcore-sdk -y
choco install nuget.commandline -y
choco install nugetpackageexplorer -y
choco install linqpad -y
choco install iis -y

#--Ruby on Rails Dev--#
choco install ruby -y
choco install bundler -source ruby
choco install rails -source ruby

#--Python Dev --#
choco  install python -y
choco install pip -y

#-- Java Dev --#
#jdk
#groovy
#gradle

#--Azure--#
choco install azure-cli -y
choco install azurepowershell -y

#-- DevOps --
#puppet
#chef

refreshenv

Write-Output "The following are installed via choco."
choco list --local-only

Write-Output "The following are installed via scoop."
scoop list
