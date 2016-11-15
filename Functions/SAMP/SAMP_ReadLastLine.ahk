SAMP_ReadLast(File)
{
Loop, Read, %File%
If A_LoopReadLine
Line:=A_LoopReadLine
Return, Line
}
