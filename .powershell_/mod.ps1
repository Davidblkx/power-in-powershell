. ~/.powershell_/_utils.ps1
. ~/.powershell_/_helper.ps1
. ~/.powershell_/_install.ps1
. ~/.powershell_/_git.ps1
. ~/.powershell_/_sln.ps1

Import-Module npm-completion
Import-Module posh-git

$env:POSH_GIT_ENABLED = $true

oh-my-posh prompt init pwsh --config ~/.powershell_/.dracula.omp.json | Invoke-Expression

# Needs to be last import
Import-Module ZLocation
