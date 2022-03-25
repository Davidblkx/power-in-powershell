# Power in PowerShell

> Collection of tools and configurations for my powershell and terminal

## Dependencies

<details>
<summary>Windows</summary>

- Scoop (<https://scoop.sh/>):

```Powershell
iwr -useb get.scoop.sh | iex
scoop bucked add extras
scoop bucked add nerd-fonts
```

- Winget installs

```Powershell
winget install Microsoft.PowerShell
winget install Microsoft.WindowsTerminal
```

</details>

## Install

### Using remote script

```Powershell
iwr -useb https://raw.githubusercontent.com/Davidblkx/power-in-powershell/master/intall.ps1 | iex

# add to your $PROFILE
. ~/.powershell_/mod.ps1
```

### Local

```Powershell
git clone https://github.com/Davidblkx/power-in-powershell.git
cd power-in-powershell
./install-local.ps1

# add to your $PROFILE
. ~/.powershell_/mod.ps1
```
