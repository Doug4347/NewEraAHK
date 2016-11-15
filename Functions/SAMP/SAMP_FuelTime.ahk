/*
Please note:
This only works on the MTG SAMP server and will require modifications to work on other servers.

MTG:
mt-gaming.com
register.mt-gaming.com
samp.mt-gaming.com
*/
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
