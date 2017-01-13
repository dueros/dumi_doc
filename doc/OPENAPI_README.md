# 度秘开放平台-OpenApi使用说明

Table of Contents
=================

   * [度秘开放平台-OpenApi使用说明](#度秘开放平台-openapi使用说明)
      * [客户端sdk下载](#客户端sdk下载)
      * [整体格式说明](#整体格式说明)
         * [架构描述](#架构描述)
         * [概念解释](#概念解释)
         * [请求字段（使用sdk的用户，无需关注此节）](#请求字段使用sdk的用户无需关注此节)
         * [正常返回的结果](#正常返回的结果)
         * [常见的错误返回](#常见的错误返回)
      * [数据格式分块详细说明](#数据格式分块详细说明)
         * [bot_id、bot_meta](#bot_idbot_meta)
         * [views](#views)
            * [文本卡片](#文本卡片)
            * [图文卡片](#图文卡片)
            * [图片卡片](#图片卡片)
         * [resource](#resource)
            * [天气](#天气)
            * [新闻](#新闻)
            * [音乐](#音乐)
         * [speech](#speech)
         * [directive](#directive)
         * [hint](#hint)
         * [nlu](#nlu)
            * [包含query解析结果的结构化数据](#包含query解析结果的结构化数据)
            * [以下是跑出来的一批nlu数据的例子](#以下是跑出来的一批nlu数据的例子)


## 客户端sdk下载
内有demo工程和可测试的apk，外网用户请下载连线上环境的版本
   * [连线上环境](sdk/sdk_v2_online.zip)
   * [连线下环境](sdk/sdk_v2_offline.zip)

## 整体格式说明


### 架构描述
![dumi_system](img/system.png)

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


### 请求字段（使用sdk的用户，无需关注此节）

给服务端发请求内容。使用sdk的用户，无需关注此节，因为sdk的请求不用手动拼

```javascript
{
    //==========以下是开放sdk会有的字段========================
    "appid": "dm5C60F68C963F4A66", 
    "appkey": "675C78EA90BF418D875317CEA172A7AE", 
    "sdk_ui": "no", 
    "sdk_init": "no", 
    "appname": "com.baidu.duersdk.xiaomi",
    "from_client": "sdk", 
    //========================================================
    //string 用户id, 如有Cookie则不需要此字段 
    "request_uid": "string",
    //string 输入来源,0-语音输入，1-键盘输入，2-编辑query，3-引导query，4-重新发送，7-用户上传图片，8-点击导航图标输入，9-applink方式传参数发送，10-自动回复，11-未知，13-手百插件新用户引导浮层点击，14-feed流拉取
    "query_type": "string",
    //默认为空,类型string， 多个以逗号分隔， 为空可以不填该字段
    "hint_id": "用户选中hint的id" 
    //string 机器id
    "CUID": "string",
    //double 经度
    "longitude": double,
    //double 纬度
    "latitude": double,
    //可选，如果经纬度是来自于缓存，增加location_type:cache，add by 王芃、吴芮生2016-08-11
    "location_type": "wgs84",
    //当前定位数据坐标系统，取值为：”bd09ll”（百度球面坐标）或”wgs84”（GPS球面坐标）或”bd09mc”（百度墨卡托坐标）。默认是wgs84
    "location_system"："wgs84"
    //如果用户是语音输入的，存语音输入的id 
    "speech_id":"xxxx",
    //string 请求类型，-1-手百插件注册(query为空), 0-输入框输入，1-鼠标点击输入，2-查看聊天历史，3-写入聊天历史，4-注册用户信息，5-查看用户信息，6-查看熊成长信息，7-更改熊身上装备，8-检查是否可以修改昵称, 9-app从后台恢复
    "request_type": "string",
    //string 请求来源,0-和熊对话,1-框中输入，2-主动触发熊，3-首页, 4-feed流,，5-客户端选择操作类型请求
    "request_from": "string",
    //string 服务标识
    "sample_name": "bear_brain_wireless",
    //string 客户端生成的消息id
    "client_msg_id": "string",
    //int 调试标记，1-测试消息 0或字段不存在表示线上消息
    "debug": int,
    //int 消息模式， 1-3D演示模式 0或字段不存在为默认状态
    "mode": int, 
    //操作系统， 可选，android/ios
    "operation_system": "ios", 
    "operation_system_version":"7.0.0", //操作系统版本号（目前只有对外sdk有该字段），ios取[[[UIDevice currentDevice] systemVersion] floatValue]，安卓取android.os.Build.VERSION.RELEASE
    "device_brand":"apple", //设备品牌 （目前只有对外sdk有该字段），ios写死"apple"，安卓取android.os.Build.BRAND
    "device_model":"iphone 6s", //设备具体型号 （目前只有对外sdk有该字段）ios取 设备型号字符串 sysctlbyname("hw.machine", name, &size, NULL, 0);，安卓取android.os.Build.MODEL
    //app_ver app版本号
    "app_ver": "1.0.10", 
    "searchbox_ver":"8.0",//宿主版本号，只存在于插件形式，比如手百、地图、浏览器
    //string 可选，默认值是"txt"，可用的值现在有txt / image，消息内容的类型，会决定服务端如何解析request_query
    "content_type": "image",
    //int 可选，content_type=='image'的时候，表示图片的高度
    "image_height": int,
    //int 可选，content_type=='image'的时候，表示图片的宽度
    "image_width": int,
    //string 请求query
    "request_query": "query",
    "ua":""//标识客户端、渠道，
    //durobot_automation 直接调度给UI
    //durobot_kfc 调度给KFC特定的客服
}
```

### 正常返回的结果
以下是一次典型请求中，sdk（客户端）收到的完整json数据

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
            "domain": "music",  
            "intent": "music",  //domain + intent确定一种解析结果的类型
            "slots": {   //从query中提取出来的槽位信息
                "action_type":"1",
                "singer": "周杰伦"
            }
        },
        "resource":{ //数据资源，可选字段
            "type":"music_ref",//资源类型，目前已经有music/news/weather等资源类型
            "data":{
                "api": {
                    "method": "GET",
                    "url": "http: //s.xiaodu.baidu.com/v20161223/resource/music?user_id=888"
                }
                //以上地址，可以增加page参数来翻页，如 http://s.xiaodu.baidu.com/v20161223/resource/music?user_id=888&page=2
                //抓取以上api地址后会返回如下格式
/*
{
  "status": 0,
  "code": null,
  "data": {
    "page": 1,
    "total_page": 5,
    "list": [
      {
        "duration": "238",
        "name": "恋红尘",
        "alias": "",
        "singer_name": "祁隆,彭丽嘉",
        "all_singer_name": "",
        "genre": "流行",
        "tag": "好听,新歌,网络歌曲",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/271665582?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E6%81%8B%E7%BA%A2%E5%B0%98",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/a1d4eca5675d21e6e0b3dad002de5c1d/271665733/271665733.mp3?x
code=2e387ebc099d9e5aa0d51cfc739c1004",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/25b1faff5bf89f84b6491593e31381ed/271665166/271665166.jpg",
        "album_name": "恋红尘",
        "album_url": "",
        "score": "0",
        "publish_time": "2016-09-20",
        "publish_company": "华宇世博",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "237391"
      }...
    ]
  }
}
*/
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

### bot_id、bot_meta

bot 是真正负责返回结果的度秘平台子服务，每条结果中会带有真正服务的bot的id和meta信息
下面的表格是现有的bot及其说明

bot_id | 说明
------ | -------
phone | 电话服务
remind | 提醒服务
recommend_service_wireless source_sub_type: joke | 笑话
duer_weather | 天气服务
music | 音乐服务
restaurant_bot | 美食服务
life_common | 生活服务（地图导航）
sac | 火车航班,查限行
aries_general aries_guide aries_dqa kg_service | 通用信息(翻译)
sysprofile_service | 系统画像


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

#### 新闻

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

#### 音乐

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


### nlu

#### 包含query解析结果的结构化数据

描述|domain|intent|slots(可用的槽位)|example
----|------|------|-----------------|-------
火车票|22|22|end_point(终点站), start_point(起点站), search_type(如：高铁), start_time(时间)|给我买张到武汉的高铁票
天气|duer_weather|sys_weather|loc_city(城市), loc_county(国家), loc_province(省), time(时间)|北京明天天气如何
地址查询类需求|lbs|poi|poi(地址字符串)|射阳在哪儿
音乐类需求|music|music|action_type(0. 关闭 1. 打开 2. 播放 3. 暂停 4. 下一首 5. 上一首 6. 换一首 7. 重播), song(歌名), singer(歌手), music_language(语言), music_emotion(情感，如悲伤、欢快等), music_tag, music_type(嘻哈、摇滚、儿歌等)|
让度秘唱歌，类似调戏|music|music_sing|CommandAccepter, action_type(0. 关闭 1. 打开 2. 播放 3. 暂停 4. 下一首 5. 上一首 6. 换一首 7. 重播), song(歌名), singer(歌手)|
联系人查询需求|phone|contact|action_type(1：查看 0：新建 2：发送), pinyin_for_view(要查看的联系人的拼音), name_for_view(要查看的联系人的名字), pinyin_to_send(要发送的联系人的拼音), name_to_send(要发送的联系人的名字)|告诉我张凤仪的电话号码, 庞翔宇的电话号码发给张凤仪
打开网址|phone|open_website|action_type, name, website_url|携程火车票
发短信|phone|sms|content(短信内容), number(目标号码), name(目标姓名), pinyin(目标姓名拼音)|短信发给15140559455
提醒、闹钟|remind|remind|action, event_title, intent, remind_time, remind_type_message, remind_type_phone, remind_type_dumi, remind_type_clock, remind_time_type, remind_time_value, remind_time_data, status|设置提醒每天晚上9点半洗衣服。
美食、团购|restaurant_bot|find|catetag, fragment, location, sortby, cuisine, crowd, groupon|附近有什么好吃的饭馆

#### 以下是跑出来的一批nlu数据的例子

```javascript
["10月21号早上九点提醒我开会",{"domain":"remind","intent":"remind","slots":{"event_title":"开会","intent":"设置","remind_time":"{\"month\":\"10\",\"day\":\"21\",\"hour\":\"9\",\"apm\":\"am\"}","__intent__":"setup","__id__":"1483430617165_fu6tll","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1508547600","status":"create_confirm"}}]
["10月22号晚上11点提醒我爱康",{"domain":"remind","intent":"remind","slots":{"remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"cancel","da_system_not_understand":"2"}}]
["10月26号下午提醒我吃喜酒下午四点半",{"domain":"remind","intent":"remind","slots":{"event_title":"开会","intent":"设置","remind_time":"{\"minute\":\"+15\"}","__intent__":"setup","__id__":"1483430623828_cyi45b","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1483431524","status":"create_confirm","da_system_not_understand":"1"}}]
["10月4号中午十三点提醒我要回家",{"domain":"remind","intent":"remind","slots":{"remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"cancel","da_system_not_understand":"2"}}]
["13192285237",{"domain":"phone","intent":"telephone","slots":{"number":"13192285237"}}]
["G1112次火车票",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","start_time":"2017-01-03"}}]
["bigbang的歌",{"domain":"music","intent":"music","slots":{"music_theme":"的歌","singer":"bigbang"}}]
["一小时后提醒我放冬瓜",{"domain":"remind","intent":"remind","slots":{"event_title":"放冬瓜","intent":"设置","remind_time":"{\"hour\":\"+1\"}","__intent__":"setup","__id__":"1483430619122_fcj335","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1483434219","status":"create_confirm"}}]
["一张到太原的火车票",{"domain":"22","intent":"22","slots":{"end_point":"太原","start_time":"2017-01-03","sugs":"买火车票"}}]
["三亚市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"三亚市","loc_county":"三亚市","loc_province":"海南省","time":"2017-01-03,2017-01-03"}}]
["上海到北京动车多少钱",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["上海到北京卧铺多少钱",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["上海到北京的火车班次",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["上海到北京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["上海到北京硬座多少钱",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","end_point":"北京","start_point":"上海","start_time":"2017-01-03"}}]
["上海到北京软卧多少钱",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","end_point":"北京","start_point":"上海","start_time":"2017-01-03"}}]
["上海到深圳的动车票价",{"domain":"22","intent":"22","slots":{"end_point":"深圳","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["上海市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"上海市","loc_province":"上海市","time":"2017-01-03,2017-01-03"}}]
["下周一早上十一点提醒我联系王妙英",{"domain":"remind","intent":"remind","slots":{"event_title":"联系王妙英","intent":"设置","remind_time":"{\"month\":\"11\",\"day\":\"1\",\"hour\":\"11\",\"week\":\"1+1\",\"apm\":\"am\",\"repeat\":\"year\",\"special_calendar\":\"lunar\"}","__intent__":"setup","__id__":"1483430625801_fn21ww","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"create_confirm","remind_time_type":"year","remind_time_value":"1101","remind_time_data":"1513566000"}}]
["下周一的火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-09","sugs":"买火车票"}}]
["下周三出发去上海的火车票",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_time":"2017-01-11","sugs":"买火车票"}}]
["东莞市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"东莞市","loc_province":"广东省","time":"2017-01-03,2017-01-03"}}]
["中午十一点半提醒我拿菊花茶",{"domain":"remind","intent":"remind","slots":{"event_title":"带手机充电器","intent":"设置","remind_time":"{\"day\":\"next\",\"hour\":\"6\",\"apm\":\"am\"}","__intent__":"setup","__id__":"1483430612697_cl11ra","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1483480800","status":"create_confirm","da_system_not_understand":"1"}}]
["中山市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"中山市","loc_province":"广东省","time":"2017-01-03,2017-01-03"}}]
["丽江市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"丽江市","loc_county":"丽江市","loc_province":"云南省","time":"2017-01-03,2017-01-03"}}]
["乌鲁木齐市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"乌鲁木齐市","loc_county":"乌鲁木齐市","loc_province":"新疆维吾尔自治区","time":"2017-01-03,2017-01-03"}}]
["九江市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"九江市","loc_county":"九江市","loc_province":"江西省","time":"2017-01-03,2017-01-03"}}]
["也可以啊你给我唱首歌",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"你给我","action_type":"1"}}]
["买一张回家的火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["买一张火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["买个上海到重庆的火车票",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","end_point":"重庆","start_point":"上海","start_time":"2017-01-03"}}]
["买张火车票吧",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["买火车票",{"domain":"phone","intent":"open_website","slots":{"action_type":"1","name":"买火车票","website_url":"http://www.12306.cn/"}}]
["今天晚上十点半提醒我晾衣服",{"domain":"remind","intent":"remind","slots":{"remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"cancel","da_system_not_understand":"2"}}]
["今晚8点40分电话提醒我寄快递和拿快递",{"domain":"remind","intent":"remind","slots":{"event_title":"电话","intent":"设置","remind_time":"{\"day\":\"+0\",\"hour\":\"8\",\"minute\":\"40\",\"apm\":\"pm\"}","remind_type":"phone","__intent__":"setup","__id__":"1483430621189_gf9koq","remind_type_message":"否","remind_type_phone":"是","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1483447200","status":"create_confirm"}}]
["从上海到太原的火车票还有没有",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","end_point":"太原","start_point":"上海","start_time":"2017-01-03"}}]
["从成都到重庆的火车票",{"domain":"22","intent":"22","slots":{"end_point":"重庆","start_point":"成都","start_time":"2017-01-03","sugs":"买火车票"}}]
["从杭州到重庆的火车票",{"domain":"22","intent":"22","slots":{"end_point":"重庆","start_point":"杭州","start_time":"2017-01-03","sugs":"买火车票"}}]
["代买火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["以后每天中午一点提醒我上班儿",{"domain":"remind","intent":"remind","slots":{"remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"cancel","da_system_not_understand":"2"}}]
["会唱歌吗",{"domain":"music","intent":"music_sing","slots":{"MusicAskKey":"吗","action_type":"1"}}]
["你会唱儿歌吗",{"domain":"music","intent":"music_sing","slots":{"music_type":"儿歌","MusicAskKey":"吗","action_type":"1"}}]
["你会唱歌",{"domain":"music","intent":"music_sing","slots":{"action_type":"1"}}]
["你会唱歌吗",{"domain":"music","intent":"music_sing","slots":{"MusicAskKey":"吗","action_type":"1"}}]
["你会唱英文歌吗",{"domain":"music","intent":"music_sing","slots":{"music_theme":"歌","music_language":"英文","MusicAskKey":"吗","action_type":"1"}}]
["你唱一首歌歌歌我听吧",{"domain":"music","intent":"music","slots":{"music_theme":"歌","song":"唱一首歌","MusicAskKey":"吧","CommandAccepter":"你","action_type":"1"}}]
["你唱个歌吗",{"domain":"music","intent":"music_sing","slots":{"music_theme":"歌","MusicAskKey":"吗","action_type":"1"}}]
["你唱安眠曲给我听哦",{"domain":"music","intent":"music_sing","slots":{"song":"安眠曲","MusicSuffix":"给我听","action_type":"1"}}]
["你唱歌不好听",{"domain":"music","intent":"music_sing","slots":{"music_tag":"不好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌不好听呀",{"domain":"music","intent":"music_sing","slots":{"music_tag":"不好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌不跑调",{"domain":"music","intent":"music_sing","slots":{"song":"跑调","CommandAccepter":"你","action_type":"1"}}]
["你唱歌不跑调挺好听的",{"domain":"music","intent":"music_sing","slots":{"song":"跑调","music_tag":"好听的","CommandAccepter":"你","action_type":"1"}}]
["你唱歌吗",{"domain":"music","intent":"music_sing","slots":{"MusicAskKey":"吗","CommandAccepter":"你","action_type":"1"}}]
["你唱歌唱得好好听",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌好听还是难听呢",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌好好听",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌好好听。",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌好好听哦",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌带有回声",{"domain":"music","intent":"music_sing","slots":{"song":"回声","CommandAccepter":"你","action_type":"1"}}]
["你唱歌很好听呀",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌挺好听",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌挺好听的",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听的","CommandAccepter":"你","action_type":"1"}}]
["你唱歌挺好听的哈",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听的","CommandAccepter":"你","action_type":"1"}}]
["你唱歌特别好听",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌真好听",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌真好听，也好逗",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌真的很好听",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌真的挺好听耶",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听","CommandAccepter":"你","action_type":"1"}}]
["你唱歌累了去喝点水睡觉",{"domain":"music","intent":"music_sing","slots":{"song":"累","music_period":"睡觉","CommandAccepter":"你","action_type":"1"}}]
["你唱首歌吧",{"domain":"music","intent":"music_sing","slots":{"MusicAskKey":"吧","CommandAccepter":"你","action_type":"1"}}]
["你唱首歌把",{"domain":"music","intent":"music_sing","slots":{"CommandAccepter":"你","action_type":"1"}}]
["你唱首歌给我们听",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","MusicSuffix":"听","CommandAccepter":"你","action_type":"1"}}]
["你唱首歌给我听",{"domain":"music","intent":"music_sing","slots":{"MusicSuffix":"给我听","CommandAccepter":"你","action_type":"1"}}]
["你唱首黄土高坡的歌给我听",{"domain":"music","intent":"music_sing","slots":{"music_theme":"的歌","song":"黄土高坡","MusicSuffix":"给我听","CommandAccepter":"你","action_type":"1"}}]
["你来唱给我听",{"domain":"music","intent":"music_sing","slots":{"MusicSuffix":"给我听","CommandAccepter":"你","action_type":"1"}}]
["你给我唱一个",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"你给我","action_type":"1"}}]
["你给我唱一首歌，我就开心了",{"domain":"music","intent":"music","slots":{"music_theme":"一首歌","music_emotion":"开心","MusicWantKey":"你给我"}}]
["你给我唱个歌",{"domain":"music","intent":"music_sing","slots":{"music_theme":"歌","MusicWantKey":"你给我","action_type":"1"}}]
["你给我唱个歌儿吧",{"domain":"music","intent":"music_sing","slots":{"music_theme":"MusicRefer","MusicWantKey":"你给我","MusicAskKey":"吧","action_type":"1"}}]
["你给我唱歌",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"你给我","action_type":"1"}}]
["你给我唱首吧",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"你给我","MusicAskKey":"吧","action_type":"1"}}]
["你给我唱首歌吧",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"你给我","MusicAskKey":"吧","action_type":"1"}}]
["你给我唱首歌，我就原谅你",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["你能帮我买张火车票吗？",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["你能帮我打电话给电信吗",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["你能给我唱歌?吗？",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","MusicAskKey":"吗","action_type":"1"}}]
["你要不要我唱给你听呢",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["佛山市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"佛山市","loc_county":"佛山市","loc_province":"广东省","time":"2017-01-03,2017-01-03"}}]
["保定市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"保定市","loc_county":"保定市","loc_province":"河北省","time":"2017-01-03,2017-01-03"}}]
["兰州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"兰州市","loc_county":"兰州市","loc_province":"甘肃省","time":"2017-01-03,2017-01-03"}}]
["再给我唱一只歌",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["到廊坊的火车票要多少钱？",{"domain":"22","intent":"22","slots":{"end_point":"廊坊","start_time":"2017-01-03","sugs":"买火车票"}}]
["到杭州的火车票要多少钱？",{"domain":"22","intent":"22","slots":{"end_point":"杭州","start_time":"2017-01-03","sugs":"买火车票"}}]
["到重庆的火车票有吗？",{"domain":"22","intent":"22","slots":{"end_point":"重庆","start_time":"2017-01-03","sugs":"买火车票"}}]
["包贝尔的妻子",{"domain":"music","intent":"music","slots":{"singer":"包贝尔","song":"妻子"}}]
["北京到上海的火车票多少钱？",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["北京到南京火车票，最快的",{"domain":"22","intent":"22","slots":{"end_point":"南京","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["北京到天津明天最早的火车票是几点的，多少钱",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","end_point":"天津","start_point":"北京","start_time":"2017-01-04"}}]
["北京市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"北京市","loc_province":"北京市","time":"2017-01-03,2017-01-03"}}]
["北京最好吃的北京菜",{"domain":"restaurant_bot","intent":"find","slots":{"city":"北京","cuisine":"北京菜","sortby":"taste"}}]
["北京最好的韩国料理",{"domain":"restaurant_bot","intent":"find","slots":{"city":"北京","cuisine":"韩国料理","sortby":"score"}}]
["北京火车南站火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["北京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["十五分钟后提醒我开会",{"domain":"remind","intent":"remind","slots":{"event_title":"开会","intent":"设置","remind_time":"{\"minute\":\"+15\"}","__intent__":"setup","__id__":"1483430623828_cyi45b","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1483431523","status":"create_confirm"}}]
["半小时后叫我起床",{"domain":"remind","intent":"remind","slots":{"remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"cancel","da_system_not_understand":"2"}}]
["南京市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"南京市","loc_county":"南京市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["南宁市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"南宁市","loc_county":"南宁市","loc_province":"广西壮族自治区","time":"2017-01-03,2017-01-03"}}]
["南昌市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"南昌市","loc_county":"南昌市","loc_province":"江西省","time":"2017-01-03,2017-01-03"}}]
["南通市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"南通市","loc_county":"南通市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["厦门市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"厦门市","loc_county":"厦门市","loc_province":"福建省","time":"2017-01-03,2017-01-03"}}]
["去深圳的火车票价格",{"domain":"22","intent":"22","slots":{"end_point":"深圳","start_time":"2017-01-03","sugs":"买火车票"}}]
["去重庆的火车票",{"domain":"22","intent":"22","slots":{"end_point":"重庆","start_time":"2017-01-03","sugs":"买火车票"}}]
["发个短信给邱春华跟他讲我睡觉了",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"跟他讲","SMSKey":"短信","SendKey":"发个","content":"我睡觉了","bot_not_understand":"1"}}]
["发条短信给庞翔宇",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发条","bot_not_understand":"1"}}]
["发条短信给张凤仪告诉他晚上记得做饭",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"说","SMSKey":"短信","SendKey":"发","WantKey":"帮我","content":"晚上记得加油","bot_not_understand":"1","da_system_not_understand":"1"}}]
["发短信",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发"}}]
["发短信给10086",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","content":"发短信给10086","number":"15140559455","bot_not_understand":"1"}}]
["发短信给傅仕勤",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"1"}}]
["发短信给冯姐啊",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","WantKey":"我要","bot_not_understand":"2"}}]
["发短信给刘芳",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","content":"写哈哈","bot_not_understand":"2"}}]
["发短信给叶赛凤教他吃饭",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"1"}}]
["发短信给家里",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","bot_not_understand":"2"}}]
["发短信给张杰写哈哈",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","content":"写哈哈","bot_not_understand":"1"}}]
["发短信给心雨",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"跟他讲","SMSKey":"短信","SendKey":"发个","content":"我睡觉了","bot_not_understand":"2"}}]
["发短信给李新宇",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"1"}}]
["发短信给李真自",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"2"}}]
["发短信给李贞",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"2"}}]
["发短信给李贞子",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","WantKey":"我要","content":"家妈妈","bot_not_understand":"2"}}]
["发短信给李赛凤",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"1"}}]
["发短信给王俊华鑫",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发条","bot_not_understand":"2"}}]
["发短信给策划策划",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","content":"发短信给10086","number":"15140559455","bot_not_understand":"1","da_system_not_understand":"1"}}]
["发短信给苗",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","bot_not_understand":"1"}}]
["发短信给韩义龙",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"1"}}]
["发短信给魏玮明天一起吃饭",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","content":"在车上等你","name":"1514559455","number":"1514559455","bot_not_understand":"1","pinyin":"1+5+1+4+5+5+9+4+5+5","da_system_not_understand":"1"}}]
["发送短信给老爸",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发送","bot_not_understand":"1"}}]
["可不可以给我放首歌听",{"domain":"music","intent":"music","slots":{"music_theme":"首歌","MusicWantKey":"WantKey","action_type":"1"}}]
["可以帮我找点好听的歌曲吗",{"domain":"music","intent":"music","slots":{"music_theme":"歌曲","music_tag":"好听的","MusicWantKey":"WantKey","MusicAskKey":"吗"}}]
["合肥市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"合肥市","loc_county":"合肥市","loc_province":"安徽省","time":"2017-01-03,2017-01-03"}}]
["听歌",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["听歌曲",{"domain":"music","intent":"music","slots":{"music_theme":"歌曲","action_type":"1"}}]
["听音乐",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["吴亦凡的歌",{"domain":"music","intent":"music","slots":{"music_theme":"的歌","singer":"吴亦凡"}}]
["告诉我张凤仪的电话号码",{"domain":"phone","intent":"contact","slots":{"action_type":"1","pinyin_for_view":"zhang+feng+yi","name_for_view":"张凤仪"}}]
["周六十一点提醒我香蕉版勺子痒痒挠",{"domain":"remind","intent":"remind","slots":{"event_title":"香蕉版勺子痒痒挠","intent":"设置","remind_time":"{\"hour\":\"11\",\"week\":\"6\"}","__intent__":"setup","__id__":"1483430625801_fn21ww","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"ask_time"}}]
["周杰伦的妻子",{"domain":"music","intent":"music","slots":{"singer":"周杰伦","song":"妻子"}}]
["呼叫119",{"domain":"phone","intent":"telephone","slots":{"name":"119","number":"119","pinyin":"1+1+9"}}]
["呼和浩特市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"呼和浩特市","loc_county":"呼和浩特市","loc_province":"内蒙古自治区","time":"2017-01-03,2017-01-03"}}]
["哈尔滨市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"哈尔滨市","loc_county":"哈尔滨市","loc_province":"黑龙江省","time":"2017-01-03,2017-01-03"}}]
["哥舅舅你给我唱个歌吧",{"domain":"music","intent":"music_sing","slots":{"music_theme":"歌","MusicWantKey":"你给我","MusicAskKey":"吧","action_type":"1"}}]
["哪儿能买去成都的动车",{"domain":"22","intent":"22","slots":{"end_point":"成都","start_time":"2017-01-03","sugs":"买火车票"}}]
["哪里可以买火车票？",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["哪里能买火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["唱一首歌",{"domain":"music","intent":"music_sing","slots":{"music_theme":"一首歌","action_type":"1"}}]
["唱一首歌给我听",{"domain":"music","intent":"music","slots":{"MusicSuffix":"给我听","song":"唱一首歌"}}]
["唱个歌",{"domain":"music","intent":"music_sing","slots":{"music_theme":"歌","action_type":"1"}}]
["唱个歌听听",{"domain":"music","intent":"music_sing","slots":{"music_theme":"歌","MusicSuffix":"听听","action_type":"1"}}]
["唱歌",{"domain":"music","intent":"music_sing","slots":{"action_type":"1"}}]
["唱歌吧",{"domain":"music","intent":"music_sing","slots":{"MusicAskKey":"吧","action_type":"1"}}]
["唱歌听听",{"domain":"music","intent":"music_sing","slots":{"MusicSuffix":"听听","action_type":"1"}}]
["唱歌给我他",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","action_type":"1"}}]
["唱送别",{"domain":"music","intent":"music_sing","slots":{"song":"送别","action_type":"1"}}]
["唱首好听的",{"domain":"music","intent":"music_sing","slots":{"music_tag":"好听的","action_type":"1"}}]
["唱首李易峰的年少有你",{"domain":"music","intent":"music_sing","slots":{"song":"年少有你","singer":"李易峰","action_type":"1"}}]
["唱首歌",{"domain":"music","intent":"music_sing","slots":{"action_type":"1"}}]
["唱首歌。",{"domain":"music","intent":"music_sing","slots":{"action_type":"1"}}]
["唱首歌吧",{"domain":"music","intent":"music_sing","slots":{"MusicAskKey":"吧","action_type":"1"}}]
["唱首歌来听",{"domain":"music","intent":"music_sing","slots":{"MusicSuffix":"来听","action_type":"1"}}]
["唱首歌给我听吧",{"domain":"music","intent":"music_sing","slots":{"MusicSuffix":"给我听","MusicAskKey":"吧","action_type":"1"}}]
["唱首歌给我宝宝听好吗",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","MusicSuffix":"听","MusicAskKey":"好吗","action_type":"1"}}]
["嗯我想听听你的歌",{"domain":"music","intent":"music","slots":{"music_theme":"的歌","MusicWantKey":"WantKey","CommandAccepter":"你","action_type":"1"}}]
["嗯放个音乐听",{"domain":"music","intent":"music","slots":{"MusicSuffix":"听","action_type":"1"}}]
["嘉兴市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"嘉兴市","loc_county":"嘉兴市","loc_province":"浙江省","time":"2017-01-03,2017-01-03"}}]
["坐火车上海",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["大庆市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"大庆市","loc_county":"大庆市","loc_province":"黑龙江省","time":"2017-01-03,2017-01-03"}}]
["大连市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"大连市","loc_county":"大连市","loc_province":"辽宁省","time":"2017-01-03,2017-01-03"}}]
["天津市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"天津市","loc_province":"天津市","time":"2017-01-03,2017-01-03"}}]
["太原市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"太原市","loc_county":"太原市","loc_province":"山西省","time":"2017-01-03,2017-01-03"}}]
["女人唱首歌吗",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["好听的歌",{"domain":"music","intent":"music","slots":{"music_theme":"歌","music_tag":"好听的"}}]
["威海市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"威海市","loc_county":"威海市","loc_province":"山东省","time":"2017-01-03,2017-01-03"}}]
["宁波市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"宁波市","loc_county":"宁波市","loc_province":"浙江省","time":"2017-01-03,2017-01-03"}}]
["定个闹钟明天早上7点20叫我",{"domain":"remind","intent":"remind","slots":{"remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"cancel","da_system_not_understand":"2"}}]
["射阳在哪儿",{"domain":"lbs","intent":"poi","slots":{"WHERE":"在哪儿","poi":"射阳"}}]
["帮我买张从北京到上海的火车票",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我买张后天到南京的动车票",{"domain":"22","intent":"22","slots":{"end_point":"南京","start_time":"2017-01-05","sugs":"买火车票"}}]
["帮我买张明天下午三点的火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-04","sugs":"买火车票"}}]
["帮我买张火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我找找有没有星期天到北京的火车",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","end_point":"北京","start_time":"2017-01-08"}}]
["帮我推荐一些口碑好的餐厅",{"domain":"restaurant_bot","intent":"find","slots":{"sortby":"praise"}}]
["帮我推荐一些适合朋友聚会的餐厅",{"domain":"restaurant_bot","intent":"find","slots":{"crowd":"朋友聚餐","location":"附近"}}]
["帮我查一下从北京到上海的火车票",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我查一下从北京到上海的火车票有哪些",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我查下t121火车时刻表",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","start_time":"2017-01-03"}}]
["帮我查下从北京到上海的火车票",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我查下夜间的车次",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","start_time":"2017-01-03"}}]
["帮我查下张凤仪的电话号码",{"domain":"phone","intent":"contact","slots":{"action_type":"1","pinyin_for_view":"zhang+feng+yi","name_for_view":"张凤仪"}}]
["帮我查下靠窗座位的火车票",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","start_time":"2017-01-03"}}]
["帮我查查25号上海到武汉的火车票",{"domain":"22","intent":"22","slots":{"end_point":"武汉","start_point":"上海","start_time":"2017-01-25","sugs":"买火车票"}}]
["帮我给光光打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["帮我给庞翔宇打个电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["帮我给张凤仪发短信说晚上记得加油",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"说","SMSKey":"短信","SendKey":"发","WantKey":"帮我","content":"晚上记得加油","bot_not_understand":"1"}}]
["帮我给我乖乖打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["帮我订一个晚上八点钟的闹钟谢谢",{"domain":"remind","intent":"remind","slots":{"event_title":"的闹钟谢谢","intent":"设置","remind_time":"{\"hour\":\"8\",\"apm\":\"pm\"}","remind_type":"clock","__intent__":"setup","__id__":"1483430623245_d88yu1","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"是","remind_time_type":"abstime","remind_time_data":"1483444800","status":"create"}}]
["帮我订一张上海到大理明天晚上的火车票",{"domain":"22","intent":"22","slots":{"end_point":"大理","start_point":"上海","start_time":"2017-01-04","sugs":"买火车票"}}]
["帮我订上海到深圳的火车票",{"domain":"22","intent":"22","slots":{"end_point":"深圳","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我订张动车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我订张后天的火车票",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","start_time":"2017-01-05"}}]
["帮我订张火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我订张高铁票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["帮我设置明天上午五点四十的闹铃",{"domain":"remind","intent":"remind","slots":{"event_title":"联系王妙英","intent":"设置","remind_time":"{\"month\":\"11\",\"day\":\"1\",\"hour\":\"11\",\"week\":\"1+1\",\"apm\":\"am\",\"repeat\":\"year\",\"special_calendar\":\"lunar\"}","__intent__":"setup","__id__":"1483430625801_fn21ww","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"create_confirm","remind_time_type":"year","remind_time_value":"1101","remind_time_data":"1513566000","da_system_not_understand":"1"}}]
["帮我预订一张1月2日上海到青岛的火车票",{"domain":"22","intent":"22","slots":{"end_point":"青岛","start_point":"上海","start_time":"2018-01-02","sugs":"买火车票"}}]
["常州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"常州市","loc_county":"常州市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["常熟市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"苏州市","loc_county":"常熟市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["广州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"广州市","loc_county":"广州市","loc_province":"广东省","time":"2017-01-03,2017-01-03"}}]
["庞翔宇的电话号码是多少",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"1","da_system_not_understand":"1"}}]
["度秘你给我唱首歌",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"你给我","action_type":"1"}}]
["度秘唱个歌儿",{"domain":"music","intent":"music_sing","slots":{"music_theme":"MusicRefer","action_type":"1"}}]
["度秘唱歌",{"domain":"music","intent":"music_sing","slots":{"action_type":"1"}}]
["度秘推荐几首好听的歌呗",{"domain":"music","intent":"music","slots":{"music_theme":"几首","music_tag":"好听的","MusicWantKey":"WantKey","MusicAskKey":"呗"}}]
["度秘给唱首歌吧",{"domain":"music","intent":"music_sing","slots":{"MusicAskKey":"吧","action_type":"1"}}]
["度秘，我想听说唱歌曲",{"domain":"music","intent":"music","slots":{"song":"说唱歌曲","action_type":"1"}}]
["度秘，我要听钢琴曲",{"domain":"music","intent":"music","slots":{"song":"钢琴曲","action_type":"1"}}]
["廊坊市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"廊坊市","loc_county":"廊坊市","loc_province":"河北省","time":"2017-01-03,2017-01-03"}}]
["徐州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"徐州市","loc_county":"徐州市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["德阳市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"德阳市","loc_county":"德阳市","loc_province":"四川省","time":"2017-01-03,2017-01-03"}}]
["怎么订火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["株洲市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"株洲市","loc_county":"株洲市","loc_province":"湖南省","time":"2017-01-03,2017-01-03"}}]
["想买张从重庆去成都的火车票",{"domain":"22","intent":"22","slots":{"end_point":"成都","start_point":"重庆","start_time":"2017-01-03","sugs":"买火车票"}}]
["成都市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"成都市","loc_county":"成都市","loc_province":"四川省","time":"2017-01-03,2017-01-03"}}]
["成龙的妻子",{"domain":"music","intent":"music","slots":{"singer":"成龙","song":"妻子"}}]
["我发你给我唱首歌",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["我在2月15号想去上海，你帮我看看有没有火车票",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","end_point":"上海","start_time":"2017-01-03"}}]
["我想去上海，你帮我看看有没有火车票",{"domain":"22","intent":"22","slots":{"sugs":"买火车票","end_point":"上海","start_time":"2017-01-03"}}]
["我想听一首歌冷酷到底",{"domain":"music","intent":"music","slots":{"music_theme":"一首歌","song":"冷酷到底","action_type":"1"}}]
["我想听中国风的歌曲",{"domain":"music","intent":"music","slots":{"music_language":"中文","music_theme":"的歌曲","song":"风","action_type":"1"}}]
["我想听你唱歌",{"domain":"music","intent":"music","slots":{"action_type":"1","song":"唱歌"}}]
["我想听嘻哈风格的歌",{"domain":"music","intent":"music","slots":{"music_theme":"的歌","music_type":"嘻哈","action_type":"1"}}]
["我想听度秘唱红歌",{"domain":"music","intent":"music","slots":{"song":"唱红歌","action_type":"1"}}]
["我想听新世纪音乐",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["我想听歌",{"domain":"music","intent":"music","slots":{"music_theme":"歌","action_type":"1"}}]
["我想听歌了",{"domain":"music","intent":"music","slots":{"music_theme":"歌","action_type":"1"}}]
["我想听歌曲张惠妹的解脱",{"domain":"music","intent":"music","slots":{"singer":"张惠妹","song":"解脱","action_type":"1"}}]
["我想听爱的传奇",{"domain":"music","intent":"music","slots":{"song":"爱的传奇","action_type":"1"}}]
["我想坐火车去北京",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["我想要2月3号到武汉的火车票",{"domain":"22","intent":"22","slots":{"end_point":"武汉","start_time":"2017-02-03","sugs":"买火车票"}}]
["我想要北京到杭州的火车票",{"domain":"22","intent":"22","slots":{"end_point":"杭州","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["我现在想听音乐",{"domain":"music","intent":"music","slots":{"CommandSender":"我","action_type":"1"}}]
["我的女儿要你唱一个歌给她听",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["我知道你给我放一首歌",{"domain":"music","intent":"music","slots":{"music_theme":"一首歌","MusicWantKey":"你给我","CommandSender":"我","action_type":"1"}}]
["我要买动车票",{"domain":"phone","intent":"open_website","slots":{"action_type":"1","name":"买动车票","website_url":"http://www.12306.cn/"}}]
["我要买火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["我要到哪里买火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["我要发短信",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","WantKey":"我要"}}]
["我要发短信给冯姐",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","WantKey":"我要","bot_not_understand":"1"}}]
["我要发短信给冯姐姐",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","WantKey":"我要","bot_not_understand":"1"}}]
["我要发短信给小桐桐家妈妈",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","WantKey":"我要","content":"家妈妈","bot_not_understand":"1"}}]
["我要发短信给小糖糖",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","WantKey":"我要","bot_not_understand":"2"}}]
["我要听小跳蛙",{"domain":"music","intent":"music","slots":{"song":"小跳蛙","action_type":"1"}}]
["我要听恋人心",{"domain":"music","intent":"music","slots":{"song":"恋人心","action_type":"1"}}]
["我要听悲伤逆流成河",{"domain":"music","intent":"music","slots":{"song":"悲伤逆流成河","action_type":"1"}}]
["我要听星星这首歌",{"domain":"music","intent":"music","slots":{"MusicSuffix":"这首歌","song":"星星","action_type":"1"}}]
["我要听歌",{"domain":"music","intent":"music","slots":{"MusicWantKey":"WantKey","action_type":"1"}}]
["我要听那些花儿",{"domain":"music","intent":"music","slots":{"song":"那些花儿","action_type":"1"}}]
["我要听风的季节",{"domain":"music","intent":"music","slots":{"song":"风的季节","action_type":"1"}}]
["我要打电话",{"domain":"phone","intent":"telephone","slots":{}}]
["我要明天到北京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_time":"2017-01-04","sugs":"买火车票"}}]
["我要最快的从上海到北京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["我要订上海到北京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["我要订火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["我需要坐火车来北京",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["打119",{"domain":"phone","intent":"telephone","slots":{"number":"119"}}]
["打个电话给庞翔宇",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打个电话给张凤仪",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["打小宝电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["打开电话给小张打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打电话",{"domain":"phone","intent":"telephone","slots":{}}]
["打电话给中国移动",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["打电话给丽丽哦",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["打电话给代东华",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打电话给余中荣",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["打电话给小鬼",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["打电话给朋友a",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打电话给沙县小吃",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打电话给爸爸",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打电话给甲富",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打电话给美丽的君君",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打电话给老昌",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打给小君",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["打老婆的电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["打莫志航的电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["扬州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"扬州市","loc_county":"扬州市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["找一些有团购的餐厅",{"domain":"restaurant_bot","intent":"find","slots":{"groupon":"1","location":"附近"}}]
["找几首新歌听听",{"domain":"music","intent":"music","slots":{"music_theme":"几首","MusicWantKey":"WantKey","MusicSuffix":"听听"}}]
["找几首英文歌曲",{"domain":"music","intent":"music","slots":{"music_theme":"几首","music_language":"英文","MusicWantKey":"WantKey"}}]
["把庞翔宇的电话号码发给张凤仪",{"domain":"phone","intent":"contact","slots":{"action_type":"2","pinyin_for_view":"pang+xiang+yu","pinyin_to_send":"zhang+feng+yi","name_for_view":"庞翔宇","name_to_send":"张凤仪"}}]
["把张凤仪的电话号码发给庞翔宇",{"domain":"phone","intent":"contact","slots":{"action_type":"2","pinyin_for_view":"zhang+feng+yi","pinyin_to_send":"pang+xiang+yu","name_for_view":"张凤仪","name_to_send":"庞翔宇"}}]
["拨打18503769969",{"domain":"phone","intent":"telephone","slots":{"number":"18503769969"}}]
["拨打二哥的电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["拨打电话181028321275",{"domain":"phone","intent":"telephone","slots":{"number":"181028321275"}}]
["拨打贤哥",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["拨打陈平电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["提醒我两个小时以后起床运动",{"domain":"remind","intent":"remind","slots":{"event_title":"起床运动","intent":"设置","remind_time":"{\"month\":\"11\",\"day\":\"1\",\"hour\":\"+2\",\"week\":\"6\",\"repeat\":\"year\",\"special_calendar\":\"lunar\"}","__intent__":"setup","__id__":"1483430625801_fn21ww","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"ask_time"}}]
["携程火车票",{"domain":"phone","intent":"open_website","slots":{"action_type":"1","name":"携程火车票","website_url":"http://www.ctrip.com/"}}]
["播放mc天佑的歌",{"domain":"music","intent":"music","slots":{"music_theme":"的歌","song":"mc","action_type":"1"}}]
["播首周杰伦的歌",{"domain":"music","intent":"music","slots":{"music_theme":"的歌","singer":"周杰伦","action_type":"1"}}]
["放首歌听",{"domain":"music","intent":"music","slots":{"music_theme":"歌","action_type":"1"}}]
["教我唱歌呗",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["无锡市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"无锡市","loc_county":"无锡市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["昆山市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"苏州市","loc_county":"昆山市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["昆明市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"昆明市","loc_county":"昆明市","loc_province":"云南省","time":"2017-01-03,2017-01-03"}}]
["明天上海虹桥火车站到北京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-04","sugs":"买火车票"}}]
["明天下午两点提醒我订票去南京。",{"domain":"remind","intent":"remind","slots":{"event_title":"放冬瓜","intent":"设置","remind_time":"{\"hour\":\"+1\"}","__intent__":"setup","__id__":"1483430619122_fcj335","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1483434219","status":"create_confirm","da_system_not_understand":"1"}}]
["明天下午北京到上海的火车票",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_point":"北京","start_time":"2017-01-04","sugs":"买火车票"}}]
["明天去成都的高铁票",{"domain":"22","intent":"22","slots":{"end_point":"成都","start_time":"2017-01-04","sugs":"买火车票"}}]
["明天早上8点提醒我起床",{"domain":"remind","intent":"remind","slots":{"event_title":"起床","event_type":"wakeup","intent":"设置","remind_time":"{\"day\":\"next\",\"hour\":\"8\",\"apm\":\"am\"}","__intent__":"setup","__id__":"1483430612128_dimb88","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"是","remind_time_type":"abstime","remind_time_data":"1483488000","status":"create"}}]
["明天早上七点半提醒我带银子和还信用卡",{"domain":"remind","intent":"remind","slots":{"event_title":"还信用卡","intent":"设置","remind_time":"{\"day\":\"10\",\"hour\":\"10\",\"apm\":\"am\",\"repeat\":\"month\"}","__intent__":"setup","__id__":"1483430629735_bzhrhs","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"month","remind_time_value":"10","remind_time_data":"1484013600","status":"create_confirm","da_system_not_understand":"1"}}]
["明天晚上上海到北京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-04","sugs":"买火车票"}}]
["明早六点提醒我带手机充电器",{"domain":"remind","intent":"remind","slots":{"event_title":"带手机充电器","intent":"设置","remind_time":"{\"day\":\"next\",\"hour\":\"6\",\"apm\":\"am\"}","__intent__":"setup","__id__":"1483430612697_cl11ra","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1483480800","status":"create_confirm"}}]
["春节去上海火车票",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_time":"2017-01-28","sugs":"买火车票"}}]
["晚上七点提醒我去逛逛桥参加吉他社会员活动要带乐器",{"domain":"remind","intent":"remind","slots":{"event_title":"电话","intent":"设置","remind_time":"{\"day\":\"+0\",\"hour\":\"8\",\"minute\":\"40\",\"apm\":\"pm\"}","remind_type":"phone","__intent__":"setup","__id__":"1483430621189_gf9koq","remind_type_message":"否","remind_type_phone":"是","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1483447200","status":"create_confirm","da_system_not_understand":"1"}}]
["晚上七点提醒我打钥匙",{"domain":"remind","intent":"remind","slots":{"remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"cancel","da_system_not_understand":"2"}}]
["最炫民族风凤凰传奇唱",{"domain":"music","intent":"music","slots":{"action_type":"1","singer":"凤凰传奇","song":"最炫民族风"}}]
["有2月14号到上海的火车票吗？",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_time":"2017-02-14","sugs":"买火车票"}}]
["有2月15号去北京的火车票吗？",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_time":"2017-02-15","sugs":"买火车票"}}]
["有什么好听的歌",{"domain":"music","intent":"music","slots":{"music_theme":"歌","music_tag":"好听的","MusicWantKey":"WantKey"}}]
["有到上海的火车票吗？",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["有星期天去武汉的火车票吗？",{"domain":"22","intent":"22","slots":{"end_point":"武汉","start_time":"2017-01-08","sugs":"买火车票"}}]
["来一首歌",{"domain":"music","intent":"music","slots":{"music_theme":"一首歌"}}]
["来首薛之谦的歌",{"domain":"music","intent":"music","slots":{"music_theme":"的歌","singer":"薛之谦","action_type":"1"}}]
["杨幂被灌醉",{"domain":"music","intent":"music","slots":{"singer":"杨幂","song":"灌醉"}}]
["杭州到上海火车票价查询",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_point":"杭州","start_time":"2017-01-03","sugs":"买火车票"}}]
["杭州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"杭州市","loc_county":"杭州市","loc_province":"浙江省","time":"2017-01-03,2017-01-03"}}]
["桂林市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"桂林市","loc_county":"桂林市","loc_province":"广西壮族自治区","time":"2017-01-03,2017-01-03"}}]
["歌曲渴望春天",{"domain":"music","intent":"music","slots":{"music_theme":"歌曲","song":"渴望春天"}}]
["武汉市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"武汉市","loc_county":"武汉市","loc_province":"湖北省","time":"2017-01-03,2017-01-03"}}]
["每个工作日早上七点叫醒我",{"domain":"remind","intent":"remind","slots":{"event_title":"叫醒我","event_type":"wakeup","intent":"设置","remind_time":"{\"hour\":\"7\",\"apm\":\"am\",\"repeat\":\"weekday\",\"special_day\":\"weekday\"}","__intent__":"setup","__id__":"1483430616490_b7q3co","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"是","remind_time_type":"weekday","remind_time_data":"1483484400","status":"create"}}]
["每个月10号上午十点提醒我还信用卡",{"domain":"remind","intent":"remind","slots":{"event_title":"还信用卡","intent":"设置","remind_time":"{\"day\":\"10\",\"hour\":\"10\",\"apm\":\"am\",\"repeat\":\"month\"}","__intent__":"setup","__id__":"1483430629735_bzhrhs","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"month","remind_time_value":"10","remind_time_data":"1484013600","status":"create_confirm"}}]
["每天下午1点提醒我商标专利",{"domain":"remind","intent":"remind","slots":{"action":"create","event_title":"洗衣服","intent":"设置","remind_time":"{\"hour\":\"9\",\"minute\":\"30\",\"apm\":\"pm\",\"repeat\":\"day\"}","__intent__":"setup","__id__":"1483430614567_g0rsx7","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"absinterval","remind_time_value":"86400","remind_time_data":"1483450200","status":"create_confirm","da_system_not_understand":"1"}}]
["每天晚上9点提醒我睡觉。",{"domain":"remind","intent":"remind","slots":{"event_title":"开会","intent":"设置","remind_time":"{\"month\":\"10\",\"day\":\"21\",\"hour\":\"9\",\"apm\":\"am\"}","__intent__":"setup","__id__":"1483430617165_fu6tll","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1508547600","status":"create_confirm","da_system_not_understand":"1"}}]
["每年10月10日提醒我奶奶生日",{"domain":"remind","intent":"remind","slots":{"remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"cancel","da_system_not_understand":"2"}}]
["每年的十一月初一提醒贵阳苏豪准备生日礼物",{"domain":"remind","intent":"remind","slots":{"event_title":"香蕉版勺子痒痒挠","intent":"设置","remind_time":"{\"month\":\"11\",\"day\":\"1\",\"hour\":\"11\",\"week\":\"6\",\"repeat\":\"year\",\"special_calendar\":\"lunar\"}","__intent__":"setup","__id__":"1483430625801_fn21ww","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","status":"ask_time"}}]
["汕头市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"汕头市","loc_county":"汕头市","loc_province":"广东省","time":"2017-01-03,2017-01-03"}}]
["沈阳市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"沈阳市","loc_county":"沈阳市","loc_province":"辽宁省","time":"2017-01-03,2017-01-03"}}]
["泉州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"泉州市","loc_county":"泉州市","loc_province":"福建省","time":"2017-01-03,2017-01-03"}}]
["泰安市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"泰安市","loc_county":"泰安市","loc_province":"山东省","time":"2017-01-03,2017-01-03"}}]
["泰州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"泰州市","loc_county":"泰州市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["洛阳市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"洛阳市","loc_county":"洛阳市","loc_province":"河南省","time":"2017-01-03,2017-01-03"}}]
["济南市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"济南市","loc_county":"济南市","loc_province":"山东省","time":"2017-01-03,2017-01-03"}}]
["海口市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"海口市","loc_county":"海口市","loc_province":"海南省","time":"2017-01-03,2017-01-03"}}]
["淄博市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"淄博市","loc_county":"淄博市","loc_province":"山东省","time":"2017-01-03,2017-01-03"}}]
["深圳市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"深圳市","loc_county":"深圳市","loc_province":"广东省","time":"2017-01-03,2017-01-03"}}]
["温州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"温州市","loc_county":"温州市","loc_province":"浙江省","time":"2017-01-03,2017-01-03"}}]
["湖州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"湖州市","loc_county":"湖州市","loc_province":"浙江省","time":"2017-01-03,2017-01-03"}}]
["湛江市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"湛江市","loc_county":"湛江市","loc_province":"广东省","time":"2017-01-03,2017-01-03"}}]
["潍坊市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"潍坊市","loc_county":"潍坊市","loc_province":"山东省","time":"2017-01-03,2017-01-03"}}]
["澳门特别行政区天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"澳门特别行政区","loc_county":"澳门特别行政区","time":"2017-01-03,2017-01-03"}}]
["火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["火车票购买",{"domain":"phone","intent":"open_website","slots":{"action_type":"1","name":"火车票购买","website_url":"http://www.12306.cn/"}}]
["烟台市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"烟台市","loc_county":"烟台市","loc_province":"山东省","time":"2017-01-03,2017-01-03"}}]
["珠海市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"珠海市","loc_county":"珠海市","loc_province":"广东省","time":"2017-01-03,2017-01-03"}}]
["盐城市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"盐城市","loc_county":"盐城市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["短信发给15140559455",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","number":"15140559455","bot_not_understand":"1"}}]
["短信发给1514559455",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","content":"在车上等你","name":"1514559455","number":"1514559455","bot_not_understand":"1","pinyin":"1+5+1+4+5+5+9+4+5+5"}}]
["石家庄市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"石家庄市","loc_county":"石家庄市","loc_province":"河北省","time":"2017-01-03,2017-01-03"}}]
["福州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"福州市","loc_county":"福州市","loc_province":"福建省","time":"2017-01-03,2017-01-03"}}]
["秦皇岛市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"秦皇岛市","loc_county":"秦皇岛市","loc_province":"河北省","time":"2017-01-03,2017-01-03"}}]
["绍兴市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"绍兴市","loc_county":"绍兴市","loc_province":"浙江省","time":"2017-01-03,2017-01-03"}}]
["给18730372024打电话",{"domain":"phone","intent":"telephone","slots":{"name":"18730372024","number":"18730372024","pinyin":"18730372024"}}]
["给伤者打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["给刘梅打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["给刘鹏飞打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["给孙浩打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["给庞翔宇发短信",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","bot_not_understand":"1"}}]
["给庞翔宇发短信说晚上不回家吃饭了",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","bot_not_understand":"1","da_system_not_understand":"1"}}]
["给庞翔宇打个电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["给庞翔宇打打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["给张凤仪打个电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["给张宇洁打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["给张梅发短信",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","bot_not_understand":"1"}}]
["给张梅发短信在车上等你",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发","content":"在车上等你","bot_not_understand":"1"}}]
["给张馨元打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["给我买张到武汉的高铁票",{"domain":"22","intent":"22","slots":{"end_point":"武汉","search_type":"高铁","start_time":"2017-01-03","sugs":"买火车票"}}]
["给我买张动车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["给我买张去北京的高铁票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["给我买张火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["给我买张高铁票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["给我唱一个没有你陪伴真的好孤单",{"domain":"music","intent":"music_sing","slots":{"song":"没有你陪伴真的好孤单","action_type":"1"}}]
["给我唱一首歌",{"domain":"music","intent":"music_sing","slots":{"music_theme":"一首歌","action_type":"1"}}]
["给我唱一首歌不再见",{"domain":"music","intent":"music","slots":{"action_type":"1","song":"不再见"}}]
["给我唱一首歌我给说",{"domain":"music","intent":"music","slots":{"music_theme":"一首歌","MusicWantKey":"WantKey"}}]
["给我唱歌来听听呗",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","MusicSuffix":"来听听","MusicAskKey":"呗","action_type":"1"}}]
["给我唱青春修炼手册",{"domain":"music","intent":"music_sing","slots":{"song":"青春修炼手册","action_type":"1"}}]
["给我唱首歌",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","action_type":"1"}}]
["给我唱首歌名叫明天会更好",{"domain":"music","intent":"music_sing","slots":{"song":"明天会更好","MusicWantKey":"WantKey","action_type":"1"}}]
["给我唱首歌吗",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","MusicAskKey":"吗","action_type":"1"}}]
["给我唱首歌吧",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","MusicAskKey":"吧","action_type":"1"}}]
["给我唱首歌吧度秘",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","MusicAskKey":"吧","action_type":"1"}}]
["给我唱首歌被",{"domain":"music","intent":"music_sing","slots":{"MusicWantKey":"WantKey","action_type":"1"}}]
["给我唱首生日歌吧",{"domain":"music","intent":"music_sing","slots":{"song":"生日歌","MusicAskKey":"吧","action_type":"1"}}]
["给我来首儿歌吧",{"domain":"music","intent":"music","slots":{"music_type":"儿歌","MusicWantKey":"WantKey","MusicAskKey":"吧"}}]
["给我查一下北京到上海的火车票价格",{"domain":"22","intent":"22","slots":{"end_point":"上海","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["给我看下庞翔宇的电话号码",{"domain":"phone","intent":"contact","slots":{"action_type":"1","pinyin_for_view":"pang+xiang+yu","name_for_view":"庞翔宇"}}]
["给我见好听的歌",{"domain":"music","intent":"music","slots":{"music_theme":"歌","music_tag":"好听的","MusicWantKey":"WantKey"}}]
["给我订张上海到北京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"北京","start_point":"上海","start_time":"2017-01-03","sugs":"买火车票"}}]
["给李爱华发短信",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","WantKey":"我要","bot_not_understand":"2"}}]
["给沈全新打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["给沈泉勋打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["给男神发条短信",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发条","bot_not_understand":"1"}}]
["给老婆打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["给豆豆发条短信",{"domain":"phone","intent":"sms","slots":{"SMSKey":"短信","SendKey":"发条","bot_not_understand":"2"}}]
["给赵明英打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["给陈姐打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"2"}}]
["给领导打电话",{"domain":"phone","intent":"telephone","slots":{"bot_not_understand":"1"}}]
["给马哥员工发短信",{"domain":"phone","intent":"sms","slots":{"MSMOmit":"给","SendKey":"发","SendSMSKey":"短信","bot_not_understand":"2"}}]
["绵阳市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"绵阳市","loc_county":"绵阳市","loc_province":"四川省","time":"2017-01-03,2017-01-03"}}]
["网上买火车票",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["美味又美型的日本料理店",{"domain":"restaurant_bot","intent":"find","slots":{"cuisine":"日本料理","fragment":"美型"}}]
["能帮我买明天从北京去天津的火车票吗",{"domain":"22","intent":"22","slots":{"end_point":"天津","start_point":"北京","start_time":"2017-01-04","sugs":"买火车票"}}]
["能帮我买火车票吗",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["苏州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"苏州市","loc_county":"苏州市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["西安市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"西安市","loc_county":"西安市","loc_province":"陕西省","time":"2017-01-03,2017-01-03"}}]
["设置提醒每天晚上9点半洗衣服。",{"domain":"remind","intent":"remind","slots":{"action":"create","event_title":"洗衣服","intent":"设置","remind_time":"{\"hour\":\"9\",\"minute\":\"30\",\"apm\":\"pm\",\"repeat\":\"day\"}","__intent__":"setup","__id__":"1483430614567_g0rsx7","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"absinterval","remind_time_value":"86400","remind_time_data":"1483450200","status":"create_confirm"}}]
["请帮忙订一张火车票从北京到三亚",{"domain":"22","intent":"22","slots":{"end_point":"三亚","start_point":"北京","start_time":"2017-01-03","sugs":"买火车票"}}]
["请给我订两张初二回南京的火车票",{"domain":"22","intent":"22","slots":{"end_point":"南京","start_time":"2017-01-03","sugs":"买火车票"}}]
["贵阳市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"贵阳市","loc_county":"贵阳市","loc_province":"贵州省","time":"2017-01-03,2017-01-03"}}]
["这周日从北京到广州的高铁班次",{"domain":"22","intent":"22","slots":{"end_point":"广州","start_point":"北京","start_time":"2017-01-08","sugs":"买火车票"}}]
["那些网站可以买火车票？",{"domain":"22","intent":"22","slots":{"start_time":"2017-01-03","sugs":"买火车票"}}]
["那唱首歌给我听",{"domain":"music","intent":"music_sing","slots":{"MusicSuffix":"给我听","action_type":"1"}}]
["郑州市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"郑州市","loc_county":"郑州市","loc_province":"河南省","time":"2017-01-03,2017-01-03"}}]
["重庆市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"重庆市","loc_province":"重庆市","time":"2017-01-03,2017-01-03"}}]
["银川市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"银川市","loc_county":"银川市","loc_province":"宁夏回族自治区","time":"2017-01-03,2017-01-03"}}]
["镇江市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"镇江市","loc_county":"镇江市","loc_province":"江苏省","time":"2017-01-03,2017-01-03"}}]
["长春市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"长春市","loc_county":"长春市","loc_province":"吉林省","time":"2017-01-03,2017-01-03"}}]
["长沙市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"长沙市","loc_county":"长沙市","loc_province":"湖南省","time":"2017-01-03,2017-01-03"}}]
["附近值得去吃的美食",{"domain":"restaurant_bot","intent":"find","slots":{"catetag":"值得去吃","fragment":"值得去吃","location":"附近","sortby":"default"}}]
["附近有哪些餐馆",{"domain":"restaurant_bot","intent":"find","slots":{"location":"附近","sortby":"default"}}]
["青岛市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"青岛市","loc_county":"青岛市","loc_province":"山东省","time":"2017-01-03,2017-01-03"}}]
["鞍山市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"鞍山市","loc_county":"鞍山市","loc_province":"辽宁省","time":"2017-01-03,2017-01-03"}}]
["韩文歌",{"domain":"music","intent":"music","slots":{"music_theme":"歌","music_language":"韩文"}}]
["音乐",{"domain":"music","intent":"music","slots":{"action_type":"1"}}]
["香港特别行政区天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"香港特别行政区","loc_county":"香港特别行政区","time":"2017-01-03,2017-01-03"}}]
["鹿晗的歌",{"domain":"music","intent":"music","slots":{"music_theme":"的歌","singer":"鹿晗"}}]
["鼓浪屿市天气",{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"鼓浪屿市","time":"2017-01-03,2017-01-03"}}]
```
