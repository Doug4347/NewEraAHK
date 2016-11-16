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
Min-=Hour*60
IfInString, Min, .
StringTrimRight, Min, Min, 7
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
