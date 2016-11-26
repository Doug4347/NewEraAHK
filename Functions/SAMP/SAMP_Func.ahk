/*
Please note:
This only works on the MTG SAMP server and will require modifications to work on other servers.

MTG:
mt-gaming.com
register.mt-gaming.com
samp.mt-gaming.com
*/
SAMP_FuelTime(Fuel)
{
Sec:=Fuel*66.7
Min:=Sec/60
IfInString, Min, .
StringTrimRight, Min, Min, 7
Sec-=Min*60
IfInString, Sec, .
StringTrimRight, Sec, Sec, 7
Hour:=Min/60
IfInString, Hour, .
StringTrimRight, Hour, Hour, 7
Min-=Hour*60
IfInString, Min, .
StringTrimRight, Min, Min, 7
StringLen, SecLen, Sec
StringLen, MinLen, Min
StringLen, HourLen, Hour
If SecLen < 2
Sec = 0%Sec%
If MinLen < 2
Min = 0%Min%
If HourLen < 2
Hour = 0%Hour%
Time = %Hour%-%Min%-%Sec%
Return, Time
}

Fuel(File, Delay)
{
SendInput, t^a/checkfuel{Enter}
If Delay
Sleep, %Delay%
Loop, Read, %File%
IfInString, A_LoopReadLine, /100]
Out:=A_LoopReadLine
IfNotInString, Out, /100]
Return, "Err_NotFuelLine"
StringTrimRight, Out, Out,5
StringTrimLeft, Out, Out, 25
Return, Out
}

SAMP_ReadLast(File)
{
Loop, Read, %File%
If A_LoopReadLine
Line:=A_LoopReadLine
Return, Line
}

SAMP_LogExist(CustomFile)
{
If CustomFile
{
IfExist, %CustomFile%
Return, 1
Else
Return, 0
}
IfExist, %A_MyDocunents%\GTA San Andreas User Files\SAMP\chatlog.txt
Return, 1
Else
Return, 0
}

SAMP_ArchiveLog(Dest, NewName, File)
{
If (not Dest) or (not NewName)
{
MsgBox, 16,, ERROR`n`nParam 1 (Destination Folder) or Param 2 (New Name) is blank and required!
Return, "Err_NoDestOrName"
}
If not File
File = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
FileCreateDir, %Dest%
FileMove, %File%, %Dest%\%NewName%
Return, "Success"
}

SAMP_Indicator(Direct, State)
{
IfInString, Direct, R
Direct = Right
Else
IfInString, Direct, L
Direct = Left
Else
Return, "Err_InvalidDirection"
If State
SendInput, t^a/indicators off{Enter}
Else
SendInput, t^a/indicators %Direct%{Enter}
Return, State*-1
}

SAMP_PhoneState(File)
{
Loop, Read, %File%
{
IfInString, A_LoopReadLine, Incoming call on
Line:=A_LoopReadLine
IfInString, A_LoopReadLine, You have picked up the phone
Line:=A_LoopReadLine
IfInString, A_LoopReadLine, You got a message on your phone
Line:=A_LoopReadLine
IfInString, A_LoopReadLine, SMS from 343
Line:=A_LoopReadLine
IfInString, A_LoopReadLine, The ringing has stopped
Line:=A_LoopReadLine
}
IfInString, Line, Incoming call on
Return, 1
IfInString, Line, You have picked up the phone
Return, 2
IfInString, Line, You got a message on your phone
Return, 3
IfInString, Line, SMS from 343
Return, 4
IfInString, Line, The ringing has stopped
Return, 5
Return, "Err_NoPhone"
}

