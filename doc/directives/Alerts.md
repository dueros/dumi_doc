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

### DeleteAlert Directive

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
