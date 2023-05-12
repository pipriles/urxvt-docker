Set oShell = WScript.CreateObject("WScript.Shell")
oShell.Run "wsl --cd """ & WScript.Arguments(0) & """ -e wsl.bash", 0, True
