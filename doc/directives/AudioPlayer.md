[AudioPlayer接口](http://wiki.baidu.com/pages/viewpage.action?pageId=268099035#id-云和端的接口制定V3-AudioPlayer接口)
AudioPlayer接口给出了用户控制客户端播放器的指令，以及客户端需要上报的事件，以管理和追踪播放状态。
```json
{
    "header": {
        "namespace": "AudioPlayer",
        "name": "Play",
        "message_id": "message_id-1344"
    },
    "payload": {
        "play_behavior": "REPLACE_ALL",
        "audio_item": {
            "audio_item_id": "156",
            "stream": {
                "url": "http://yinyueshiting.baidu.com/data2/music/124088643/124088643.mp3?xcode=57462f29cfc176f86a37d80a2c02fc5b",
                "stream_format": "AUDIO_MP3",
                "offset_ms": 0,
                "token": "156",
                "progress_report_interval_ms": 1000   
            }
        }
    }
}
```

