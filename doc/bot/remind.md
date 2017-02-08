# remind bot输出schema

## 创建提醒(intent：remind)
打电话返回的完整例子:
```javascript
//query=明天上午8点提醒我起床
{
  "result": {
    "bot_id": "remind",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "list",
        "list": [
          {
            "title": "起床",
            "summary": "为你设置了【起床】提醒。\n语音助手将于明天上午8点通知你",
            "url": "http://xiaodu.baidu.com/saiya/events",
            "image": "http://xiaodu.baidu.com/saiya/img/remind.png"
          }
        ]
      }
    ],
    "nlu": {
      "domain": "remind",
      "intent": "remind",
      "slots": {
        "event_title": "起床",
        "event_type": "wakeup",
        "intent": "设置",
        "remind_time": "{\"day\":\"next\",\"hour\":\"8\",\"apm\":\"am\"}",
        "remind_type_message": "否",
        "remind_type_phone": "否",
        "remind_type_dumi": "否",
        "remind_type_clock": "是",
        "remind_time_type": "abstime",
        "remind_time_data": "1486598400",
        "status": "create"
      }
    },
    "speech": {
      "type": "Text",
      "content": "为你设置了【起床】提醒。\n语音助手将于明天上午8点通知你"
    }
  },
  "id": "1486548437_49427afb0",
  "logid": "14865484374487",
  "user_id": "test",
  "time": 1486548437,
  "cuid": null,
  "se_query": "明天上午8点提醒我起床",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明

|slot |desc | value | 
|---|---|---|
|name | 名字 | 中文名 | 
|event_title | 提醒标题 | eg:起床| 
|event_type | 提醒事件类型 | eg:wakeup| 
|remind_time_data | 提醒设置的时间 | 1486598400| 
|remind_type_clock | 提醒触达方式闹钟 | 是|
|status| create |创建|

