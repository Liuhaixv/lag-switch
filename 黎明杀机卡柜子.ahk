*$F1::Suspend

global isDisconnected := false

connect(){
	SoundBeep, 450, 150
	run C:\Program Files\NetBalancer\nbcmd.exe settings reset true, ,hide
	isDisconnected := false
}

disconnect(){
	SoundBeep, 1000, 150
	run C:\Program Files\NetBalancer\nbcmd.exe settings priorities edit deadbydaylight-win64-shipping.exe  Normal Limited 90 90 true, ,hide
	isDisconnected := true
}

;断网/联网
switch() {
	if(isDisconnected == false) {
		disconnect()
	} else {
		connect()
	}
}

checkConnection() {
	if(isDisconnected == false) {
		SoundBeep, 450, 150
	} else {
		SoundBeep, 1000, 150
	}
}

*$C::
switch()
Return

*$R::
checkConnection()
Return

*$V::
Send {Space}
connect()
Return

Progress, Off
Return
