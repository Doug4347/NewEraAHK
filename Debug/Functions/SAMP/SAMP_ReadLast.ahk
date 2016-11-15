File = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
Exist:=False
Return
!1::
IfExist, %File%
Exist:=True
Loop, Read, %File%
Index:=A_Index-2
FileReadLine, Line, %File%, %Index%
FileAppend,
(
%Exist%
%File%
%Index%
%Line%

), debug.txt
Index-=1
FileAppend,
(

%File%
%Index%
%Line%

), debug.txt
Return
