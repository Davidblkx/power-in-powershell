$PIP_SCOOP = Write-Output FiraCode-NF python peco hosts-file-editor nu
$PIP_PWSH_MODULES = Write-Output ZLocation PSReadLine oh-my-posh npm-completion posh-git

function Install-PIPModules {
    $PIP_SCOOP.foreach({scoop install $PSItem})
    $PIP_PWSH_MODULES.foreach({Install-Module $PSItem -Scope CurrentUser -AllowPrerelease -Force})
}

function Update-PIPModules {
    scoop update *
    $PIP_PWSH_MODULES.foreach({Update-Module $PSItem})
}
