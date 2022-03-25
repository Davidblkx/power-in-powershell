function Open-SLN ($PATH = $PWD) {
    $childs = (Get-ChildItem $PATH | Where-Object {$_.Name -like "*.sln"})
    $childs.foreach({ Start-Process $PSItem.FullName })
}
Set-Alias -Name sln -Value Open-SLN


function Open-VSCode ($PATH = $PWD) {
    code $PATH
}
Set-Alias -Name cde -Value Open-VSCode
