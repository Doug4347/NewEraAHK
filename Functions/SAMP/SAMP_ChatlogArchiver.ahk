SAMP_ArchiveLog(Dest, NewName, File)
{
If (not Dest) or (not NewName)
{
MsgBox, 16,, ERROR`n`nParam 1 (Destination Folder) or Param 2 (New Name) is blank and required!
Return, "Err_NoDestOrName"
}
If not File
File = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
FileCreateDir, %Dest%
FileMove, %File%, %Dest%\%NewName%
Return, "Success"
}
