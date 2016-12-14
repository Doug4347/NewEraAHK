SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

AFKms:=300000
AFKWarnMs:=270000
LoopDelay:=250
AFKWarnBeepDelay:=250
KickTime:=AFKms-AFKWarnMs
/*
Loop,
{
	SplashImage,,, TimeIdle: %A_TimeIdle%`nTimeIdlePhysical: %A_TimeIdlePhysical%
}
Return
*/
Loop,
{
	TimeLeft:=AFKms-A_TimeIdlePhysical
	If A_TimeIdlePhysical > %AFKWarnMs%
	{
		SoundBeep
		Send, t^a/b This user appears to be AFK, and will automatically /q in %TimeLeft% ms.`n
		FirstWarn:=True
		GoSub, AFKWarning
		FirstWarn:=False
	}
	Sleep, %LoopDelay%
}

AFKWarning:
Loop,
{
	StartTime:=A_TickCount
	If FirstWarn
		Sleep, 500
	If A_TimeIdlePhysical < 450
		Return
	SetScrollLockState, Off
	SoundBeep
	Sleep, 250
	SetScrollLockState, On
	SoundBeep
	Sleep, 250
	EndTime:=A_TickCount
	KickTime-=(EndTime-StartTime)
	If KickTime < 1
	{
		Send, t/b This user has been idle for %AFKms% ms, the AHK script will now automatically /q for them.`nt/q`n
		ExitApp
	}
	SplashImage,,, %A_TimeIdlePhysical% > %KickTime%
}
Return
