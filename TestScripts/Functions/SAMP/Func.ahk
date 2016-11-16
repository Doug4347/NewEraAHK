#Include SAMP_Func.ahk
File = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
Dest:=A_ScriptDir
NewName = MovedLog.txt
FileDelete, log.txt
FileAppend, Is Admin: %A_IsAdmin%`n`n

!1::
Fuel:=Fuel(File, 1000)
FuelTime:=FuelTime(Fuel)
Process, Exist, gta_sa.exe
FileAppend, Fuel: %Fuel%`nFuel Time: %FuelTime%`nErrorLevel: %ErrorLevel%`n`n, log.txt
SoundBeep
Return
!2::
ReadLine:=SAMP_ReadLast(File)
LogExist:=SAMP_LogExist(CustomFile)
Process, Exist, gta_sa.exe
FileAppend, ReadLine: %ReadLine%`nLog Exist:%LogExist%`nErrorLevel: %ErrorLevel%`n`n, log.txt
Return
!3::
Archive:=SAMP_ArchiveLog(Dest, NewName, File)
FileAppend, %Archive%, log.txt
IfExist, %Dest%\%NewName%
FileAppend, (1)`n, log.txt
Else
FileAppend (0)`n, log.txt
Process, Exist, gta_sa.exe
FileAppend, ErrorLevel: %ErrorLevel%`n`n, log.txt
Return
!4::
FileMove, %NewName%, log2.txt
FileMove, %File%, log3.txt
Return
