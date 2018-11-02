. ./ScoopAndChocolatey.ps1

#--Node dev--#
choco install nodejs -y
refreshenv
npm install -g typescript
npm install -g gulp-cli
npm install -g @angular/cli
