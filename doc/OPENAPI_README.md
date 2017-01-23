# 度秘开放平台-OpenApi使用说明

## Table of Contents


   * [度秘开放平台-OpenApi使用说明](#度秘开放平台-openapi使用说明)
      * [Table of Contents](#table-of-contents)
      * [客户端sdk](#客户端sdk)
         * [下载](#下载)
         * [介绍](#介绍)
         * [常见问题](#常见问题)
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
         * [directives](#directives)
            * [AudioPlayer](#audioplayer)
            * [Speaker](#speaker)
            * [SpeechSynthesizer](#speechsynthesizer)
         * [hint](#hint)
         * [nlu](#nlu)
            * [包含query解析结果的结构化数据](#包含query解析结果的结构化数据)
            * [以下是跑出来的一批nlu数据的例子](#以下是跑出来的一批nlu数据的例子)
      * [下游服务介绍](#下游服务介绍)


## 客户端sdk

### 下载

内有demo工程和可测试的apk，外网用户请下载连线上环境的版本
   * [连线上环境](sdk/sdk_v2_online.zip)
   * [连线下环境](sdk/sdk_v2_offline.zip)

### 介绍

内部含有文件

   * app-release.apk 这个是demo app，可以安装到手机，可以试用度秘的语音识别、TTS、query理解等功能
   * demo_src.zip 这个是demo app的源代码，是一个android studio工程，可以直接打开、编译。调用sdk的代码请参考此工程
   * duersdk_library.zip  这个是sdk库，可以导入到已有工程中使用

### 常见问题

   * 如何更改appid、appkey
    * 请看demo工程代码中的 app/src/main/java/com/baidu/duersdkdemo/DemoApplication.java

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
    "appid": "650DEBC2B99A4dA4",
    "appkey": "2F4B662AF2064323A16122D702160F15",
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

"resource":{ //数据资源，可选字段
    "type":"music_ref",//资源类型，目前已经有music/news/weather等资源类型
    "data":{
        "api": {
            "method": "GET",
            "url": "http://s.xiaodu.baidu.com/v20161223/resource/music?user_id=888"
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
                "url":"http://music.baidu.com/song/s/04071175dd9085630382f", //歌曲地址
                "same_name_url":"http://music.baidu.com/search?key=%E4%BD%A0%E5%BF%AB%E5%9B%9E%E6%9D%A5", // 同名其他歌曲页url
                "streaming_vedio_url":"http://neisou.baidu.com/images/headportrait/zhangwenbo/0_112.jpg",
                "head_image_url":"http://neisou.baidu.com/images/headportrait/zhangwenbo/0_112.jpg",
                "album_name":"十一月的肖邦", //专辑名称
                "album_url":"http://music.baidu.com/album/234211111",  //专辑地址
                "score":"63",  //歌曲质量得分
                "publish_time":"2011-09-01", //发布日期
                "publish_company":"飞碟",  //唱片公司
                "is_need_pay_listen":"0", //是否付费收听，0表示否，1表示是
                "from_site":"1", //来源站点，1:百度,2:QQ,3:网易云,4:虾米,5:一听,6:酷我
                "hot":"12345"   //用整数表示的热度
              }...
            ]
          }
        }
        */
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

### directives
基础结构：
```javascript
"directives":[   //指令，用于控制给客户端、目标硬件下达命令，可选字段，一个结果可包含多条啊指令
    {
        "header": {  
            "namespace": "",//指令的分类
            "name": "" //指令的名字
        },
        "payload":{ //指令的参数
        }
    }
]
```
现在有以下namespace指令可能返回

#### AudioPlayer
  * [AudioPlayer](directives/AudioPlayer.md) 音乐播放相关指令

#### Speaker
  * [Speaker](directives/Speaker.md) 扬声器控制、设置相关指令

#### SpeechSynthesizer
  * [SpeechSynthesizer](directives/SpeechSynthesizer.md) 语音播报（TTS）相关指令



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

[Examples](nlu/example.md)


## 下游服务介绍

bot_id|描述|测试query
------|----|---------
aries_general|通用信息查询|周杰伦是谁
life_common|生活服务；鲜花、美容、理发、导航、周边、路况|附近堵车么;故宫在哪里;附近的饭馆
sac|通用服务入口|我要买火车票
restaurant_bot|美食服务|北京哪里的烤鸭好吃
remind|提醒、闹钟|5分钟之后提醒我
recommend_service_wireless|笑话、新闻|讲个笑话
sysprofile_service|系统画像（可根据端类型自定义返回内容）|你是什么星座的
phone|电话指令、打开app、网页、通信录、我的位置|
movie_satisfy|电影|
o2o_satisfy|外卖|
duer_game|游戏|
rent_car|打车|我要打车
image_satisfy|图片搜索（多模sdk）|
duer_gaokao_server|高考|
drama_satisfy|电视剧|琅琊榜
travel_server|旅游，景点，hi周末|最近有什么演唱会？
recharge|手机充值（必须登录）|帮我充值
online_shopping|在线购物|网购高露洁
hotel|酒店|附近的酒店
duer_short_video|短视频?|
sport_server|部分NBA功能？|
nba_search|NBA|nba
baojie|保洁|帮我找个保洁
duer_weather|天气|今天天气怎么样
talk_service|开放集合聊天|（兜底服务）
doudi_server|聊天封闭集合兜底|（兜底服务）
smart_tv|电视（有电视剧）|我想看琅琊榜
speaker_hardware|扬声器控制|声音大一点
audio_news|新闻|英特尔的最新新闻
[audio_music](bot/audio_music.md)|音乐|放一首周杰伦的歌
audio_unicast|点播垂类（有声资源）|播放郭德纲的相声
audio_scene|场景化垂类|进入助眠模式
audio_live|直播垂类|播放北京文艺广播
[fridge](bot/fridge.md)|冰箱指令|
[cookbook](bot/cookbook.md)|菜谱|
scene_satisfaction|明星|周杰伦的最新专辑


