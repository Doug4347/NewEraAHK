SAMP_ReadLast(FileIn)
{
Loop, Read, %File%
Index:=A_Index-4
Loop, 4
{
Line+=1
FileReadLine, Line2, %File%, %Index%
Line = %A_Index%: %Line2%`n%Line%
}
Return, Line
}
