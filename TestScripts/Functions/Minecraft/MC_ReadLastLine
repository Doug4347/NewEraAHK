MC_ReadLast(File)
{
If not File
File = %A_AppData%\.minecraft\logs\latest.log
Loop, Read, %File%
Index:=A_Index-1
FileReadLine, Out, %File%, %Index%
Return, Out
}
