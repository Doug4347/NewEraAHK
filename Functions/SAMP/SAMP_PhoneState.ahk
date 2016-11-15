/*
Please note:
This script will only work on MTG and will probably require modification to work with other servers.

MTG:
mt-gaming.com
register.mt-gaming.com
samp.mt-gaming.com

Incoming call on
You have picked up the phone
You got a message on your phone
SMS from 343
The ringing has stopped
*/

SAMP_PhoneState(File)
{
Loop, Read, %File%
{
IfInString, A_LoopReadLine, Incoming call on
Line:=A_LoopReadLine
IfInString, A_LoopReadLine, You have picked up the phone
Line:=A_LoopReadLine
IfInString, A_LoopReadLine, You got a message on your phone
Line:=A_LoopReadLine
IfInString, A_LoopReadLine, SMS from 343
Line:=A_LoopReadLine
IfInString, A_LoopReadLine, The ringing has stopped
Line:=A_LoopReadLine
}
If not Line
Return, "Err_NoPhone"
IfInString, Line, Incoming call on
Return, 1
IfInString, Line, You have picked up the phone
Return, 2
IfInString, Line, You got a message on your phone
Return, 3
IfInString, Line, SMS from 343
Return, 4
IfInString, Line, The ringing has stopped
Return, 5
}
