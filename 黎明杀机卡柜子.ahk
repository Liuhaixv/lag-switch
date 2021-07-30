global isDisconnected := false
global uploadBlocked := false
global downloadBlocked := false
global counter := new SecondCounter

;⇅
class SecondCounter {
    __New() {
        this.interval := 1000
        this.count := 0
        ; Tick() has an implicit parameter "this" which is a reference to
        ; the object, so we need to create a function which encapsulates
        ; "this" and the method to call:
        this.timer := ObjBindMethod(this, "Tick")
    }
    Start() {
        ; Known limitation: SetTimer requires a plain variable reference.
        timer := this.timer
        SetTimer % timer, % this.interval
        ToolTip % this.count, % A_ScreenWidth / 2, % A_ScreenHeight / 2
    }
    Stop() {
        ; To turn off the timer, we must pass the same object as before:
        timer := this.timer
        SetTimer % timer, Off
		;隐藏工具栏
        ToolTip
		this.count := 0
    }
    ; In this example, the timer calls this method:
    Tick() {
        ToolTip % ++this.count, % A_ScreenWidth / 2, % A_ScreenHeight / 2
    }
}

connect(){
	SoundBeep, 450, 150
	run C:\Program Files\NetBalancer\nbcmd.exe settings reset true, ,hide
	isDisconnected := false
	uploadBlocked := false
	downloadBlocked := false
	Return
}

;阻断上传
blockUpload(){
	SoundBeep, 1000, 150
	run C:\Program Files\NetBalancer\nbcmd.exe settings priorities edit deadbydaylight-win64-shipping.exe  Normal Limited 90 90 true, ,hide
	isDisconnected := true
	downloadBloked := false
	uploadBlocked := true
	Return
}

;阻断下载
blockDownload(){
	SoundBeep, 1000, 150
	run C:\Program Files\NetBalancer\nbcmd.exe settings priorities edit deadbydaylight-win64-shipping.exe Limited Normal 90 90 true, ,hide
	isDisconnected := true
	downloadBlocked := true
	uploadBlocked := false
	Return
}

;阻断上传和下载
blockAll(){
	SoundBeep, 1000, 150
	run C:\Program Files\NetBalancer\nbcmd.exe settings priorities edit deadbydaylight-win64-shipping.exe  Limited Limited 90 90 true, ,hide
	isDisconnected := true
	uploadBlocked := true
	downloadBlocked := true
	Return
}
switchBlockUpload(){
	if(uploadBlocked == false) {
		blockUpload()
		counter.Start()
	} else {
		connect()
		counter.Stop()
	}
	Return
}

switchBlockDownload(){
	if(downloadBlocked == false) {
		blockDownload()
		counter.Start()
	} else {
		connect()
		counter.Stop()
	}
	Return
}

switchBlockAll(){
	if(downloadBlocked == false || uploadBlocked == false) {
		blockAll()
		counter.Start()
	} else {
		connect()
		counter.Stop()
	}
	Return
}

checkConnection(){
	if(isDisconnected == false){
		SoundBeep, 450, 150
	} else {
		SoundBeep, 1000, 150
	}
	Return
}

init() {
	connect()
}

init()

;绑定按键

*$F1::Suspend

*$C::
switchBlockUpload()
Return

*$X::
switchBlockDownload()
Return

*$Z::
switchBlockAll()
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
