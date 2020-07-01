*$F1::Suspend

*$WheelDown::
run E:\NetDisabler\NetDisabler_x64.exe /D
SetTimer, *$WheelUp, -2000
return

*$C::
run E:\NetDisabler\NetDisabler_x64.exe /D
SetTimer, *$WheelUp, -2000
return

*$WheelUp::
run E:\NetDisabler\NetDisabler_x64.exe /E
return

Progress, Off
Return 






