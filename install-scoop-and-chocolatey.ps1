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
