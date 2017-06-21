# 笑话Bot

## 有声笑话完整输出

```
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
    "emotion": 0,
    "hint": [
        "再来一个",
        "图片笑话",
        "动图笑话",
        "文字笑话"
    ],
    "logid": "14979406701265",
    "request_time": "1497940670813",
    "request_uid": "zhoubingxuan_debug",
    "result_list": [
        {
            "card_id": "",
            "result_content": {
                "img_height": 0,
                "img_width": 0,
                "imgs": [
                    "https://ss1.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/xiaodu/pic/item/6a600c338744ebf8a30fda49def9d72a6059a74e.jpg"
                ],
                "link": "",
                "source": null
            },
            "result_type": "img_comm",
            "source_type": "joke",
            "source_sub_type": "joke",
            "voice": ""
        },
        {
            "card_id": "",
            "result_content": {
                "answer": "白赚十块钱"
            },
            "result_type": "txt",
            "source_type": "joke",
            "voice": "白赚十块钱",
            "source_sub_type": "joke"
        }
    ],
    "se_query": "讲个笑话",
    "service_id": "27",
    "status": 0,
    "tips_num": 0,
    "kuangim_msgid": 1497940670813329,
    "type": "server",
    "send_id": "1497940670_506fel3fq",
    "send_kuangim_msgid": 1497940670505929,
    "count_down": 0,
    "hint_id": "BDB2B8F6D0A6BBB0",
    "hint_mult": {
        "data": [
            {
                "id": "0",
                "value": "再来一个"
            },
            {
                "id": "1",
                "value": "图片笑话"
            },
            {
                "id": "2",
                "value": "动图笑话"
            },
            {
                "id": "3",
                "value": "文字笑话"
            }
        ],
        "placeholder": "",
        "type": "multi_column",
        "hint_float": 1
    },
    "nlu": {
        "domain": "unknown",
        "intent": "unknown",
        "slots": []
    },
    "ctime": 1497940670,
    "id": "1497940670_8132pceds"
}
```

### result_list分三种情况，文字笑话、图片笑话、动图笑话

* 文字笑话

```
{
    "result_list": [
        {
            "card_id": "",
            "result_content": {
                "answer": "本人是男的。有一天和我朋友去银行取钱，怕贴条，叫朋友看着车。一会我朋友进来银行了。急着说 大哥快炮，警，察来了。突然银行里安安静静的。"
            },
            "result_type": "txt",
            "source_type": "joke",
            "voice": "本人是男的。有一天和我朋友去银行取钱，怕贴条，叫朋友看着车。一会我朋友进来银行了。急着说 大哥快炮，警，察来了。突然银行里安安静静的。",
            "source_sub_type": "joke"
        }
    ]
}
```

* 图片笑话

```
{
    "result_list": [
        {
            "card_id": "",
            "result_content": {
                "img_height": 0,
                "img_width": 0,
                "imgs": [
                    "https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/xiaodu/pic/item/ca1349540923dd54c82b6f1ed609b3de9c824868.jpg"
                ],
                "link": "",
                "source": null
            },
            "result_type": "img_comm",
            "source_type": "joke",
            "source_sub_type": "joke",
            "voice": ""
        },
        {
            "card_id": "",
            "result_content": {
                "answer": "下雪的真相"
            },
            "result_type": "txt",
            "source_type": "joke",
            "voice": "下雪的真相",
            "source_sub_type": "joke"
        }
    ]
}
```

* 动图笑话

```
{
    "result_list": [
        {
            "card_id": "",
            "result_content": {
                "img": "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/xiaodu/pic/item/7e3e6709c93d70cfdbbf47ddffdcd100bba12b9d.jpg",
                "txt": "这个广告我给满分"
            },
            "result_type": "gif_face",
            "source_type": "joke",
            "source_sub_type": "joke",
            "voice": ""
        },
        {
            "card_id": "",
            "result_content": {
                "answer": "这个广告我给满分"
            },
            "result_type": "txt",
            "source_type": "joke",
            "voice": "这个广告我给满分",
            "source_sub_type": "joke"
        }
    ]
}
```

result_list每个元素代表一个资源，一个资源的类型由result_type决定，其中图片为txt，静态图片为img_comm，git图片为git_face；

当query是一个明确的"文字笑话"、"图片笑话"、"动图笑话"时，result_list会固定是上面所列的某个类型的返回结果，如果query是"讲个笑话"泛意图query，result_list将随机出一个类型的结果。


## nlu说明

intent|slot_name|slot_value|备注
----|----|--------|----
audio.joke.play|||播放笑话
 |textual|文字笑话|表达文字笑话意图（针对图文笑话）
 |image|图片笑话|表达图片笑话意图（针对图文笑话）
 |dynamic_image|动图笑话|表达动图笑话意图（针对图文笑话）
audio.joke.next|||下一个
audio.joke.previous|||上一个
audio.joke.continue|||继续
audio.joke.stop|||停止


## directives 部分的说明

参见相关directives的文档
* [AudioPlayer](../directives/AudioPlayer.md) 播放相关指令
* [Speaker](../directives/Speaker.md) 扬声器控制、设置相关指令
* [SpeechSynthesizer](../directives/SpeechSynthesizer.md) 语音播报（TTS）相关指令
