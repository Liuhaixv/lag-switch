*$F1::Suspend

/*
一键断网，2秒后开始重连
*/
*$WheelDown::
run E:\NetDisabler\NetDisabler_x64.exe /D
SetTimer, *$WheelUp, -2000
return

/*
一键断网，2秒后开始重连
*/
*$C::
run E:\NetDisabler\NetDisabler_x64.exe /D
SetTimer, *$WheelUp, -2000
return

*$WheelUp::
run E:\NetDisabler\NetDisabler_x64.exe /E
return

/*
一键卡柜子
*/
*$V::
Send {space}
run E:\NetDisabler\NetDisabler_x64.exe /D
SetTimer, *$WheelUp, -2000
return

Progress, Off
Return 
