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
![remind_create](img/remind_create.png)

### nlu部分的说明

|slot |desc | value | 
|---|---|---|
|name | 名字 | 中文名 | 
|event_title | 提醒标题 | eg:起床| 
|event_type | 提醒事件类型 | eg:wakeup| 
|remind_time_data | 提醒设置的时间 | 1486598400| 
|remind_type_clock | 提醒触达方式闹钟 | 是|
|status| create |创建|


## 查看提醒(intent：remind_manage)
打电话返回的完整例子:
```javascript
//query=查看我明天上午开会的提醒
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
        "type": "txt",
        "content": "暂时没有提醒哦，有任何需求可以告诉我，语音助手帮你记下来。"
      }
    ],
    "nlu": {
      "domain": "remind",
      "intent": "remind_manage",
      "slots": {
        "action": "list",
        "event_title": "开会",
        "remind_time": "{\"day\":\"next\",\"apm\":\"am\"}",
        "remind_type_message": "否",
        "remind_type_phone": "否",
        "remind_type_dumi": "否",
        "remind_type_clock": "否"
      }
    },
    "speech": {
      "type": "Text",
      "content": "暂时没有提醒哦，有任何需求可以告诉我，语音助手帮你记下来。"
    }
  },
  "id": "1486549266_6504f3o6a",
  "logid": "14865492666785",
  "user_id": "test",
  "time": 1486549266,
  "cuid": null,
  "se_query": "查看我明天上午开会的提醒",
  "msg": "ok",
  "status": 0
}
```
![remind_manage](img/remind_manage.png)

### nlu部分的说明

|slot |desc | value | 
|---|---|---|
|name | 名字 | 中文名 | 
|event_title | 提醒标题 | eg:起床| 
|remind_time | 提醒时间 | json | 
|action | 操作类型 | eg:list、update、delete，分别为查看、更新、删除| 

### 时间json内字段说明

|Key |Value |说明|
|---|---|---|
|minute |3, +2, -1|string. 3分，2分钟后，1分钟前|
|hour|2, +1, -3|string. 2点，1小时后，3小时前|
|day|1, +2, -3, -1,next, +0|string. 1号，2天后，3天前，昨天，明天，今天|
|month|1, +2, -3, +0|string. 1月，2个月后，3个月前，这个月|
|year|1984, +1, -2, +0|string. 1984年，明年，2年前，今年|
|week|+1, -1, 2, 3, 2+1|string. 下周，上一周，星期二，周三, 下周二|
|apm|am, pm|string. 上午，下午|
|const|recent, awhile|string. 刚刚，一会儿|
|repeat|day, month, year|string. 每天，每月，每年|
|special_day |weekend, weekday|string. 周末，工作日，节气，节日|
|special_calendar|lunar|string. 农历|
