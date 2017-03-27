# Speaker

## Table of Contents


   * [Speaker](#speaker)
      * [Table of Contents](#table-of-contents)
      * [SetVolume指令](#setvolume指令)
      * [AdjustVolume指令](#adjustvolume指令)
      * [SetMute 指令](#setmute-指令)
      * [MuteChanged 事件](#mutechanged-事件)
      * [VolumeChanged事件](#volumechanged事件)
      * [Speaker状态上报](#speaker状态上报)


## SetVolume指令
音量绝对控制指令, volumn取值为[0,100]
```json
{
    "header": {
        "namespace": "Speaker",
        "name": "SetVolume",
        "message_id": "message_id-1344"
    },
    "payload": {
        "volume": 1
    }
}
```

## AdjustVolume指令
音量相对控制指令，volume的取值范围为[-100,100]，正数表示增大音量，负数表示减小音量。
```json
{
    "header": {
        "namespace": "Speaker",
        "name": "AdjustVolume",
        "message_id": "message_id-1344"
    },
    "payload": {
        "volume": -10
    }
}
```

## SetMute 指令
设置静音状态打开／关闭
```json
{
    "header": {
        "namespace": "Speaker",
        "name": "SetMute",
        "message_id": "message_id-1344"
    },
    "payload": {
        "mute": true
    }
}
```


## MuteChanged 事件
静音状态改变的事件上报
```json
"device_event": {
    "header": {
        "namespace": "Speaker",
        "name": "MuteChanged",
        "message_id": "message_id-1344"
    },
    "payload": {
        "muted": true,
        "volume": 10
    }
}
```


## VolumeChanged事件
```json
"device_event": {
    "header": {
        "namespace": "Speaker",
        "name": "VolumeChanged",
        "message_id": "message_id-1344"
    },
    "payload": {
        "volume": 10
    }
}
```


## Speaker状态上报
正常请求中也需要上报Speaker当前的状态
```json
"device_status":{
    "Speaker":{
        "volume": 50,
        "muted": false
    }
}
```


