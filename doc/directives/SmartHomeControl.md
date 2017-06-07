# SmartHomeControl

## Table of Contents


   * [SmartHomeControl](#smarthomecontrol)
      * [Table of Contents](#table-of-contents)
      * [总体逻辑](#总体逻辑)
      * [上报SmartHomeControl状态](#上报smarthomecontrol状态)


## 总体逻辑

这个协议用于用一个可以语音交互的设备，去控制可联网的其它设备

客户端在请求中上报当前可以被控制的设备列表，da如果识别出语音请求是在操作设备列表中的某个设备（比如用户说：“打开客厅的电视”，设备列表中存在一项“客厅的电视”），就会返回设备控制的intent，并在槽位中加上target_device字段


## 上报SmartHomeControl状态

在[请求](../api/request.md)中的device_status字段

```javascript
"device_status":{
    "SmartHomeControl":{
        "target_devices":[
            {"name":"客厅的电视","id":"xxxxxx","type":"duer_iot"},//type、id可选
            {"name":"厨房的音箱","id":"yyy"}
        ],
    },
},
```

target_devices是设备列表，一个设备的描述包含如下字段
  * name 必选，设备名字，会用这个值做query的匹配
  * id 可选，代表设备id
  * type 可选，设备类型，代表

被用户query选中要操作的设备，以上设备描述字段会完整的发给bot（会放在da解析的槽位中），由bot完成最终的控制操作（比如调用设备云接口），并且由bot返回给用户的反馈（指在主控设备上的反馈）
