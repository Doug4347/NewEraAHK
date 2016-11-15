InputBox, Func,, Please put the function in.
If ErrorLevel
ExitApp
InputBox, File,, Please put the name of the file in.
If ErrorLevel
ExitApp
FileAppend, #Include %File%`n%Func%, Tester.ahk
Run, Tester.ahk
ExitApp
