Set oShell = WScript.CreateObject("WScript.Shell")
oShell.Run "wsl --cd """ & WScript.Arguments(0) & """ bash -c 'DISPLAY=:0 xrdb ~/.Xresources && DISPLAY=:0 urxvt -e zsh'", 0, True