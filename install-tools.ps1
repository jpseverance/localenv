. .\install-scoop-and-chocolatey.ps1

. .\install-azure-dev.ps1

. .\install-core-utils.ps1

. .\install-dbs.ps1

. .\install-dotnetdev.ps1

. .\install-editors.ps1

. .\install-java-dev.ps1

. .\install-node-dev.ps1

. .\install-python-dev.ps1

. .\install-ruby-dev.ps1

Write-Output "The following are installed via choco."
choco list --local-only

Write-Output "The following are installed via scoop."
scoop list
