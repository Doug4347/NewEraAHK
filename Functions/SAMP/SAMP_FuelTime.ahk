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
