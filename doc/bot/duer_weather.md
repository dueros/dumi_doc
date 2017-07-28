# weather bot输出schema

## 天气意图（intent：weather）
```javascript
//query = 今天天气咋样
{
  "result": {
    "resource": {
      "type": "weather",
      "data": {
        "city": "北京",
        "current_temp": "14℃",
        "pm25": "132",
        "temp": "11℃~25℃",
        "time": "周四 04月06日",
        "weather": "多云转阴",
        "weather_all": "多云转阴，11℃~25℃，南风微风",
        "wind": "南风微风",
		"clothes": {
			"level": "热",
			"sugg": "天气热，建议着短裙、短裤、短薄外套、T恤等夏季服装。"
		},
		"exercise": {
			"level": "较不宜",
			"sugg": "有降水，推荐您在室内进行低强度运动；若坚持户外运动，须注意选择避雨防滑并携带雨具。"
		},
		"influenza": {
			"level": "少发",
			"sugg": "各项气象条件适宜，无明显降温过程，发生感冒机率较低。"
		},
		"ultraviolet": {
			"level": "弱",
			"sugg": "紫外线强度较弱，建议出门前涂擦SPF在12-15之间、PA+的防晒护肤品。"
		},
		"wash_car": {
			"level": "不宜",
			"sugg": "不宜洗车，未来24小时内有雨，如果在此期间洗车，雨水和路上的泥水可能会再次弄脏您的爱车。"
		},
        "weather_info": [
          {
            "current_temp": "14℃",
            "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/bigicon/5.png",
            "pm25": "132",
            "pm_level": "轻度污染",
            "temp": "11℃~25℃",
            "time": "周四 04月06日",
            "weather": "多云转阴",
            "wind": "南风微风"
          },
          {
            "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/icon/3.png",
            "temp": "14℃~22℃",
            "time": "周五 04月07日",
            "weather": "阴",
            "wind": "南风微风"
          },
          {
            "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/icon/5.png",
            "temp": "7℃~19℃",
            "time": "周六 04月08日",
            "weather": "多云",
            "wind": "南风微风"
          },
          {
            "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/icon/5.png",
            "temp": "10℃~20℃",
            "time": "周日 04月09日",
            "weather": "多云转阴",
            "wind": "南风微风"
          },
          {
            "icon": "http://s1.bdstatic.com/r/www/aladdin/img/new_weath/icon/3.png",
            "temp": "10℃~21℃",
            "time": "周一 04月10日",
            "weather": "阴转晴",
            "wind": "南风微风"
          }
        ]
      }
    },
    "bot_id": "duer_weather",
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
            "title": "北京市今天多云转阴",
            "summary": "实时：14℃\n温度：11℃~25℃\n风力：南风微风\n空气质量指数：132，轻度污染\n来源：中国天气网",
            "url": "https://m.baidu.com/from=2001a/s?word=北京市天气",
            "image": "http://xiaodu.baidu.com/img/pic?pic_id=47950952"
          }
        ]
      }
    ],
    "nlu": {
      "domain": "duer_weather",
      "intent": "sys_weather",  //（还包括：SYS_AQI（空气指数）、SYS_CLOTHES(穿衣指数)、SYS_RAIN（下雨天）、SYS_SNOW（下雪天）
、SYS_SUNNY（晴天）、SYS_TEMP（温度）、SYS_ULTRAVIOLET（紫外线指数）、SYS_WIND（刮风天）、SYS_LOW_TEMP（低温）、SYS_HIGH_TEMP（高温）、SYS_EXERCISE（运动指数）、SYS_TRIP（旅行指数）、SYS_WASH_CAR（洗车指数）、SYS_INFLUENZA（感冒指数），均为小写
      "slots": {
        "loc_city": "北京市",
        "loc_province": "北京市",
        "time": "2017-04-06,2017-04-06"
      }
    },
    "speech": {
      "type": "Text",
      "content": "北京今天多云转阴，11℃~25℃，南风微风。空气质量指数为132，轻度污染。"
    }
  },
  "id": "1491444790_995cbnd5u",
  "logid": "14914447905270",
  "user_id": "test",
  "time": 1491444790,
  "cuid": null,
  "se_query": "天气咋样",
  "msg": "ok",
  "status": 0
}
```
