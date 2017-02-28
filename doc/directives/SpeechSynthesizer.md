# SpeechSynthesizer 语音合成

## Table of Contents


   * [SpeechSynthesizer 语音合成](#speechsynthesizer-语音合成)
      * [Table of Contents](#table-of-contents)
            * [Speak指令](#speak指令)
            * [GetNextSpeech事件](#getnextspeech事件)
            * [SpeechStarted事件](#speechstarted事件)
            * [SpeechFinished事件](#speechfinished事件)


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
should_get_next_speech  | 如果should_get_next_speech为true，这条Speech播放完毕后，客户端应该上报一个GetNextSpeech的事件。 | bool    | 是

## GetNextSpeech事件
播报，如果Speak指令的should_get_next_speech设置了true，speech播放完毕后，客户端上报此事件，云端返回下一个Speak指令。
```json
{
    "event": {
        "header": {
            "namespace": "SpeechSynthesizer",
            "name": "GetNextSpeech",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156"
        }
    }
}
```
## SpeechStarted事件
收到Speak指令后，开始播报之前，上报此事件。
```json
{
    "event": {
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
    "event": {
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


