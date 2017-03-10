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
  "code": "",
  "data": {
    "page": 1,
    "total_page": 5,
    "list": [
      {        
        "id": "1006090198",
        "duration": "252",
        "name": "黑雨",
        "alias": "",
        "singer_name": [
            "莫文蔚"
        ],
        "original_singer": [],
        "primitive_singer": [
            "莫文蔚"
        ],
        "album_info": [
            {
                "album_url": "http:\\/\\/music.baidu.com\\/album\\/179567",
                "album_url_md5": "5e1b2464c0fa0abac9369f89eb68e753",
                "album_id": "1043086642",
                "album_name": "x"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "lycUrl": "http://music.baidu.com/song/929759?fm=altg_new3#song_lyric",
        "lycContent": "歌词详情",
        "wap_lycUrl": "http://music.baidu.com/song/929759?fm=altg_new3",
        "lycDownload": "http://qukufile2.qianqian.com/data2/lrc/12459382/12459382.lrc",
        "url": "http://music.baidu.com/song/929759",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E9%BB%91%E9%9B%A8",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/124206198/124206198.jpg",
        "score": "0",
        "publish_time": "2003-09-01",
        "publish_company": "SONY MUSIC",
        "is_need_pay_listen": 0,
        "hot": "144",
        "from_site": 1,
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/42531820/42531820.mp3?xcode=1ddc85b4186134be718197b4a0f16666"

      },
      ....
    ]
  },
  "message": ""
}
```
### 获取某首歌的歌曲详情

请求参数
  * url: http://s.xiaodu.baidu.com/v20161223/resource/musicdetail?song_id=1006090198
  * id : [歌曲列表接口]中返回的id

返回值：
```javascript
{
  "status": 0,
  "code": ‘’,
  "data": {
        "id": "1006090198",
        "duration": "252",
        "name": "黑雨",
        "alias": "",
        "singer_name": [
            "莫文蔚"
        ],
        "original_singer": [],
        "primitive_singer": [
            "莫文蔚"
        ],
        "album_info": [
            {
                "album_url": "http:\\/\\/music.baidu.com\\/album\\/179567",
                "album_url_md5": "5e1b2464c0fa0abac9369f89eb68e753",
                "album_id": "1043086642",
                "album_name": "x"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "lycUrl": "http://music.baidu.com/song/929759?fm=altg_new3#song_lyric",
        "lycContent": "歌词详情",
        "wap_lycUrl": "http://music.baidu.com/song/929759?fm=altg_new3",
        "lycDownload": "http://qukufile2.qianqian.com/data2/lrc/12459382/12459382.lrc",
        "url": "http://music.baidu.com/song/929759",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E9%BB%91%E9%9B%A8",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/124206198/124206198.jpg",
        "score": "0",
        "publish_time": "2003-09-01",
        "publish_company": "SONY MUSIC",
        "is_need_pay_listen": 0,
        "hot": "144",
        "from_site": 1,
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/42531820/42531820.mp3?xcode=1ddc85b4186134be718197b4a0f16666"
  },
  "message": ""
}
```
其中status 为0返回正常，其它异常


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
    message: ""
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
        "id": "1004785648",
        "duration": "215",
        "name": "告白气球",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/266322553",
                "album_url_md5": "4ff9f62e9bdc0bfc4361efe9d219f86d",
                "album_id": "1045401856",
                "album_name": "周杰伦的床边故事"
            }
        ],
        "genre": [
            "R&B",
            "节奏布鲁斯"
        ],
        "tag": [
            "RnB",
            "节奏怨曲",
            "R&B",
            "节奏蓝调",
            "好听",
            "节奏布鲁斯"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/266322598",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E5%91%8A%E7%99%BD%E6%B0%94%E7%90%83",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/7d093104b5e3c0a92a95eea7e24456ff/273945517/273945517.jpg",
        "score": "0",
        "publish_time": "2016-06-24",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "854092",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/5d62ab148fc1d5f05c033409b6d07e84/266958163/266958163.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "998002844",
        "duration": "240",
        "name": "青花瓷",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/68674",
                "album_url_md5": "8ddd52a97c2aaeff6ca774c607573f03",
                "album_id": "1054918835",
                "album_name": "我很忙"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/354387",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E9%9D%92%E8%8A%B1%E7%93%B7",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/1df84db0f1cc0f7d92c9925b47e7fa7d/88389089/88389089.jpg",
        "score": "0",
        "publish_time": "2007-11-02",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "93427",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/d190bc80771bed15d5afd2e08672e194/64540063/64540063.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "964861563",
        "duration": "270",
        "name": "晴天",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/72257",
                "album_url_md5": "67a675d5ce7e9c2501f77855c9e69ec3",
                "album_id": "1011284556",
                "album_name": "叶惠美"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/816477",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E6%99%B4%E5%A4%A9",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/115434572/115434572.jpg",
        "score": "0",
        "publish_time": "2003-07-31",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "70453",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/64333975/64333975.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "1009088399",
        "duration": "229",
        "name": "夜曲",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/697896",
                "album_url_md5": "e8a4fd90e081275d4c2c00c6e06b6730",
                "album_id": "1011290034",
                "album_name": "十一月的萧邦"
            }
        ],
        "genre": "流行",
        "tag": [
            "寂寞",
            "纯音乐",
            "孤独",
            "孤单",
            "流行",
            "Absolute"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/1191265",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E5%A4%9C%E6%9B%B2",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/2ff7ed1d61b5473cd64d805577ddab36/115457137/115457137.jpg",
        "score": "0",
        "publish_time": "2005-11-01",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "106174",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/51403263/51403263.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "1003959977",
        "duration": "224",
        "name": "稻香",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/116177",
                "album_url_md5": "224c2d8eee1ea941a6cbd342a0c3d0d1",
                "album_id": "1009252782",
                "album_name": "魔杰座"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/1390840",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E7%A8%BB%E9%A6%99",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/97be3c1753fbf496315d4b4953e06ee2/274049124/274049124.jpg",
        "score": "0",
        "publish_time": "2008-10-14",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "21893",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/64358974/64358974.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "997036570",
        "duration": "269",
        "name": "简单爱",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/10735646",
                "album_url_md5": "94c999d194215d8204e9e80b873acf7c",
                "album_id": "1043072482",
                "album_name": "婚礼歌手 幸福情歌精选"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/10736444",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E7%AE%80%E5%8D%95%E7%88%B1",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/a882d5cbbc469ba95f3b6442a9db2aa3/117628079/117628079.jpg",
        "score": "0",
        "publish_time": "2010-02-08",
        "publish_company": "SONY MUSIC",
        "is_need_pay_listen": 0,
        "hot": "66379",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/41527060/41527060.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "996977531",
        "duration": "302",
        "name": "发如雪",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/697896",
                "album_url_md5": "e8a4fd90e081275d4c2c00c6e06b6730",
                "album_id": "1011290034",
                "album_name": "十一月的萧邦"
            }
        ],
        "genre": "流行",
        "tag": [
            "中国风",
            "伴奏",
            "Absolute",
            "流行",
            "纯音乐"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/1147070",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E5%8F%91%E5%A6%82%E9%9B%AA",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/2ff7ed1d61b5473cd64d805577ddab36/115457137/115457137.jpg",
        "score": "0",
        "publish_time": "2005-11-01",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "56316",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/51420821/51420821.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "1005362249",
        "duration": "276",
        "name": "红尘客栈",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/31496572",
                "album_url_md5": "2bb5adb0bb278e9169adcf97ecc8f63d",
                "album_id": "1054909997",
                "album_name": "十二新作"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/31496563",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E7%BA%A2%E5%B0%98%E5%AE%A2%E6%A0%88",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/1b62c0ccc53edc47a1152d9f004a31ce/115744261/115744261.jpg",
        "score": "0",
        "publish_time": "2012-12-06",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "47853",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/42744018/42744018.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "1006041007",
        "duration": "257",
        "name": "说好的幸福呢",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/116177",
                "album_url_md5": "224c2d8eee1ea941a6cbd342a0c3d0d1",
                "album_id": "1009252782",
                "album_name": "魔杰座"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/1392875",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E8%AF%B4%E5%A5%BD%E7%9A%84%E5%B9%B8%E7%A6%8F%E5%91%A2",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/97be3c1753fbf496315d4b4953e06ee2/274049124/274049124.jpg",
        "score": "0",
        "publish_time": "2008-10-14",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "34673",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/41604714/41604714.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
     },
     {
        "id": "1016008345",
        "duration": "263",
        "name": "烟花易冷",
        "alias": "",
        "singer_name": [
            "周杰伦"
        ],
        "original_singer": [],
        "primitive_singer": [
            "周杰伦"
        ],
        "album_info": [
            {
                "album_url": "http://music.baidu.com/album/67834",
                "album_url_md5": "c07513e19430c434d69618d15a0a9959",
                "album_id": "1050554398",
                "album_name": "跨时代"
            }
        ],
        "genre": "流行",
        "tag": [
            "流行"
        ],
        "language": "",
        "composer": [],
        "lyricist": [],
        "url": "http://music.baidu.com/song/228393",
        "same_name_url": "http://music.baidu.com/search?fm=altg_new3&key=%E7%83%9F%E8%8A%B1%E6%98%93%E5%86%B7",
        "head_image_url": "http://qukufile2.qianqian.com/data2/pic/21d4d618a2b1a077bb7332cb6d09fe0b/274045307/274045307.jpg",
        "score": "0",
        "publish_time": "2010-05-18",
        "publish_company": "杰威尔JVR音乐有限公司",
        "is_need_pay_listen": 0,
        "hot": "49779",
        "from_site": "baidu",
        "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/41943072/41943072.mp3?xcode=b95fef1670a00875e4d6351b3c1b445d"
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
  "code": "",
  "data": {
    "streaming_vedio_url": "http://zhangmenshiting.baidu.com/data2/music/ec75bbd373de776107be888a4dab4596/263815849/263815849.mp3?xcode=e8a6f9d3d7ea39bc06d3b5c82f9312a3"
  },
  "message": ""
}
```
### 获取某首歌曲的歌词

请求参数
  * url: http://s.xiaodu.baidu.com/v20161223/resource/songlyric?song_id=991725450
  * song_id : [歌曲列表接口](#获取某个歌单下的歌曲列表)中返回的id

返回值：
```javascript
{
  "status": 0,
  "code": "",
  "data": {
        "lycUrl": "http://music.baidu.com/song/130244161?fm=altg_new3#song_lyric",
        "lycContent": "歌词内容",
        "lycDownload": "http://qukufile2.qianqian.com/data2/lrc/130488147/130488147.lrc"
  },
  "message": ""
}
```
