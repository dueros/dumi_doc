image_satisfy 图片搜索（多模sdk），需要用多模sdk上传图片

所以以下示例，先放一个完整内容的示例

```javascript
{
  "result": {
    "resource": {
      "type": "image_satisfy",
      "data": {
        "hasResult": false,
        "category": "question",
        "url": "https://graph.baidu.com/s?tn=bdbox&sign=051fcfcf7f7d0c540b9f411487143582&session=YToxOntzOjEyOiJ0YW5zbGF0ZVNpZ24iO3M6MzI6IjA1MWZjZmNmN2Y3ZDBjNTQwYjlmNDExNDg3MTQzNTgyIjt9&f=question&itype=1&idctag=tc&bdImageExist=1&sids=10010_10026_10028_10002_10005_10101_10201_9999&logid=1582752350&uid=D5169D3E7F26822D7A7CC5C07D5AB3AD%7CDBB0AA0500001A&network=1_0&sdk_source=d18735b0316d01c62e65d8e5f4627398&sdk_version=1.0.0&sdk_ua=NzIwXzEyODBfYW5kcm9pZF81LjFfMzIw&sdk_ut=dml2byBWM00gQV81LjFfdml2bw%3D%3D&origin_version=1.0",
        "imgUrl": "http://graph.baidu.com/resource/051fcfcf7f7d0c540b9f411487143582.jpg"
      }
    },
    "bot_id": "image_satisfy",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "抱歉，未能找到图片中的题目。度秘教你如何拍照搜题。",
        "url": "https://graph.baidu.com/s?tn=bdbox&sign=051fcfcf7f7d0c540b9f411487143582&session=YToxOntzOjEyOiJ0YW5zbGF0ZVNpZ24iO3M6MzI6IjA1MWZjZmNmN2Y3ZDBjNTQwYjlmNDExNDg3MTQzNTgyIjt9&f=question&itype=1&idctag=tc&bdImageExist=1&sids=10010_10026_10028_10002_10005_10101_10201_9999&logid=1582752350&uid=D5169D3E7F26822D7A7CC5C07D5AB3AD%7CDBB0AA0500001A&network=1_0&sdk_source=d18735b0316d01c62e65d8e5f4627398&sdk_version=1.0.0&sdk_ua=NzIwXzEyODBfYW5kcm9pZF81LjFfMzIw&sdk_ut=dml2byBWM00gQV81LjFfdml2bw%3D%3D&origin_version=1.0"
      }
    ],
    "nlu": {
      "domain": "unknown",
      "intent": "unknown",
      "slots": {}
    },
    "speech": {
      "type": "Text",
      "content": "抱歉，未能找到图片中的题目。度秘教你如何拍照搜题。"
    }
  },
  "id": "1487214979_502aqt86i",
  "logid": "14872149798917",
  "user_id": "3596403",
  "time": 1487214979,
  "cuid": "D5169D3E7F26822D7A7CC5C07D5AB3AD|DBB0AA0500001A",
  "se_query": "http://graph.baidu.com/resource/051fcfcf7f7d0c540b9f411487143582.jpg",
  "msg": "ok",
  "status": 0
}
```



### fridge.info.agreement 查看用户协议
看看用户协议
用户协议是什么
用户协议有什么啊
看一下用户协议
```javascript
{
  "domain": "fridge",
  "intent": "fridge.info.agreement",
  "slots": {}
}
```

### fridge.info.service 查看服务
服务是什么
```javascript
{
  "domain": "fridge",
  "intent": "fridge.info.service",
  "slots": {}
}
```


### fridge.info.version  查看系统版本
现在系统是什么版本
```javascript
{
  "domain": "fridge",
  "intent": "fridge.info.version",
  "slots": {}
}
```


### fridge.setting.address  设置用户地址
我现在的地址是哪里
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.address",
  "slots": {}
}
```


### fridge.setting.mode 设置冰箱模式

slot key|slot value
--------|----------
mode| 自动 智能 速冻 休眠 假日 速冷 微冻 零度 冷饮 干货

进入速冻模式
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.mode",
  "slots": {
    "mode": "速冻"
  }
}
```


### fridge.setting.phone_bind 绑定手机
我该怎么绑定
怎么绑定APP
手机怎么控制冰箱
绑定教程看一下
看一下绑定教程
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.phone_bind",
  "slots": {
    "mode": "速冻"
  }
}
```


### fridge.connect
冰箱绑定了哪些设备
```javascript
{
  "domain": "fridge",
  "intent": "fridge.connect",
  "slots": {}
}
```
