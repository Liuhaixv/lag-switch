# lag-switch
一键断线,默认120秒后开始重连网络,可自行修改脚本,带有声音和视觉反馈

### 需要的软件
  * [AutoHotKey](https://www.autohotkey.com/)(运行ahk脚本)
  * NetBalancer(用于限制网络流量)

### 常量
  * `nbcmdDir`:NetBalancer的根目录,必须设置正确,并且确保NetBalancer处于工作状态(激活或试用),否则脚本无法正确运行
  * `timeLimit`:自动重新连接的最大等待时间,默认为120秒

### 热键
  * `F1`:暂停脚本
  * `C`:限制上传/网络重置
  * `X`:限制下载/网络重置
  * `Z`:限制上传和下载/网络重置
  * `V`:按一下空格然后网络重置

***
# lag-switch
lag switch for Dead By Daylight(works for other softwares too). With both auditory  and visual feedback, you can easily tell if the game was lag-switched or how long it has been.

### Requirements
  * [AutoHotKey](https://www.autohotkey.com/)(to run .ahk scripts)
  * NetBalancer(Control network traffic of game)

### constant Variable
  * `nbcmdDir`:root direction of NetBalancer, must be set correctly.Also you need to ensure that NB is in working stage(activated or in trial), or the script will not work.
  * `timeLimit`:max time before auto-reconnecting, default by 120 sec
### Hotkeys
  * `F1`:Suspends script
  * `C`:Limit upload/reset network
  * `X`:Limit download/reset network
  * `Z`:Limit both upload and download/reset network
  * `V`:Send {Space} and reset network
