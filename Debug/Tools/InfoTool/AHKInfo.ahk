SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
InfoFile = Info.txt
A_NowMTG:=A_NowUTC-10000
FileAppend,
(
[%A_NowMTG%]
A_AhkVersion: %A_AhkVersion%
A_IsUnicode: %A_IsUnicode%
A_IsCompiled: %A_IsCompiled%
ComSpec: %ComSpec%
A_OSType: %A_OSType%
A_OSVersion: %A_OSVersion%
A_Is64bitOS: %A_Is64bitOS%
A_Language: %A_Language%
A_IsAdmin: %A_IsAdmin%
A_ScreenWidth: %A_ScreenWidth%
A_ScreenHeight: %A_ScreenHeight%
A_ScreenDPI: %A_ScreenDPI%

), %InfoFile%

MsgBox, 64, AHK Info,
(
Info about your system:
A_AhkVersion: %A_AhkVersion%
A_IsUnicode: %A_IsUnicode%
A_IsCompiled: %A_IsCompiled%
ComSpec: %ComSpec%
A_OSType: %A_OSType%
A_OSVersion: %A_OSVersion%
A_Is64bitOS: %A_Is64bitOS%
A_Language: %A_Language%
A_IsAdmin: %A_IsAdmin%
A_ScreenWidth: %A_ScreenWidth%
A_ScreenHeight: %A_ScreenHeight%
A_ScreenDPI: %A_ScreenDPI%

This info has been saved to %InfoFile%`nPlease copy that and send it to whoever needs the info.
)
