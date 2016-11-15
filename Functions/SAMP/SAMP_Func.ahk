FuelTime(Fuel)
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
Min-==our*60
IfInString, Min, .
StringTrimRight, Min, Min, 7
Return, Hour":"Min":"Sec
}

Fuel()
{
SendInput, t^a/checkfuel{Enter}
Loop, Read, File
Index:=A_Index-Offset
FileReadLine, Out, %File%, %Index%
IfNotInString, Out, /100]
Return, "Err_NotFuelLine"
StringTrimRight, Out, Out,5
StringTrimLeft, Out, Out, 25
Return, Out
}

SAMP_ReadLast(File)
{
Loop, Read, %File%
Index:=A_Index-2
FileReadLine, Line, %File%, %Index%
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

