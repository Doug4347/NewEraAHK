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
