# Extension

## Table of Contents


## Extension.Settings.Set指令


### 打开/关闭蓝牙

用户对音箱说“打开/关闭蓝牙”，会返回如下指令，true表示打开，false表示关闭。

```json
{
    "header": {
        "namespace": "Extension.Settings",
        "name": "Set",
        "message_id": "message_id-1344"
    },
    "payload": {
        "bluetooth": true
    }
}
```


### 关闭麦克风

用户对音箱说“关闭麦克风”，会返回如下指令，false表示关闭。

说明：对于麦克风的控制，只支持关闭指令，打开操作需要通过其他方式（如：物理按键）实现。

```json
{
    "header": {
        "namespace": "Extension.Settings",
        "name": "Set",
        "message_id": "message_id-1344"
    },
    "payload": {
        "microphone": false
    }
}
```

