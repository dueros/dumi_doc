# Smart Home Skill API Reference

<!-- MarkdownTOC -->

- [简介](#%E7%AE%80%E4%BB%8B)
- [认证](#%E8%AE%A4%E8%AF%81)
- [Skill指令](#skill%E6%8C%87%E4%BB%A4)
  - [Header](#header)
  - [Payload](#payload)
  - [发现设备\(Discovery Message\)](#%E5%8F%91%E7%8E%B0%E8%AE%BE%E5%A4%87discovery-message)
    - [DiscoverAppliancesRequest](#discoverappliancesrequest)
    - [DiscoverAppliancesResponse](#discoverappliancesresponse)
  - [控制设备\(Control Message\)](#%E6%8E%A7%E5%88%B6%E8%AE%BE%E5%A4%87control-message)
    - [门锁控制及查询消息\(Door Lock Control and Query Messages\)](#%E9%97%A8%E9%94%81%E6%8E%A7%E5%88%B6%E5%8F%8A%E6%9F%A5%E8%AF%A2%E6%B6%88%E6%81%AFdoor-lock-control-and-query-messages)
    - [打开关闭设备\(On/Off Messages\)](#%E6%89%93%E5%BC%80%E5%85%B3%E9%97%AD%E8%AE%BE%E5%A4%87onoff-messages)
    - [摄像机设备消息\(Smart Home Camera Messages \)](#%E6%91%84%E5%83%8F%E6%9C%BA%E8%AE%BE%E5%A4%87%E6%B6%88%E6%81%AFsmart-home-camera-messages-)
    - [可控灯光设备\(Tunable Lighting Control Messages\)](#%E5%8F%AF%E6%8E%A7%E7%81%AF%E5%85%89%E8%AE%BE%E5%A4%87tunable-lighting-control-messages)
    - [可控温度设备\(Temperature Control Messages\)](#%E5%8F%AF%E6%8E%A7%E6%B8%A9%E5%BA%A6%E8%AE%BE%E5%A4%87temperature-control-messages)
    - [可控风速设备\(Fan Speed Control Messages\)](#%E5%8F%AF%E6%8E%A7%E9%A3%8E%E9%80%9F%E8%AE%BE%E5%A4%87fan-speed-control-messages)
  - [查询状态\(Query Message\)](#%E6%9F%A5%E8%AF%A2%E7%8A%B6%E6%80%81query-message)
    - [查询空气质量](#%E6%9F%A5%E8%AF%A2%E7%A9%BA%E6%B0%94%E8%B4%A8%E9%87%8F)
    - [查询当前温度](#%E6%9F%A5%E8%AF%A2%E5%BD%93%E5%89%8D%E6%B8%A9%E5%BA%A6)
    - [查询当前湿度](#%E6%9F%A5%E8%AF%A2%E5%BD%93%E5%89%8D%E6%B9%BF%E5%BA%A6)
  - [错误消息\(Error Message\)](#%E9%94%99%E8%AF%AF%E6%B6%88%E6%81%AFerror-message)
    - [用户故障\(User Faults\)](#%E7%94%A8%E6%88%B7%E6%95%85%E9%9A%9Cuser-faults)
    - [Bot故障\(Bot Faults\)](#bot%E6%95%85%E9%9A%9Cbot-faults)
    - [其他错误\(Other Faults\)](#%E5%85%B6%E4%BB%96%E9%94%99%E8%AF%AFother-faults)

<!-- /MarkdownTOC -->

## 简介

该协议实现度秘终端互联互通的目的，达到通过使用支持DuerOS能力的设备，控制灯泡等被控设备的效果。协议是使用JSON消息格式。

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
|messageId | 单个请求或响应的唯一标识符。 这用于跟踪目的，Bot应该记录此信息，尽管它不应用于支持业务逻辑。 来自Bot的每条消息都必须填充此字段。 任何字符串数字字符和短于128个字符的字符串都是有效的，但是推荐使用随机数生成的UUID版本4 UUID。 |
|name | 指令的名称，如 DiscoverAppliancesRequest 和 DiscoverAppliancesResponse |
|namespace | 指定消息payload的类别。 目前的类别有： DuerOS.ConnectedHome.Discovery、DuerOS.ConnectedHome.Control、DuerOS.ConnectedHome.Query |
|payloadVersion | 标识payload的版本号 |

### Payload

Payload的内容取决于在Header中的name值。
以下部分描述不同类型的指令，及其预期的payload描述和示例。

|Task | Namespace | Message Names |
|---|---|---|
|Discover connected devices | DuerOS.ConnectedHome.Discovery | DiscoverAppliancesRequest、DiscoverAppliancesResponse|
|Control connected devices; turn things off and on and change settings | DuerOS.ConnectedHome.Control |TurnOnRequest、TimingTurnOnRequest、TurnOffRequest、TimingTurnOnRequest、PauseRequest、IncrementBrightnessPercentageRequest、DecrementBrightnessPercentageRequest、IncrementPowerRequest、DecrementPowerRequest、SetColorRequest、IncrementTemperatureRequest、DecrementTemperatureRequest、SetTemperatureRequest、IncrementFanSpeedRequest、DecrementFanSpeedRequest、SetModeRequest、TimingSetModeRequest |
|Query connected devices for their current state | DuerOS.ConnectedHome.Query | GetLockStateRequest、GetAirQualityIndexRequest、GetHumidityRequest、GetAirPM25Request、GetTargetTemperatureRequest、GetTemperatureReadingRequest |

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
|discoveredAppliance.actions | 设备可支持的action的数组。合法的action包括： <br>turnOn<br/> <br>timingTurnOn<br/> <br>turnOff<br/> <br>timingTurnOff<br/> <br>pause<br/> <br>incrementBrightnessPercentage<br/> <br>decrementBrightnessPercentage<br/> <br>incrementPower<br/> <br>decrementPower<br/> <br>incrementTemperature<br/> <br>decrementTemperature<br/> <br>setTemperature<br/> <br>incrementFanSpeed<br/> <br>decrementFanSpeed<br/> <br>setMode<br/> <br>timingSetMode<br/> <br>getLockState<br/> <br>getAirQualityIndex<br/> <br>getAirPM25<br/> <br>getTemperatureReading<br/> <br>getTargetTemperature<br/> <br>getHumidity<br/>| Yes |
|discoveredAppliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

设备 和 场景 类型:

|Value | Description | Notes |
|---|---|---|
|WASHING_MACHINE| 洗衣机等设备 ||
|AIR_CONDITION| 空调等设备 ||
|AIR_PURIFIER| 空气净化器 ||
|WATER_HEATER| 热水器 ||
|SOCKET| 插座 ||
|INDUCTION_COOKER| 电磁炉 ||
|GAS_STOVE| 燃气灶 ||
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
            "incrementBrightnessPercentage",
            "decrementBrightnessPercentage"
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

#### 门锁控制及查询消息(Door Lock Control and Query Messages)

这些消息让您能够查询及更改当前锁的状态。

* GetLockStateRequest
* GetLockStateResponse
* SetLockStateRequest
* SetLockStateConfirmation

##### GetLockStateRequest

**例子：**
“小度小度，**锁的名字** 是否锁了？”

**目的：**
从DuerOS发送到厂商bot，请求指定设备的锁定状态。

###### Header

|Property|Value|
|---|---|
|name|GetLockStateRequest|
|namespace|DuerOS.ConnectedHome.Query|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

GetLockStateRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "GetLockStateRequest",
        "namespace": "DuerOS.ConnectedHome.Query",
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

##### GetLockStateResponse 

**度秘返回的结果例子：**
“前门已经锁了”

**目的：**
指定设备的锁定状态。对GetLockStateRequest的预期响应，并从厂商Bot发送到DuerOS。

###### Header

|Property|Value|
|---|---|
|name| GetLockStateResponse |
|namespace|DuerOS.ConnectedHome.Query|

###### Payload

|Property|Description|Required|
|---|---|---|
| lockState | 指定设备的锁定状态。有效值为LOCKED，UNLOCKED | Yes |
| applianceResponseTimestamp | 可选。表示上次从目标设备检索到lockState的时间。这表明了状态的新鲜度，这会影响DuerOS的响应。该值的精度是特定于设备的，可以由Bot预估。有效值是标准ISO 8601格式，UTC时间，精度为1秒。RFC 3399变体是首选，但不允许使用负偏移。例如，YYYY-MM-DDThh：mm：ssZ | No |

GetLockStateResponse 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "GetLockStateResponse",
        "namespace": "DuerOS.ConnectedHome.Query",
        "payloadVersion": "1"
    },
    "payload": {
        "lockState":"LOCKED",
        "applianceResponseTimestamp":"2017-01-12T23:20:50.52Z"
    }
}
```

##### SetLockStateRequest 

**例子：**
“小度小度，帮我把**锁的名字**锁了”

**目的：**
将指定的设备设置为锁定。从DuerOS发送到Bot。

###### Header

|Property|Value|
|---|---|
|name|SetLockStateRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| lockState | 表示所请求的指定设备的锁定状态。此请求的有效值为LOCKED。|

SetLockStateRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "SetLockStateRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken":"[OAuth Token here]",
        "appliance":{
            "applianceId":"[Device ID for front door lock appliance]",
            "additionalApplianceDetails":{
                "extraDetail1":"optionalDetailForSkillAdapterToReferenceThisDevice",
                "extraDetail2":"There can be multiple entries",
                "extraDetail3":"but they should only be used for reference purposes.",
                "extraDetail4":"This is not a suitable place to maintain current device state"
            }
        },
        "lockState":"LOCKED"
    }
}
```

##### SetLockStateConfirmation 

**度秘返回的结果例子：**
“前门现在已经锁了”

**目的：**
表示指定设备的锁定状态。返回的锁定状态值应与SetLockStateRequest中请求的锁定状态相匹配，否则代表发生错误。并从厂商Bot发送到DuerOS。

###### Header

|Property|Value|
|---|---|
|name| GetLockStateResponse |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| lockState | 指定设备的锁定状态。有效值为LOCKED，UNLOCKED | Yes |

SetLockStateConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "SetLockStateConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "lockState":"LOCKED"
    }
}
```

#### 打开关闭设备(On/Off Messages)

消息类型打开或关闭目标设备。这些消息通常由几种不同类型的设备使用。
* TurnOnRequest
* TurnOnConfirmation
* TimingTurnOnRequest
* TimingTurnOnConfirmation
* TurnOffRequest
* TurnOffConfirmation
* TimingTurnOffRequest
* TimingTurnOffConfirmation
* PauseRequest
* PauseConfirmation

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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| timestamp | 表示设备定时设置的量的对象。包含一个属性值，它指定一个数字，代表时间戳，单位是秒。 | Yes |

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
表示设备已经被成功定时。表示Bot返回给DuerOS的定时打开成功的结果

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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
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
            "applianceId": "[Device ID for Ceiling Fan]"
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

##### TimingTurnOffRequest

**例子：**
“小度小度，定时1分钟后关闭 *设备名*”

**目的：**
DuerOS发送给Bot的定时关闭设备的请求

###### Header

|Property|Value|
|---|---|
|name|TimingTurnOffRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| timestamp | 表示设备定时设置的量的对象。包含一个属性值，它指定一个数字，代表时间戳，单位是秒。 | Yes |

TimingTurnOffRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "TimingTurnOffRequest",
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

##### TimingTurnOffConfirmation

**度秘返回的结果例子：**
“*设备name*已经定时关闭成功”

**目的：**
表示设备已经被成功定时。表示Bot返回给DuerOS定时关闭成功的结果

###### Header

|Property|Value|
|---|---|
|name| TimingTurnOffConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

TimingTurnOffConfirmation 例子：
```
{
    "header": {
        "messageId": "26fa11a8-accb-4f66-a272-8b1ff7abd722",
        "name": "TimingTurnOffConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {}
}
```

##### PauseRequest

**例子：**
“小度小度，暂停 *设备名*”

**目的：**
DuerOS发送给Bot的暂停设备的请求

###### Header

|Property|Value|
|---|---|
|name|PauseRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

PauseRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "PauseRequest",
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

##### PauseConfirmation

**度秘返回的结果例子：**
“*设备name*已暂停”

**目的：**
表示设备已经被成功打开。表示Bot返回给DuerOS的打开成功的结果

###### Header

|Property|Value|
|---|---|
|name| PauseConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

PauseConfirmation 例子：
```
{
    "header": {
        "messageId": "26fa11a8-accb-4f66-a272-8b1ff7abd722",
        "name": "PauseConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {}
}
```

#### 摄像机设备消息(Smart Home Camera Messages )
这些消息是查询摄像机，然后返回视频流的URI。有关为摄像机构建智能家居技术的更多信息和技术要求，请参阅构建智能家居相机技能。
* RetrieveCameraStreamUriRequest
* RetrieveCameraStreamUriResponse
* AdjustOrientationRequest
* AdjustOrientationConfirmation

##### RetrieveCameraStreamUriRequest

**例子：**
“小度小度，给我看下**摄像机的名字**”

**目的：**
为了获得相机视频流的URI，用于在DuerOS设备中显示。这是从DuerOS发送到Bot。

###### Header

|Property|Value|
|---|---|
|name|RetrieveCameraStreamUriRequest|
|namespace|DuerOS.ConnectedHome.Query|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

RetrieveCameraStreamUriRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "RetrieveCameraStreamUriRequest",
        "namespace": "DuerOS.ConnectedHome.Query",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken":"[OAuth Token here]",
        "appliance": {
            "applianceId": "[Device ID for the camera]",
            "additionalApplianceDetails": {
                "extraDetail1": "optionalDetailForSkillAdapterToReferenceThisDevice",
                "extraDetail2": "There can be multiple entries",
                "extraDetail3": "but they should only be used for reference purposes.",
                "extraDetail4": "Not a suitable place to maintain current device state"
            }
        }
    }
}
```

##### RetrieveCameraStreamUriResponse 

**例子：**
“OK, 已经获得**摄像机的名字**”

**目的：**
返回在DuerOS的设备中显示的相机视频流的URI。这是从Bot发送到DuerOS。

###### Header

|Property|Value|
|---|---|
|name|RetrieveCameraStreamUriResponse |
|namespace|DuerOS.ConnectedHome.Query|

###### Payload

|Property|Description|Required|
|---|---|---|
| uri | 请求中指定的摄像机的视频流的URI。此URI的主机名作为一个公用名称或主题备用名称，必须是可以用你的SSL证书进行验证。包含IP地址的主机名将被拒绝。 | Yes |
| imageUri | 来自请求中指定的相机的先前视频流的静态图像的URI。此URI的主机名作为一个公用名称或主题备用名称，必须是可以用你的SSL证书进行验证。包含IP地址的主机名将被拒绝。 | Yes |

RetrieveCameraStreamUriResponse 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "RetrieveCameraStreamUriResponse",
        "namespace": "DuerOS.ConnectedHome.Query",
        "payloadVersion": "1"
    },
    "payload": {
        "uri": {
            "value":"rtsp://link.to.video:443/feed.mp4"
        },
        "imageUri": {
            "value":"https://link.to.image/image.jpg"
        }
    }
}
```

##### AdjustOrientationRequest

**例子：**
“小度小度，把 *设备名* 往左转”

**目的：**
DuerOS发送给Bot的关闭设备的请求

###### Header

|Property|Value|
|---|---|
|name|AdjustOrientationRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| orientation | 指定设备的调整方向。有效值为LEFT, RIGHT | Yes |

AdjustOrientationRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "AdjustOrientationRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        },
        "orientation": "LEFT"
    }
}
```

##### AdjustOrientationConfirmation

**度秘返回的结果例子：**
“*设备name*已调整完毕”

**目的：**
表示设备已经被调整完成。表示Bot返回给DuerOS的关闭成功的结果

###### Header

|Property|Value|
|---|---|
|name| AdjustOrientationConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

AdjustOrientationConfirmation 例子：
```
{
    "header": {
        "messageId": "26fa11a8-accb-4f66-a272-8b1ff7abd722",
        "name": "AdjustOrientationConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {}
}
```
#### 可控灯光设备(Tunable Lighting Control Messages)

##### IncrementBrightnessPercentageRequest

**例子：**
“小度小度，把卧室的灯调亮一点”

**目的：**
DuerOS发送给Bot的调亮灯光的请求

###### Header

|Property|Value|
|---|---|
|name|IncrementBrightnessPercentageRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaPercentage | 增加的百分比的对象 | No，在没有给这个值时，表示用户没有指定需要增加的百分比 |
| deltaPercentage.value | 增加的百分比值，float类型，范围是0 - 100； | 在deltaPercentage不为空时，取值Yes |

IncrementBrightnessPercentageRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "IncrementBrightnessPercentageRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        },
        "deltaPercentage": {
            "value": 10.0
        }
    }
}
```

##### IncrementBrightnessPercentageConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备亮度调高成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| IncrementBrightnessPercentageConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| brightness | double类型，表示亮度增加后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象  | Yes |
| previousState.brightness | double类型，表示亮度增加前的值。 | Yes |

IncrementBrightnessPercentageConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "IncrementBrightnessPercentageConfirmation",
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

##### DecrementBrightnessPercentageRequest

**例子：**
“小度小度，把卧室的灯调暗一点”

**目的：**
DuerOS发送给Bot的调低灯光亮度的请求

###### Header

|Property|Value|
|---|---|
|name|DecrementBrightnessPercentageRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaPercentage | 减少的百分比的对象 | No，在没有给这个值时，表示用户没有指定需要减少的百分比 |
| deltaPercentage.value | 减少的百分比值，float类型，范围是0 - 100；| 在deltaPercentage不为空时，取值Yes |

DecrementBrightnessPercentageRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "DecrementBrightnessPercentageRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        },
        "deltaPercentage": {
            "value": 10.0
        }
    }
}
```

##### DecrementBrightnessPercentageConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备亮度调低成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| DecrementBrightnessPercentageConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| brightness | double类型，表示亮度增加后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象  | Yes |
| previousState.brightness | double类型，表示亮度增加前的值。 | Yes |

DecrementBrightnessPercentageConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "DecrementBrightnessPercentageConfirmation",
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

##### SetColorRequest

**例子：**
“小度小度，把卧室的灯设置为红色”

**目的：**
DuerOS发送给Bot的灯光调色的请求

###### Header

|Property|Value|
|---|---|
|name|SetColorRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| color object | 描述为灯设置的颜色。在[色相、饱和度、亮度（HSB）颜色模型](https://en.wikipedia.org/wiki/HSL_and_HSV)中指定。 | Yes |
| color.hue | doule类型，表示色相设置。有效范围为0.00〜360.00（含）。 | Yes
| color.saturation | doule类型，指示饱和度设置。有效范围为0.0000至1.0000（含）。 | Yes
| color.brightness | doule类型，指示亮度设置。有效范围为0.0000至1.0000（含）。 | Yes

SetColorRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "SetColorRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        },
        "color": {
          "hue": 0.0,
          "saturation": 1.0000,
          "brightness": 1.0000
        }
    }
}
```

##### SetColorConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备已成功更改颜色。从Bot发送给DuerOS的对SetColorRequest的预期响应。

###### Header

|Property|Value|
|---|---|
|name| SetColorConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| achievedState object | 指示颜色更改后设备的状态。此对象是必需的，但请注意，如果无法查询设备的状态，或者不希望引起查询的额外延迟，则可以返回SetColorRequest中发送的值。| Yes
| achievedState.color object | 表示颜色变化后设备的颜色。| Yes
| color.hue | doule类型，表示色相设置。有效范围为0.00〜360.00（含）。 | Yes
| color.saturation | doule类型，指示饱和度设置。有效范围为0.0000至1.0000（含）。 | Yes
| color.brightness | doule类型，指示亮度设置。有效范围为0.0000至1.0000（含）。 | Yes

SetColorConfirmation 例子：
```
{
    "header": {
      "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
      "name": "SetColorConfirmation",
      "namespace": "DuerOS.ConnectedHome.Control",
      "payloadVersion": "1"
    },
    "payload": {
      "achievedState": {
        "color": {
          "hue": 0.0,
          "saturation": 1.0000,
          "brightness": 1.0000
        }
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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaValue object | 表示温度信息 | No，当值为空时表示用户没有指定调高的具体值 |
| deltaValue.value | 浮点数表示温度值 | 在deltaValue不为空时为Yes |
| deltaValue.scale | 表示温度计量标准，CELSIUS(摄氏温度), FAHRENHEIT(华氏温度), 默认是CELSIUS | 在deltaValue不为空时为Yes |

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
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        },
        "deltaValue": {
            "value": 60.0,
            "scale": "CELSIUS"
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
| mode | 表示设置之后的设备模式。 | No |
| temperature | double类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | No |
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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaValue object | 表示温度信息 | No，当值为空时表示用户没有指定调低的具体值 |
| deltaValue.value | 浮点数表示温度值 | 在deltaValue不为空时为Yes |
| deltaValue.scale | 表示温度计量标准，CELSIUS(摄氏温度), FAHRENHEIT(华氏温度), 默认是CELSIUS | 在deltaValue不为空时为Yes |

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
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        },
        "deltaValue": {
            "value": 60.0,
            "scale": "CELSIUS"
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
| mode | 表示设置之后的设备模式。 | No |
| temperature | double类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | No |
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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| targetTemperature | 表示设备的温度设置的量的对象。 | Yes |
| targetTemperature.value | 包含一个属性值，它指定一个数字，表示目标温度。 | Yes |
| targetTemperature.scale | 表示温度计量标准，CELSIUS(摄氏温度), FAHRENHEIT(华氏温度), 默认是CELSIUS | 在targetTemperature不为空时为Yes |

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
            "value": 23,
            "scale": "CELSIUS"
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
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
| mode | 表示设置之后的设备模式。 | No |
| temperature | double类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | No |
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
“小度小度，把空调的风速增加一点”(调高一档)

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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaValue | 增加风速的对象。 | No，在没有指定该对象时，表示用户没有指定需要增大具体值 |
| deltaValue.value | 增加风速的具体值，int类型，如果该值加上原值越界，返回ValueOutOfRangeError | 当deltaValue不为空时为Yes |

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
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        },
        "deltaValue" : {
            "value" : 1
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
| mode | 表示设置之后的设备模式。 | No |
| fanSpeed | int类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | No |
| previousState.fanSpeed | int类型，表示设置之前的值。 | Yes |

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
                "value": 1
            }
        },
        "fanSpeed": {
            "value": 2
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

##### DecrementFanSpeedRequest

**例子：**
“小度小度，把空调的风速降低一点”(风速慢一档)

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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| deltaValue | 增加风速的对象。 | No，在没有指定该对象时，表示用户没有指定需要增大具体值 |
| deltaValue.value | 增加风速的具体值，int类型，如果该值加上原值越界，返回ValueOutOfRangeError | 当deltaValue不为空时为Yes |

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
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        },
        "deltaValue" : {
            "value" : 1
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
| mode | 表示设置之后的设备模式。 | No |
| fanSpeed | int类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | No |
| previousState.fanSpeed | int类型，表示设置之前的值。 | Yes |

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
                "value": 2
            }
        },
        "fanSpeed": {
            "value": 1
        },
        "mode": {
            "value": "AUTO"
        }
    }
}
```

##### SetFanSpeedRequest

**例子：**
“小度小度，把空调的风速设为2档”

**目的：**
DuerOS发送给Bot的设置风速的请求

###### Header

|Property|Value|
|---|---|
|name|SetFanSpeedRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| fanSpeed | 表示设备的风速设置的值的对象。包含一个属性值，有效值为1~10 | Yes |

SetFanSpeedRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "SetFanSpeedRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "fanSpeed": {
            "value": 1
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        }
    }
}
```

##### SetFanSpeedConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备风速调低成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| SetFanSpeedConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| fanSpeed | int类型，表示设置之后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.fanSpeed | int类型，表示设置之前的值。 | Yes |

SetFanSpeedConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "SetFanSpeedConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "fanSpeed": {
                "value": 1
            }
        },
        "fanSpeed": {
            "value": 2
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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| mode | 表示设备的模式设置的量的对象。| Yes |
| mode.deviceType | 表示设备类型。AIR_CONDITION(空调), AIR_PURIFIER(空气净化器), INDUCTION_COOKER(电磁炉)| Yes |
| mode.value | 它指定一种模式，模式的值与设备类型相关。AIR_CONDITION的值包括：COOL(制冷)、HEAT(制热)、AUTO(自动)、FAN(送风)、DEHUMIDIFICATION(除湿)、SLEEP(睡眠); AIR_PURIFIER的值包括SLEEP(睡眠), HOME(回家), OUT(离家),AUTO (自动), MANUAL(手动), MUTE(静音), INTELLIGENT(智能
), HIGHSPEED(急速); INDUCTION_COOKER的值包括FAST(快速火), SLOW(温火), FRY(煎炸), STEWING(蒸煮), SOAP(汤粥), HOT_POT(火锅) | Yes |

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
            "deviceType": "AIR_CONDITION",
            "value": "AUTO"
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
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
                "deviceType": "AIR_CONDITION",
                "value": "AUTO"
            }
        },
        "mode": {
            "deviceType": "AIR_CONDITION",
            "value": "COOL"
        }
    }
}
```

##### UnsetModeRequest

**例子：**
“小度小度，取消**模式名字**”

**目的：**
DuerOS发送给Bot的设置模式的请求

###### Header

|Property|Value|
|---|---|
|name|UnsetModeRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| mode | 表示设备的模式设置的量的对象。| Yes |
| mode.deviceType | 表示设备类型。AIR_CONDITION(空调), AIR_PURIFIER(空气净化器), INDUCTION_COOKER(电磁炉)| Yes |
| mode.value | 它指定一种模式，模式的值与设备类型相关。AIR_CONDITION的值包括：COOL(制冷)、HEAT(制热)、AUTO(自动)、FAN(送风)、DEHUMIDIFICATION(除湿)、SLEEP(睡眠); AIR_PURIFIER的值包括SLEEP(睡眠), HOME(回家), OUT(离家); INDUCTION_COOKER的值包括FAST(快速火), SLOW(温火), FRY(煎炸), STEWING(蒸煮), SOAP(汤粥), HOT_POT(火锅) | Yes |

UnsetModeRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "UnsetModeRequest",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "mode": {
            "value": "AUTO"
            "deviceType": "AIR_CONDITION"
        },
        "accessToken": "[OAuth token here]",
        "appliance": {
            "additionalApplianceDetails": {},
            "applianceId": "[Device ID for Ceiling Fan]"
        }
    }
}
```

##### UnsetModeConfirmation

**度秘返回的结果例子：**
“*模式名字*已取消成功”

**目的：**
表示设备模式设置成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| UnsetModeConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.mode | 表示设置之前的设备模式。 | Yes |
| previousState.deviceType | 表示设置之前的设备类型。 | Yes |

UnsetModeConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "UnsetModeConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "previousState": {
            "mode": {
                "deviceType": "AIR_CONDITION",
                "value": "COOL"
            }
        },
        "mode": {
            "deviceType": "AIR_CONDITION",
            "value": "COOL"
        }
    }
}
```

##### TimingSetModeRequest

**例子：**
“小度小度，1分钟后把空调的模式调整为制冷”

**目的：**
DuerOS发送给Bot的定时设置模式的请求

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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |
| mode | 表示设备的模式设置的量的对象。| Yes |
| mode.deviceType | 表示设备类型。AIR_CONDITION(空调), AIR_PURIFIER(空气净化器), INDUCTION_COOKER(电磁炉)| Yes |
| mode.value | 它指定一种模式，模式的值与设备类型相关。AIR_CONDITION的值包括：COOL(制冷)、HEAT(制热)、AUTO(自动)、FAN(送风)、DEHUMIDIFICATION(除湿)、SLEEP(睡眠); AIR_PURIFIER的值包括SLEEP(睡眠), HOME(回家), OUT(离家); INDUCTION_COOKER的值包括FAST(快速火), SLOW(温火), FRY(煎炸), STEWING(蒸煮), SOAP(汤粥), HOT_POT(火锅) | Yes |
| timestamp | 表示设备定时设置的量的对象。包含一个属性值，它指定一个数字，代表时间戳，单位是秒。 | Yes |

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
            "deviceType": "AIR_CONDITION",
            "value": "AUTO"
        },
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

##### TimingSetModeConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备模式定时成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| TimingSetModeConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设备的模式设置的量的对象。| Yes |
| mode.deviceType | 表示设备类型。AIR_CONDITION(空调), AIR_PURIFIER(空气净化器), INDUCTION_COOKER(电磁炉)| Yes |
| mode.value | 它指定一种模式，模式的值与设备类型相关。AIR_CONDITION的值包括：COOL(制冷)、HEAT(制热)、AUTO(自动)、FAN(送风)、DEHUMIDIFICATION(除湿)、SLEEP(睡眠); AIR_PURIFIER的值包括SLEEP(睡眠), HOME(回家), OUT(离家); INDUCTION_COOKER的值包括FAST(快速火), SLOW(温火), FRY(煎炸), STEWING(蒸煮), SOAP(汤粥), HOT_POT(火锅) | Yes |

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
                "deviceType": "AIR_CONDITION",
                "value": "COOL"
            }
        },
        "mode": {
            "deviceType": "AIR_CONDITION",
            "value": "COOL"
        }
    }
}
```

#### 可控功率设备(Tunable Power Control Messages)

##### IncrementPowerRequest

**例子：**
“小度小度，把电磁炉功率调大一点”

**目的：**
DuerOS发送给Bot的调大功率、火力的请求

###### Header

|Property|Value|
|---|---|
|name|IncrementPowerRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

IncrementPowerRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "IncrementPowerRequest",
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

##### IncrementPowerConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备功率调高成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| IncrementPowerConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|

IncrementPowerConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "IncrementPowerConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
    }
}
```

##### DecrementPowerRequest

**例子：**
“小度小度，把电磁炉功率调低一点”

**目的：**
DuerOS发送给Bot的调低功率的请求

###### Header

|Property|Value|
|---|---|
|name|DecrementPowerRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

DecrementPowerRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "DecrementPowerRequest",
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

##### DecrementPowerConfirmation

**度秘返回的结果例子：**
“*设备name*已设置成功”

**目的：**
表示设备功率调低成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| DecrementPowerConfirmation |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| brightness | double类型，表示亮度增加后的值。 | Yes |
| previousState object | 表示亮度变化之前的对象 | Yes |
| previousState.brightness | double类型，表示亮度增加前的值。 | Yes |

DecrementPowerConfirmation 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "DecrementPowerConfirmation",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
    }
}
```

### 查询状态(Query Message)

#### 查询空气质量

##### GetAirQualityIndexRequest

**例子：**
“小度小度，查一下卧室空气质量”

**目的：**
+DuerOS发送给Bot的查询空气质量的请求

###### Header

|Property|Value|
|---|---|
|name|GetAirQualityIndexRequest|
|namespace|DuerOS.ConnectedHome.Query|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

GetAirQualityIndexRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "GetAirQualityIndexRequest",
        "namespace": "DuerOS.ConnectedHome.Query",
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

##### GetAirQualityIndexResponse

**度秘返回的结果例子：**
“当前卧室空气质量为10”

**目的：**
表示设备查询结果成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| GetAirQualityIndexResponse |
|namespace| DuerOS.ConnectedHome.Query |

###### Payload

|Property|Description|Required|
|---|---|---|
| AQI | 表示当前空气质量 | Yes |

GetAirQualityIndexResponse 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "GetAirQualityIndexResponse",
        "namespace": "DuerOS.ConnectedHome.Query",
        "payloadVersion": "1"
    },
    "payload": {
        "AQI": {
            "value": 10
        }
    }
}
```

##### GetAirPM25Request

**例子：**
“小度小度，查一下卧室pm2.5”

**目的：**
DuerOS发送给Bot的设置模式的请求
+DuerOS发送给Bot的查询空气质量的请求

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
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
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
            "applianceId": "[Device ID for Ceiling Fan]"
        }
    }
}
```

##### GetAirPM25Response

**度秘返回的结果例子：**
“当前卧室pm2.5为100”

**目的：**
表示设备查询结果成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| GetAirPM25Response |
|namespace| DuerOS.ConnectedHome.Query |

###### Payload

|Property|Description|Required|
|---|---|---|
| PM25 | 表示当前PM2.5的数值。 | Yes |

GetAirPM25Response 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "GetAirPM25Response",
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

#### 查询当前湿度

##### GetHumidityRequest

**例子：**
“小度小度，查一下卧室湿度”

**目的：**
DuerOS发送给Bot的设置模式的请求

###### Header

|Property|Value|
|---|---|
|name|GetHumidityRequest|
|namespace|DuerOS.ConnectedHome.Query|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

GetHumidityRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "GetHumidityRequest",
        "namespace": "DuerOS.ConnectedHome.Query",
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

##### GetHumidityResponse

**度秘返回的结果例子：**
“当前卧室湿度为50%”

**目的：**
表示设备查询结果成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| GetHumidityResponse |
|namespace| DuerOS.ConnectedHome.Query |

###### Payload

|Property|Description|Required|
|---|---|---|
| humidity | 表示当前相对湿度值。有效值：0.0000 ~ 1.0000 | Yes |

GetHumidityResponse 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "GetHumidityResponse",
        "namespace": "DuerOS.ConnectedHome.Query",
        "payloadVersion": "1"
    },
    "payload": {
        "humidity": {
            "value": 0.5
        }
    }
}
```

#### 查询温度
##### GetTemperatureReadingRequest

**例子：**
“小度小度，热水器现在水温是多少度？”

**目的：**
DuerOS发送给Bot的查询设备当前温度的请求

###### Header

|Property|Value|
|---|---|
|name|GetTemperatureReadingRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

GetTemperatureReadingRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "GetTemperatureReadingRequest",
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

##### GetTemperatureReadingResponse

**度秘返回的结果例子：**
“*设备name*现在温度是60度”

**目的：**
表查询成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| GetTemperatureReadingResponse |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| temperatureReading object | 表示温度信息 | Yes |
| temperatureReading.value | 浮点数表示温度值 | Yes |
| temperatureReading.scale | 表示温度计量标准，CELSIUS(摄氏温度), FAHRENHEIT(华氏温度), 默认是CELSIUS | No |
| applianceResponseTimestamp | 表示从设备上获取到温度的时间，用于估计温度值的刷新事件；ISO 8601格式 | No |

GetTemperatureReadingResponse 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "GetTemperatureReadingResponse",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "temperatureReading": {
            "value": 60.0,
            "scale": "CELSIUS"
        },
        "applianceResponseTimestamp": "2017-08-12T11:20:50.52Z"
    }
}
```

##### GetTargetTemperatureRequest

**例子：**
“小度小度，热水器设置的水温是多少度？”

**目的：**
DuerOS发送给Bot的查询设备目标温度的请求

###### Header

|Property|Value|
|---|---|
|name|GetTargetTemperatureRequest|
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| accessToken | 从设备云端取到的access token | Yes |
| appliance object | 表示具体操作指令 | Yes |
| appliance.applianceId | 设备标识符。标识符在用户拥有的所有设备上必须是唯一的。此外，标识符需要在同一设备的多个发现请求之间保持一致。标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。标识符不能超过256个字符。 | Yes |
| appliance.additionalApplianceDetails | 提供给Bot使用的设备或场景相关的附加信息的键值对。该属性的内容不能超过5000字节。而且DuerOS也不了解或使用这些数据。 | Yes，但可以为空 |

GetTargetTemperatureRequest 例子：
```
{
    "header": {
        "messageId": "01ebf625-0b89-4c4d-b3aa-32340e894688",
        "name": "GetTargetTemperatureRequest",
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

##### GetTargetTemperatureResponse

**度秘返回的结果例子：**
“*设备name*设置的温度是60度”

**目的：**
表查询成功。表示Bot返回给DuerOS的成功的结果

###### Header

|Property|Value|
|---|---|
|name| GetTargetTemperatureResponse |
|namespace|DuerOS.ConnectedHome.Control|

###### Payload

|Property|Description|Required|
|---|---|---|
| mode | 表示设置之后的设备模式。 | Yes |
| targetTemperature object | 表示温度信息 | No |
| targetTemperature.value | 浮点数表示温度值 | Yes，在targetTemperature object有值时必须 |
| targetTemperature.scale | 表示温度计量标准，CELSIUS(摄氏温度), FAHRENHEIT(华氏温度), 默认是CELSIUS | No |
| coolingTargetTemperature object | 表示制冷温度信息，在制冷加热可以同时开的双模式下使用，一般与heatingTargetTemperature同时出现 | No |
| coolingTargetTemperature.value | 浮点数表示温度值 | Yes，在coolingTargetTemperature object有值时必须 |
| coolingTargetTemperature.scale | 表示温度计量标准，CELSIUS(摄氏温度), FAHRENHEIT(华氏温度), 默认是CELSIUS | No |
| coolingTargetTemperature object | 表示加热温度信息，在制冷加热可以同时开的双模式下使用，一般与coolingTargetTemperature同时出现 | No |
| heatingTargetTemperature.value | 浮点数表示温度值 | Yes，在heatingTargetTemperature object有值时必须 |
| heatingTargetTemperature.scale | 表示温度计量标准，CELSIUS(摄氏温度), FAHRENHEIT(华氏温度), 默认是CELSIUS | No |
| temperatureMode object | 表示温控模式 | Yes |
| temperatureMode.value | 表示温控模式，COOL(制冷)、HEAT(制热)、AUTO(自动)、FAN(送风)、DEHUMIDIFICATION(除湿)、SLEEP(睡眠), CUSTOM(设备厂商特有模式) | Yes |
| temperatureMode.friendlyName | 在value为CUSTOM时，表示该模式的可阅读的名称 | Yes |
| applianceResponseTimestamp | 表示从设备上获取到温度的时间，用于估计温度值的刷新时间；ISO 8601格式 | No |

GetTargetTemperatureResponse 例子：
```
{
    "header": {
        "messageId": "780013dd-99d0-4c69-9e35-db0457f9f2a7",
        "name": "GetTargetTemperatureResponse",
        "namespace": "DuerOS.ConnectedHome.Control",
        "payloadVersion": "1"
    },
    "payload": {
        "targetTemperature": {
            "value": 60.0,
            "scale": "CELSIUS"
        },
        "applianceResponseTimestamp": "2017-08-12T11:20:50.52Z",
        "temperatureMode": {
            "value": "CUSTOM",
            "friendlyName": "Required device-specific mode name"
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
当用户给出不正确的指示或度秘不能完成的指令时，会发生以下错误。

##### ValueOutOfRangeError
目的：表示用户请求将目标值设置为超出其支持范围的值。 例如，用户说：“小度小度，将厨房设置为1000度”。

###### Payload

|Property|Description|Required|
|---|---|---|
| minimumValue | 64位双精度值，表示目标设备设置允许的最低值。 | Yes |
| maximumValue | 64位双精度值，表示目标设备设置允许的最高值。 | Yes |

ValueOutOfRangeError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":" ValueOutOfRangeError",
    "payloadVersion":"1",
    "messageId":"697fe957-c842-4545-a159-8a8c75fbe5bd"
  },
  "payload":{
    "minimumValue":15.0,
    "maximumValue":30.0
  }
}
```

##### TargetOfflineError
目的：表示目标设备未连接到用户的设备云或设备云不在线。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

TargetOfflineError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"TargetOfflineError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
  }
}
```

##### BridgeOfflineError 
目的：指示目标设备连接到已关闭电源。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

BridgeOfflineError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"BridgeOfflineError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
  }
}
```

#### Bot故障(Bot Faults)
当Bot与设备云交互出现问题时，会发生以下错误。在这些情况下，用户请求有效，但由于某种原因无法完成。

##### DriverInternalError
目的：指示Bot内的通用运行时错误。如果可能，应该返回一个更具体的错误。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |

DriverInternalError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"DriverInternalError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
  }
}
```

##### DependentServiceUnavailableError 
目的：表示技Bot依赖的模块不可用，Bot无法完成请求。

###### Payload

|Property|Description|Required|
|---|---|---|
| dependentServiceName | 表示不可用的依赖模块的字符串。必须以字母数字字符和空格指定。此值在256个字符后截断。 | Yes |

DependentServiceUnavailableError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"DependentServiceUnavailableError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
    "dependentServiceName":"Customer Credential Database"
  }
}
```

##### TargetConnectivityUnstableError  
目的：表示目标设备的云连接不稳定可靠。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

TargetConnectivityUnstableError  例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"TargetConnectivityUnstableError ",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
  }
}
```

##### TargetBridgeConnectivityUnstableError
目的：表示连接目标设备的家庭hub或网桥的云连接不稳定和不可靠。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

TargetBridgeConnectivityUnstableError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"TargetBridgeConnectivityUnstableError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
  }
}
```

##### TargetFirmwareOutdatedError
目的：表示目标设备的固件版本太低。

###### Payload

|Property|Description|Required|
|---|---|---|
| minimumFirmwareVersion | 表示最低允许固件版本。不能超过256个字符。 | Yes |  
| currentFirmwareVersion | 表示当前固件版本。不能超过256个字符。 | Yes | 

TargetFirmwareOutdatedError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"TargetFirmwareOutdatedError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
    "minimumFirmwareVersion":"17",
    "currentFirmwareVersion":"6"
  }
}
```

##### TargetBridgeFirmwareOutdatedError
目的：表示连接目标设备的家庭hub或网桥的固件版本太低。

###### Payload

|Property|Description|Required|
|---|---|---|
| minimumFirmwareVersion | 表示最低允许固件版本。不能超过256个字符。 | Yes |  
| currentFirmwareVersion | 表示当前固件版本。不能超过256个字符。 | Yes | 

TargetBridgeFirmwareOutdatedError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"TargetBridgeFirmwareOutdatedError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
    "minimumFirmwareVersion":"17",
    "currentFirmwareVersion":"6"
  }
}
```

##### TargetHardwareMalfunctionError
目的：表示目标设备出现硬件故障。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

TargetHardwareMalfunctionError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"TargetHardwareMalfunctionError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
  }
}
```

##### TargetBridgeHardwareMalfunctionError
目的：表示连接目标设备的家庭hub或桥接器出现硬件故障。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

TargetBridgeHardwareMalfunctionError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"TargetBridgeHardwareMalfunctionError",
    "payloadVersion":"1",
    "messageId":"15a248f6-8ab5-433d-a3ac-73c358e0bebd"
  },
  "payload":{
  }
}
```

##### UnableToGetValueError
目的：表示尝试在目标设备上获取指定值时发生错误。当返回此错误时，适当的errorInfo.code值可以让DuerOS能够适应不同类型的故障。您只需生成适用于目标设备的错误代码。

###### Payload

|Property|Description|Required|
|---|---|---|
| errorInfo | 描述为什么不能设置值的错误对象。 | Yes |  
| errorInfo.code | 字符串格式的错误代码。有效值是: DEVICE_AJAR：由于门打开，无法获取指定的状态。DEVICE_BUSY：设备正忙。DEVICE_JAMMED：设备卡住。DEVICE_OVERHEATED：设备过热。HARDWARE_FAILURE：由于未确定的硬件故障，请求失败。LOW_BATTERY：设备的电池电量不足。NOT_CALIBRATED：设备未校准。 | Yes | 
| errorInfo.Description | 来自设备制造商的错误的自定义描述。 | No |  

UnableToGetValueError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"UnableToGetValueError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
    "errorInfo":{
      "code":"DEVICE_JAMMED",
      "description":"A custom description of the error.."
    }
  }
}
```

##### UnableToSetValueError
目的：表示尝试在目标设备上设置指定值时发生错误。当返回此错误时，适当的errorInfo.code值使得DuerOS能够适应不同类型的故障。您只需生成适用于目标设备的错误代码。

###### Payload

|Property|Description|Required|
|---|---|---|
| errorInfo | 描述为什么不能设置值的错误对象。 | Yes |  
| errorInfo.code | 字符串格式的错误代码。有效值是: DEVICE_AJAR：由于门打开，无法获取指定的状态。DEVICE_BUSY：设备正忙。DEVICE_JAMMED：设备卡住。DEVICE_OVERHEATED：设备过热。HARDWARE_FAILURE：由于未确定的硬件故障，请求失败。LOW_BATTERY：设备的电池电量不足。NOT_CALIBRATED：设备未校准。 | Yes | 
| errorInfo.Description | 来自设备制造商的错误的自定义描述。 | No |  

UnableToSetValueError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"UnableToSetValueError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
    "errorInfo":{
      "code":"DEVICE_JAMMED",
      "description":"A custom description of the error.."
    }
  }
}
```

##### UnwillingToSetValueError
目的：表示目标设备商不愿意在指定的设备上设置请求的值。使用此错误进行温度设置。

###### Payload

|Property|Description|Required|
|---|---|---|
| errorInfo | 描述为什么不能设置值的错误对象。 | Yes |  
| errorInfo.code | 字符串格式的错误代码。目前，代码的有效值为ThermostatIsOff，表示由于恒温器关闭，制造商不愿自动将其启动，因此被请求的操作被拒绝。 | Yes | 
| errorInfo.Description | 来自设备制造商的错误的自定义描述。 | No |  

UnwillingToSetValueError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"UnwillingToSetValueError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
    "errorInfo":{
      "code":"ThermostatIsOff",
      "description":"The requested operation is unsafe because it requires changing the mode."
    }
  }
}
```

##### RateLimitExceededError
目的：表示超出设备接受的最大请求数。此消息提供有关设备的最大请求数和这些请求的时间单位的信息。例如，如果设备每小时接受四个请求，则消息应分别指定4和HOUR作为rateLimit和timeUnit。

###### Payload

|Property|Description|Required|
|---|---|---|
| rateLimit | Integer，表示设备在指定的时间单位中接受的最大请求数。 | Yes |  
| timeUnit | 大写字符串，表示rateLimit的时间单位，如MINUTE，HOUR或DAY。 | Yes | 

RateLimitExceededError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"RateLimitExceededError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
    "errorInfo":{
      "rateLimit":"10",
      "timeUnit":"HOUR"
    }
  }
}
```

##### NotSupportedInCurrentModeError
目的：表示目标设备处于无法通过DuerOS进行控制的模式，并提供有关设备当前模式的信息。

###### Payload

|Property|Description|Required|
|---|---|---|
| currentDeviceMode | 表示设备当前模式的字符串。有效值为AUTO，AWAY，COLOR，COOL，HEAT和OTHER。 | Yes |  

NotSupportedInCurrentModeError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"NotSupportedInCurrentModeError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
    "errorInfo":{
      "currentDeviceMode":"COOL",
    }
  }
}
```

#### 其他错误(Other Faults)
当一个或多个请求输入无效DuerOS无法处理时，会发生以下错误。例如，访问令牌(access token)无效。

##### ExpiredAccessTokenError
目的：表示用于认证的访问令牌(access token)已过期，不再有效。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

ExpiredAccessTokenError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"ExpiredAccessTokenError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
  }
}
```

##### InvalidAccessTokenError
目的：表示用于身份验证的访问令牌(access token)无效，除了已过期的原因。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

InvalidAccessTokenError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"InvalidAccessTokenError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
  }
}
```

##### UnsupportedTargetError
目的：指示Bot不支持目标设备。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

UnsupportedTargetError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"UnsupportedTargetError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
  }
}
```

##### UnsupportedOperationError
目的：表示目标设备不支持请求的操作。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

UnsupportedOperationError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"UnsupportedOperationError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
  }
}
```

##### UnsupportedTargetSettingError
目的：表示所请求的设置对于指定的设备和操作无效。

###### Payload

|Property|Description|Required|
|---|---|---|
| N/A | N/A | N/A |  

UnsupportedTargetSettingError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"UnsupportedTargetSettingError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
  }
}
```

##### UnexpectedInformationReceivedError
目的：由于格式错误，Bot无法处理请求消息。

###### Payload

|Property|Description|Required|
|---|---|---|
| faultingParameter | 请求消息中的属性或字段格式错误，导致Bot无法处理。 | Yes |  

UnexpectedInformationReceivedError 例子：
```
{
  "header":{
    "namespace":"DuerOS.ConnectedHome.Control",
    "name":"UnexpectedInformationReceivedError",
    "payloadVersion":"1",
    "messageId":"917314cd-ca00-49ca-b75e-d6f65ac43503"
  },
  "payload":{
    "faultingParameter": "value"
  }
}
```
