音乐返回的完整例子:
```javascript
//放一首周杰伦的歌
{
  "result": {
    "directives": [
      {
        "header": {
          "message_id": "14851538172760",
          "name": "Play",
          "namespace": "AudioPlayer"
        },
        "payload": {
          "audio_item": {
            "audio_item_id": "846803671",
            "stream": {
              "offset_ms": 0,
              "progress_report_interval_ms": 1000,
              "stream_format": "AUDIO_MP3",
              "token": "846803671",
              "url": "http://zhangmenshiting.baidu.com/data2/music/64333976/64333976.mp3?xcode=0411b74c6de0c453a0d51cfc739c1004"
            }
          },
          "play_behavior": "REPLACE_ALL"
        }
      }
    ],
    "resource": {
      "data": {
        "api": {
          "method": "GET",
          "url": "http://s.xiaodu.baidu.com/v20161223/resource/music?user_id=DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768"
        }
      },
      "type": "music_ref"
    },
    "speech": {
      "content": "周杰伦 晴天",
      "message_id": "14851538172760",
      "type": "Text"
    },
    "bot_id": "audio_music",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "周杰伦 晴天"
      }
    ],
    "nlu": {
      "domain": "audio.music",
      "intent": "audio.music.play",
      "slots": {
        "singer": "周杰伦",
        "unit": "歌曲"
      }
    }
  },
  "id": "1485153817_97578ae8d",
  "logid": "14851538172760",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1485153817,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "放一首周杰伦的歌",
  "msg": "ok",
  "status": 0
}
```

### nlu部分的说明
intent|slot|slot_name|slot_value
------|----|---------|----------
intent::audio.music.play音乐播放|歌手/乐队名|singer|周杰伦/二手玫瑰
 |歌曲名|song|听妈妈的话
 |专辑名|album|依然范特西
 |排序类型|sort_type|sort_new(最新)|/|sort_hot(最热)
 |单位|unit|歌曲、专辑（用于区分“播放周杰伦的歌曲”和“播放周杰伦的专辑”）
 |标签|tag|好听、悲伤、80后、摇滚
 |榜单名|top_name|热歌榜、原创音乐榜
 |歌单名|list_name|让音乐撞见你的心事;别让时间消磨掉你的青春
 |作词人|lyricist|方文山
 |作曲人|composer|周杰伦
intent::audio.music.ask 知识问答|歌手名|singer|有值代表有询问需求；空代表无询问需求
 |专辑名|album|有值代表有询问需求；空代表无询问需求
 |歌曲名|song|有值代表有询问需求；空代表无询问需求
intent::audio.music.favorite 收藏歌曲|动作|action|like(收藏)/unlike(取消收藏)
 |歌名|name|这首歌，这个
intent::audio.music.songlist 歌单管理|歌曲名|song|这首歌
 |动作|action|add(加入歌单)/delete(删除歌单)
 |歌单名|list_name|小清新
intent::audio.music.stop 停止 |	 	 	 	 
intent::audio.music.pause 暂停 |  	 	 	 
intent::audio.music.continue 继续 | 	 	 	 	 	 
intent::audio.music.next 下一首 | 	 	 	 
intent::audio.music.previous 上一首	 | 	 	 	 	 
intent::audio.music.play_mode 播放模式 | 循环模式 |mode |single_cycle，rand，list_cycle


### directives 部分的说明

参见音乐相关directives的文档
  * [AudioPlayer](../directives/AudioPlayer.md) 音乐播放相关指令
  * [Speaker](../directives/Speaker.md) 扬声器控制、设置相关指令
  * [SpeechSynthesizer](../directives/SpeechSynthesizer.md) 语音播报（TTS）相关指令



### resource 部分的解释说明

.result.resource.type==music_ref的resource，是一个播放列表的地址，支持翻页
```javascript
{
  "data": {
    "api": {
      "method": "GET",
      "url": "http://s.xiaodu.baidu.com/v20161223/resource/music?user_id=DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768"
    }
  },
  "type": "music_ref"
}
```

抓取播放列表的地址，返回值示例如下
```javascript
{
  "status": 0,
  "code": null,
  "data": {
    "page": 1,
    "total_page": 5,
    "list": [
      {
        "duration": "270",
        "name": "晴天",
        "alias": "",
        "singer_name": "周杰伦",
        "all_singer_name": "",
        "genre": "流行",
        "tag": "好听",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/816477?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E6%99%B4%E5%A4%A9",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/64333976/64333976.mp3?xcode=0411b74c6de0c453a0d51cfc739c1004",//可播放资源地址
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/115434572/115434572.jpg",
        "album_name": "叶惠美",
        "album_url": "http://music.baidu.com/album/72257", //专辑地址
        "score": "0",
        "publish_time": "2003-07-31",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "67832"
      },
      ....
    ]
  },
  "message": ""
}
```



### 获取歌单列表
  * url：http://s.xiaodu.baidu.com/v20161223/resource/songsheetlist?page=1&page_size=10
  * page：页码
  * page_size：每页请求歌单数量，默认为10

返回结果

```javascript
{
     status: 0,
     code: "",
     data: 
        {
            "page" : 1,        //当前页
            "total_page" : 10,  //总页数
            "list" 
               [
                 {
                   "sheet_id" : 121,   //歌单id
                   "name":"【环球之音】一听就上瘾的欧美节奏",   //歌单名字
                   "pic":"http://musicugc.cdn.qianqian.com/ugcdiy/pic/7d584d4298a6584be32f0cd115722280.jpg",    //歌单封面
                   "desc":"环球旗下的顶尖歌手们，正用他们开拓的创新精神引领着这个时代的音乐潮流。节奏是一首歌的心跳，更是嘻哈音乐和电子音乐的灵魂，这样的节奏足够精彩到让人流连忘返。",   //歌单简介
                   "tag":"欧美 说唱 电子"     //歌单标签           
                },
                {
                   "sheet_id" : 122,
                   "name":"【环球之音】一听就上瘾的欧美节奏",
                   "pic":"http://musicugc.cdn.qianqian.com/ugcdiy/pic/7d584d4298a6584be32f0cd115722280.jpg",
                   "desc":"环球旗下的顶尖歌手们，正用他们开拓的创新精神引领着这个时代的音乐潮流。节奏是一首歌的心跳，更是嘻哈音乐和电子音乐的灵魂，这样的节奏足够精彩到让人流连忘返。",
                   "tag":"欧美 说唱 电子"               
                }
             ]
       },
    message: null
}
```
其中status 为0返回正常，其它异常


### 获取某个歌单下的歌曲列表

请求参数
  * url：http://s.xiaodu.baidu.com/v20161223/resource/songsheetmusic?sheet_id=1000&page=1&page_size=10
  * sheet_id：歌单id
  * page：页码     
  * page_size：每页歌曲数量，默认为10

返回值：
```javascript

{
  "status": 0,
  "code": "",
  "data": {
    "total_page": 4,
    "page": "1",
    "list": [
      {
        "id": "846122617",
        "duration": "210",
        "name": "Team",
        "alias": "",
        "singer_name": "Iggy Azalea",
        "all_singer_name": "",
        "genre": "",
        "tag": "",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/263815780?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Team",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/ec75bbd373de776107be888a4dab4596/263815849/263815849.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/64110822f1de106bd1ef8ee2fa059f2e/263815772/263815772.jpg",
        "album_name": "Team",
        "album_url": "http://music.baidu.com/album/263795829",
        "score": "0",
        "publish_time": "2016-03-18",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "134"
      },
      {
        "id": "846278539",
        "duration": "285",
        "name": "Cool",
        "alias": "",
        "singer_name": "Alesso,Roy Engli",
        "all_singer_name": "",
        "genre": "",
        "tag": "",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/257601318?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Cool",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/3e92662b714e24d474934de6973a22d1/257601730/257601730.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/f09b251f165c953b7e380e470932cce9/257602030/257602030.jpg",
        "album_name": "Cool",
        "album_url": "http://music.baidu.com/album/257601261",
        "score": "0",
        "publish_time": "2015-05-04",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "1"
      },
      {
        "id": "846416416",
        "duration": "208",
        "name": "Fake Love",
        "alias": "",
        "singer_name": "Drake",
        "all_singer_name": "",
        "genre": "嘻哈",
        "tag": "好听,新歌",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/277008589?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Fake+Love",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/026d7edc9469d5910dde3301847f3091/277008784/277008784.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/573a30051ea9f0125cdc21b9e038305c/277008585/277008585.jpg",
        "album_name": "Fake Love",
        "album_url": "http://music.baidu.com/album/277008579",
        "score": "0",
        "publish_time": "2016-11-04",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "16509"
      },
      {
        "id": "846457060",
        "duration": "219",
        "name": "Niggas In Paris",
        "alias": "",
        "singer_name": "JAY Z,Kanye West",
        "all_singer_name": "",
        "genre": "嘻哈",
        "tag": "",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/130202808?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Niggas+In+Paris",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/132597892/132597892.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/130207140/130207140.jpg",
        "album_name": "Top Five",
        "album_url": "http://music.baidu.com/album/130202702",
        "score": "0",
        "publish_time": "0000-00-00",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "90"
      },
      {
        "id": "851508785",
        "duration": "267",
        "name": "Because Of You",
        "alias": "",
        "singer_name": "Ne-Yo",
        "all_singer_name": "",
        "genre": "R&B,节奏布鲁斯",
        "tag": "唯美,喜悦,情人节,旅行,汽车,甜蜜,节奏布鲁斯,轻松",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/1790591?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Because+Of+You",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/122992781/122992781.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/5ca0d5d20fc5d41878033d5f035d0d3e/119220883/119220883.jpg",
        "album_name": "Because Of You",
        "album_url": "http://music.baidu.com/album/2469803",
        "score": "0",
        "publish_time": "2013-11-29",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "11797"
      },
      {
        "id": "851515427",
        "duration": "234",
        "name": "Love Yourself",
        "alias": "",
        "singer_name": "Justin Bieber",
        "all_singer_name": "",
        "genre": "",
        "tag": "好听,欧美",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/257613380?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Love+Yourself",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/511b0e40283f616c6657847a320f73b8/257613559/257613559.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/0171bb5aa87aba5a7aabdd2a5b79c727/257807696/257807696.jpg",
        "album_name": "Purpose",
        "album_url": "http://music.baidu.com/album/257807665",
        "score": "0",
        "publish_time": "2015-11-13",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "73868"
      },
      {
        "id": "852299516",
        "duration": "273",
        "name": "Candy",
        "alias": "",
        "singer_name": "LL Cool J",
        "all_singer_name": "",
        "genre": "嘻哈",
        "tag": "",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/1636167?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Candy",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/238607622/238607622.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/136174816/136174816.jpg",
        "album_name": "Phenomenon",
        "album_url": "http://music.baidu.com/album/1360777",
        "score": "0",
        "publish_time": "2015-02-16",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "0"
      },
      {
        "id": "853034358",
        "duration": "225",
        "name": "Diamonds",
        "alias": "",
        "singer_name": "Rihanna",
        "all_singer_name": "",
        "genre": "流行",
        "tag": "",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/89321974?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Diamonds",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/89322669/89322669.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/4853d9e95a657d85b3341f23a3acbbaa/102330189/102330189.jpg",
        "album_name": "Diamonds",
        "album_url": "http://music.baidu.com/album/89321967",
        "score": "0",
        "publish_time": "2013-10-07",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "5931"
      },
      {
        "id": "853893882",
        "duration": "210",
        "name": "Black Widow",
        "alias": "",
        "singer_name": "Iggy Azalea,Rita",
        "all_singer_name": "",
        "genre": "",
        "tag": "",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/268430429?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Black+Widow",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/3060a9d7f0743eddd8e569ed6a1e96da/268448342/268448342.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/adff50a94c19769a7d4766e6fd7c870f/268429460/268429460.jpg",
        "album_name": "The New Classic",
        "album_url": "http://music.baidu.com/album/268429448",
        "score": "0",
        "publish_time": "2016-08-03",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "80"
      },
      {
        "id": "854010435",
        "duration": "184",
        "name": "Kiss It Better",
        "alias": "",
        "singer_name": "Rihanna",
        "all_singer_name": "",
        "genre": "",
        "tag": "",
        "language": "",
        "original_singer": "",
        "composer": "",
        "lyricist": "",
        "url": "http://music.baidu.com/song/266069829?fm=altg_new3",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=Kiss+It+Better",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/d074db162f877575194e628f5e1e1e13/266069950/266069950.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/55bea5b033997b9bb07e702c277893b1/266069817/266069817.jpg",
        "album_name": "Kiss It Better",
        "album_url": "http://music.baidu.com/album/266069804",
        "score": "0",
        "publish_time": "2016-06-01",
        "publish_company": "环球唱片",
        "is_need_pay_listen": "0",
        "from_site": "1",
        "hot": "436"
      }
    ]
  },
  "message": ""
}
```
 其中status 为0返回正常，其它异常

### 获取某首歌的最新播放地址

请求参数
  * url: http://s.xiaodu.baidu.com/v20161223/resource/musicstreamurl?id=846122617
  * id : [歌曲列表接口](#获取某个歌单下的歌曲列表)中返回的id

返回值：
```javascript
{
  "status": 0,
  "code": null,
  "data": {
    "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/ec75bbd373de776107be888a4dab4596/263815849/263815849.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3"
  },
  "message": ""
}
```
