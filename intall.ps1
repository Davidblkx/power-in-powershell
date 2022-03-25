Push-Location $env:TEMP
git clone https://github.com/Davidblkx/power-in-powershell.git
Push-Location power-in-powershell
./install-local.ps1
Pop-Location
Pop-Location