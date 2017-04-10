# AudioPlayer

## Table of Contents

   * [AudioPlayer](#audioplayer)
      * [Table of Contents](#table-of-contents)
      * [AudioPlayer.Play指令](#audioplayerplay指令)
      * [AudioPlayer.Stop指令](#audioplayerstop指令)
      * [PlaybackStarted事件](#playbackstarted事件)
      * [PlaybackStopped事件](#playbackstopped事件)
      * [PlaybackNearlyFinished事件](#playbacknearlyfinished事件)
      * [PlaybackFinished事件](#playbackfinished事件)
      * [ProgressReportIntervalElapsed事件](#progressreportintervalelapsed事件)
      * [上报AudioPlayer状态（在请求中）](#上报audioplayer状态在请求中)
      * [有屏设备接入音乐、有声等音频服务](#有屏设备接入音乐有声等音频服务)
      * [FAQ](#faq)
      * [Changelog](#changelog)


## AudioPlayer.Play指令
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
audio_item.stream.offset_ms | 客户端从哪里开始播放音频，如果值等于0，从开头播放。 | long | 是
audio_item.stream.token | 同音频ID  | string | 是
audio_item.stream.progress_report_interval_ms |客户端每隔多长时间上报一次进度，这个取值必须大于0，如果没有这个字段，则不上报进度   |  long | 否

## AudioPlayer.Stop指令
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

## PlaybackStarted事件
客户端开始播放的时候，需要上报此事件。
```json
{
    "device_event": {
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
## PlaybackStopped事件
用户说"暂停播放"、 "停止播放"后，会收到Stop指令，客户端执行完Stop指令后，即暂停播放后，需要上报此事件，云端会保存断点，供下一次继续播放使用。
```json
{
    "device_event": {
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
## PlaybackNearlyFinished事件
这个事件用来获取下一首歌曲，云端收到这个事件后，返回下一首歌曲对应的Play指令，play_behavior选项设为ENQUEUE，
指示客户端加入到本地列表中，利用此事件，客户端可以实现下一首的预取。这个事件的上报时机取决于客户端，
可以在歌曲播放的中间发送，也可以剩余几秒钟的时候发送。如果不需要预取，也可以在歌曲播放完毕后上报此事件。但必须保证：

1 PlaybackNearlyFinished必须在PlaybackStarted事件发送完毕后才上报。

2 一首歌曲只发送一次PlaybackNearlyFinished事件。

```json
{
    "device_event": {
        "header": {
            "namespace": "AudioPlayer",
            "name": "PlaybackNearlyFinished",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156",
            "offset_ms": 10000
        }
    }
}
```
## PlaybackFinished事件
当且仅当歌曲正常播放到末尾后，上报此事件。注意如果被其它指令打断比如“下一首”、“上一首”导致没有播放到末尾的，不上报此事件。
```json
{
    "device_event": {
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
## ProgressReportIntervalElapsed事件
如果Play指令设置了progress_report_interval_ms的值，那么客户端需要周期性的每隔一段时间上报一次当前的播放进度，
直到歌曲播放结束。注意歌曲开始播放和歌曲结束播放的时候，可以不上报这个事件。

情况1：假如progress_report_interval_ms的值为3000，Play指令的offset_ms值为0， 从音频流的0位置算起，如果播放位置到达3000的整数倍，就上报一次事件。

情况2：假如progress_report_interval_ms的值为3000，Play指令的offset_ms值为1000， 从音频流的0位置算起，如果播放位置到达3000的整数倍，就上报一次事件。

这2种情况，上报事件时所处的播放位置是一样的，跟offset_ms的值没有关系，因为是从音频流的0位置算起。
云端收到这个事件后，可能会返回给客户端一条指令，需要客户端执行之，比如Stop指令、AdjustVolume指令等。利用这个特性可以实现助眠模式。


## 上报AudioPlayer状态（在请求中）

```javascript
"device_status":{
    "AudioPlayer":{
        "token":"xxx",//正在播放的音频流id
        "offset_ms":20000,//播放到多少ms了
        "player_activity":"IDLE PAUSED PLAYING BUFFER_UNDERRUN FINISHED STOPPED"
    },
},
```

## 有屏设备接入音乐、有声等音频服务
Directive和Event机制非常适合无屏设备使用，对于有屏设备，
也推荐使用Directive和Event机制接入音频服务，端和云之间的交互的性能和流畅性会更好，带来更好的用户体验。
但是如果厂商认为接入Directive和Event开发成本高，需要快速出产品效果，也可以通过NLU+Resource的方式接入音频服务,具体流程如下：

1. 用户语音说“”播放周杰伦的歌曲”，发起第一次网络请求，DuerOS云端除了返回Play指令外，还会返回resource，里面有一个api
   url，用于从云端获取播放列表，端上发起第二次网络请求获取播放列表在屏幕展现，然后端上拿到列表中第一首歌曲的ID，向度秘云端
   发起第三次网络请求，拿到第一首歌曲的MP3
   URL，开始音频的播放。这里需要三次网络请求才能实现歌曲的播放，链路长，性能不好，如果为了更快的播放，端上可以选择第一次网络请求后，从Play指令中提取MP3
   URL，直接开始第一首歌曲的播放，不用等到第二次和第三次网络请求之后就能播放歌曲了。

2. 用户在屏幕GUI上点击一首歌曲的播放，端上发起一次网络请求，根据歌曲ID拿到MP3 URL，开始播放用户点击的歌曲。

3. 用户语音说"下一首"，发起第一次网络请求，DuerOS云端返回NLU结果，客户端判断NLU结果为换一首，然后本地取得下一首歌曲的歌曲ID，发起第二次网络请求，拿到MP3 URL，开始下一首歌曲的播放。
   其它播放控制也类似，DuerOS NLU支持的播放控制，可以参考[音乐](../bot/audio_music.md) 、[点播](../bot/audio_unicast.md)、[直播](../bot/audio_live.md)。

4. 用户语音说“换一批”，发起第一次网络请求，DuerOS云端返回NLU结果，客户端判断NLU结果为换一批，发起第二次网络请求，获取下一页的歌曲列表，将列表中第一首歌曲的ID，发起第三次网络请求，拿到MP3
   URL，开始下一批歌曲的播放。

5. 用户在频幕GUI上的上滑翻页操作，请求播放列表的接口，拿到下一页的歌曲列表，追加到GUI的播放列表中。

## FAQ
* 如何实现暂停、继续

暂停和继续只需要实现Play和Stop两个指令，语音说“暂停”，云端返回Stop指令，客户端收到指令后执行暂停，同时立马上报一个PlaybackStopped的事件，
云端收到事件后把断点位置offset_ms保存下来，接下来语音说“继续”，云端返回Play指令，offset_ms的值为上一次说暂停时上报的位置，客户端收到Play指令后，
从offset_ms的位置开始播放，从而实现继续播放的功能。

* 如何实现循环模式（列表循环、随机播放、单曲循环）

循环模式的逻辑由云端实现，客户端不需要实现循环模式的逻辑，客户端只需要维持本地的播放列表，一首一首的播放，以及实现Play指令的play_behavior的REPLACE_ENQUEUED模式，例如单曲循环的实现：
当前正在播放的音频id为156，语音说“单曲循环”，云端会把播放模式切换为单曲循环，同时返回一个Play指令
```json
{
    "header": {
        "namespace": "AudioPlayer",
        "name": "Play",
        "message_id": "message_id-1344"
    },
    "payload": {
        "play_behavior": "REPLACE_ENQUEUED",
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
Play指令的play_behavior为REPLACE_ENQUEUED，客户端清空本地之前预取保存的播放列表，同时把音频id为156的歌曲加入到播放列表，当前播放的歌曲不受
影响，继续播放直到结束，结束后开始播放本地播放列表中的下一首歌曲，即音频id为156的歌曲。这里重点是要清空本地的播放列表，否则下一首歌曲可能不会符合预期。播放到一定位置后，客户端上报PlaybackNearlyFinished事件
实现预取，云端返回的音频id依然为156，播放模式为ENQUEUED。
```json
{
    "header": {
        "namespace": "AudioPlayer",
        "name": "Play",
        "message_id": "message_id-1344"
    },
    "payload": {
        "play_behavior": "ENQUEUED",
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
下一次预取依然返回相同的Play指令，依此类推，这样就实现了单曲循环的功能。

## Changelog
* 2017-4-10 修改有屏设备接入的说明；增加FAQ。
