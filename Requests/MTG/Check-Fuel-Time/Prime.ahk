#Include Fuel.ahk
File = %A_MyDocumemts%\GTA San Andreas User Files\SAMP\chatlog.txt
!1::
Fuel:=FuelGet(File, 1000)
Time:=FuelTime(Fuel)
SendInput, t^a/b You have %Fuel% fuel units remaining which will last %Time%{Enter}
Return
