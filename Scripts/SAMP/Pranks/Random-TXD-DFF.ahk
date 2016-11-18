SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileSelectFolder, InputFolder, C:\Users\User\Desktop\Temp4Doug\Games\GTA SA\Game\GTA-SanAndreas\modloader,, Please select the input folder
If ErrorLevel
	ExitApp
SelectOutput:
FileSelectFolder, OutputFolder, C:\Users\User\Desktop\Temp4Doug\Games\GTA SA\Game\GTA-SanAndreas\modloader,, Please select the output folder
If ErrorLevel
	ExitApp
If InputFolder = OutputFolder
{
MsgBox, 16,, [Error]`n`nOutput Folder cannot be the same as input folder!
Goto, SelectOutput
}

Loop, %InputFolder%\*.txd, 0, 0
	Files:=A_Index
Loop, %InputFolder%\*.txd, 0, 0
{
GoSub, RandomFile
FileCopy, %InputFolder%\%A_LoopFileName%, %OutputFolder%\%FileName%
StringTrimRight, MoveFile, A_LoopFileName, 4
FileCopy, %InputFolder%\%MoveFile%.dff, %OutputFolder%\%FileNameNoExt%.dff
}
MsgBox, Done
ExitApp

RandomFile:
	Random, FileName, 1, %Files%
	Loop, %InputFolder%\*.txd, 0, 0
	{
		If A_Index = %FileName%
		{
			FileName:=A_LoopFileName
			StringTrimRight, FileNameNoExt, FileName, 4
			Break
		}
	}
	IfExist, %OutputFolder%\%FileName%
		GoSub, RandomFile
Return
