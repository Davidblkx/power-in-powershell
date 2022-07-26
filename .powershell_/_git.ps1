function Set-GitAliases {
    git config --global alias.flog "log --oneline --decorate --all --graph --simplify-by-decoration"
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    git config --global alias.mylog "log --author='$(git config user.email)' --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
    git config --global alias.cb "checkout"
    git config --global alias.nb "checkout -b"
    git config --global alias.req 'push -u origin'
    git config --global alias.ls 'branch'
    git config --global alias.pfetch 'fetch --all --prune'
    git config --global alias.amend 'commit -a --amend'
    git config --global alias.c-all '!git add -A && git commit -m'
    git config --global alias.bd 'branch -d'
    git config --global alias.bdf 'branch -D'

    git config --global core.editor "vim"
    git config --global diff.tool vscode
    git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
}
Set-Alias -Name giiit -Value Set-GitAliases

function Set-GitCommit ($message) {
    git commit -m "$message"
}
Set-Alias -Name commit -Value Set-GitCommit

function Set-GitCommitAll ($message) {
    git add -A && git commit -m "$message"
}
Set-Alias -Name commit-all -Value Set-GitCommitAll

function Get-GitLogObj($lines = 10) {
    $i = -1
    (git log --pretty=%h_1_%s_1_%aN_1_%aE_1_%aD -n $lines) |
    ForEach-Object { $d = ($_ -split "_1_"); [PSCustomObject]@{ index = $i += 1; hash = $d[0]; message = $d[1]; name = $d[2]; email = $d[3] } }
}

function Get-GitLog ($lines = 10) {
    Get-GitLogObj($lines) | ForEach-Object { "$($_.index): $($_.hash) | $($_.message)" }
}
Set-Alias -Name log -Value Get-GitLog

function Get-GitLogLong ($lines = 10) {
    Get-GitLogObj($lines) | ForEach-Object { "$($_.index): $($_.hash) | $($_.message) --- <$($_.name)($($_.email))>" }
}
Set-Alias -Name loog -Value Get-GitLogLong

function Search-GitLog {
    Get-GitLogLong(5000) | peco | ForEach-Object { $data = ($_ -Split " "); $data[1] } | Set-Clipboard
}
Set-Alias -Name gfind -Value Search-GitLog

function Get-GitBranchObj($remote = $False) {
    $i = -1
    $a = If ($remote) { "-a" } Else { "" }
    git branch $a |
    ForEach-Object {
        $v = ($_.trim() -Split "\* ");
        $c = ($v[0].Length -eq 0);
        $n = ($v[0].Length -eq 0) ? $v[1] : $v[0];
        [PSCustomObject]@{ index = $i += 1; current = $c; name = $n }
    }
}

function Get-GitBranches([switch]$r) {
    Get-GitBranchObj($r) | ForEach-Object {
        $value = "$($_.index): $($_.name)"
        if ($_.current) { Write-Host -ForegroundColor Green $value }
        else { Write-Host $value }
    }
}
Set-Alias -Name gls -Value Get-GitBranches

function Set-GitBranch ($index = 0, [switch]$r) {
    git checkout $(Get-GitBranchObj($r))[$index].name
}
Set-Alias -Name gitc -Value Set-GitBranch

function Remove-GitBranch ($index, [switch]$F, [switch]$r) {
    $force = $F ? "-D" : ""
    git branch --delete $(Get-GitBranchObj($r))[$index].name $force
}
Set-Alias -Name gbd -Value Remove-GitBranch

function Set-GitPushRemote ($name = (git branch --show-current)) {
    $current = (git branch --show-current)
    git push -u origin "$($current):$($name)"
}
Set-Alias -Name greq -Value Set-GitPushRemote

function Get-GitStatusSimple {
    git status -s
}
Set-Alias -Name gstatus -Value Get-GitStatusSimple

function Get-GitFetch {
    git fetch --all --prune
}
Set-Alias -Name gfetch -Value Get-GitFetch

function Get-GitRebase {
    git fetch
    git rebase origin/master
}
Set-Alias -Name grebase -Value Get-GitRebase

function Set-GitPush ([switch]$F) {
    if ($F) {
        git push --force
    } else {
        git push
    }
}
Set-Alias -Name gpush -Value Set-GitPush

function Set-GitAmend() {
    git add -A
    git commit --amend --no-edit
    git push --force
}
Set-Alias -Name gamend -Value Set-GitAmend
