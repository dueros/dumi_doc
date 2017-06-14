# 笑话Bot

## 有声笑话完整输出
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

## 图文笑话完整输出

```
{
    "status": 0,
    "msg": "ok",
    "data": {
        "page_num": 1,
        "page_cnt": 1,
        "result_num": 1,
        "result_list": [
            {
                "content": "{\"hint_id\":\"5940F5AE8A11F\",\"hint\":[\"再来一个\",\"文字笑话\",\"图片笑话\",\"动图笑话\"],\"hint_mlt\":{\"placeholder\":\"\",\"type\":\"multi_column\",\"data\":[{\"id\":0,\"value\":\"再来一个\"},{\"id\":1,\"value\":\"文字笑话\"},{\"id\":2,\"value\":\"图片笑话\"},{\"id\":3,\"value\":\"动图笑话\"}]},\"result_list\":[{\"result_content\":{\"answer\":\"妈妈劝我不要再抽烟喝酒了，不然体检的时候一定会查出病来的。听从了妈妈的话，我就再也没去体检过。\"},\"source_type\":\"joke\",\"voice\":\"妈妈劝我不要再抽烟喝酒了，不然体检的时候一定会查出病来的。听从了妈妈的话，我就再也没去体检过。\",\"result_type\":\"txt\",\"card_id\":\"\"}],\"confidence\":300,\"bot_session\":{\"key\":\"zhoubingxuan_debug_monitor\",\"bot_session\":{\"text_play_list\":[{\"id\":\"40\",\"type\":\"1\",\"content\":\"妈妈劝我不要再抽烟喝酒了，不然体检的时候一定会查出病来的。听从了妈妈的话，我就再也没去体检过。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"24\",\"type\":\"1\",\"content\":\"一司机酒后开车被警察逮个正着，遂解释喝了点啤酒。警察问：“啤酒不是酒吗？”司机反问道：“酱油也是油吗？”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"2\",\"type\":\"1\",\"content\":\"护士看到病人在病房喝酒，就走过去小声叮嘱说：“小心肝！ ”病人微笑道：“小宝贝。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"9\",\"type\":\"1\",\"content\":\"儿子：爸爸，结婚大概需要花多少钱呢？爸爸：很难计算呢！因为爸爸直到现在还在付帐哪！\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"11\",\"type\":\"1\",\"content\":\"──我可以算是从基层干起，一直爬到顶峰的青年。──真了不起，你是干什么的呢？??──以前擦皮鞋，现在是理发师。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"39\",\"type\":\"1\",\"content\":\"我最讨厌姓马的人了，比如马化疼、马云，都坑老子的钱，当然最讨厌的还是马赛克。。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"20\",\"type\":\"1\",\"content\":\"“男人和女人看橱窗的方式，有什么不同？”“很简单，女人看物品，男人看物价！ ”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"50\",\"type\":\"1\",\"content\":\"有次上课时，安静的教室里，某同学突然开始打嗝，大家哗然。老师笑着说：“我讲的内容比较难理解，大家回去要好好消化消化。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"46\",\"type\":\"1\",\"content\":\"最好的朋友：睡在我上铺的兄弟。最爱的女孩：同桌的你。最难忘的事：睡在我上铺的兄弟带走了同桌的你。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"12\",\"type\":\"1\",\"content\":\"一个认为自己艳压群芳的女生出了车祸，躺在医院里对着镜子感叹“自古红颜多薄命”。临床对曰：“放心，你一定会长命百岁的。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"25\",\"type\":\"1\",\"content\":\"法官对一个惯犯说：“想想看，除了坏事外，你一生中有没有做过一件好事？”“有！我使阁下和警察们不至于失业。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"35\",\"type\":\"1\",\"content\":\"老板对自己的女秘书说：“这是一份非常重要的文件，你最好把它和你的指甲油放在一起，免得我们需要用时找不到。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"45\",\"type\":\"1\",\"content\":\"四级考前一个月，同学的qq签名是“事在人为”；考前一周，该同学的签名改为“一切随缘”；考试结束后，签名遂改为“重在参与”。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"28\",\"type\":\"1\",\"content\":\"一个德国抢劫犯被带到法庭，法官问他是否会讲英语，年轻人答道：“会一点儿。”“你会讲什么？”“把所有的钱都给我，”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"19\",\"type\":\"1\",\"content\":\"法官：行窃时，你怎么不为你的妻子和女儿着想呢：被告：想了，可惜店里只有男人们的衣服！\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"26\",\"type\":\"1\",\"content\":\"法官：“你为何要偷这辆车？”被告：“因为它放在坟墓旁边，我想主人肯定是死了。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"6\",\"type\":\"1\",\"content\":\"爸爸教儿子辨认方向，儿子称已经学会了。于是爸爸问儿子：“你看今天刮的是什么风？”儿子看了一眼红旗，很自信的说：“左风。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"38\",\"type\":\"1\",\"content\":\"某天，一胖妞到一“智能机”称体重，当她站上机子上时，突然“智能机”说：“对不起，请一个一个上。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"23\",\"type\":\"1\",\"content\":\"有老师闯红灯，交警拦住，老师说：拜托，我教课要迟到了。交警：你是老师？谢天谢地，我等20年了，把不再闯红灯写100遍。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"44\",\"type\":\"1\",\"content\":\"妻子说：“帮我把房子打扫下吧！ ”丈夫说：“亲爱的，我不舒服。你瞧：我的手在打颤……”妻子说：“那先把地毯抖抖吧！\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"47\",\"type\":\"1\",\"content\":\"上学的时候，有一个老师在办公室门牌上写了自己的名字，我们没人敢进去，他叫“施法中”。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"4\",\"type\":\"1\",\"content\":\"在外上学的儿子给老爸打电话。??“爸爸，我不够路费了。”“那就回家来取吧！ ”电话马上挂断。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"10\",\"type\":\"1\",\"content\":\"阿冬：我太太最近为了减肥，天天都在骑马！??阿平：结果如何？??阿冬：马足足瘦了二十公斤！\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"27\",\"type\":\"1\",\"content\":\"“真傻！您的手表被抢，为什么不大声呼救呢？”“如果我张开嘴呼救，他们就会发现我还有四颗金牙，那就更糟了。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"49\",\"type\":\"1\",\"content\":\"方向盘把稳点，别让它左晃右晃，我们这车喝的是汽油，不是酒。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"33\",\"type\":\"1\",\"content\":\"两个酒鬼在开车回家的途中……。??甲∶注意，前面有个弯道…。??乙∶啊！不是你在开车吗？！\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"22\",\"type\":\"1\",\"content\":\"深夜，睡着了的孩子又哭了起来。父亲决定唱一段催眠曲。刚开了个头，隔壁人家就抗议了：“还是让孩子哭吧。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"21\",\"type\":\"1\",\"content\":\"主妇问两个贪懒的仆人：“张妈，你在做什么？”张妈：“我不做什么事。”主妇：“李妈，你呢？”李妈：“我在帮张妈的忙。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"13\",\"type\":\"1\",\"content\":\"一位朋友对手表商说:??“你抛出了那么多廉价的手表,靠什么赚取利润呢?”手表商:“靠修理这些手表.”\\\"\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"43\",\"type\":\"1\",\"content\":\"松下为什么没索尼强？ 答案：panasonic （怕了索尼哥）\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"30\",\"type\":\"1\",\"content\":\"法官：“这么说，你真是单独流窜行骗的？”骗子：“是的，我总是独自行动。假如我有同伙的话，那我会担心他是否诚实！ ”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"14\",\"type\":\"1\",\"content\":\"甲：“何谓白领阶级？”??乙：“光拿薪水不做事的，就是白领！ ”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"42\",\"type\":\"1\",\"content\":\"终于知道坐过山车真的很恐怖，坐的时候冒着枪林弹雨似的唾沫星子，下来发现自己嘴里多了块口香糖，这特么不是我的益达！！\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"16\",\"type\":\"1\",\"content\":\"约翰看了游泳池的招聘救生员的广告后前去报名，游泳池的老板问约翰有何特长，约翰回答说：“游泳池深2．1米，我身高2．17米。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"8\",\"type\":\"1\",\"content\":\"晚餐时，小女儿好奇的问：“妈妈，你怎么会和爸爸结婚呢？”母亲看看父亲说：“看吧！连孩子都觉得奇怪……”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"7\",\"type\":\"1\",\"content\":\"妻子：“每次我唱歌的时候，你为什么总要到阳台上去？”??丈夫：“我是想让大家都知道，不是我在打你。”??\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"17\",\"type\":\"1\",\"content\":\"食客：“你们店的食物糟透了，我要见你们的经理。”侍应生：“对不起，先生，我们的经理到外面吃东西去了。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"5\",\"type\":\"1\",\"content\":\"子：我听说非洲有些国家的男人如今还要到结婚以后才认识他太太，是真的吗？??父：不单是非洲，是全世界。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"37\",\"type\":\"1\",\"content\":\"顾客：“这种棉衣确实很暖和，请问这棉衣防雨吗？”商人：“当然能防雨，你见过地里有棉花打伞的吗？”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"41\",\"type\":\"1\",\"content\":\"今天数学考了零分，我仰天痛哭，祈求上天能让我重来一次。 果然，第二天物理也考了零分……\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"34\",\"type\":\"1\",\"content\":\"法官对被告说：“你怎么能证明你是无罪的呢？”“当然，这得让我好好想一想。”“好吧，给你5年的时间，足够了吧！ ”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"3\",\"type\":\"1\",\"content\":\"子：“如果我考全班第一名，你会怎样? 父：“那我真要高兴死了！ ” 子：“爸爸，不要担心，我不会让你死的！ ”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"48\",\"type\":\"1\",\"content\":\"“危楼高百尺，手可摘星辰”用的是什么修辞手法？答：吸星大法。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"36\",\"type\":\"1\",\"content\":\"火车上，孕妇看见一男子身旁有一空位，便对男子说：“你不知道我怀孕了吗？”只见男子很不理会且紧张地说：“孩子不是我的！ ”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"29\",\"type\":\"1\",\"content\":\"――我的委托人有双重人格，所以，法官先生，我请求您对他要宽容。――很好，我将考虑到这一点。我想给他的每一种人格判5年。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"18\",\"type\":\"1\",\"content\":\"一只鸽子把屎拉到爸爸脸上，爸爸：快拿张纸来！儿子：它飞那么高，我怎么帮它擦屁股啊！\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"32\",\"type\":\"1\",\"content\":\"汉斯问他的朋友：“离婚困难吗？”??朋友答：“??一点不难，法官就是我妻子的第一个丈夫。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"1\",\"type\":\"1\",\"content\":\"只有那些懒惰者才会为每天早上起不来而抱怨、痛苦，真正有行动力的人会马上打电话请假。\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"31\",\"type\":\"1\",\"content\":\"建筑师为大富商修造一座陵墓。??大富商问忙了一年的建筑师：“也许还缺什么吧？”??“现在只缺你了。”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"},{\"id\":\"15\",\"type\":\"1\",\"content\":\"顾客：你搞入户推销的成功经验是什么?”推销员：每个家庭主妇开门后，我的第一句话是：“小姑娘，你妈妈在家吗?”\",\"image\":\"\",\"create_time\":\"2017-04-20 19:56:59\"}],\"text_play_id\":0}},\"nlu\":{\"domain\":\"audio.joke\",\"intent\":\"audio.joke.play\"},\"type\":\"user\",\"user_id\":\"zhoubingxuan_debug_monitor\",\"bot_intent\":{\"query\":\"讲个笑话\",\"query_score\":100}}",
                "confidence": 300,
                "form_confidence": 300,
                "source_type": "ai.dueros.bot.audio_joke",
                "source_sub_type": "ai.dueros.bot.audio_joke",
                "stategy_middle_data": {
                    "raw_answer": [
                        {
                            "url": "",
                            "title": "",
                            "subtitle": "",
                            "answer": "妈妈劝我不要再抽烟喝酒了，不然体检的时候一定会查出病来的。听从了妈妈的话，我就再也没去体检过。"
                        }
                    ],
                    "bot_intent": {
                        "query": "讲个笑话",
                        "query_score": 100
                    }
                }
            }
        ],
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
                                        "key": "dynamic_image",
                                        "type": "text",
                                        "value": [
                                            {
                                                "value": "",
                                                "name": "dynamic_image",
                                                "source": "query",
                                                "type": "string",
                                                "tag_op": 1,
                                                "session_num": 0
                                            }
                                        ],
                                        "score": 0
                                    },
                                    {
                                        "key": "image",
                                        "type": "text",
                                        "value": [
                                            {
                                                "value": "",
                                                "name": "image",
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
                                    },
                                    {
                                        "key": "textual",
                                        "type": "text",
                                        "value": [
                                            {
                                                "value": "",
                                                "name": "textual",
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
        "server_query_intent": "\"\"",
        "directives": [],
        "nlu": {
            "domain": "audio.joke",
            "intent": "audio.joke.play"
        },
        "speech": [],
        "prompt": [],
        "resource": [],
        "views": []
    },
    "keep_silence": null
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
