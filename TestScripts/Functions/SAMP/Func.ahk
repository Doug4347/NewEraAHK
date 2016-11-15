#Include SAMP_Func.ahk
File = %A_AppData%\GTA San Andreas User Files\SAMP\chatlog.txt
Dest:=A_ScriptDir
NewName = MovedLog.txt

!1::
Fuel:=Fuel()
FuelTime:=FuelTime(Fuel)
FileAppend, Fuel: %Fuel%`n%FuelTime%`n, log.txt
SoundBeep
Return
!2::
ReadLine:=SAMP_ReadLast(File)
LogExist:=SAMP_LogExist(CustomFile)
FileAppend, %ReadLine%`n%LogExist%`n, log.txt
Return
!3::
Archive:=SAMP_ArchiveLog(Dest, NewName, File)
FileAppend, %Archive%, log.txt
IfExist, %Dest%\%NewName%
FileAppend, (1)`n, log.txt
Else
FileAppend (0)`n, log.txt
Return
