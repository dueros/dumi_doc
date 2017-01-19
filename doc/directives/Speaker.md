用户控制Speaker（扬声器）的音量的指令

#### SetVolume指令
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

#### AdjustVolume指令
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

#### VolumeChanged事件
```json
{
    "event": {
        "header": {
            "namespace": "Speaker",
            "name": "VolumeChanged",
            "message_id": "message_id-1344"
        },
        "payload": {
            "volume": 10
        }
    }
}
```
