# 度秘开放平台-OpenApi使用说明

## 整体格式说明

### 架构描述

### 概念解释

概念名字     | 概念解释
------------ | -------------
bot | 字面理解就是机器人，是真正负责返回结果的度秘平台子服务
bot列表（服务列表） | 每个合作方可以选择自己想要使用的bot
nlu | Natural Language Understanding (自然语言理解)，可以理解为把用户的自然语言query转换为结构化数据的服务
cuid | 设备id，它与用户id是独立的概念
user_id | 用户id，它与设备id是独立的概念
appid | 每个合作方的id
appkey | 每个合作方的密钥
appqps | 合作方的每秒访问次数限制
appqps | 合作方的每天访问次数限制

### 正常返回的结果

```javascript
{
    "status":0,   //0 表示成功，其他值表示失败
    "msg":"ok",   //错误状态文本
    "se_query":"我要听周杰伦的歌",  //用户请求的query
    "logid":"xxxx1234354",    //日志查询用的logid
    "id":"id12334235",  //消息id
    "user_id":"",  //请求的用户id
    "cuid":"",   //请求的设备id
    "time":1482226019, //当前的服务端时间戳
    "result":{
        "bot_id":"duer_music",  //返回结果的bot的id
        "bot_meta":{  //下游bot元数据
            "description":"返回音乐类结果",  // 文字描述
            "version":"1.0.0",  //版本
            "type":"音乐"  //TODO，bot类型见pm给的分类
        },
        "views":[   //显示用的数据，一个结果里可包含多个卡片
            {
                "type":"list", //卡片类型，只有txt,list,image三种类型
                "list":[
                    {
                        "title": "东方破",
                        "image": "http://nodeapi.cloudfoundry.com/qrcode.jpg",
                        "url":  "http://nodeapi.cloudfoundry.com/"
                    },
                    {
                        "title": "双截棍",
                        "image": "http://nodeapi.cloudfoundry.com/qrcode.jpg",
                        "url":  "http://nodeapi.cloudfoundry.com/"
                    }
                ]
            }        
        ],
        "directives":[   //指令，用于控制给客户端、目标硬件下达命令，可选字段，一个结果可包含多条啊指令
            {
                "header": {  //指令的名字
                    "namespace": "AudioPlayer",
                    "name": "Play"
                },
                "payload": {   //指令的参数
                    "play_behavior": "REPLACE_ALL",
                    "audio_item": {
                        "audio_item_id": "156",
                        "stream": {
                            "url": "http://yinyueshiting.baidu.com/data2/music/124088643/124088643.mp3?xcode=57462f29cfc176f86a37d80a2c02fc5b",
                            "stream_format": "AUDIO_MP3",
                            "offset_ms": 0,
                            "token": "156",
                            "progress_report_interval_ms": 10000  
                        }
                    }
                }
            }
        ],

        "nlu": {   //query解析的结果
            "domain": "Audio.Music",  
            "intent": "Audio.Music.Play",  //domain + intent确定一种解析结果的类型
            "slots": {   //从query中提取出来的槽位信息
                "singer": "周杰伦"
            }
        },
        "resource":{ //数据资源，可选字段
            "type":"music",//资源类型，目前已经有music/news/weather等资源类型
            "data":{   //实际资源数据，包含的字段由资源类型决定
                "duration":256,
                "name":"千里之外",
                "alias":"千里外",
                "singer_name":"羽泉",
                "all_singer_name":"陈羽凡,胡海泉",
                "genre":"复古",
                "tag":"港台,励志,流行,合唱,摇滚",
                "language":"华语",
                "original_singer":"周杰伦,费玉清",
                "composer":"周杰伦",
                "lyricist":"lyricist",
                "lyric":"屋檐如悬崖 风铃如沧海 我等燕归来 时间被安排 演一场意外 你悄然走开 故事在城外 浓雾散不开 看不清对白 你听不出来 风声不存在 是我在感慨 梦醒来 是谁在窗台 把结局打开 那薄如蝉翼的未来 经不起谁来拆 我送你离开 千里之外 你无声黑白 沉默年代 或许不该 太遥远的相爱 我送你离开 天涯之外 你是否还在",
                "url":"http://music.baidu.com/song/s/04071175dd9085630382f",
                "same_name_url":"http://music.baidu.com/search?key=%E4%BD%A0%E5%BF%AB%E5%9B%9E%E6%9D%A5",
                "streaming_vedio_url":"http://neisou.baidu.com/images/headportrait/zhangwenbo/0_112.jpg",
                "head_image_url":"http://neisou.baidu.com/images/headportrait/zhangwenbo/0_112.jpg",
                "album_name":"十一月的肖邦",
                "album_url":"http://music.baidu.com/album/234211111",
                "score":63,
                "publish_time":"2011-09-01",
                "publish_company":"飞碟",
                "is_need_pay_listen":0,
                "from_site":1,
                "hot":12345
            }
        },
        "speech": {  //TTS播报用的数据
            "type": "Text",  //有SSML和Text两种类型
            "content": "为您播放周杰伦的歌曲"
        }
    }
}

```

### 常见的错误返回

返回值     | 含义
---------- | -------------
status:1,msg: appid unvalid | appid无效
status:2,msg: appkey unvalid | appkey无效
status:3,msg: appqps warning | appqps前一天峰值警告
status:4,msg: appqps refuse | appqps拒绝
status:5,msg: appqpd warning | appqpd前一天峰值警告
status:6,msg: appqpd refuse | appqpd拒绝
status:7,msg: sericelist empty | 请求的服务列表未配置


## 数据格式分块详细说明

### views
返回展示卡片数据，必选字段。一次可返回一个或多个卡片。
一共有三种类型：

#### 文本卡片
只能返回一段文本
```javascript
{
    "type":"txt",
    "content":"为你推荐如下热门资讯",
    "url":"http://www.baidu.com" //可选字段
}
```

#### 图文卡片
```javascript
{
    "type":"list",
    "list":[
        {
            "title": "你来我家接我吧",
            "summary": "这是女神与高富帅之间的对话", ///可选字段
            "image": "http://nodeapi.cloudfoundry.com/qrcode.jpg",//可选字段
            "url":  "http://nodeapi.cloudfoundry.com/"
        },
        {
            "title": "你来我家接我吧",
            "summary": "这是女神与高富帅之间的对话",   //可选字段
            "image": "http://nodeapi.cloudfoundry.com/qrcode.jpg",//可选字段
            "url":  "http://nodeapi.cloudfoundry.com/"
        }
    ]
}
```

#### 图片卡片
可一次返回多张图片，可选缩略图
```javascript
{
    "type": "image",
    "list": [
        {
            "src":"http://c.hiphotos.baidu.com/image/pic/item/7af40ad162d9f2d38d7056c8acec8a136327ccb0.jpg",
            "thumb":"http://c.hiphotos.baidu.com/image/pic/item/7af40ad162d9f2d38d7056c8acec8a136327ccb0.jpg" //可选字段 缩略图
        },
        {
            "src":"http://b.hiphotos.baidu.com/image/pic/item/b21bb051f8198618df86c5424eed2e738ad4e637.jpg",
            "thumb":"http://c.hiphotos.baidu.com/image/pic/item/7af40ad162d9f2d38d7056c8acec8a136327ccb0.jpg" //可选字段 缩略图
        },
        {
            "src":"http://c.hiphotos.baidu.com/image/pic/item/83025aafa40f4bfbc9c817b9074f78f0f63618c6.jpg",
            "thumb":"http://c.hiphotos.baidu.com/image/pic/item/7af40ad162d9f2d38d7056c8acec8a136327ccb0.jpg" //可选字段 缩略图
        }
    ]
}

```

### resource
根据用户的意图和度秘服务的能力，在一些请求里会返回复杂的结构化数据，用于客户端的特殊逻辑和展示，现有的resource类型有以下几类，还在不断增加中

#### 天气
```javascript
"resource":{
    "type":"weather",
    "data":{
        "city": "北京",
        "current_temp": "-1℃", //实时温度，只有query查询今天的天气的时候才会有值，如“今天天气怎么样”
        "pm25": "426",  //实时pm2.5，只有query查询今天的天气的时候才会有值，如“今天天气怎么样”
        "temp": "-3℃~5℃", //当天的温度
        "time": "周二 12月20日", //查询目标时间的文字描述
        "weather": "雾",//天气的文字描述
        "weather_all": "雾，-3℃~5℃，微风", //完整的天气描述
        "wind": "微风",
        "weather_info": [//未来5天的天气数据
            {
                "current_temp": "-1℃",
                "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/bigicon/4.png",
                "pm25": "426",
                "pm_level": "严重污染",
                "temp": "-3℃~5℃",
                "time": "周二 12月20日",
                "weather": "雾",
                "wind": "微风"
            },
            {
                "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/icon/7.png",
                "temp": "-3℃~3℃",
                "time": "周三 12月21日",
                "weather": "霾",
                "wind": "微风"
            },
            {
                "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/icon/1.png",
                "temp": "-5℃~6℃",
                "time": "周四 12月22日",
                "weather": "晴",
                "wind": "北风3-4级"
            },
            {
                "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/icon/1.png",
                "temp": "-6℃~3℃",
                "time": "周五 12月23日",
                "weather": "晴转多云",
                "wind": "北风微风"
            },
            {
                "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/icon/5.png",
                "temp": "-5℃~3℃",
                "time": "周六 12月24日",
                "weather": "多云转霾",
                "wind": "北风微风"
            }
        ]
    }
},
```

####新闻
一次查询会返回多条新闻，现在是10条，新闻内容（content字段）如果太长会被截断
```javascript
"resource":{
    "type":"news",
    "data":{
        "list":[
            {
                "id":"xxx1234bbb",
                "title":"河北首次启动区域红色应急响应 雾霾笼罩",
                "summary":"河北首次启动区域红色应急响应 雾霾笼罩",
                "content":"霾是什么？雾是什么？都是怎么形成的？它们的关系是什么？气温丶湿度丶风力丶风向丶地形丶地表丶温湿度丶灰尘丶烟尘丶粉尘丶扬尘那个危害更大，这些都应当弄清了，再谈霾和雾，不要把霾字前加雾字。这本来就是两种截然不同的两种物质。只是它们互相影响而已。把它们混为一谈。就是错的引导。霾在四五年前就已经开始了。只是越来越严重而已。它是随着汽车进入家庭而伴生的。", //新闻内容
                "url":"http://headline.baidu.com/doc/detail?app_from=dumi_news&url_key=http%3A//news.163.com/photoview/00AP0001/2216510.html",
                "image" : "http://ztd00.photos.bdimg.com/ztd/whfpf%3D160%2C120%2C50%3Bq%3D70/sign=1a96a9f0f41f4134e062563e4322a4fc/d000baa1cd11728bfb98b831c1fcc3cec3fd2c6f.jpg",
                "thumb":"http://ztd00.photos.bdimg.com/ztd/whfpf%3D160%2C120%2C50%3Bq%3D70/sign=1a96a9f0f41f4134e062563e4322a4fc/d000baa1cd11728bfb98b831c1fcc3cec3fd2c6f.jpg",
                "pubtime":"2016-12-20 20:01:01"
            },
            {
                "id":"xxx1234bbb",
                "title":"河北首次启动区域红色应急响应 雾霾笼罩",
                "summary":"河北首次启动区域红色应急响应 雾霾笼罩",
                "content":"霾是什么？雾是什么？都是怎么形成的？它们的关系是什么？气温丶湿度丶风力丶风向丶地形丶地表丶温湿度丶灰尘丶烟尘丶粉尘丶扬尘那个危害更大，这些都应当弄清了，再谈霾和雾，不要把霾字前加雾字。这本来就是两种截然不同的两种物质。只是它们互相影响而已。把它们混为一谈。就是错的引导。霾在四五年前就已经开始了。只是越来越严重而已。它是随着汽车进入家庭而伴生的。",
                "url":"http://headline.baidu.com/doc/detail?app_from=dumi_news&url_key=http%3A//news.163.com/photoview/00AP0001/2216510.html",
                "image":"http://ztd00.photos.bdimg.com/ztd/whfpf%3D160%2C120%2C50%3Bq%3D70/sign=1a96a9f0f41f4134e062563e4322a4fc/d000baa1cd11728bfb98b831c1fcc3cec3fd2c6f.jpg",
                "thumb":"http://ztd00.photos.bdimg.com/ztd/whfpf%3D160%2C120%2C50%3Bq%3D70/sign=1a96a9f0f41f4134e062563e4322a4fc/d000baa1cd11728bfb98b831c1fcc3cec3fd2c6f.jpg",
                "pubtime":"2016-12-20 20:01:01"
            }
        ]
    }
},
```

####音乐
```javascript
"resource":{
    "type":"music",
    "data":{
        "duration":256, //歌曲时长（秒）
        "name":"千里之外", //歌曲名
        "alias":"千里外", //别名
        "singer_name":"羽泉",
        "all_singer_name":"陈羽凡,胡海泉",
        "genre":"复古", //类型
        "tag":"港台,励志,流行,合唱,摇滚",
        "language":"华语", //语言分类
        "original_singer":"周杰伦,费玉清",//原唱
        "composer":"周杰伦", //作曲
        "lyricist":"lyricist",  //作词
        "lyric":"屋檐如悬崖 风铃如沧海 我等燕归来 时间被安排 演一场意外 你悄然走开 故事在城外 浓雾散不开 看不清对白 你听不出来 风声不存在 是我在感慨 梦醒来 是谁在窗台 把结局打开 那薄如蝉翼的未来 经不起谁来拆 我送你离开 千里之外 你无声黑白 沉默年代 或许不该 太遥远的相爱 我送你离开 天涯之外 你是否还在",  //歌词，纯文本
        "url":"http://music.baidu.com/song/s/04071175dd9085630382f", //歌曲地址
        "same_name_url":"http://music.baidu.com/search?key=%E4%BD%A0%E5%BF%AB%E5%9B%9E%E6%9D%A5", // 同名其他歌曲页url
        "streaming_vedio_url":"http://neisou.baidu.com/images/headportrait/zhangwenbo/0_112.jpg",
        "head_image_url":"http://neisou.baidu.com/images/headportrait/zhangwenbo/0_112.jpg", 
        "album_name":"十一月的肖邦", //专辑名称
        "album_url":"http://music.baidu.com/album/234211111",  //专辑地址
        "score":63,  //歌曲质量得分
        "publish_time":"2011-09-01", //发布日期
        "publish_company":"飞碟",  //唱片公司
        "is_need_pay_listen":0, //是否付费收听，0表示否，1表示是
        "from_site":1, //来源站点，1:百度,2:QQ,3:网易云,4:虾米,5:一听,6:酷我
        "hot":12345   //用整数表示的热度
    }
}
```

### speech
目前仅返回Text类型，SSML类型在开发中，[SSML的说明](https://www.w3.org/TR/speech-synthesis/)
```javascript
"speech": {
    "type": "Text",  
    "content": "为您播放周杰伦的歌曲"
}
```

### directive
//TODO 请世权写一下


### hint
用户接下去可能会输入的query，可以用来给用户提示，辅助用户输入
比如下面的例子是“讲个笑话”这个query返回的hint
```javascript
"hint":["再来一个", "文字笑话", "图片笑话"],
```
