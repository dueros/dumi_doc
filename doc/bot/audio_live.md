直播功能输出：
服务名：audio_live

直播返回示例:
```javascript
// 播放北京台

{
  "data": {
    "directives": [
      {
        "header": {
          "namespace": "AudioPlayer",
          "name": "Play",
          "message_id": "1488285070_053fydydo"
        },
        "payload": {
          "play_behavior": "REPLACE_ALL",
          "audio_item": {
            "audio_item_id": "2007",
            "stream": {
              "token": "2007",
              "url": "http://hls.qingting.fm/live/4851.m3u8?bitrate=1000",
              "stream_format": "AUDIO_M3U8",
              "offset_ms": 0
            }
          }
        }
      }
    ],
    "speech": {
      "type": "Text",
      "content": "播放北京动听调频MetroRdiao 来自蜻蜓FM"
    },
    "resource": {
      "type": "live_ref",
      "data": {
        "api": {
          "method": "GET",
          "url": "http://s.xiaodu.baidu.com/v20161223/resource/live?user_id=DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768"
        }
      }
    }
  }
}
```


### 1、电台列表
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/live/channelList
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid|string|是|设备ID，设备的唯一标识
category|string|否|分类 (国家，网络，省市，本地，音乐，体育，交通，曲艺等)
province|string|否|省
la|string|当category为本地，必须|纬度
lo|string|当category为本地，必须|经度
page|int|否|页码，默认为1
pagesize|int|否|每页数据量，默认为10
appid|string|是|必须|标识请求的端

返回格式：
```javascript
{
  "status": 0,
  "code": 200,
  "data": {
    "page": 1,
    "total_page": 10,
    "list": [
      {
        "channel_id": 1,
        "channel_name": "北京文艺广播",
        "attr_province": "北京",       
        "freq_fm": "",
        "media_info": [
          {
            "play_url": "http://hls.qingting.fm/live/333.m3u8?bitrate=1000",
            "pic": {
              "small": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!small",
              "medium": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!medium",
              "large": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!large"
            },
            "program_name": "娱乐有范儿",
            "source": "蜻蜓FM",
            "source_icon": "http://123.jpg"
          },
          {
            "play_url": "http://live.xmcdn.com/live/94/64.m3u8?transcode=ts",
            "pic": {
              "small": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_small.jpg",
              "medium": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_large.jpg",
              "large": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_large.jpg"
            },
            "program_name": "娱乐有范儿",
            "source": "喜马拉雅",
            "source_icon": "http://123.jpg"
          },
          {
            "play_url": "http://trslbs.itings.com/016f63815d64d4db/1600000000459/playlist.m3u8",
            "pic": {
              "small": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg",
              "medium": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg",
              "large": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg"
            },
            "program_name": "娱乐有范儿",
            "source": "考拉",
            "source_icon": "http://123.jpg"
          }
        ],
        "update_time": "2016-02-12 13:00:00",
        "create_time": "2016-02-11 14:00:00"
      }
    ]
  }
}
```

### 2、获取播放列表接口：
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/live/playlist
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid	|string	|是	|设备ID，设备的唯一标识
page|int|否|页码，默认为1
pagesize|int|否|每页数据量，默认为10
appid|string|是|必须|标识请求的端

返回格式：
```javascript
{
  "status": 0,
  "code": 200,
  "data": {
    "page": 1,
    "total_page": 10,
    "list": [
      {
        "channel_id": 1,
        "channel_name": "北京文艺广播",
        "attr_province": "北京",      
        "freq_fm": "",
        "media_info": [
          {
            "play_url": "http://hls.qingting.fm/live/333.m3u8?bitrate=1000",
            "pic": {
              "small": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!small",
              "medium": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!medium",
              "large": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!large"
            },
            "program_name": "娱乐有范儿",
            "source": "蜻蜓FM",
            "source_icon": "http://123.jpg"
          },
          {
            "play_url": "http://live.xmcdn.com/live/94/64.m3u8?transcode=ts",
            "pic": {
              "small": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_small.jpg",
              "medium": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_large.jpg",
              "large": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_large.jpg"
            },
            "source": "喜马拉雅",
            "source_icon": "http://123.jpg"
          },
          {
            "play_url": "http://trslbs.itings.com/016f63815d64d4db/1600000000459/playlist.m3u8",
            "pic": {
              "small": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg",
              "medium": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg",
              "large": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg"
            },
            "program_name": "娱乐有范儿",
            "source": "考拉",
            "source_icon": "http://123.jpg"
          }
        ],
        "update_time": "2016-02-12 13:00:00",
        "create_time": "2016-02-11 14:00:00"
      }
    ]
  }
}
```

### 3、播放历史接口
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/live/history
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid	|string	|是	|设备ID，设备的唯一标识
page|int|否|页码，默认为1
pagesize|int|否|每页数据量，默认为10
appid|string|是|必须|标识请求的端

返回格式：
```javascript
{
  "status": "0",
  "code": "200",
  "data": [
    "page": 1,
    "total_page": 10,
    "list": [
      {
        "record_id": 6366998,
        "channel_id": 23,
        "channel_name": "北京音乐广播",
        "media_url": "http://hls.qingting.fm/live/4991.m3u8?bitrate=1000",
        "last_program": "环球音乐",
        "create_time": "2016-02-12 14:00:00",
        "update_time": "2016-02-12 15:00:00",
        "source": "喜马拉雅",
        "source_icon": "http://123.jpg"
      }
    ]
  }
}
```
### 4、播放地址接口
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/live/playurl
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid	|string	|是	|设备ID，设备的唯一标识
channel_id|int|是|电台ID
appid|string|是|必须|标识请求的端
```javascript
{
  "status": 0,
  "code": 200,
  "data": [
        //可能有蜻蜓、喜马拉雅、考拉一个或多个资源方
        {
            "play_url": "http://hls.qingting.fm/live/333.m3u8?bitrate=1000",
            "source": "蜻蜓FM",
            "source_icon": "http://123.jpg"
        },
        {
            "play_url": "http://live.xmcdn.com/live/94/64.m3u8?transcode=ts",
            "source": "喜马拉雅FM",
            "source_icon": "http://123.jpg"
          },
          {
             "play_url": "http://trslbs.itings.com/016f63815d64d4db/1600000000459/playlist.m3u8",
             "source": "考拉FM",
             "source_icon": "http://123.jpg"
          }
    ]
}
```

直播槽位

intent|slot|slot_name|slot_value|优先级|举例
------|----|---------|----------|------|----
intent::audio.live.play 直播播放|搜索源|search_list|空(所有电台列表) / favorite (收藏列表)|P1|	
||电台名|channel|归一化后的电台名 或query中 认为是电台名的词语|P0|例如query"播放北京乱七八糟电台",channel为“乱七八糟”
||一级地域|province|湖南|P0|	
||二级地域|city|长沙|P0|	
||内容分类|category|（音乐）台|P0|	
||调频|fm|调频，fm|P0|	
||调频频率|freq|87.6|P0|	
||节目名|program||开心茶馆	
intent::audio.live.ask.channel 直播channel相关问答|频道名|channel|值：this（本频道）or具体频道名，如“北京故事广播”|P0|这个频道信息，凤凰娱乐节目信息
||节目名|program|值：空 or 具体节目名|P1|放午夜书场的是什么频道
||主持人|artist|修饰|P1|
||专辑|album|修饰|P1|
||剧集|episode|修饰|P1|	
||播放状态|playing|修饰|P1|	
intent::audio.live.ask.program 直播program相关问答|频道名|program|值:this(本节目） or 具体节目名，如‘音乐旅途’|P1|	
intent::audio.live.ask.artist 直播(艺人/主持人/主讲人)相关问答|主持人|artist|值：this（当前主持人）or 具体主持人名，如‘张三’|P1|这个主持人的信息
intent::audio.live.ask.album 直播album相关问答|专辑名|album|值：this（当前专辑） or 具体专辑名称|P1|	
intent::audio.live.ask.episode 直播剧集相关问答|剧集数|ask_sum|总共多少集|P1|总共多少集|
||当前第几集|now_index|第几集|P1|现在第几集
intent::audio.live.ask.playing 直播playing相关问答|频道|channel|值：this（当前频道在播放什么） or 具体频道在播放什么|P1|cnr文艺之声在播放什么，这是在播什么
intent::audio.live.favorite.channel 收藏电台|动作|action|like(收藏)、unlike(取消收藏)|P0|	
||频道名|channel|为空时收藏or删除收藏当前电台，非空时，收藏or删除收藏指定电台名|	P1|	
intent::audio.live.favorite.program收藏节目|动作|action|like(收藏)、unlike(取消收藏)|P1|	
||节目|program|为空时收藏or删除收藏当前节目，非空时，收藏or删除收藏指定节目|P1|
intent::audio.live.favorite.artist 收藏(艺人/主持人/主讲人)|动作|action|like(收藏)、unlike(取消收藏)|P1|	
||主持人|artist|为空时收藏or删除收藏当前主持人，非空时，收藏or删除收藏指定主持人|P1|
intent::audio.live.favorite.album |收藏专辑|动作|action|like(收藏)、unlike(取消收藏)|P1|
||专辑|album|为空时收藏or删除收藏当前专辑，非空时，收藏or删除收藏指定专辑|P1|	
