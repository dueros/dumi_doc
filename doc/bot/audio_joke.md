# 笑话Bot

## 有声笑话完整输出
```json
{
    "result": {
        "directives": [
            {
                "header": {
                    "message_id": "fb299466-bbe2-46e3-bcda-65c9b68fa1fb",
                    "name": "Play",
                    "namespace": "AudioPlayer"
                },
                "payload": {
                    "audio_item": {
                        "audio_item_id": "56467429673",
                        "stream": {
                            "__name": "小明的故事——不想上学",
                            "offset_ms": 0,
                            "progress_report_interval_ms": 1000,
                            "stream_format": "AUDIO_MP3",
                            "token": "56467429673",
                            "url": "http://fdfs.xmcdn.com/group5/M08/2E/3F/wKgDtlSuElnDb355AAV5Dsfoo8Q652.mp3"
                        }
                    },
                    "play_behavior": "REPLACE_ALL"
                }
            }
        ],
        "nlu": {
            "domain": "audio.joke",
            "intent": "audio.joke.play",
            "slots": {}
        },
        "bot_id": "audio_joke",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "Play"
            }
        ],
        "speech": {
            "type": "Text",
            "content": ""
        }
    },
    "id": "1497940145_101fbs4kc",
    "logid": "14979401448642",
    "user_id": "@@@cuid@@@",
    "time": 1497940145,
    "cuid": "@@@cuid@@@",
    "se_query": "讲个笑话",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 296
}
```

## 图文笑话完整输出

```
{
    "result": {
        "hint": [
            "再来一个",
            "文字笑话"
        ],
        "nlu": {
            "domain": "recommend_service_wireless",
            "intent": "joke",
            "slots": {
                "service_type": "joke"
            }
        },
        "bot_id": "joke",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "你这长相完全可以穿越回古代卖艺，先在现场拱手对观众说句“献丑了！”，然后拿出你的身份证给观众们看就行。"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "你这长相完全可以穿越回古代卖艺，先在现场拱手对观众说句“献丑了！”，然后拿出你的身份证给观众们看就行。"
        }
    },
    "id": "1497940452_2452sajey",
    "logid": "14979404523186",
    "user_id": "@@@cuid@@@",
    "time": 1497940452,
    "cuid": "@@@cuid@@@",
    "se_query": "讲个笑话",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 177
}
```

### 图文笑话result_list的content说明
图文笑话result_list可包含单个item或者多个item，一个item代表一个媒体资源（文字／静态图片／动态图片），通过result_type判断，txt文字、img_comm图片，gif_face动图。目前文字笑话只会出一个文字资源，图片笑话会出两个资源，分别是图片和文字。
```
{
    "hint_id": "5940F5AE8A11F",
    "hint": [
        "再来一个",
        "文字笑话",
        "图片笑话",
        "动图笑话"
    ],
    "hint_mlt": {
        "placeholder": "",
        "type": "multi_column",
        "data": [
            {
                "id": 0,
                "value": "再来一个"
            },
            {
                "id": 1,
                "value": "文字笑话"
            },
            {
                "id": 2,
                "value": "图片笑话"
            },
            {
                "id": 3,
                "value": "动图笑话"
            }
        ]
    },
    "result_list": [
        {
            "result_content": {
                "answer": "妈妈劝我不要再抽烟喝酒了，不然体检的时候一定会查出病来的。听从了妈妈的话，我就再也没去体检过。"
            },
            "source_type": "joke",
            "voice": "妈妈劝我不要再抽烟喝酒了，不然体检的时候一定会查出病来的。听从了妈妈的话，我就再也没去体检过。",
            "result_type": "txt",
            "card_id": ""
        }
    ],
    "confidence": 300,
    "nlu": {
        "domain": "audio.joke",
        "intent": "audio.joke.play"
    },
    "type": "user",
    "user_id": "zhoubingxuan_debug_monitor",
    "bot_intent": {
        "query": "讲个笑话",
        "query_score": 100
    }
}
```


## nlu说明
intent|slot_name|slot_value|备注
----|----|--------|----
audio.joke.play|||播放笑话
|image|图片|表达图片笑话意图（针对图文笑话）
|dynamic_image|动态图片/动图|表达动图笑话意图（针对图文笑话）
audio.joke.next|||下一个
audio.joke.previous|||上一个
audio.joke.continue|||继续
audio.joke.stop|||停止

## directives 部分的说明
参见相关directives的文档
* [AudioPlayer](../directives/AudioPlayer.md) 播放相关指令
* [Speaker](../directives/Speaker.md) 扬声器控制、设置相关指令
* [SpeechSynthesizer](../directives/SpeechSynthesizer.md) 语音播报（TTS）相关指令
