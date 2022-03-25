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

function Get-GitLog ($lines = 10) {
    nu -c "git log --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD -n $lines | lines | split column `"»¦«`" commit subject name email date | select commit subject"
}
Set-Alias -Name log -Value Get-GitLog

function Get-GitLogLong ($lines = 10) {
    nu -c "git log --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD -n $lines | lines | split column `"»¦«`" commit subject name email date"
}
Set-Alias -Name loog -Value Get-GitLogLong

function Get-GitBranches {
    nu -c "git branch | lines"
}
Set-Alias -Name gls -Value Get-GitBranches

function Set-GitBranch ($index = 0) {
    nu -c "git checkout (git ls | lines | skip $index | first | str trim | str find-replace '\* ' '')"
}
Set-Alias -Name gitc -Value Set-GitBranch

function Remove-GitBranch ($index, [switch]$F) {
    if ($F) {
        nu -c "git branch --delete (git ls | lines | skip $index | first | str trim | str find-replace '\* ' '') --force"
    } else {
        nu -c "git branch --delete (git ls | lines | skip $index | first | str trim | str find-replace '\* ' '')"
    }
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