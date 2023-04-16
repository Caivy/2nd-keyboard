; Copies the selected text to a variable while preserving the clipboard.
GetText(ByRef MyText = "")
{
    SavedClip := ClipboardAll
    Clipboard =
    Send ^c
    ClipWait 0.5
    If ERRORLEVEL
    {
        Clipboard := SavedClip
        MyText =
        Return
    }
    MyText := Clipboard
    Clipboard := SavedClip
    Return MyText
}

; Pastes text from a variable while preserving the clipboard.
PutText(MyText)
{
    SavedClip := ClipboardAll
    Clipboard =              ; For better compatibility
    Sleep 20                 ; with Clipboard History
    Clipboard := MyText
    Send ^v
    Sleep 100
    Clipboard := SavedClip
    Return
}

lookup() {
    MyClip := ClipboardAll
    Clipboard = ; empty the clipboard
    Send, ^c
    ClipWait, 2
    if ErrorLevel  ; ClipWait timed out.
    {
        return
    }
    if RegExMatch(Clipboard, "^[^ ]*\.[^ ]*$")
    {
        Run "C:\Program Files\Mozilla Firefox\firefox.exe" %Clipboard%
    }
    else
    {
        ; Modify some characters that screw up the URL
        ; RFC 3986 section 2.2 Reserved Characters (January 2005):  !*'();:@&=+$,/?#[]
        StringReplace, Clipboard, Clipboard, `r`n, %A_Space%, All
        StringReplace, Clipboard, Clipboard, #, `%23, All
        StringReplace, Clipboard, Clipboard, &, `%26, All
        StringReplace, Clipboard, Clipboard, +, `%2b, All
        StringReplace, Clipboard, Clipboard, ", `%22, All
        Run % "https://www.google.com/search?hl=en&q=" . clipboard ; uriEncode(clipboard)
    }
    Clipboard := MyClip
    return
}
