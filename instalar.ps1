# Instala o Cordel neste computador (sem precisar de administrador) e cria o atalho na Área de Trabalho.
# O jogo se atualiza sozinho: ao abrir, confere se saiu versão nova, baixa e oferece "REINICIAR AGORA".
# Pra instalar, abra o PowerShell e rode:
#   irm https://raw.githubusercontent.com/diogobennertz/cordel-jogo/main/instalar.ps1 | iex
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$base = 'https://raw.githubusercontent.com/diogobennertz/cordel-jogo/main'
$dir = Join-Path $env:LOCALAPPDATA 'Cordel'
New-Item -ItemType Directory -Force -Path $dir | Out-Null
Write-Host 'Baixando o Cordel (uns 40 MB)...'
$zip = Join-Path $env:TEMP 'Cordel.zip'
Invoke-WebRequest -Uri "$base/Cordel.zip" -OutFile $zip -UseBasicParsing
Expand-Archive -Path $zip -DestinationPath $dir -Force
Remove-Item $zip -Force
$exe = Join-Path $dir 'Cordel.exe'
if (-not (Test-Path $exe)) { throw 'Cordel.exe nao apareceu na pasta de instalacao.' }
$ws = New-Object -ComObject WScript.Shell
foreach ($pasta in @([Environment]::GetFolderPath('Desktop'), (Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs'))) {
  $lnk = $ws.CreateShortcut((Join-Path $pasta 'Cordel.lnk'))
  $lnk.TargetPath = $exe; $lnk.WorkingDirectory = $dir; $lnk.IconLocation = $exe; $lnk.Save()
}
Write-Host 'Pronto! Atalho "Cordel" criado na Area de Trabalho e no Menu Iniciar.'
Write-Host 'Se o Windows avisar "SmartScreen": clique em "Mais informacoes" > "Executar assim mesmo" (o .exe nao e assinado).'
# abre o jogo e FECHA esta janela do PowerShell (ela não precisa ficar aberta enquanto o jogo roda)
Start-Process $exe
Start-Sleep -Seconds 2
exit
