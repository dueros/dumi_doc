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
  "message": null
}
