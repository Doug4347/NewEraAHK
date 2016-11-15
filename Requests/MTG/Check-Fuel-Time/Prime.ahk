#Include Fuel.ahk
File = %A_MyDocumemts%\GTA San Andreas User Files\SAMP\chatlog.txt
!1::
Fuel:=FuelGet(File, 3, 1000)
Time:=FuelTime(Fuel)
SendInput, You have %Fuel% fuel units remaining which will last %Time%
Return
