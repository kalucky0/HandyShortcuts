#SingleInstance, force

; Search highlighted text in Google [Ctrl + Shift + C]
^+c::
    Send, ^c
    Sleep 50
    Run, https://google.com/search?q=%clipboard%
return

; Move up a folder in File Explorer [Middle mouse button]
#IfWinActive, ahk_class CabinetWClass
~MButton::Send !{Up}
#IfWinActive
return

; Empty recycle bin [Win + Del]
#Del::FileRecycleEmpty
return

; Makes window show always on top [Ctrl + Space]
^SPACE:: Winset, Alwaysontop, , A
return

; Toggles file extensions in File Explorer [Win + Y]
#y::
    RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
    if HiddenFiles_Status = 1
        RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 0
    else
        RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1WinGetClass, eh_Class, A
    send, "{F5}"
return

; Suspend HotKeys [Win + ScrLk]
#ScrollLock::Suspend
return

; Paste in cmd [Ctrl + V]
#IfWinActive ahk_class ConsoleWindowClass
^v::
    SendInput {Raw}%clipboard%
return
#IfWinActive

; Makes selected text uppercase [Ctrl + Shift + U]
^+u::
    oCB := ClipboardAll ; save clipboard contents
    Clipboard = ; Ensure we don't catch old clipboard contents when nothing was selected.
    sleep 50
    Send, ^x
    sleep 50
    StringUpper, Clipboard, Clipboard
    SendInput ^v
    Clipboard := oCB ; return original Clipboard contents
    oCB = ; free memory (mostly usefull when you had a file or so in your Clipboard)
return

; Makes selected text lowercase [Ctrl + Shift + L]
^+l::
    oCB := ClipboardAll ; save clipboard contents
    Clipboard = ; Ensure we don't catch old clipboard contents when nothing was selected.
    sleep 50
    Send, ^x
    sleep 50
    StringLower, Clipboard, Clipboard
    SendInput ^v
    Clipboard := oCB ; return original Clipboard contents
    oCB = ; free memory (mostly usefull when you had a file or so in your Clipboard)
return

