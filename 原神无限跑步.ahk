#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#maxThreadsPerHotkey, 2

repeatRunning := -1

runningTime := 25000	;跑步时间
connectTime := 3500	;重新连接服务器时间(防止掉线)
dcKey = g 		;lag switch键

/*
	F1键位:暂停脚本
	V键:自动奔跑
	Z键:lag switch, 超时自动连网
*/

*$v::
repeatRunning *= -1
if(repeatRunning = -1)
{
	SetTimer, dc, off
	Send {%dcKey%}
}else
{
	Send {%dcKey%}
	SetTimer, dc, %runningTime%

	while(repeatRunning = 1)
	{
		runForOneTime()
	}
}
return

dcIng := -1

runForOneTime()
{
	Send {w down}
	SendInput {RButton}
	Sleep, 850
	Send {w up}
}

dc:
	if(repeatRunning = 1)
	{
		Send {%dcKey%}
		Sleep, %connectTime%
		Send {%dcKey%}
	}



