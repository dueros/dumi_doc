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
![remind_create](http://f.hiphotos.baidu.com/xiaodu/pic/item/574e9258d109b3ded96189eac5bf6c81810a4c51.jpg)

### nlu部分的说明

|slot |desc | value | 
|---|---|---|
|name | 名字 | 中文名 | 
|event_title | 提醒标题 | eg:起床| 
|event_type | 提醒事件类型 | eg:wakeup| 
|remind_time_data | 提醒设置的时间。只会在提醒创建前（即槽位完备）给出 | 1486598400| 
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
![remind_manage](http://c.hiphotos.baidu.com/xiaodu/pic/item/c9fcc3cec3fdfc03f85a8f3add3f8794a4c22615.jpg)

### nlu部分的说明

|slot |desc | value | 
|---|---|---|
|name | 名字 | 中文名 | 
|event_title | 提醒标题 | eg:起床| 
|remind_time | 提醒时间 | json | 
|action | 操作类型 | eg:list、update、delete，分别为查看、更新、删除| 

### 时间json内字段说明

remind_time如果不完备，会在多轮对话中不断的澄清，是一个中间结果

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

### 闹钟数据同步
 * 如果使用度秘的存储保存闹钟数据，通过请求度秘获取闹钟数据
 * URL: http://xiaodu.baidu.com/saiya/events/Index/clock 

```javascript
{
    "status": 0,
    "msg": "",
    "data": [
        //一次性的提醒，type : abstime
        {
            "type": "abstime",
            "time": 1482019200,  //闹钟响铃的时间 时间戳
            "id": "359482_1482019200",  
            "title": "我的生日",  // 闹钟的内容
            "clock_type": "normal"   //闹钟的类型：普通normal，还有叫早wakeup; 计时器timer 
        },

        //or
        //周期重复type:repeat_mult,  周 工作日  月  年 
        {
            "type": "repeat_mult",  
            "repeat_mult": {
                "name": "每周",
                "type": "week",  //week: 周， weekday:工作日，month：月， year：年
                "value": [
                    1    //周级别 1~7，   月 1~31，   年 101 ~1231 
                ]
            },
           
            "time": 1479686400, //闹钟响铃的时间 时间戳
            "terminal": null,
            "id": 525568,
            "title": "吃饭",
            "clock_type": "normal"
        },

        //or
        //每天重复type: absinterval  
        //其实考虑有每几天的重复，目前只每天
        {
            "terminal": "na_ios",
            "type": "absinterval",  //类型
            "repeat": {
                "type": "每天", 
                "value": 86400   //每多久触发一次，时间戳 ，单位：秒
            },
            "time": 1481241600,
            "id": 604866,
            "title": "吃饭",
            "clock_type": "normal"
        }
    ]
}
```
### 闹钟数据字段说明

|key |value|desc | 
|---|---|---|
|title | 吃饭| 提醒的title | 
|type | 重复类型 | eg:abstime| 
|time | 提醒时间 | 时间戳 | 
|clock_type | 闹钟类型 | eg:timer、normal、wakeup，分别为计时器、普通闹钟、起床闹钟| 


