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
参数 | 描述 | 类型 | 必须
---- | --- | --- | ---
play_behavior | REPLACE_ALL:
清空播放列表，立即播放指令关联的音频。"播放周杰伦的歌曲"、"播放郭德纲的相声"、"下一首"、"上一首"，使用它。ENQUEUE:
把指令关联的音频添加到播放列表末尾，当前播放的音频不受影响.下一首预取的时候试用它。REPLACE_ENQUEUED:
清空播放列表，同时把指令关联的音频加到播放列表，但当前播放的歌曲不受影响。"这首歌播放完后播放周杰伦的歌曲"，使用它；用户说“单曲循环、列表循环、随机播放”的时候，也使用它。| string | 是
audio_item | 音频对象，包括音频流和元数据  | object | 是
audio_item.audio_item_id | 音频ID   | string | 是
audio_item.stream   | 音频流对象    | object | 是
audio_item.stream.url | 音频流url   | string | 是
audio_item.stream.stream_format | 音频流格式： AUDIO_MP3、AUDIO_M3U8、AUDIO_M4A  | string | 是
audio_item.stream.offset_ms | 从哪里开始播放，如果值等于0，从开头播放。 | long | 是
audio_item.stream.token | 同音频ID  | string | 是
audio_item.stream.progress_report_interval_ms |客户端每隔多长时间上报一次进度，这个取值必须大于0，如果没有这个字段，则不上报进度   |  long | 否

