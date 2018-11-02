. ./ScoopAndChocolatey.ps1

#--Virutalization & Containers--#
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
choco install vagrant -y
choco install docker-for-windows -y
choco install vscode-docker -y
