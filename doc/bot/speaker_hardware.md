speaker_hardware 类，目前没有多轮交互，而且只支持query理解，不会返回内容，所以请忽略除[nlu](../OPENAPI_README.md#nlu)结构外的其他字段

所以以下示例，返回值只是.result.nlu的内容，先放一个完整内容的示例

```javascript
{
  "result": {
    "directives": [
      {
        "header": {
          "namespace": "Speaker",
          "name": "AdjustVolume",
          "message_id": "1487143420_639epx4xe"
        },
        "payload": {
          "volume": -10
        }
      }
    ],
    "speech": {
      "type": "Text",
      "content": ""
    },
    "bot_id": "speaker_hardware",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "音量"
      }
    ],
    "nlu": {
      "domain": "control.hardware",
      "intent": "control.hardware.volume",
      "slots": {
        "vol_down": "小"
      }
    }
  },
  "id": "1487143421_2899p99zs",
  "logid": "14871434202687",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1487143421,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "声音小一点",
  "msg": "ok",
  "status": 0
}
```

### control.hardware.volume  调声音
可能的slots：

slot key|slot value
--------|----------
vol_down|小、高
vol_up|大、低

声音小一点
```javascript
{
  "domain": "control.hardware",
  "intent": "control.hardware.volume",
  "slots": {
    "vol_down": "低"
  }
}
```
