#Requires -Version 7.1

$ErrorActionPreference = "Stop" # exit when command fails

if (-not $env:XDG_DATA_HOME) { $env:XDG_DATA_HOME = $env:APPDATA }
if (-not $env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME = $env:LOCALAPPDATA }
if (-not $env:XDG_CACHE_HOME) { $env:XDG_CACHE_HOME = $env:TEMP }
if (-not $env:LUNARVIM_RUNTIME_DIR) { $env:LUNARVIM_RUNTIME_DIR = "$env:XDG_DATA_HOME\lunarvim" }
if (-not $env:LUNARVIM_CONFIG_DIR) { $env:LUNARVIM_CONFIG_DIR = "$env:XDG_CONFIG_HOME\lvim" }
if (-not $env:LUNARVIM_CACHE_DIR) { $env:LUNARVIM_CACHE_DIR = "$env:XDG_CACHE_HOME\lvim" }
if (-not $env:LUNARVIM_BASE_DIR) { $env:LUNARVIM_BASE_DIR = "$env:LUNARVIM_RUNTIME_DIR\lvim" }

nvim-qt -- -u "$env:LUNARVIM_RUNTIME_DIR\lvim\init.lua" @args
