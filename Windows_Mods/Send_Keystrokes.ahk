#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

AppsKey::
Numpad5::
NumpadClear:: ; Just so that when numpad is off, it still works
; Laptop keyboards don't have an appskey because laptop makers refuse to use a proper tkl layout and instead cram 104 minus certain keys into a size that is more fit for tkl, so arrow keys take the place of right windows and appskey. Would rather have tkl
+f19
sleep 100
ExitApp