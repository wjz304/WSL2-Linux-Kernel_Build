# WSL2-Linux-Kernel_Build


# Usage  (in WSL2)
```shell
## Add
curl -skL https://raw.githubusercontent.com/wjz304/WSL2-Linux-Kernel_Build/main/uck.sh | bash
## Del
powershell.exe /C 'Remove-Item -Path $env:USERPROFILE\.wslconfig, $env:USERPROFILE\bzImage -Force'
```