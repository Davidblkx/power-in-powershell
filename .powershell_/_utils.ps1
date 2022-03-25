function Write-Color([String[]]$Text, [ConsoleColor[]]$Color) {
    for ($i = 0; $i -lt $Text.Length; $i++) {
        Write-Host $Text[$i] -Foreground $Color[$i] -NoNewLine
    }
    Write-Host
}

function Start-KeepAwake {
    $myshell = New-Object -com "Wscript.Shell"
    while ($true) {
        Start-Sleep -Seconds 60
        $myshell.sendkeys(".")
    }
}
Set-Alias -Name awake -Value Start-KeepAwake