# UiControl

## Table of Contents


   * [UiControl](#uicontrol)
      * [Table of Contents](#table-of-contents)
      * [总体逻辑](#总体逻辑)
      * [上报UiControl状态](#上报uicontrol状态)
      * [UiControl.Click指令](#uicontrolclick指令)
      * [UiControl.Clicked 事件](#uicontrolclicked-事件)


## 总体逻辑

客户端在每个请求中上报当前界面的上下文，包括***可能需要语音控制的所有元素***，服务端如果识别出语音请求和里面的某一项匹配，就返回Click指令，包含对应项目的url字段


## 上报UiControl状态

在[请求](../api/request.md)中的device_status字段

```javascript
"device_status":{
    "UiControl":{
        "items":[
              {"label":"下一个","scene":"control","url":"xxapp://next","x":1,"y":2},
              {"label":"暂停","scene":"control","url":"xxapp://pause","x":1,"y":3},
              {"label":"停止","scene":"control","url":"xxapp://stop","x":1,"y":4},
              {"label":"跑男2017-05-10，黄磊","scene":"content","url":"xxapp://play?id=12345","x":1,"y":1},
        ],
    },
},
```

这里上报了一个可控制的元素的列表，说明如下

  * label: string, 必选，按钮上的内容
  * url: string, 必选，按钮的url，代表一种客户端行为，可以是客户端自定义的schema，在Click指令中会回传给客户端
  * scene: string, 可选，代表按钮的场景。不同的场景，query理解、匹配的方式会不一样，现在的取值有
    * content: 内容按钮
    * control: 控制按钮
  * x: int, 可选，左上角开始的x坐标，用于匹配query “播放第一行第二个”
  * y: int, 可选，左上角开始的y坐标

## UiControl.Click指令

在[响应](../api/response.md)中的directives字段中的一项

```javascript
{
       "header": {
            "namespace":  "UiControl",
            "name":  "Click",
            "message_id": "message_id-1344"
        },
        "payload": {
            "url":"xxapp://next",
            "label":"下一个",
            "scene":"control",
            "x":1,
            "y":1
        }
}
```

## UiControl.Clicked 事件

用户执行Click指令之后，需要上传Clicked Event

在[请求](../api/request.md)中的device_event字段

```javascript
{
    "device_event":{
        "header": {
            "namespace":  "UiControl",
            "name":  "Clicked",
            "message_id": "message_id-1344"
        },
        "payload": {
            "url":"xxapp://next"
        }
    }
}
```
