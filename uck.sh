#!/usr/bin/env bash
#
# Copyright (C) 2022 Ing <https://github.com/wjz304>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

KVer=$(uname -r | cut -d- -f1)
TAG="linux-msft-wsl-${KVer}"
curl -skL https://github.com/wjz304/WSL2-Linux-Kernel_Build/archive/refs/tags/${TAG}.gz -o ${TAG}.gz
if [ $? -ne 0 ] || [ ! -f ${TAG}.gz ]; then
    echo '[!!] Failed to download the kernel!'
    exit 1
fi
gzip -d ${TAG}.gz > bzImage
if [ -f bzImage ]; then
    powershell.exe /C 'Copy-Item bzImage $env:USERPROFILE'
    powershell.exe /C 'Write-Output [wsl2]`nkernel=$env:USERPROFILE\bzImage | % {$_.replace("\","\\")} | Out-File $env:USERPROFILE\.wslconfig -encoding ASCII'
    echo '[!!] Replace successful! Please restart WSL2 to apply the new kernel!'
    rm -f bzImage
else
    echo '[!!] Replace failed!'
fi
