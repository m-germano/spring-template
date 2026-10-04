$ErrorActionPreference = "Stop"

# Vai para a raiz do projeto
$ProjectRoot = Resolve-Path "$PSScriptRoot\.."
Set-Location $ProjectRoot

# O VS Code Dev Containers usa este padrão de nome para o projeto Compose
$FolderName = Split-Path $ProjectRoot -Leaf
$ComposeProject = "${FolderName}_devcontainer"

Write-Host ""
Write-Host "========================================="
Write-Host " Resetando ambiente Docker do projeto"
Write-Host "========================================="
Write-Host ""
Write-Host "Projeto: $ComposeProject"
Write-Host "Pasta:   $ProjectRoot"
Write-Host ""

docker compose `
    --project-name $ComposeProject `
    -f ".devcontainer/docker-compose.yml" `
    down `
    --volumes `
    --remove-orphans

Write-Host ""
Write-Host "Ambiente removido."
Write-Host "Containers, rede e volumes deste projeto foram apagados."
Write-Host ""
Write-Host "Agora abra/reconstrua o Dev Container novamente."
