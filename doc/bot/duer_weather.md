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
      "intent": "sys_weather",  //（还包括：SYS_AQI、SYS_CLOTHES、SYS_CLOTHES、SYS_RAIN、SYS_SNOW、SYS_SUNNY、SYS_TEMP、SYS_ULTRAVIOLET、SYS_WIND、SYS_LOW_TEMP、SYS_HIGH_TEMP、SYS_EXERCISE、SYS_TRIP、SYS_WASH_CAR、SYS_INFLUENZA，均为小写）
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
