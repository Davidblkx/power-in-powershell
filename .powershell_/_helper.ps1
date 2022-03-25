. ~/.powershell_/_utils.ps1
function Show-PIPHelper {
    Write-Color -Text "PSReadLine:"," https://github.com/PowerShell/PSReadLine" -Color green,white
    Write-Color -Text " List keys:"," Get-PSReadLineKeyHandle" -Color green,blue

    ""

    Write-Color -Text "ZLocation:"," https://github.com/vors/ZLocation" -Color green,white

    ""

    Write-Color -Text "Git Aliases:" -Color green
    Write-Color -Text "  flog:"," simple log" -Color green,white
    Write-Color -Text "  lg:"," last commit in branch" -Color green,white
    Write-Color -Text "  mylog:"," commits by my user" -Color green,white
    Write-Color -Text "  nb:"," create branch and checkout" -Color green,white
    Write-Color -Text "  cb:"," checkout to other branch" -Color green,white
    Write-Color -Text "  req:"," push to upstream" -Color green,white
    Write-Color -Text "  ls:"," list branches" -Color green,white
    Write-Color -Text "  pfetch:"," fetch and prune" -Color green,white
    Write-Color -Text "  amend:"," commit amend" -Color green,white
    Write-Color -Text "  c-all:"," add all files and commit" -Color green,white
    Write-Color -Text "  bd:"," branch delete" -Color green,white
    Write-Color -Text "  bdf:"," branch delete force" -Color green,white

    ""

    Write-Color -Text "Git Commands:" -Color green
    Write-Color -Text "  commit:"," commit file changes" -Color green,white
    Write-Color -Text "  commit-all:"," add and commit all files" -Color green,white
    Write-Color -Text "  log:"," log git commits" -Color green,white
    Write-Color -Text "  gls:"," log git branchs" -Color green,white
    Write-Color -Text "  gitc:"," change git branch by index" -Color green,white
    Write-Color -Text "  gbd:"," delete git branch by index, -F to force" -Color green,white
    Write-Color -Text "  greq:"," push branch to remote" -Color green,white
    Write-Color -Text "  gfetch:"," fetch remote branch" -Color green,white
    Write-Color -Text "  gstatus:"," current git status" -Color green,white
    Write-Color -Text "  grebase:"," rebase with master" -Color green,white
    Write-Color -Text "  gpush:"," push to remote, -F to force" -Color green,white
}
Set-Alias -Name helpme -Value Show-PIPHelper