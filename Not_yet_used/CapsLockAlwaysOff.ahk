#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Menu, Tray, Icon, shell32.dll, 120


#SingleInstance force

#InstallKeybdhook


; ; ; SetCapsLockState, AlwaysOff
; ; This also makes CapsLock no longer a modifier
; ; This is super buggy
; ; The proper solution is in multiple keyboard assignments



;script reloader, but it only worKs on this one :(
#IfWinActive ahk_class Notepad++
^r::
send ^s
sleep 10
Soundbeep, 1000, 500
Reload
Return
#IfWinActive