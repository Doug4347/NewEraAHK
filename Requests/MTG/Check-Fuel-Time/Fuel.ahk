FuelGet(File, Offset, Delay)
{
SendInput, t^a/checkfuel{Enter}
Sleep, %Delay%
Loop, Read, File
Index:=A_Index-Offset
FileReadLine, Out, %File%, %Index%
IfNotInString, Out, /100]
Return, "Err_NotFuelLine"
StringTrimRight, Out, Out,5
StringTrimLeft, Out, Out, 25
Return, Out
}

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
Time = %Hour%h %Min%m %Sec%s
Return, Time
}
