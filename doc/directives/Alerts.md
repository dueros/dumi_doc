## Alerts数据结构
### <span id="alert_struct">AlertsStruct</span>
```javascript
AlertsStruct = {
	"token": string,// 唯一标识
	"type": string,// Alert类型 TIMER|ALARM
	"scheduled_time": string,// Alert触发时间，秒级时间戳
	"content": string, // Alert事件名称
    
     // ####### 接入完整能力不要关注此字段#########
	"extensions": ExtensionsStruct json, // 可选，额外信息，qu能力级别输出携带，例如接入完整能力的A音箱则没有该字段，接入qu能力的B手机助手则有该字段|mateapp携带
}
```
```javascript
ExtensionsStruct = {
	"start_time": int, // 开始时间
	"content": string, // 事件名称
	"duration": int, // timer时长
	"repeat_type": string, // 重复类型 day|week|month|year
	"repeat_week": int, // 可选，重复星期 从低位到高位表示星期一到星期日
	"repeat_month": int, // 可选，重复月 从低位到高位表示1~12月
	"repeat_year": string, // 可选， 重复年 12-1，8-2
	"special_calender": string, // 农历，lunar
    "special_day": string, // 工作日, weekday
}
```


### SetAlert Directive
1、客户端通过语音创建alarm、timer
2、mateapp重新开启已经创建的alarm、timer
3、mateapp更新已经创建的alarm、timer

```javascript
 {
	 "header": {
	     "namespace": "Alerts",
         "name": "SetAlert",
         "message_id": string,
     },
     "payload": AlertsStruct,// 见Alerts数据结构
 }
```

### SetAlertSucceeded Event
客户端在收到SetAlert Directive后成功创建Alert必须向DCS上报SetAlertSucceeded Event
```javascript
{
    "header": {
        "namespace": "Alerts",
        "name": "SetAlertSucceeded"
    },
    "payload": {
       "token": string,// 唯一标识
    }
}
```

### SetAlertFailed Event
客户端在收到SetAlert Directive后未成功创建Alert必须向DCS上报SetAlertFailed Event
```javascript
{
    "header": {
        "namespace": "Alerts",
        "name": "SetAlertFailed"
    },
    "payload": {
       "token": string,// 唯一标识
    }
}
```

### DeleteAlert Directive
DCS下发DeleteAlert Directive场景：
1、客户端通过语音删除alarm、timer
2、客户端通过语音停止响铃的alarm、timer
2、mateapp删除alarm、timer
3、mateapp暂停已经创建的alarm

```javascript
 {
	 "header": {
	     "namespace": "Alerts",
         "name": "DeleteAlert",
         "message_id": string,
     },
     "payload":{
		"token": string,// 唯一标识
	}
 }
```

### DeleteAlertSucceeded Event
客户端在收到DeleteAlert Directive后成功删除Alert必须向DCS上报DeleteAlertSucceeded Event
```javascript
{
    "header": {
        "namespace": "Alerts",
        "name": "DeleteAlertSucceeded"
    },
    "payload": {
       "token": string,// 唯一标识
    }
}
```

### DeleteAlertFailed Event
客户端在收到DeleteAlert Directive后未成功删除Alert必须向DCS上报DeleteAlertfailed Event
```javascript
{
    "header": {
        "namespace": "Alerts",
        "name": "DeleteAlertFailed"
    },
    "payload": {
       "token": string,// 唯一标识
    }
}
```

### AlertStarted Event
Alert到触发时间响铃必须向DCS上报AlertStarted  Event
```javascript
{
    "header": {
        "namespace": "Alerts",
        "name": "AlertStarted"
    },
    "payload": {
		"token": string,// 唯一标识
	 }
}
```
### AlertStopped Event
Alert停止正在响铃的Alert必须向DCS上报AlertStopped Event
```javascript
{
    "header": {
        "namespace": "Alerts",
        "name": "AlertStoped"
    },
    "payload": {
		"token": string,// 唯一标识
	 }
}
```


## 前后台切换
### AlertEnteredForeground Event
```javascript
{
    "header": {
        "namespace": "Alerts",
        "name": "AlertEnteredForeground"
    },
    "payload": {
		"token": string,// 唯一标识
	 }
}
```

### AlertEnteredBackground Event
```javascript
{
    "header": {
        "namespace": "Alerts",
        "name": "AlertEnteredBackground"
    },
    "payload": {
		"token": string,// 唯一标识
	 }
}
```
