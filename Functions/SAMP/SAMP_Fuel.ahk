/*
Please note:
This only works on the MTG SAMP server and will require modifications to work on other servers.

MTG:
mt-gaming.com
register.mt-gaming.com
samp.mt-gaming.com
*/

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
