global isDisconnected := false
global uploadBlocked := false
global downloadBlocked := false
global counter := new SecondCounter
global timeLimit := 120

class SecondCounter {	
    __New() {
		this.str := ""
        this.interval := 1000
        this.count := 0
        this.timer := ObjBindMethod(this, "Tick")
    }
    Start(prefix_str) {
		this.str := prefix_str
        timer := this.timer
        SetTimer % timer, % this.interval
		this.count++
		text := this.str . this.count
        ToolTip %text%, % A_ScreenWidth / 2, % A_ScreenHeight / 2
    }
    Stop() {
        timer := this.timer
        SetTimer % timer, Off
		;隐藏工具栏
		;hide tooltip
        ToolTip
		this.count := 0
    }
    Tick() {
		this.count++
		if(this.count >= timeLimit) {
			connect()
			this.Stop()
			return
		}
		text := this.str . this.count
        ToolTip %text%, % A_ScreenWidth / 2, % A_ScreenHeight / 2
    }
}

connect(){
	counter.Stop()
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
		counter.Start("↑ ")
	} else {
		connect()
	}
	Return
}

switchBlockDownload(){
	if(downloadBlocked == false) {
		blockDownload()
		counter.Start("↓ ")
	} else {
		connect()
	}
	Return
}

switchBlockAll(){
	if(downloadBlocked == false || uploadBlocked == false) {
		blockAll()
		counter.Start("↑↓ ")
	} else {
		connect()
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
;bindings
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
