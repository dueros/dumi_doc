# VideoPlayer(非稳定版)

## Table of Contents

## VideoPlayer.Play指令
用户对音箱说“播放周杰伦的歌曲”、“播放郭德纲的相声”、"继续播放"、“下一首”、“上一首”、“下一个专辑”、“上一个专辑”都返回一个Play指令。
```json
{
    "header": {
        "namespace": "VideoPlayer", 
        "name": "Play", 
    },
    "payload": {
        "tips": "为您播放如下电视剧",
        "resource": {
            "resource_id": "102_50451",
            "resource_name": "欢乐颂",
            "director": "孔笙",
            "type": "都市,言情",
            "category": "电视剧",
            "actors": "刘涛,蒋欣,王子文,杨紫",
            "era": "2016",
            "season": "1",
            "poster_url": "http://10.0.11.10/poster/15860.jpg",
            "episode" : 14,
            "item_id": "102_50452",
            "token": "xxxx"
            "description": "心怀梦想的大龄胡同公主樊胜美能",
        }
    }
}
```
参数 | 描述 | 类型 | 必须
---- | --- | --- | ---
tips | 提示用户的信息, 可进行播放时的tips显示| string | 是
resource | 视频对象，包括元数据和播放token  | object | 是
resource.resource_id | 视频唯一ID   | string | 是
resource.resource_name   | 视频名称    | string | 是
resource.director | 该视频导演   | string | 是
resource.type | 视频二级分类(科幻/魔幻/言情/动作/武侠等)  | string | 是
resource.category | 视频类型(电影/电视剧/综艺/动漫/纪录片) | string | 是
resource.era | 出品年代  | int | 否
resource.season |第几季或者第几部   |  string | 否
resource.poster_url | 海报url地址   |  string | 是
resource.episode | 第几集   |  int | 否
resource.item_id | 电视剧某一集对应的id(不同合作方会不一样)   |  string | 否
resource.token | 该视频对应的播放token(不同合作方不同)   |  string | 是
resource.description | 该视频的剧情简介信息   |  string | 否



## PlaybackStarted事件
客户端开始播放的时候，需要上报此事件。
```json
"device_event":{
    "header": {
         "namespace": "VideoPlayer",
         "name": "PlaybackStarted",
         "message_id": "message_id-1xxxx"
      },
      "payload": {
          "token": "156",//客户的资源播放标识
          "resource_id": "98fd71c1523", //云端返回的视频资源唯一id
          "resource_name": "魔戒1",//资源的名称
          "category": "电影",// 资源的分类
          "episode" : 15,//如果是电视剧的话, 需要填写具体的集数
          "type": "[\"动作\", \"奇幻\", \"剧情\", \"冒险\"]",//资源所属的类型
      }
    }
```
## PlaybackStopped事件
用户说"停止播放"并执行了停止动作、或者退出了播放界面时 需要发送此事件.
```json
"device_event":{
    "header": {
         "namespace": "VideoPlayer",
         "name": "PlaybackFinished",
         "message_id": "message_id-1xxxx"
      },
      "payload": {
          "token": "156",
          "resource_id": "98fd71c1523", 
          "name": "魔戒1",
          "category": "电影",
          "episode" : 15,
          "type": "[\"动作\", \"奇幻\", \"剧情\", \"冒险\"]",
      }
    }
}
```

## 上报VideoPlayer状态（在请求中）
当用户正在播放电视魔戒时,询问: "该电影的导演是谁?", 需要在请求中带上这些信息,协助后端进行正确的解析.
```javascript
"device_status":{
    "VideoPlayer":{
        "token": "156",//客户的资源播放标识
        "resource_id": "98fd71c1523", //云端返回的视频资源唯一id
        "resource_name": "魔戒1",//资源的名称
        "category": "电影",// 资源的分类
        "episode" : 15,//如果是电视剧的话, 需要填写具体的集数
        "type": "[\"动作\", \"奇幻\", \"剧情\", \"冒险\"]",//资源所属的类型
    },
},
```


## FAQ


## Changelog
* 2017-6-3 初稿。
