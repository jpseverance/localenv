. ./install-scoop-and-chocolatey.ps1

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
scoop install grep
scoop install concfg 
concfg import solarized small
scoop install pshazz
scoop install touch
scoop install time

#--Browsers--#
choco install googlechrome -y
