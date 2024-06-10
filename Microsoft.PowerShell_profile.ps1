#Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
Import-Module posh-git
$GitPromptSettings.EnableStashStatus = $True

#Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
$env:POSH_SESSION_DEFAULT_USER = [System.Environment]::UserName
#oh-my-posh init pwsh | Invoke-Expression
$DocumentsFolder = [Environment]::GetFolderPath('Personal')
oh-my-posh init pwsh --config "$DocumentsFolder/PowerShell/Themes/.ohmy.theme.omp.json" | Invoke-Expression

#Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -Repository PSGallery
Import-Module -Name Terminal-Icons

#Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

#Install-Module CompletionPredictor -Scope CurrentUser -Force
Import-Module CompletionPredictor

New-Item -Path Alias: -Name k -Value kubectl -Options "AllScope" | Out-Null
New-Item -Path Alias: -Name hl -Value helm -Options "AllScope" | Out-Null
New-Item -Path Alias: -Name tf -Value terraform -Options "AllScope" | Out-Null
New-Item -Path Alias: -Name g -Value git -Options "AllScope" | Out-Null

#Install-Module WslInterop -Force
#Import-WslCommand ansible-vault
Import-WslCommand ssh
Import-WslCommand ssh-keygen
Import-WslCommand grep
Import-WslCommand curl
Import-WslCommand vi
Import-WslCommand openssl