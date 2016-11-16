/*
Please note:
This only works on the MTG SAMP server and will require modifications to work on other servers.
MTG:
mt-gaming.com
register.mt-gaming.com
samp.mt-gaming.com
*/

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
