#Include Fuel.ahk
File = %A_MyDocumemts%\GTA San Andreas User Files\SAMP\chatlog.txt
!1::
Fuel:=Fuel(File, 3)
Time:=FuelTime(Fuel)
SendInput, You have %Fuel% fuel units remaining which will last %Time%
Return