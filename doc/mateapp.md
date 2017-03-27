# mate app 实现指南

## Table of Contents


   * [mate app 实现指南](#mate-app-实现指南)
      * [Table of Contents](#table-of-contents)
      * [登录](#登录)
      * [command](#command)
         * [请求示例](#请求示例)
         * [支持的command](#支持的command)


## 登录
请参考[度秘无屏设备登录流程](http://agroup.baidu.com/duer/md/article/241282)

## command
command是mate app发送给度秘的一种请求，用于控制设备
所有的command请求，都发给 **https://xiaodu.baidu.com/saiya/command**，需要**带百度的登录态**，method为post，body是json，格式参考下面的示例

### 请求示例

```javascript
{
    //==========以下是开放sdk会有的字段========================
    "appid": "650DEBC2B99A4dA4",
    "appkey": "2F4B662AF2064323A16122D702160F15",
    "appname": "com.baidu.duersdk.xiaomi",
    //string mate app手机的硬件id
    "CUID": "string",
    //被操作的设备的cuid
    "device_id":"12783681267812d",
    "command": {"type":"PlayCommand"} //参考下面的command列表
}
```

### 支持的command

  * 播放指令： {"type":"PlayCommand"}
    * 如果设备在暂停状态，设备实际执行恢复播放，并且上报PlaybackStarted事件
  * 暂停指令： {"type":"PauseCommand"}
    * 如果设备在播放状态，设备实际执行暂停，并且上报PlaybackStopped事件
  * 下一首：{"type":"NextCommand"}
    * 上报PlaybackNearlyFinished事件（以前的GetNextPlayback事件），理论上会收到播放下一首歌的指令，执行之，并且播放下一首歌
  * 上一首 ： {"type":"PreviousCommand"}
    * 播放上一首歌，上报PlaybackStarted事件
  * 音量调节：{"type":"VolumeLevelCommand","volumeLevel":40}
    * 设备调整音量，并且上报Speaker.VolumeChanged事件
  * 快进后者后退（拖动进度条） {"type":"SeekCommand", "mediaPosition":161}
    * 播放器快进快退，并且上报PlaybackStarted事件
  <!--
  * 重复指令： {"type":"RepeatCommand", "repeat":true/false}  false为取消
  * 随机播放命令：{"type":"ShuffleCommand", "shuffle":true/false} false为取消
  -->
