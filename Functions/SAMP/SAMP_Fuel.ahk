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
