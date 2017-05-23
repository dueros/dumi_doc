# SpeechRecognizer 语音识别

## Table of Contents


   * [SpeechRecognizer 语音识别](#speechrecognizer-语音识别)
      * [Table of Contents](#table-of-contents)
      * [ExpectSpeech指令](#expectspeech指令)
      * [ExpectSpeechTimedOut事件](#expectspeechtimedout事件)


## ExpectSpeech指令
需要客户端开始语音识别的时候，返回这个指令。
其实是一个多轮的标识，标识播报结果完成后，需要用户马上说话，而不是进入等待唤醒的状态
```json
{
    "header": {
        "namespace": "SpeechRecognizer",
        "name": "ExpectSpeech",
    },
    "payload": {
    }
}
```


## ExpectSpeechTimedOut事件

客户端开始语音识别后，一段时间（默认8s）没有收到用户的语音，超时的事件
```json
{
    "header": {
        "namespace": "SpeechRecognizer",
        "name": "ExpectSpeechTimedOut",
    },
    "payload": {
    }
}
```
