# 笑话Bot

## 播放笑话完整输出
```json
{
    "status": 0,
    "msg": "ok",
    "data": {
        "directives": [
            {
                "header": {
                    "namespace": "AudioPlayer",
                    "name": "Play",
                    "message_id": "1493187565_5286foqog"
                },
                "payload": {
                    "play_behavior": "REPLACE_ALL",
                    "audio_item": {
                        "audio_item_id": "56467949870",
                        "stream": {
                            "token": "56467949870",
                            "item_name": "第016集Ⅰ 《美女变兔子》",
                            "url": "http://fdfs.xmcdn.com/group14/M07/9A/5F/wKgDY1do_gWAx397AAxIyDN75Is613.mp3",
                            "stream_format": "AUDIO_MP3",
                            "progress_report_interval_ms": 1000,
                            "offset_ms": 0
                        }
                    }
                }
            }
        ],
        "nlu": {
            "domain": "audio.joke",
            "intent": "audio.joke.play"
        },
        "speech": {},
        "prompt": {},
        "resource": {},
        "views": [],
        "result_list": [
            {
                "confidence": 100,
                "form_confidence": 100,
                "source_type": "ai.dueros.bot.audio_joke",
                "source_sub_type": "ai.dueros.bot.audio_joke",
                "content": "{\"directives\":[{\"header\":{\"namespace\":\"AudioPlayer\",\"name\":\"Play\",\"message_id\":\"1493187565_5286foqog\"},\"payload\":{\"play_behavior\":\"REPLACE_ALL\",\"audio_item\":{\"audio_item_id\":\"56467949870\",\"stream\":{\"token\":\"56467949870\",\"item_name\":\"第016集Ⅰ 《美女变兔子》\",\"url\":\"http:\\/\\/fdfs.xmcdn.com\\/group14\\/M07\\/9A\\/5F\\/wKgDY1do_gWAx397AAxIyDN75Is613.mp3\",\"stream_format\":\"AUDIO_MP3\",\"progress_report_interval_ms\":1000,\"offset_ms\":0}}}}],\"confidence\":100,\"result_list\":[{\"result_confidence\":100,\"confidence\":100,\"result_content\":{\"answer\":\"Play\"},\"result_type\":\"txt\",\"source_type\":\"ai.dueros.bot.audio_joke\"}],\"nlu\":{\"domain\":\"audio.joke\",\"intent\":\"audio.joke.play\"},\"type\":\"user\",\"user_id\":\"zhoubingxuan_debug_monitor\",\"bot_intent\":{\"query\":\"讲个笑话\",\"query_score\":100}}",
                "stategy_middle_data": {
                    "raw_answer": [
                        {
                            "title": "",
                            "subtitle": "",
                            "answer": "Play",
                            "url": ""
                        }
                    ],
                    "bot_intent": {
                        "query": "讲个笑话",
                        "query_score": 100
                    }
                }
            }
        ],
        "page_num": 1,
        "page_cnt": 1,
        "result_num": 1,
        "service_query_info": [
            {
                "type": "audio.joke",
                "result_list": [
                    {
                        "type": "audio.joke",
                        "score": 100,
                        "result_list": [
                            {
                                "type": "audio.joke.play",
                                "score": 0,
                                "content": "",
                                "result_list": [
                                    {
                                        "key": "close",
                                        "type": "text",
                                        "value": [
                                            {
                                                "value": "",
                                                "name": "close",
                                                "source": "query",
                                                "type": "string",
                                                "tag_op": 1,
                                                "session_num": 0
                                            }
                                        ],
                                        "score": 0
                                    },
                                    {
                                        "key": "open",
                                        "type": "text",
                                        "value": [
                                            {
                                                "value": "",
                                                "name": "open",
                                                "source": "query",
                                                "type": "string",
                                                "tag_op": 1,
                                                "session_num": 0
                                            }
                                        ],
                                        "score": 0
                                    },
                                    {
                                        "key": "room",
                                        "type": "text",
                                        "value": [
                                            {
                                                "value": "",
                                                "name": "room",
                                                "source": "query",
                                                "type": "string",
                                                "tag_op": 1,
                                                "session_num": 0
                                            }
                                        ],
                                        "score": 0
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        ],
        "server_query_intent": "\"\""
    },
    "sessions": [
        {
            "status": 0,
            "msg": "ok",
            "action": "set",
            "type": "string",
            "name": "ai.dueros.bot.audio_joke",
            "key": "zhoubingxuan_debug_monitor",
            "list_sessions_str": [
                "[]"
            ]
        }
    ]
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
