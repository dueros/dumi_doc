# Extension

## Table of Contents


## Extension.Settings.Set指令

用户对音箱说“关闭麦克风”、“打开蓝牙”，可能会返回一个这样的指令。
```json
{
    "header": {
        "namespace": "Extension.Settings",
        "name": "Set",
        "message_id": "message_id-1344"
    },
    "payload": {
        "tone":"", //音色
        "bluetooth":true,//蓝牙开关
        "microphone":true //麦克风开关
    }
}
```

