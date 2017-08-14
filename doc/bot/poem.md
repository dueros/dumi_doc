# poem bot输出schema

## 度秘写诗
```javascript
//query = 写诗->中秋快乐
{
    "result": {
        "hint": [
            "换一首",
            "换主题句",
            "退出写诗",
            "只要文字",
            "换背景"
        ],
        "nlu": {
            "domain": "unknown",
            "intent": "unknown",
            "slots": {}
        },
        "bot_id": "poem",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "image",
                "list": [
                    {
                        "src": "http://xiaodu.baidu.com/img/pic?pic_id=55698631"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "欢歌笑语满堂香.喜看嫦娥舞霓裳.万户团圆人尽望.中秋佳节好时光."
        }
    },
    "id": "1498542896_4478zu8w5",
    "logid": "14985428962008",
    "user_id": "XXXXXXXEBE29BC13C7CBAADXEFXXXXXX|111118820888888",
    "time": 1498542896,
    "cuid": "XXXXXXXEBE29BC13C7CBAADXEFXXXXXX|111118820888888",
    "se_query": "中秋快乐",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "speech_id": "12345",
    "status": 0,
    "timeuse": 188
}
```
## 藏头诗
```javascript
//query = 藏头诗->度秘祝你快乐
{
    "result": {
        "hint": [
            "换一首",
            "换主题句",
            "退出写诗",
            "只要文字",
            "换背景"
        ],
        "nlu": {
            "domain": "unknown",
            "intent": "unknown",
            "slots": {}
        },
        "bot_id": "poem",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "image",
                "list": [
                    {
                        "src": "http://xiaodu.baidu.com/img/pic?pic_id=55688235"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "度诗挥墨添儒雅.秘词举书助境高.祝吟风情千万景.你唱故事万千情.快把灯笼坛上挂.乐凭影罩苑前藏."
        }
    },
    "id": "1498536521_6269nksfk",
    "logid": "14985365211616",
    "user_id": "XXXXXXXEBE29BC13C7CBAADXEFXXXXXX|111118820888888",
    "time": 1498536521,
    "cuid": "XXXXXXXEBE29BC13C7CBAADXEFXXXXXX|111118820888888",
    "se_query": "度秘祝你快乐",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "speech_id": "12345",
    "status": 0,
    "timeuse": 223
}
```