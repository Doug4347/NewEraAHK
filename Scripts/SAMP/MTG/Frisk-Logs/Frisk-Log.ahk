DebugMode:=False

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Trigger = ] You have requested to frisk
AcceptedTrigger =  has accepted your frisk request.
TimeOutTrigger = Your frisk request has timed out.

Chatlog = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
FriskLog = Frisks.txt
If DebugMode
{
	Gui, Add, Text, vDevText r40 w1000 h1000,
	(
SecondMessageSearch = %SecondMessageSearch%
Line = %Line%
StartTime = %StartTime%
Name = %Name%
Index = %Index%

FriskLog = %FriskLog%
Chatlog = %Chatlog%
LastAppend = %LastAppend%

A_TickCount = %A_TickCount%
	)
	Gui, Show
}
While Not ExisitingFile
{
	IfExist, %Chatlog%
		ExisitingFile:=True
	Sleep, 100
}
Loop, Read, %Chatlog%
{
	If A_LoopReadLine
		Index:=A_Index
}
Loop,
{
	Index+=2
	FileReadLine, Line, %Chatlog%, %Index%
	If ErrorLevel
		Index-=2
	FileReadLine, Line, %Chatlog%, %Index%
	If Not SecondMessageSearch
	{
		IfInString, Line, %Trigger%
		{
			SecondMessageSearch:=True
			StartTime:=A_TickCount
			StringTrimRight, Name, Line, 25
			StringTrimLeft, Name, Name, 39
		}
	}
	Else
	{
		IfInString, Line, %TimeOutTrigger%
		{
			SecondMessageSearch:=False
			TotalTime:=A_TickCount-StartTime
			NameTimes:=0
			Loop, Read, %FriskLog%
				IfInString, A_LoopReadLine, %A_Year%/%A_MM%/%A_DD%
					IfInString, A_LoopReadLine, %Name%
						IfInString, A_LoopReadLine, Result: Time Out
							NameTimes+=1
			NameTimes+=1
			FileAppend, [%A_Year%/%A_MM%/%A_DD% - %A_Hour%-%A_Min%-%A_Sec%] Attempted Frisk of: %Name% || Result: Time Out (Timeout Count: %NameTimes%) || Time Taken: %TotalTime%ms`n, %FriskLog%
			If DebugMode
				LastAppend:=A_TickCount
		}
		IfInString, Line, %AcceptedTrigger%
		{
			SecondMessageSearch:=False
			TotalTime:=A_TickCount-StartTime
			NameAccepts:=0
			Loop, Read, %FriskLog%
				IfInString, A_LoopReadLine, %A_Year%/%A_MM%/%A_DD%
					IfInString, A_LoopReadLine, %Name%
						IfInString, A_LoopReadLine, Result: Accepted
							NameAccepts+=1
			NameAccepts+=1
			FileAppend, [%A_Year%/%A_MM%/%A_DD% - %A_Hour%-%A_Min%-%A_Sec%] Attempted Frisk of: %Name% || Result: Accepted (Accepted Count: %NameAccepts%) || Time Taken: %TotalTime%ms`n, %FriskLog%
			If DebugMode
				LastAppend:=A_TickCount
		}
	}
	If DebugMode
	{
		GuiControl,, DevText,
(
SecondMessageSearch = %SecondMessageSearch%
Line = %Line%
StartTime = %StartTime%
Name = %Name%
Index = %Index%

FriskLog = %FriskLog%
Chatlog = %Chatlog%
LastAppend = %LastAppend%

A_TickCount = %A_TickCount%
)
	}
}
