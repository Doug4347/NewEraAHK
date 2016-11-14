SAMP_LogExist(CustomFile)
{
If CustomFile
{
IfExist, %CustomFile%
Return, 1
Else
Return, 0
}
IfExist, %A_MyDocunents%\GTA San Andreas User Files\SAMP\chatlog.txt
Return, 1
Else
Return, 0
}
