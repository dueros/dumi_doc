# SpeechSynthesizer 语音合成

## Table of Contents


   * [SpeechSynthesizer 语音合成](#speechsynthesizer-语音合成)
      * [Table of Contents](#table-of-contents)
      * [Speak指令](#speak指令)
      * [SpeechStarted事件](#speechstarted事件)
      * [SpeechFinished事件](#speechfinished事件)
      * [SpeechSynthesizer状态上报](#speechsynthesizer状态上报)


## Speak指令
需要扬声器语音播报的时候，返回这个指令。客户端收到这个指令后，需要把内容tts播报出来。听新闻返回的就是一个Speak指令。
```json
{
    "header": {
        "namespace": "SpeechSynthesizer",
        "name": "Speak",
        "message_id": "message_id-1344"
    },
    "payload": {
        "channel":"content", //可选，标志内容的优先级，默认为Dialog
        "token": "156",
        "type": "{{Text/SSML}}",
        "content": ["xxxx1", "xxxx2"],
        "speak_behavior": "REPLACE_ALL",
        "should_get_next_speech": true
    }
}
```
参数    | 描述    | 类型    | 必须
--- | --- | --- | ---
token   | tts的token | string  | 是
type    | TTS类型，type字段的两种取值：Text和SSML| string  | 是
content | 播报内容，content字段固定为数组，即使只有一条内容，也使用数组。| array   | 是
speak_behavior | 播报模式 REPLACE_ALL: 清空列表，立即播报；ENQUEUE: 把指令关联的tts添加到列表末尾，下一条预取的时候使用它 | string  | 是
channel | 播报内容的分类和优先级，取值：Dialog/Content/Alerts，请参考[directives的交互设计参考](../api/directives_design.md) | string  | 否，默认为Dialog



## SpeechStarted事件
收到Speak指令后，开始播报之前，上报此事件。
```json
{
    "device_event": {
        "header": {
            "namespace": "SpeechSynthesizer",
            "name": "SpeechStarted",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156",   
        }
    }
}
```

## SpeechFinished事件
播报完毕后，上报此事件。
```json
{
    "device_event": {
        "header": {
            "namespace": "SpeechSynthesizer",
            "name": "SpeechFinished",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156"
        }
    }
}
```


## SpeechSynthesizer状态上报

正常请求中也需要上报SpeechSynthesizer当前的状态

```json
"device_status":{
    "SpeechSynthesizer":{
        "token":"xxx",//正在播放的音频流id
        "offset_ms":20000,//播放到多少ms了
        "player_activity":"PLAYING / FINISHED"
    }
}
```
