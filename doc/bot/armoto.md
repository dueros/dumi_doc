armoto 类，目前没有多轮交互，而且只支持query理解，不会返回内容，所以请忽略除[nlu](../OPENAPI_README.md#nlu)结构外的其他字段

所以以下示例，返回值只是.result.nlu的内容，先放一个完整内容的示例

```javascript
{
    "result": {
        "nlu": {
            "domain": "control",
            "intent": "ai.dueros.control.SysCommand",
            "slots": {
                "cmd": "emit"
            }
        },
        "bot_id": "ai.dueros.bot.system_control_armoto",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "度秘为你找到如下结果"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "度秘为你找到如下结果"
        }
    },
    "id": "1498017775_821adojn9",
    "logid": "14980177754515",
    "user_id": "lihao21_debug_monitor",
    "time": 1498017775,
    "cuid": "lihao21_debug_monitor",
    "se_query": "发射空气炮",
    "msg": "ok",
    "timeuse": 594,
    "status": 0
}
```

### ai.dueros.control.SetVolume 声音控制
slot key|slot value
--------|----------
vol_up|代表声音增大
vol_down|代表声音变小
vol_set_size|max: 最大；min: 最小

声音减小
声音调到最大
```javascript
{
    "domain": "control",
    "intent": "ai.dueros.control.SetVolume",
    "slots": {
        "vol_down": "变小"
    }
}
```


### ai.dueros.control.SetBrightness 屏幕控制
slot key|slot value
--------|----------
up|代表屏幕亮度增大
down|代表屏幕亮度变小

屏幕亮度减小
```javascript
{
    "domain": "control",
    "intent": "ai.dueros.control.SetBrightness",
    "slots": {
        "up": "高"
    }
}
```

### ai.dueros.control.SysCommand  设备控制
slots：

slot key|slot value
--------|----------
cmd|emit、change_color、close_light、change_shape、open_cap

变色、变身
```javascript
{
    "domain": "control",
    "intent": "ai.dueros.control.SysCommand",
    "slots": {
        "cmd": "change_color"
    }
}
```

### ai.dueros.control.OperateApp  系统应用控制
slots：

slot key|slot value
--------|----------
app_name|代表app名字
open|代表打开，若缺失也代表打开app_name

变色、变身
```javascript
{
    "domain": "control",
    "intent": "ai.dueros.control.OperateApp",
    "slots": {
        "app_name": "灯光控制",
        "open": "进入"
    }
}
```
