#Alerts 设备端能力要求

##连接网络
用户使用设备创建、删除Alerts，需要接受DCS（duer  conversation  service）下发的Directive去创建、删除Alert，创建、删除失败后必须向DCS上报Event。

##Alerts创建后在设备离线后可以正确触发
例如用户创建第二天早上8点的alarm后，设备断网，第二天早上8点alarm需要准时触发。

##支持本地重建Alerts
设备重启后需要能够在本地重建Alerts，这种场景下不需要向DCS上报Event。

#Alerts 流程
##基本Alerts流程
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/149b86d35ae902fa853a4eecaa8a5d6c57816155)
##通过设备实体交互停止响铃流程
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/373bf9939c691a59d3e80079bae581a037b12135)
##周期重复alarm流程
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/cec09e6dd874a76a2a83969c04a7e1f63888dfe4)
##删除Alerts流程
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/04d52d10de67abc6b2ff343810b1801e94e948c7)
##mateapp删除Alerts流程
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/c05bb16452a03febc55540f12f5c2c7dbcd128a5)


# Alerts接口协议

##输出能力级别定义
###all: 输出完整的Alerts能力
完整能力输出包括qu解析、Alerts业务逻辑、数据存储。

###qu: 仅输出qu能力
qu能力输出仅包括qu解析，接入端需要实现Alerts业务逻辑、数据存储。Alerts管理输出需要在输入Context中携带Alerts详细数据，且数据格式需是[duer约定格式](#alert_struct)。

##Alerts数据结构
###<span id="alert_struct">AlertsStruct</span>
```javascript {.theme-peacock}
AlertsStruct = {
	"token": string,// 唯一标识
	"type": string,// Alert类型 TIMER|ALARM
	"scheduled_time": string,// Alert触发时间，秒级时间戳
	"content": string, // Alert事件名称

	"extensions": ExtensionsStruct json, // 可选，额外信息，qu能力级别输出携带，例如接入完整能力的A音箱则没有该字段，接入qu能力的B手机助手则有该字段|mateapp携带
}
```
```javascript {.theme-peacock}
ExtensionsStruct = {
	"start_time": int, // 开始时间
	"content": string, // 事件名称
	"duration": int, // timer时长
	"repeat_type": string, // 重复类型 day|week|month|year
	"repeat_week": int, // 重复星期 从低位到高位表示星期一到星期日
	"repeat_month": int, // 重复月 从低位到高位表示1~12月
	"repeat_year": string, // 重复年 12-1，8-2
	"special_calender": string, // 农历，lunar
}
```


##AlertsState Context
客户端请求DCS、上报Event需要携带AlertsState Context
```javascript {.theme-peacock}
{
	"allAlerts": [
	    AlertsStruct,// 见Alerts数据结构
	 ],
	"activeAlerts": [
	    AlertsStruct,// 见Alerts数据结构
    ],
}
```

##Create
设备Alerts的本地创建，必须且只有在接受到DCS 的SetAlert Directive之后进行。
###SetAlert Directive
DCS下发SetAlert Directive场景：
1、客户端通过语音创建alarm、timer
2、mateapp重新开启已经创建的alarm、timer
3、mateapp更新已经创建的alarm、timer

```javascript {.theme-peacock}
 {
	 "header": {
	     "namespace": "Alerts",
         "name": "SetAlert",
         "message_id": string,
     },
     "payload": AlertsStruct,// 见Alerts数据结构
 }
```

###SetAlertSucceeded Event
客户端在收到SetAlert Directive后成功创建Alert必须向DCS上报SetAlertSucceeded Event
```javascript {.theme-peacock}
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

###SetAlertFailed Event
客户端在收到SetAlert Directive后未成功创建Alert必须向DCS上报SetAlertFailed Event
```javascript {.theme-peacock}
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

##Delete
设备Alerts的本地删除，必须且只有在接受到DCS 的SetAlert Directive之后进行。
###DeleteAlert Directive
DCS下发DeleteAlert Directive场景：
1、客户端通过语音删除alarm、timer
2、客户端通过语音停止响铃的alarm、timer
2、mateapp删除alarm、timer
3、mateapp暂停已经创建的alarm

```javascript {.theme-peacock}
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

###DeleteAlertSucceeded Event
客户端在收到DeleteAlert Directive后成功删除Alert必须向DCS上报DeleteAlertSucceeded Event
```javascript {.theme-peacock}
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

###DeleteAlertFailed Event
客户端在收到DeleteAlert Directive后未成功删除Alert必须向DCS上报DeleteAlertfailed Event
```javascript {.theme-peacock}
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

##Start and Stop
###AlertStarted Event
Alert到触发时间响铃必须向DCS上报AlertStarted  Event
```javascript {.theme-peacock}
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
###AlertStoped Event
Alert停止正在响铃的Alert必须向DCS上报AlertStoped Event
```javascript {.theme-peacock}
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


##前后台切换
###AlertEnteredForeground Event
```javascript {.theme-peacock}
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

###AlertEnteredBackground Event
```javascript {.theme-peacock}
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

#Alarm输出schema
##输出实例

###创建实例
```javascript {.theme-peacock}
{
    "result": {
        "bot_id": "alarm",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "directives":[
	         {
			    "header": {
			        "namespace": "SpeechSynthesizer",
			        "name": "Speak",
			        "message_id": "message_id-1344"
			    },
			    "payload": {
			        "token": "156",
			        "type": "Text",
			        "content": ["为你设置了【起床】提醒。\n度秘将于明天上午8点通知你"],
			        "speak_behavior": "REPLACE_ALL",
			        "should_get_next_speech": true
			    }
			}, 
	         {
				 "header": {
				     "namespace": "Alerts",
			         "name": "SetAlert",
			         "message_id": "test_message_id",
			     },
			     "payload": {
					"token": "test_token",
					"type": "ALARM",
					"scheduled_time": "1490774496",
				}
			 }
        ],
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "起床",
                        "summary": "为你设置了【起床】提醒。\n度秘将于明天上午8点通知你",
                        "url": "http://xiaodu.baidu.com/saiya/events",
                        "image": "http://xiaodu.baidu.com/saiya/img/remind.png"
                    }
                ]
            }
        ],
        "nlu": {
            "domain": "alarm",
            "intent": "alarm",
            "slots": {
                "event_title": "起床",
                "event_type": "wakeup",
                "alarm_time": "{\"day\":\"next\",\"hour\":\"8\",\"apm\":\"am\"}",
                "status": "create"
            }
        },
        "speech": {
            "type": "Text",
            "content": "为你设置了【起床】提醒。\n度秘将于明天上午8点通知你"
        }
    },
    "id": "1490616124_7372v4pbq",
    "logid": "14906161247428",
    "user_id": "2856",
    "time": 1490616124,
    "cuid": "test_1490616124403",
    "se_query": "明天上午8点提醒我起床",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "speech_id": "12345",
    "status": 0
}
```
###管理实例
```javascript {.theme-peacock}
{
  "result": {
	"directives":[
			 {
			    "header": {
			        "namespace": "SpeechSynthesizer",
			        "name": "Speak",
			        "message_id": "message_id-1344"
			    },
			    "payload": {
			        "token": "156",
			        "type": "Text",
			        "content": ["当前没有任何闹钟"],
			        "speak_behavior": "REPLACE_ALL",
			        "should_get_next_speech": true
			    }
			}, 
	         {
				 "header": {
				     "namespace": "Alerts",
			         "name": "DeleteAlert",
			         "message_id": "test_message_id",
			     },
			     "payload": {
					"token": "test_token",
					"type": "ALARM",
					"scheduled_time": "1490774496",
				}
			 }
    ],
    "views": [
      {
        "type": "txt",
        "content": "当前没有任何闹钟"
      }
    ],
    "speech": {
      "type": "Text",
      "content": "当前没有任何闹钟"
    },
    "bot_id": "alarm",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "nlu": {
      "domain": "alarm",
      "intent": "alarm_manage",
      "slots": {
        "action": "delete",
        "alarm_time": "null\n",
      }
    }
  },
  "id": "1490663709_4834c2s7b",
  "logid": "14906637094391",
  "user_id": "2856",
  "time": 1490663709,
  "cuid": "4B7163F0FD2B34",
  "se_query": "取消闹钟",
  "msg": "ok",
  "client_msg_id": "f67d63bb-917c-4c67-8fa8-be773ec913ba",
  "status": 0
}
```

##NLU
|slot |desc | value |
|---|---|---|
|intent|alarm意图|alarm,alarm_manage|
|action|alarm动作类型|create,list,update,delete|
|event_title | alarm标题 | eg:起床|
|event_type | alarm事件类型 | eg:wakeup|
|alarm_time|[alarm_time说明](#alarm_time)|json字符串
|scheduled_time | alarm设置的时间。只会在提醒创建前（即槽位完备）给出 | 1486598400|
|status| 状态 |status|

##<span id="alarm_time">alarm_time字段说明</span>
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

#timer输出schema
##输出实例
###创建实例
```javascript {.theme-peacock}
{
  "result": {
	"directives":[
			 {
			    "header": {
			        "namespace": "SpeechSynthesizer",
			        "name": "Speak",
			        "message_id": "message_id-1344"
			    },
			    "payload": {
			        "token": "156",
			        "type": "Text",
			        "content": ["5分钟，计时开始"],
			        "speak_behavior": "REPLACE_ALL",
			        "should_get_next_speech": true
			    }
			}, 
	         {
				 "header": {
				     "namespace": "Alerts",
			         "name": "SetAlert",
			         "message_id": "test_message_id",
			     },
			     "payload": {
					"token": "test_token",
					"type": "TIMER",
					"scheduled_time": "1490774496",
				}
			 }
        ],
    "views": [
      {
        "type": "txt",
        "content": "5分钟，计时开始"
      }
    ],
    "speech": {
      "type": "Text",
      "content": "5分钟，计时开始"
    },
    "bot_id": "timer",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "nlu": {
      "domain": "timer",
      "intent": "timer",
      "slots": {
        "intent": "create",
        "minute": "5",
      }
    }
  },
  "id": "1490664954_776f4315j",
  "logid": "14906649544030",
  "user_id": "2856",
  "time": 1490664954,
  "cuid": "4B7163F0FD2B34",
  "se_query": "5分钟倒计时",
  "msg": "ok",
  "client_msg_id": "f67d63bb-917c-4c67-8fa8-be773ec913ba",
  "status": 0
}
```

###timer管理实例
```javascript {.theme-peacock}
{
  "result": {
	"directives":[
			{
			    "header": {
			        "namespace": "SpeechSynthesizer",
			        "name": "Speak",
			        "message_id": "message_id-1344"
			    },
			    "payload": {
			        "token": "156",
			        "type": "Text",
			        "content": ["刚刚5分钟内没有设置过计时"],
			        "speak_behavior": "REPLACE_ALL",
			        "should_get_next_speech": true
			    }
			}, 
	         {
				 "header": {
				     "namespace": "Alerts",
			         "name": "DeleteAlert",
			         "message_id": "test_message_id",
			     },
			     "payload": {
					"token": "test_token",
					"type": "TIMER",
					"scheduled_time": "1490774496",
				}
			 }
        ],
    "views": [
      {
        "type": "txt",
        "content": "刚刚5分钟内没有设置过计时"
      }
    ],
    "speech": {
      "type": "Text",
      "content": "刚刚5分钟内没有设置过计时"
    },
    "bot_id": "timer",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "nlu": {
      "domain": "timer",
      "intent": "timer_manage",
      "slots": {
        "condition": "recent",
        "intent": "list",
      }
    }
  },
  "id": "1490665516_47484jz9e",
  "logid": "14906655159796",
  "user_id": "2856",
  "time": 1490665516,
  "cuid": "4B7163F0FD2B34",
  "se_query": "查看刚刚的倒计时",
  "msg": "ok",
  "client_msg_id": "f67d63bb-917c-4c67-8fa8-be773ec913ba",
  "status": 0
}
```

##NLU
|slot |Value |说明|
|---|---|---|
|minute|3|string. 3分|
|hour|2|string. 2小时|
|day|1|string. 1天|
|month|1|string. 1个月|
|year|2|string. 2年|
|week|1|string. 一周|
|condition|recent|string. 刚刚|


#mateapp 接口
##Alerts列表
`/saiya/alerts`
`method:GET`
`datatype:JSON`
`params:type=(ALARM|TIMER)`

###response
```javascript {.theme-peacock}
{
	"status": int, //状态码 0正确 其他错误
	"msg": string, // 错误信息
	"data": [
		AlertsStruct, // 见Alerts数据结构
		AlertsStruct, // 见Alerts数据结构
	]
}
```

##Alerts暂停
`/saiya/pause`
`method:POST`
`datatype:JSON`
###postbody
```javascript {.theme-peacock}
{
	"token": string, // 唯一标识
}
```

###response
```javascript {.theme-peacock}
{
	"status": int, //状态码 0正确 其他错误
	"msg": string, // 错误信息
	"data": null
}
```

##Alerts重新开启
`/saiya/enable`
`method:POST`
`datatype:JSON`
###postbody
```javascript {.theme-peacock}
{
	"token": string, // 唯一标识
}
```

##Alerts删除
`/saiya/delete`
`method:POST`
`datatype:JSON`
###postbody
```javascript {.theme-peacock}
{
	"token": string, // 唯一标识
}
```

###response
```javascript {.theme-peacock}
{
	"status": int, //状态码 0正确 其他错误
	"msg": string, // 错误信息
	"data": null
}
```

##Alerts更新
`/saiya/update`
`method:POST`
`datatype:JSON`
###postbody
```javascript {.theme-peacock}
AlertsStruct
```

###response
```javascript {.theme-peacock}
{
	"status": int, //状态码 0正确 其他错误
	"msg": string, // 错误信息
	"data": null
}
```

