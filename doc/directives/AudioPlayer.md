AudioPlayer接口给出了用户控制客户端播放器的指令，以及客户端需要上报的事件，以管理和追踪播放状态。
#### AudioPlayer.Play指令
用户对音箱说“播放周杰伦的歌曲”、“播放郭德纲的相声”、"继续播放"、“下一首”、“上一首”、“下一个专辑”、“上一个专辑”都返回一个Play指令。
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
play_behavior | REPLACE_ALL:清空播放列表，立即播放指令关联的音频。"播放周杰伦的歌曲"、"播放郭德纲的相声"、"下一首"、"上一首"，使用它。ENQUEUE:把指令关联的音频添加到播放列表末尾，当前播放的音频不受影响.下一首预取的时候试用它。REPLACE_ENQUEUED:清空播放列表，同时把指令关联的音频加到播放列表，但当前播放的歌曲不受影响。"这首歌播放完后播放周杰伦的歌曲"，使用它；用户说“单曲循环、列表循环、随机播放”的时候，也使用它。| string | 是
audio_item | 音频对象，包括音频流和元数据  | object | 是
audio_item.audio_item_id | 音频ID   | string | 是
audio_item.stream   | 音频流对象    | object | 是
audio_item.stream.url | 音频流url   | string | 是
audio_item.stream.stream_format | 音频流格式： AUDIO_MP3、AUDIO_M3U8、AUDIO_M4A  | string | 是
audio_item.stream.offset_ms | 从哪里开始播放，如果值等于0，从开头播放。 | long | 是
audio_item.stream.token | 同音频ID  | string | 是
audio_item.stream.progress_report_interval_ms |客户端每隔多长时间上报一次进度，这个取值必须大于0，如果没有这个字段，则不上报进度   |  long | 否

#### AudioPlayer.Stop指令
```json
{
    "header": {
        "namespace": "AudioPlayer",
        "name": "Stop",
        "message_id": "message_id-1344"
    },
    "payload": {
    }
}
```
#### AudioPlayer.Continue指令
用户对音箱说"继续播放"，返回一个Continue指令，客户端继续播放
```json
{
    "header": {
        "namespace": "AudioPlayer",
        "name": "Continue",
        "message_id": "message_id-1344"
    },
    "payload": {
    }
}
````
#### PlaybackStarted事件
收到Play指令或者Continue指令后，需要上报此事件。
```json
{
    "event": {
        "header": {
            "namespace": "AudioPlayer",
            "name": "PlaybackStarted",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156",
            "offset_ms": 10000
        }
    }
}
```
#### PlaybackStopped事件
用户说"暂停播放"、 "停止播放"后，会收到Stop指令，客户端执行完Stop指令后，即暂停播放后，需要上报此事件，云端会保存断点，供下一次继续播放使用。
```json
{
    "event": {
        "header": {
            "namespace": "AudioPlayer",
            "name": "PlaybackStopped",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156",
            "offset_ms": 10000
        }
    }
}
```
#### GetNextPlayback事件
这个事件用来获取下一首歌曲，云端收到这个事件后，返回下一首歌曲对应的Play指令，play_behavior选项设为ENQUEUE，
指示客户端加入到本地列表中，利用此事件，客户端可以实现下一首的预取。这个事件的上报时机取决于客户端，
可以在歌曲播放的中间发送，也可以剩余几秒钟的时候发送。如果不需要预取，也可以在歌曲播放完毕后上报此事件。但必须保证：

1 GetNextPlayback必须在PlaybackStarted事件发送完毕后才上报。

2 一首歌曲只发送一次GetNextPlayback事件。

```json
{
    "event": {
        "header": {
            "namespace": "AudioPlayer",
            "name": "GetNextPlayback",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156",
            "offset_ms": 10000
        }
    }
}
```
#### PlaybackFinished事件
当且仅当歌曲正常播放到末尾后，上报此事件。注意如果被其它指令打断比如“下一首”、“上一首”导致没有播放到末尾的，不上报此事件。
```json
{
    "event": {
        "header": {
            "namespace": "AudioPlayer",
            "name": "PlaybackFinished",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156",
            "offset_ms": 10000
        }
    }
}
```
#### ProgressReportIntervalElapsed事件
如果Play指令设置了progress_report_interval_ms的值，那么客户端需要周期性的每隔一段时间上报一次当前的播放进度，
直到歌曲播放结束。注意歌曲开始播放和歌曲结束播放的时候，可以不上报这个事件。

情况1：假如progress_report_interval_ms的值为3000，Play指令的offset_ms值为0， 从音频流的0位置算起，如果播放位置到达3000的整数倍，就上报一次事件。

情况2：假如progress_report_interval_ms的值为3000，Play指令的offset_ms值为1000， 从音频流的0位置算起，如果播放位置到达3000的整数倍，就上报一次事件。

这2种情况，上报事件时所处的播放位置是一样的，跟offset_ms的值没有关系，因为是从音频流的0位置算起。
云端收到这个事件后，可能会返回给客户端一条指令，需要客户端执行之，比如Stop指令、AdjustVolume指令等。利用这个特性可以实现助眠模式。
