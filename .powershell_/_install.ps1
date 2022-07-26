$PIP_SCOOP = Write-Output FiraCode-NF python peco hosts-file-editor nu neovim volta "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json"
$PIP_PWSH_MODULES = Write-Output ZLocation PSReadLine npm-completion posh-git
$PIP_WINGET = Write-Output Microsoft.VisualStudioCode Microsoft.PowerToys Plex.Plexamp Obsidian.Obsidian

function Install-PIPModules {
    $PIP_SCOOP.foreach({scoop install $PSItem})
    $PIP_PWSH_MODULES.foreach({Install-Module $PSItem -Scope CurrentUser -AllowPrerelease -Force})
}

function Update-PIPModules {
    scoop update *
    $PIP_PWSH_MODULES.foreach({Update-Module $PSItem})
}

function Install-PIPWinget {
    $PIP_WINGET.foreach({winget instal $PSItem})
}

function Update-PIPWinget {
    winget upgrade --all
}

function Update-PIP {
    Update-PIPModules
    Update-PIPWinget
}