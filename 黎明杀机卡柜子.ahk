*$F1::Suspend


connect(){
run %A_ScriptDir%\NetDisabler_x64.exe /E
}

disconnect(){
run %A_ScriptDir%\NetDisabler_x64.exe /D
}

/*
一键断网，2秒后开始重连
*/
*$WheelDown::
disconnect()
SetTimer, *$WheelUp, -2000
return

/*
一键断网，2秒后开始重连
*/
*$C::
disconnect()
SetTimer, *$WheelUp, -2000
return

*$WheelUp::
connect()
return

/*
一键卡柜子
*/
*$V::
Send {Space}
disconnect()
SetTimer, connect, -2000
return

Progress, Off
Return 
