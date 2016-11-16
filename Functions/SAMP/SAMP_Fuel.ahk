/*
Please note:
This only works on the MTG SAMP server and will require modifications to work on other servers.

MTG:
mt-gaming.com
register.mt-gaming.com
samp.mt-gaming.com
*/

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
