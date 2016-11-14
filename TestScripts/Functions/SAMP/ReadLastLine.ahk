#Include SAMP_ReadLastLine.ahk

File = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt

OutPut:=SAMP_ReadLast(File)
FileAppend, %OutPut%, output.txt
MsgBox, Last line:`n%OutPut%`n`nPlease check output.txt to copy & paste.
