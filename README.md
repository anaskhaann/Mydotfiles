## **Note : These are just for my Reference**

<details> 
<summary>Commands for Making Symlink</summary>

1. Link ➡️ To
2. Target ➡️ From

## **Power Shell Command For Symlink**

```powershell
New-Item -ItemType SymbolicLink -Path "<link_path>" -Target "<target_path>" -Force
```

## **Command Prompt Command For Symlink**

```shell
MKLINK [[/D] | [/H] | [/J]] Link Target
    /D   Creates a directory symbolic link. Default is a file symbolic link.
    /H      Creates a hard link instead of a symbolic link.
    /J      Creates a Directory Junction.
    Link    Specifies the new symbolic link name.
    Target  Specifies the path (relative or absolute)that the new link refers to.
```

</details>

## **My Dot Files Configurations**

<details>
<summary>Code Base</summary>

## **Vs code Bindings**

`config\vscode\`

All the Shortcuts, Settings and Extension List are Added in the above folder.

## **Shell / Bash Profiles**

`config\`

The Microsoft Powershell and Bash Profile settings are added in the above folder.

## **Git Config Files**

`.gitconfig`

This file includes my default branch, my username and git settings.

## **Packages**

`packages\`

This folder contains the packages i need to install or currently have it on my system.

_The below is the **PowerShell command** to get all list of installed packages in windows_

```powershell
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -ne $null -and $_.SystemComponent -ne 1 } | Select-Object DisplayName, DisplayVersion | Sort-Object DisplayName > installed_apps.txt
```

## **Scipts**

This will be update in future, It will includes the scripts to install softwares, packages and setup the profiles/configs.

</details>

## **TODOs**

- [ ] Create winget id for all available softwares.

- [ ] Create a Script to install the softwares using winget(or other better package manager).
