# UiControl

## Table of Contents


   * [UiControl](#uicontrol)
      * [Table of Contents](#table-of-contents)
      * [总体逻辑](#总体逻辑)
      * [上报UiControl状态](#上报uicontrol状态)
         * [返回值](#返回值)
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
              {"label":"下一个","scene":"control","url":"xxapp://next","x":1,"y":2,"index":2,"domain":"{nlu.domain}","intent":"{nlu.intent}","slots":{}},
              {"label":"暂停","scene":"control","url":"xxapp://pause","x":1,"y":3,"index":3},
              {"label":"停止","scene":"control","url":"xxapp://stop","x":1,"y":4,"index":4},
              {"label":"打电话给张岩","scene":"control","url":"xxapp://next","x":1,"y":2,,"domain":"phone","intent":"telephone","slots":{"name":"张岩"}},
              {"label":"跑男2017-05-10，黄磊","scene":"content","url":"xxapp://play?id=12345","x":1,"y":1},
        ],
    },
},
```

这里上报了一个**可控制的元素** 的列表，说明如下

  * label: string, 必选，按钮上的内容
  * url: string, 必选，按钮的url，代表一种客户端行为，可以是客户端自定义的schema，在Click指令中会回传给客户端
  * scene: string, 可选，代表按钮的场景。不同的场景，query理解、匹配的方式会不一样，现在的取值有
    * content: 内容按钮
    * control: 控制按钮
  * x: int, 可选，左上角开始的x坐标，用于匹配query “播放第一行第二个”
  * y: int, 可选，左上角开始的y坐标
  * index: int, 可选，用于匹配query“播放第{index}个”
  * domain: "{nlu.domain}", 可选, nlu的domain,可选的值可以参考[NLU的example](../nlu/example.md)
  * intent: "{nlu.intent}" 可选，nlu的intent，可选的值可以参考[NLU的example](../nlu/example.md)
  * slots: object{} 可选，nlu的槽位参数，可选的值参考[NLU的example](../nlu/example.md)


### 返回值

在用户的query匹配了某个 **可控制元素** 的情况下, 可能有以下2种返回值

  * 如果用户没有上传intent和slots, 返回下面的 **UiControl.Click** 指令
  * 如果用户上传了intent和slots, 将把这个请求转发给相应的bot处理


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
            "message_id": "message_id-1344"   //中控根据message_id，将该事件请求发给对应的bot；当端上没有当前message_id时，该值为空
        },
        "payload": {
            "url":"http://unicast.bot.dueros.ai/tracklist?album_id=123&track_id=456&action=play&is_event_needed=true" //1.规定domain为bot_name的倒写，当message_id为空时，中控根据domain来识别应该接收该请求的bot；
                                                                         //2.对应的bot根据url路径及参数来处理相关业务；3.url必须encode
        }
    }
}
```
### 对于一个链接的访问，前端是否需要通过event事件来访问？
#### 重要：不是所有页面的请求都需要过dueros中控，因此不是所有页面上的点击行为，都需要端发起click事件！
#### 规定：
    * 1.影响整个dueros对话流的行为（如页面上点击播放一首歌，改变了dueros里记录的当前播放数据，也可能改变了记录的播放列表），请求需要过dueros中控；
    * 2.对于请求的发起方，click行为的请求是否需要过中控，由该click点击的链接的参数决定，提供链接的bot或者server再生成链接时，应明确该链接的请求是否需要过中控，如果过中控，则在参数里增加is_event_needed=true，无需过中控时is_event_needed=false或者不加is_event_needed参数 
