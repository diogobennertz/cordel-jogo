# Cordel

Roguelike de ação inspirado no folclore brasileiro, com visual de xilogravura de cordel.

Este repositório tem **só o que é preciso pra baixar e jogar**.

## Instalar (Windows)
Abra o **PowerShell** e rode:

```powershell
irm https://raw.githubusercontent.com/diogobennertz/cordel-jogo/main/instalar.ps1 | iex
```

Instala em `%LOCALAPPDATA%\Cordel`, cria o atalho na Área de Trabalho e abre o jogo.
O `.exe` não é assinado: se o Windows mostrar o SmartScreen, clique em *Mais informações → Executar assim mesmo*.

## Atualização automática
Ao abrir, o jogo confere `versao.txt` aqui. Se houver versão nova, baixa o `jogo.pck` (uns 10 MB) e mostra o botão
**REINICIAR AGORA** no topo; ou é só abrir de novo. O `.exe` em si quase nunca muda.

## Multijogador
Veja `COMO-JOGAR-ONLINE.txt` (dentro do `Cordel.zip`).
