SAMP_ReadLast(File)
{
Loop, Read, %File%
Index:=A_Index-2
FileReadLine, Line, %File%, %Index%
Return, Line
}
