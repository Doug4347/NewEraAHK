SAMP_ReadLast(FileIn)
{
Loop, Read, %File%
Index:=A_Index-3
FileReadLine, Line, %File%, %Index%
Return, Line
}
