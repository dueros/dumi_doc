speaker_hardware 返回案例


```javascript
"data": {
    "directives": [
      {
        "header": {
          "namespace": "Speaker",
          "name": "SetVolume",
          "message_id": "1494329999_103fg56vq"
        },
        "payload": {
          "volume": 93
        }
      },
      {
        "header": {
          "namespace": "Speaker",
          "name": "SetMute",
          "message_id": "1494329999_18078ukiv"
        },
        "payload": {
          "mute": false
        }
      }
    ],
    "nlu": {
      "domain": "control.hardware",
      "intent": "control.hardware.volume",
      "slots": {
        "vol_up": "大",
        "vol_up_size": "0.50"
      }
    },
    "speech": {},
    "prompt": {},
    "resource": {},
    "views": [],
  }
 ```

### control.hardware.volume  调声音
可能的slots：

slot key|slot value
--------|----------
vol_down|小、高
vol_up|大、低
vol_set_size|50（指定值）如果值为小数，视为百分比

### nlu
声音调大50%

```javascript
{
	"domain": "control.hardware",
    "intent": "control.hardware.volume",
    "slots": {
        "vol_up": "大",
        "vol_up_size": "0.50"
    }
},
```
#### nlu部分的说明
intent | 说明
:--------:|:--------:
intent:control.hardware.volume |底层音箱调音
intent:control.hardware.micphone|底层音箱调麦克风
intent:control.hardware.bluetooth|底层音箱调蓝牙

### directives 部分的说明

参考[Speaker](../directives/Speaker.md)硬件相关指令
