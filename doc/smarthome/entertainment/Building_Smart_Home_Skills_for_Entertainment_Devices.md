# 为娱乐设备开发智能家居技能
适用于家庭娱乐/音频/视频类设备的智能家居技能，让用户可以通过语音控制他们的智能电视、有线电视盒子和其他娱乐设备。例如，适当配置智能家居技能后，用户可以表达：“小度小度，把电视音量调大一点”，这个时候电视的音量会被调大。下述文档概述了针对娱乐设备的智能家居技能的技术要求，包括特定指令和错误消息。

## 技术实现
以下提供了关于如何在娱乐设备上实现智能家居技能的技术细节。
当你为娱乐设备创建技能时，你需要确保在Smart Home Skill API中接收到娱乐设备控制的消息。要做到这一点，在创建技能时，需要选择协议3.0版本。

### 消息格式
DuerOS会把用户的请求转化为指令（directive）下发给你开发的技能，同时需要你返回一个事件（event）来说明请求执行成功或返回错误消息，DuerOS会根据返回的结果给予用户相应反馈。Smart Home Skill API中的娱乐设备控制通过API协议3.0版本来定义消息格式。一个终端（endpoint）的每个设备通过发现响应中的接口能力列表来描述。每个接口提供了一种交互协议，即从DuerOS向Skill下发指令和Skill向DuerOS上报事件。同时，在接口协议中定义了可报告属性，你可以返回一个事件来描述当前娱乐设备的状态。例如，如果一个设备可以切换频道，你可以通过 DuerOS.Discovery和DuerOS.ChannelController接口来实现，其中，把频道定义为一个可报告属性。

### 发现设备
描述设备时，你也需要描述每个设备具备的能力。API协议版本3.0和2.0在一些字段之间存在细微差异，你在描述设备的时候需要关注这些差异。下述表格将会告诉你应该如何描述一个娱乐设备。在表格中，也包含了相同字段在2.0协议中是如何描述的。

|Purpose|payload v2 field|payload v3 field|
|---|---|---|
|设备|appliance object|endpoint object|
|设备标识|applianceId	| endpointId|
|设备制造商名称|	manufacturerName	|manufacturerName
|用户用于标识设备的名称|	friendlyName|	friendlyName
|设备的可读描述|	friendlyDescription|	description
|提供给Bot使用的设备或场景相关的附加信息的键值对。|	 additionalApplianceDetails	|cookie <br>cookie属性下面的内容与 additionalApplianceDetails 一样的键值对<br/>|
|设备可支持的能力的数组|	actions array| capabilities array|
|设备型号名称|	modelName|	None
|设备当前可达|	isReachable|	None|
|设备在Duer App中展示的类型|	applianceTypes|	displayCategories - 娱乐设备该字段为空数组.|

以下代码示例展示了如何描述一个娱乐设备。关于设备发现消息的更多信息，请参阅：DuerOS.Discovery。

**发现娱乐设备的请求返回结果的例子**
```json
{
   "event":{
      "header":{
         "namespace":"DuerOS.Discovery",
         "name":"Discover.Response",
         "payloadVersion":"2",
         "messageId":"5f8a426e-01e4-4cc9-8b79-65f8bd0fd8a4"
       },
      "payload":{
         "endpoints":[
            {
               "endpointId":"appliance-001",
               "friendlyName":"Living Room Entertainment System",
               "description":" Entertainment System by Sample Manufacturer",
               "manufacturerName":"Sample Manufacturer",
               "displayCategories":[

               ],
               "cookie":{
                  "extraDetail1":"optionalDetailForSkillAdapterToReferenceThisDevice",
                  "extraDetail2":"There can be multiple entries",
                  "extraDetail3":"but they should only be used for reference purposes",
                  "extraDetail4":"This is not a suitable place to maintain current device state"
               },
               "capabilities":[
                  {
                     "type":"DuerOSInterface",
                     "interface":"DuerOS.Speaker",
                     "version":"1.0",
                     "properties":{
                        "supported":[
                           {
                              "name":"volume"
                           },
                           {
                              "name":"muted"
                           }
                        ]
                     }
                  },
                  {
                     "type":"DuerOSInterface",
                     "interface":"DuerOS.ChannelController",
                     "version":"1.0",
                     "properties":{
                        "supported":[
                           {
                              "name":"channel"
                           }
                        ]
                     }
                  },
                  {
                     "type":"DuerOSInterface",
                     "interface":"DuerOS.PlaybackController",
                     "version":"1.0",
                     "properties":{

                     }
                  },
                  {
                     "type":"DuerOSInterface",
                     "interface":"DuerOS.InputController",
                     "version":"1.0",
                     "properties":{
                        "supported":[
                           {
                              "name":"input"
                           }
                        ]
                     }
                  }
               ]
            }
         ]
      }
   }
}
```

### 娱乐设备的接口
为了执行用户所表达的请求，你需要解析DuerOS的请求并通过DuerOS.Response来上报事件返回结果。如果发生错误，你需要按正确格式返回错误消息。基于设备能力的消息已经在接口协议中定义。描述娱乐设备功能的接口协议如下表所示。

|操作|能力接口|
|---|---|
|打开、关闭设备|DuerOS.PowerController|
|改变设备的频道| DuerOS.ChannelController
|改变播放设备的输入 |DuerOS.InputController
|控制播放设备：快进、倒回、暂停|	DuerOS.PlaybackController
|改变音量	|DuerOS.Speaker
|代表错误发生	|DuerOS.ErrorResponse
