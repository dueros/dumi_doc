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
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/resource/live/channelList
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid|string|是|设备ID，设备的唯一标识
category|string|否|分类 (国家，网络，省市，音乐，体育，交通，曲艺等)
province|string|否|省
page|int|否|页码，默认为1
pagesize|int|否|每页数据量，默认为10

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
        "program_name": "娱乐有范儿",
        "attr_province": "北京",
        "attr_city": "北京",
        "attr_class": "文艺",
        "freq_fm": "",
        "media_info": {
          "qiting": {
            "url": "http://hls.qingting.fm/live/333.m3u8?bitrate=1000",
            "thumbs": {
              "small": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!small",
              "medium": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!medium",
              "large": "http://pic.qingting.fm/2015/0828/20150828111022698.jpg!large"
            },
            "source": "蜻蜓FM",
            "source_icon": "http://123.jpg"
          },
          "ximalaya": {
            "url": "http://live.xmcdn.com/live/94/64.m3u8?transcode=ts",
            "thumbs": {
              "small": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_small.jpg",
              "medium": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_large.jpg",
              "large": "http://fdfs.xmcdn.com/group6/M08/A9/12/wKgDhFUKl1jyghlVAABRqWHVL_g545_mobile_large.jpg"
            },
            "source": "喜马拉雅",
            "source_icon": "http://123.jpg"
          },
          "kaola": {
            "url": "http://trslbs.itings.com/016f63815d64d4db/1600000000459/playlist.m3u8",
            "thumbs": {
              "small": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg",
              "medium": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg",
              "large": "http://img.kaolafm.net/mz/images/201607/5d54a015-4700-4b6e-a2b4-8f08c2918209/default.jpg"
            },
            "source": "考拉",
            "source_icon": "http://123.jpg"
          }
        },
        "update_time": "2016-02-12 13:00:00",
        "create_time": "2016-02-11 14:00:00"
      }
    ]
  }
}
```

### 2、获取播放列表接口：
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/resource/live/playlist
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid	|string	|是	|设备ID，设备的唯一标识
page|int|否|页码，默认为1
pagesize|int|否|每页数据量，默认为10


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
        "channel_name": "CNR中国之声",
        "program_name": "都市夜归人",
        "thumbs": {
          "small": "http://123.jpg",
          "medium": "http://223.jpg",
          "large": "http://124.jpg"
        },
        "attr_province": "中国",
        "attr_city": "",
        "attr_class": "新闻",
        "freq_fm": "",
        "media_url": {
          "qiting": "http://hls.qingting.fm/live/4991.m3u8?bitrate=1000"
        },
        "source": "蜻蜓FM",
        "update_time": "2016-02-12 13:00:00",
        "create_time": "2016-02-11 14:00:00"
      }
    ]
  }
}
```

### 3、播放历史接口
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/resource/live/history
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid	|string	|是	|设备ID，设备的唯一标识
page|int|否|页码，默认为1
pagesize|int|否|每页数据量，默认为10

返回格式：
```javascript
{
  "status": "0",
  "code": "200",
  "data": {
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
        "source": "喜马拉雅"
      }
    ]
  }
}
```
