# Smart Home Skill API Reference

<!-- MarkdownTOC -->

1. [简介](#%E7%AE%80%E4%BB%8B)
1. [认证](#%E8%AE%A4%E8%AF%81)
1. [Skill指令](#skill%E6%8C%87%E4%BB%A4)
  1. [Header](#header)
  1. [Payload](#payload)
  1. [发现设备\(Discovery Message\)](#%E5%8F%91%E7%8E%B0%E8%AE%BE%E5%A4%87discovery-message)
    1. [DiscoverAppliancesRequest](#discoverappliancesrequest)
    1. [DiscoverAppliancesResponse](#discoverappliancesresponse)
  1. [控制设备\(Control Message\)](#%E6%8E%A7%E5%88%B6%E8%AE%BE%E5%A4%87control-message)
    1. [打开关闭设备\(On/Off Messages\)](#%E6%89%93%E5%BC%80%E5%85%B3%E9%97%AD%E8%AE%BE%E5%A4%87onoff-messages)
    1. [可控灯光设备\(Tunable Lighting Control Messages\)](#%E5%8F%AF%E6%8E%A7%E7%81%AF%E5%85%89%E8%AE%BE%E5%A4%87tunable-lighting-control-messages)
    1. [可控温度设备\(Temperature Control Messages\)](#%E5%8F%AF%E6%8E%A7%E6%B8%A9%E5%BA%A6%E8%AE%BE%E5%A4%87temperature-control-messages)
    1. [可控风速设备\(Fan Speed Control Messages\)](#%E5%8F%AF%E6%8E%A7%E9%A3%8E%E9%80%9F%E8%AE%BE%E5%A4%87fan-speed-control-messages)
  1. [查询状态\(Query Message\)](#%E6%9F%A5%E8%AF%A2%E7%8A%B6%E6%80%81query-message)
    1. [查询空气质量](#%E6%9F%A5%E8%AF%A2%E7%A9%BA%E6%B0%94%E8%B4%A8%E9%87%8F)
  1. [错误消息\(Error Message\)](#%E9%94%99%E8%AF%AF%E6%B6%88%E6%81%AFerror-message)
    1. [用户故障\(User Faults\)](#%E7%94%A8%E6%88%B7%E6%95%85%E9%9A%9Cuser-faults)

<!-- /MarkdownTOC -->

## 简介

该协议实现度秘终端互联互通的目的，达到通过使用支持DuerOS能力的设备，控制灯泡等被控设备的效果。

## 认证

Smart Home Skill API 遵循 OAuth2.0 规范。
从 DuerOS 发送到 厂商Bot 的每个请求都包含 OAuth 的 access token。

## Skill指令

所有的指令(Directives)，不论是DuerOS发送给Bot还是Bot返回给DuerOS，都是同一个结构，包含以下两个顶层字段：
* Header
* Payload

### Header

Header包含 命名空间、指令名称、目标版本和唯一消息标识符。以下是典型的消息Header的JSON示例：
```
{
    "header": {
        "messageId": "6d6d6e14-8aee-473e-8c24-0d31ff9c17a2",
        "name": "DiscoverAppliancesRequest",
        "namespace": "DuerOS.ConnectedHome.Discovery",
        "payloadVersion": "1"
    }
}
```

Header必须包含以下属性：

|Property | Description |
|---|---|
|messageID | 单个请求或响应的唯一标识符。 这用于跟踪目的，Bot应该记录此信息，尽管它不应用于支持业务逻辑。 来自Bot的每条消息都必须填充此字段。 任何字符串数字字符和短于128个字符的字符串都是有效的，但是推荐使用随机数生成的UUID版本4 UUID。 |
|name | 指令的名称，如 DiscoverAppliancesRequest 和 DiscoverAppliancesResponse |
|namespace | 指定消息payload的类别。 目前的类别有： DuerOS.ConnectedHome.Discovery、DuerOS.ConnectedHome.Control、DuerOS.ConnectedHome.Query |
|payloadVersion | 标识payload的版本号 |

### Payload

Payload的内容取决于在Header中的name值。
以下部分描述不同类型的指令，及其预期的payload描述和示例。

|Task | Namespace | Message Names |
|---|---|---|
|Discover connected devices | DuerOS.ConnectedHome.Discovery | DiscoverAppliancesRequest、DiscoverAppliancesResponse|
|Control connected devices; turn things off and on and change settings | DuerOS.ConnectedHome.Control |TurnOnRequest、TimingTurnOnRequest、TurnOffRequest、IncrementBrightnessRequest、DecrementBrightnessRequest、IncrementTemperatureRequest、DecrementTemperatureRequest、SetTemperatureRequest、IncrementFanSpeedRequest、DecrementFanSpeedRequest、SetModeRequest、TimingSetModeRequest |
|Query connected devices for their current state | DuerOS.ConnectedHome.Query | GetAirPM25Request |

### 发现设备(Discovery Message)

该消息类型用于发现可用的设备，确定其使用场景和功能。

#### DiscoverAppliancesRequest

**例子：**

“小度小度，查找我的设备”

**目的：**

发现与最终用户的设备云帐户相关的设备和场景。DiscoverAppliancesRequest 从 DuerOS 发送到 Bot。如果没有设备可以发现，或者您的设备云是否遇到错误，则 Bot 应返回一个空的 DiscoverAppliancesResponse，而不是错误消息。

##### Header

|Property | Value |
|---|---|
|name | DiscoverAppliancesRequest |
|namespace | DuerOS.ConnectedHome.Discovery |

##### Payload

|Property | Description | Required |
|---|---|---|
|accessToken | 与用户设备云帐号相关的access token | Yes |

DiscoverAppliancesRequest例子：
```
{
    "header": {
        "messageId": "6d6d6e14-8aee-473e-8c24-0d31ff9c17a2",
        "name": "DiscoverAppliancesRequest",
        "namespace": "DuerOS.ConnectedHome.Discovery",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken": "*OAuth Token here*"
    }
}
```

#### DiscoverAppliancesResponse

**目的：**

返回与最终用户的设备云帐户相关的所有设备的能力。是Bot对 DiscoverAppliancesRequest 的预期响应。如果没有发现设备或者您的设备云遇到错误，请返回一个空的 discoveryAppliances 数组。 DiscoverAppliancesResponse 指令包含与您的能力和数据相关联的设备列表，如：
* 用户标识的名称和描述
* 设备类型，如light 和 scene
* 每个设备或场景支持的操作

##### Header

|Property | Value |
|---|---|
|name | DiscoverAppliancesResponse |
|namespace | DuerOS.ConnectedHome.Discovery |

##### Payload

|Property | Description | Required |
|---|---|---|
|discoveredAppliances | discoveredAppliance 对象的数组，该对象包含可发现设备或场景，与用户设备帐户相关联的。 如果没有与用户帐户关联的设备或场景，此属性应包含一个空数组。 如果发生错误，该属性可以为null。 阵列中允许的最大项目数量为300。discoveryAppliance对象的每个属性如下所示 | Yes |
|discoveredAppliance.applianceTypes | 包含字符串的数组，其中字符串，表示所连接设备的类别，如LIGHT；或者表示场景。有关支持的字符串的完整列表，请参阅设备类别。任何其他字符串将被拒绝。 | Yes |
|discoveredAppliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。| Yes |
|discoveredAppliance.manufacturerName | 设备制造商的名称。此值不能超过128个字符。| Yes |
|discoveredAppliance.modelName | 设备型号名称。此值不能超过128个字符。 | Yes |
|discoveredAppliance.version | 供应商提供的设备版本。此值不能超过128个字符。 | Yes |
|discoveredAppliance.friendlyName | 用户用来识别设备的名称。 此值不能超过128个字符，不应包含特殊字符或标点符号。| Yes |
|discoveredAppliance.friendlyDescription | 设备的可读描述。 此值不能超过128个字符。 描述应包含设备连接方式的描述。 例如，“通过Wink连接的WiFi温控器”。| Yes |
|discoveredAppliance.isReachable | true表示设备当前可达; 否则，false。| Yes |
|discoveredAppliance.actions | 设备可支持的action的数组。合法的action包括： <br>turnOn<br/> <br>timingTurnOn<br/> <br>turnOff<br/> <br>incrementBrightness<br/> <br>decrementBrightness<br/> <br>incrementTemperature<br/> <br>decrementTemperature<br/> <br>setTemperature<br/> <br>incrementFanSpeed<br/> <br>decrementFanSpeed<br/> <br>setMode<br/> <br>timingSetMode<br/>| Yes |
|discoveredAppliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

设备 和 场景 类型:

|Value | Description | Notes |
|---|---|---|
|WASHING_MACHINE| 洗衣机等设备 ||
|AIR_CONDITION| 空调等设备 ||
|RANGE_HOOD | 抽油烟机等设备 | |
|LIGHT| 代表光源的设备 ||
|CURTAIN | 窗帘等设备 | |
|ACTIVITY_TRIGGER| 描述设置为特定状态的设备的组合，状态必须以特定顺序变更。例如，“观看优酷视频”场景可能需要 (1)打开电视机; (2)打开HDMI1。| |
|SCENE_TRIGGER| 描述设置为特定状态的设备的组合，状态不必以特定顺序变更。 例如睡眠模式可能包括关闭灯光和拉上窗帘，但是顺序不重要。| |

注：在 场景 类型的appliance下，需对 friendlyDescription 和 friendlyName 的命名有一定规范：

* friendlyDescription 的值内容必须包含“场景”及场景提供的设备厂商。如 “来自*厂商*的场景”. 此值不能超过128个字符。
* friendlyName 是用户用来与您的场景交互并且必须存在的名称。目的是让用户以自然而轻松的方式控制场景。friendlyName应遵循以下准则： 
    * 首选项，仅包括场景名称。这为用户控制场景提供了最简单和最自然的方式
    * 可选，包括房间名称，如果在不同的房间提供类似的场景
    * 可选，包括房间“场景”
    * 可选，包括场景名称和房间名称之间的介词，如“在”
    * 不能包含特殊字符活标点符号
    * 不能超过128个字符

DiscoverAppliancesResponse 例子：

```
{
 "header":{
    "messageId":"ff746d98-ab02-4c9e-9d0d-b44711658414",
    "name":"DiscoverAppliancesResponse",
    "namespace":"DuerOS.ConnectedHome.Discovery",
    "payloadVersion": "1"
 },
 "payload":{
    "discoveredAppliances":[
       {
          "actions":[
            "turnOn",
            "turnOff",
            "incrementBrightness",
            "decrementBrightness"
          ],
          "applianceTypes":[
             "LIGHT"
          ],
          "additionalApplianceDetails":{
             "extraDetail1":"optionalDetailForSkillAdapterToReferenceThisDevice",
             "extraDetail2":"There can be multiple entries",
             "extraDetail3":"but they should only be used for reference purposes.",
             "extraDetail4":"This is not a suitable place to maintain current device state"
          },
          "applianceId":"uniqueLightDeviceId",
          "friendlyDescription":"展现给用户的详细介绍",
          "friendlyName":"卧室",
          "isReachable":true,
          "manufacturerName":"设备制造商的名称",
          "modelName":"fancyLight",
          "version":"your software version number here."
       },
       {
          "actions":[
             "turnOn",
             "turnOff"
          ],
          "applianceTypes":[
             "CURTAIN"
          ],
          "additionalApplianceDetails":{
             "extraDetail1":"optionalDetailForSkillAdapterToReferenceThisDevice",
             "extraDetail2":"There can be multiple entries",
             "extraDetail3":"but they should only be used for reference purposes.",
             "extraDetail4":"This is not a suitable place to maintain current device state"
          },
          "applianceId":"uniqueSwitchDeviceId",
          "friendlyDescription":"展现给用户的详细介绍",
          "friendlyName":"卧室的窗帘",
          "isReachable":true,
          "manufacturerName":"设备制造商的名称",
          "modelName":"fancyCurtain",
          "version":"your software version number here."
       },
      {
        "actions": [
          "turnOn",
          "turnOff"
        ],
        "applianceTypes":[
          "SCENE_TRIGGER"
        ],
        "additionalApplianceDetails": {
          "extraDetail1": "detail about the scene",
          "extraDetail2": "another detail about scene",
          "extraDetail3": "only be used for reference purposes."
        },
        "applianceId": "uniqueDeviceId",
        "friendlyDescription": "来自设备商的场景",
        "friendlyName": "回家模式",
        "isReachable": true,
        "manufacturerName": "yourManufacturerName",
        "modelName": "提供场景的设备型号",
        "version": "your software version number here."
      }
    ]
 }
}
```

### 控制设备(Control Message)

#### 打开关闭设备(On/Off Messages)

消息类型打开或关闭目标设备。这些消息通常由几种不同类型的设备使用。
* TurnOnRequest
* TurnOnConfirmation
* TimingTurnOnRequest
* TimingTurnOnConfirmation
* TurnOffRequest
* TurnOffConfirmation

##### TurnOnRequest

**例子：**
“小度小度，打开 *设备名*”

**目的：**
DuerOS发送给Bot的打开设备的请求

###### Header

|Property|Value|
|---|---|
|name|TurnOnRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

TurnOnRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "TurnOnRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        }
    }
}
```

##### TurnOnConfirmation

**度秘返回的结果例子：**
“*设备name*已打开”

**目的：**
表示设备已经被成功打开。表示Bot返回给DuerOS的打开成功的结果

###### Header

|Property|Value|
|---|---|
|name| TurnOnConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

TurnOnConfirmation 例子：
```
{
    "header": {
        "messageId": "26fa11a8-accb-4f66-a272-8b1ff7abd722",
        "name": "TurnOnConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {}
}
```

##### TimingTurnOnRequest

**例子：**
“小度小度，定时1分钟后打开 *设备名*”

**目的：**
DuerOS发送给Bot的打开设备的请求

###### Header

|Property|Value|
|---|---|
|name|TimingTurnOnRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| timestamp | 表示设备定时设置的量的对象。包含一个属性值，它指定一个数字，代表时间戳。 | No |

TimingTurnOnRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "TimingTurnOnRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "timestamp": {
            "value": 1496741861
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        }
    }
}
```

##### TimingTurnOnConfirmation

**度秘返回的结果例子：**
“*设备name*已定时成功”

**目的：**
表示设备已经被成功定时。表示Bot返回给DuerOS的打开成功的结果

###### Header

|Property|Value|
|---|---|
|name| TimingTurnOnConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

TimingTurnOnConfirmation 例子：
```
{
    "header": {
        "messageId": "26fa11a8-accb-4f66-a272-8b1ff7abd722",
        "name": "TimingTurnOnConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {}
}
```

##### TurnOffRequest

**例子：**
“小度小度，关闭 *设备名*”

**目的：**
DuerOS发送给Bot的关闭设备的请求

###### Header

|Property|Value|
|---|---|
|name|TurnOffRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

TurnOffRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "TurnOffRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### TurnOffConfirmation

**度秘返回的结果例子：**
“*设备name*已关闭”

**目的：**
表示设备已经被成功关闭。表示Bot返回给DuerOS的关闭成功的结果

###### Header

|Property|Value|
|---|---|
|name| TurnOffConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

TurnOffConfirmation 例子：
```
{
    "header": {
        "messageId": "26fa11a8-accb-4f66-a272-8b1ff7abd722",
        "name": "TurnOffConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {}
}
```

#### 可控灯光设备(Tunable Lighting Control Messages)

##### IncrementBrightnessRequest

**例子：**
“小度小度，把卧室的灯调亮一点”

**目的：**
DuerOS发送给Bot的调亮灯光的请求

###### Header

|Property|Value|
|---|---|
|name|IncrementBrightnessRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaBrightness | 表示设备的亮度提高的量的对象。包含一个属性值，它指定一个double类型的数字，表示设备亮度调整的值，其有效范围为0.0000至1.0000。 | Yes |

TurnOnRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "IncrementBrightnessRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "deltaBrightness": {
            "value": 0.500
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### IncrementBrightnessConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备亮度调高成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| IncrementBrightnessConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| brightness | double类型，表示亮度增加后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.brightness | double类型，表示亮度增加前的值。 | Yes |

TurnOnConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "IncrementBrightnessConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "brightness": {
                "value": 0.5
            }
        },
        "brightness": {
            "value": 1.0
        }
    }
}
```

##### DecrementBrightnessRequest

**例子：**
“小度小度，把卧室的灯调暗一点”

**目的：**
DuerOS发送给Bot的调低灯光亮度的请求

###### Header

|Property|Value|
|---|---|
|name|DecrementBrightnessRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaBrightness | 表示设备的亮度提高的量的对象。包含一个属性值，它指定一个double类型的数字，表示设备亮度调整的值，其有效范围为0.0000至1.0000。 | Yes |

DecrementBrightnessRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "DecrementBrightnessRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "deltaBrightness": {
            "value": 0.500
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### DecrementBrightnessConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备亮度调低成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| DecrementBrightnessConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| brightness | double类型，表示亮度增加后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.brightness | double类型，表示亮度增加前的值。 | Yes |

DecrementBrightnessConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "DecrementBrightnessConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "brightness": {
                "value": 1.0
            }
        },
        "brightness": {
            "value": 0.5
        }
    }
}
```

#### 可控温度设备(Temperature Control Messages)

##### IncrementTemperatureRequest

**例子：**
“小度小度，把卧室的温度调高一点”

**目的：**
DuerOS发送给Bot的调高温度的请求

###### Header

|Property|Value|
|---|---|
|name|IncrementTemperatureRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaTemperature | 表示设备的温度变化的量的对象。包含一个属性值，它指定一个数字。 | Yes |

IncrementTemperatureRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "IncrementTemperatureRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "deltaTemperature": {
            "value": 2.0
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### IncrementTemperatureConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备温度调高成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| IncrementTemperatureConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| temperature | double类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | Yes |
| previousState.temperature | double类型，表示设置之前的值。 | Yes |

IncrementTemperatureConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "IncrementTemperatureConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "mode": {
                "value": "AUTO"
            },
            "temperature": {
                "value": 21.0
            }
        },
        "temperature": {
            "value": 25.0
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

##### DecrementTemperatureRequest

**例子：**
“小度小度，把卧室的温度调低一点”

**目的：**
DuerOS发送给Bot的调低温度的请求

###### Header

|Property|Value|
|---|---|
|name|DecrementTemperatureRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaTemperature | 表示设备的温度变化的量的对象。包含一个属性值，它指定一个数字。 | Yes |

DecrementTemperatureRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "DecrementTemperatureRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "deltaTemperature": {
            "value": 2.0
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### DecrementTemperatureConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备温度调低成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| DecrementTemperatureConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| temperature | double类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | Yes |
| previousState.temperature | double类型，表示设置之前的值。 | Yes |

DecrementTemperatureConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "DecrementTemperatureConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "mode": {
                "value": "AUTO"
            },
            "temperature": {
                "value": 25.0
            }
        },
        "temperature": {
            "value": 23.0
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

##### SetTemperatureRequest

**例子：**
“小度小度，把卧室的温度设置为20度”

**目的：**
DuerOS发送给Bot的设置温度的请求

###### Header

|Property|Value|
|---|---|
|name|SetTemperatureRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| targetTemperature | 表示设备的温度设置的量的对象。包含一个属性值，它指定一个数字。 | Yes |

SetTemperatureRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "SetTemperatureRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "targetTemperature": {
            "value": 2.0
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### SetTemperatureConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备温度设置成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| SetTemperatureConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| temperature | double类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | Yes |
| previousState.temperature | double类型，表示设置之前的值。 | Yes |

SetTemperatureConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "SetTemperatureConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "mode": {
                "value": "AUTO"
            },
            "temperature": {
                "value": 25.0
            }
        },
        "temperature": {
            "value": 23.0
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

#### 可控风速设备(Fan Speed Control Messages)

##### IncrementFanSpeedRequest

**例子：**
“小度小度，把空调的风速增加一点”

**目的：**
DuerOS发送给Bot的调高风速的请求

###### Header

|Property|Value|
|---|---|
|name|IncrementFanSpeedRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaFanSpeed | 表示设备的风速变化的量的对象。包含一个属性值，它指定一个double类型的数字，表示设备风速调整的值，其有效范围为0.0000至1.0000。 | Yes |

IncrementFanSpeedRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "IncrementFanSpeedRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "deltaFanSpeed": {
            "value": 0.5
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### IncrementFanSpeedConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备风速调高成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| IncrementFanSpeedConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| fanSpeed | double类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | Yes |
| previousState.fanSpeed | double类型，表示设置之前的值。 | Yes |

IncrementFanSpeedConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "IncrementFanSpeedConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "mode": {
                "value": "AUTO"
            },
            "fanSpeed": {
                "value": 0.5
            }
        },
        "fanSpeed": {
            "value": 1.0
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

##### DecrementFanSpeedRequest

**例子：**
“小度小度，把空调的风速降低一点”

**目的：**
DuerOS发送给Bot的调低风速的请求

###### Header

|Property|Value|
|---|---|
|name|DecrementFanSpeedRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaFanSpeed | 表示设备的风速变化的量的对象。包含一个属性值，它指定一个double类型的数字，表示设备风速调整的值，其有效范围为0.0000至1.0000。 | Yes |

DecrementFanSpeedRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "DecrementFanSpeedRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "deltaFanSpeed": {
            "value": 0.5
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### DecrementFanSpeedConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备风速调低成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| DecrementFanSpeedConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| fanSpeed | double类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | Yes |
| previousState.fanSpeed | double类型，表示设置之前的值。 | Yes |

DecrementFanSpeedConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "DecrementFanSpeedConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "mode": {
                "value": "AUTO"
            },
            "fanSpeed": {
                "value": 1.0
            }
        },
        "fanSpeed": {
            "value": 0.5
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

##### SetModeRequest

**例子：**
“小度小度，把空调的模式调整为制冷”

**目的：**
DuerOS发送给Bot的设置模式的请求

###### Header

|Property|Value|
|---|---|
|name|SetModeRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| mode | 表示设备的模式设置的量的对象。包含一个属性值，它指定一种模式。 | Yes |

SetModeRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "SetModeRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "mode": {
            "value": "AUTO"
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### SetModeConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备模式设置成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| SetModeConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | Yes |

SetModeConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "SetModeConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "mode": {
                "value": "COOL"
            }
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

##### TimingSetModeRequest

**例子：**
“小度小度，1分钟后把空调的模式调整为制冷”

**目的：**
DuerOS发送给Bot的设置模式的请求

###### Header

|Property|Value|
|---|---|
|name|TimingSetModeRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| mode | 表示设备的模式设置的量的对象。包含一个属性值，它指定一种模式。 | Yes |
| timestamp | 表示设备定时设置的量的对象。包含一个属性值，它指定一个数字，代表时间戳。 | Yes |

TimingSetModeRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "TimingSetModeRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "mode": {
            "value": "AUTO"
        },
        "timestamp": {
            "value": 2.0
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### TimingSetModeConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备模式设置成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| TimingSetModeConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | Yes |

TimingSetModeConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "TimingSetModeConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "mode": {
                "value": "COOL"
            }
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

### 查询状态(Query Message)

#### 查询空气质量

##### GetAirPM25Request

**例子：**
“小度小度，查一下卧室pm2.5”

**目的：**
DuerOS发送给Bot的设置模式的请求

###### Header

|Property|Value|
|---|---|
|name|GetAirPM25Request|
|namespace|DuerOS.ConnectedHome.Query|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceID | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

GetAirPM25Request 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "GetAirPM25Request",
        "namespace": "DuerOS.ConnectedHome.Query",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]",
        }
    }
}
```

##### GetAirPM25Confirmation

**度秘返回的结果例子：**
“当前卧室pm2.5为100”

**目的：**
表示设备查询结果成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| GetAirPM25Confirmation |
|namespace| DuerOS.ConnectedHome.Query |

###### Payload

|Property|Description|Required|
|---|---|---|
| PM25 | 表示当前PM2.5的数值。 | Yes |

GetAirPM25Confirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "GetAirPM25Confirmation",
        "namespace": "DuerOS.ConnectedHome.Query",
        "payloadVersion": "1"
    },
    "payload": {
        "PM25": {
            "value": 100
        }
    }
}
```

### 错误消息(Error Message)

当 DuerOS 向 Bot 发送控制请求时，可能会出现不同种类的错误，如果需要，Bot应返回相应的错误类型和信息。Bot不需要返回每个错误类型，仅返回错误对应的故障类型。本节中列出了错误类型和详细信息。除非另有说明，否则错误消息不适用于设备发现，并且不应返回错误消息作为对DiscoverAppliancesRequest的响应。

用户故障：由于用户错误操作，请求可能会无效，会发生以下这些错误。 例如，用户要求将空调设置为1000度。
* ValueOutOfRangeError
* TargetOfflineError
* NoSuchTargetError
* BridgeOfflineError

Bot故障：当请求有效时，由于硬件问题或限制，也可能会出现以下这些错误，Bot无法完成所需的任务。
* DriverInternalError
* DependentServiceUnavailableError
* NotSupportedInCurrentModeError
* RateLimitExceededError
* TargetBridgeConnectivityUnstableError
* TargetFirmwareOutdatedError
* TargetBridgeFirmwareOutdatedError
* TargetHardwareMalfunctionError
* TargetBridgeHardwareMalfunctionError
* TargetConnectivityUnstableError
* TargetHardwareMalfunctionError
* UnableToGetValueError
* UnableToSetValueError
* UnwillingToSetValueError

其他故障：当请求中的数据内容无法满足时，会发生这些错误; 认证令牌无效，或技能适配器无法满足请求的其他方面。
* ExpiredAccessTokenError
* InvalidAccessTokenError
* UnsupportedTargetError
* UnsupportedOperationError
* UnsupportedTargetSettingError
* UnexpectedInformationReceivedError

#### 用户故障(User Faults)
