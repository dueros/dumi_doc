# DuerOS.Discovery 接口
DuerOS.Discovery 接口描述了用于请求和识别与客户设备帐户相关联的设备的消息。您必须使用此接口，以便客户可以发现其设备和场景。

## Directives
以下列表表示了指令支持的技能类型。

|Directive|Skill Type|
|---|---|
|Discover|Smart Home, Video|

### Discover
请求发现与最终用户的云帐户相关的设备或场景。当用户配置与设备或设备集相关联的技能时，会发送该消息。此外，在某些情况下，用户可以要求发现他们的设备。如果没有要发现的设备或发生错误，您应该返回一个空的Discover.Response，而不是错误消息。

"小度小度, 发现我的智能家居设备"

**Discover** 例子
```json
{
  "directive": {
    "header": {
      "namespace": "DuerOS.Discovery",
      "name": "Discover",
      "payloadVersion": "2",
      "messageId": "1bd5d003-31b9-476f-ad03-71d471922820"
    },
    "payload": {
      "scope": {
        "type": "BearerToken",
        "token": "some-access-token"
      }
    }
  }
}
```
#### Payload 细节
发现请求的payload包含一个scope对象。

scope是一个多态对象，用于提供消息的授权和识别信息。对于发现请求，scope将包含一个承载令牌，用于将用户识别为技能接入的设备云的帐户。

## 事件和属性
### 可上报的属性
无
### Discover.Response 事件
返回与最终用户的云帐户相关联的所有设备。Discover指令的预期响应。在此响应中，您将提供有关每个设备的详细信息，例如唯一标识符，设备的名称以及每个设备的什么支持的属性。如果没有要发现的设备或者您的设备云遇到错误，请返回一个空的endpoints数组。
**Discover.Response** 对于娱乐设备的例子
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
               "friendlyName":"Living Room Sound System",
               "description":"Smart Light by Sample Manufacturer",
               "manufacturerName":"Sample Manufacturer",
               "displayCategories": [ ],
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
                     "interface":"DuerOS.StepSpeaker",
                     "version":"1.0",
                     "properties":{

                     }
                  }
               ]
            }
         ]
      }
   }
}
```
#### Payload 细节

|Field|	Description|	Type|	Required
|---|---|---|---|
|endpoints| 一组 endpoint 对象，表示与用户的设备云帐户相关联的设备。 如果没有与客户帐户关联的设备，此属性应包含一个空数组。 如果发生错误，该属性可以为null。 数组中允许的最大项目数为300。	|object array|	Yes
|capabilities|	一组 capability 对象，表示特定设备支持并可以响应的能力。 capability 对象可以包含不同的字段，具体取决于类型。|object array|	Yes

##### endpoint 细节
表示与用户的设备云帐户相关联的连接设备。

|Field|	Description|	Type|	Required
|---|---|---|---|
|endpoint.endpointId|设备标识符。 该标识符在Skill内的最终用户拥有的所有设备上必须是唯一的。 此外，标识符需要在同一设备的多个发现请求之间保持一致。 标识符可以包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆。 标识符不能超过256个字符。|字符串，可包含任何字母或数字和以下特殊字符：_ - =＃; ：？ @＆	|Yes
|endpoint.manufacturerName	|设备制造商的名称。 此值不能超过128个字符。|	string	Yes
|endpoint.friendlyName	|用户用来识别设备的名称。 此值不能超过128个字符，不应包含特殊字符或标点符号。|	string|	Yes
|endpoint.description	|设备的可读描述。 此值不能超过128个字符。 描述应包含制造商名称或设备的连接方式。 例如，“飞利浦的智能灯泡”或“通过SmartHub连接的WiFi温控器”。 此值不能超过128个字符。|	string|	Yes
|endpoint.displayCategories|	表示设备应在DuerOS App 中显示的组名称。 目前，这是一个空数组。|string array	|Yes
|endpoint.cookie|	提供关于Bot使用的设备的附加信息的字符串名称/值对。 该属性的内容不能超过5000字节。 DuerOS不使用或理解此数据。|	map of string key/value pairs|	No

##### capability object
一种能力是一种多态类型。 目前，DuerOSInterface是唯一支持的功能类型。

##### DuerOSInterface capability
描述设备能够执行的操作以及可以检索的属性，并可报告通知更改。

|Field|	Description|	Type|	Required
|---|---|---|---|
|type|	表示能力的类型，它决定了能力具有哪些字段。|string “DuerOS.Interface”|	Yes
|interface|	描述设备操作的DuerOS.Interface的限定名称。|string|	Yes
|version	|表示此endpoint支持的接口版本。|string|	Yes
|properties.supported|	以"name":"< propertyName >"的格式表示此endpoint支持的接口的属性。|Array of name/value pairs	|No
