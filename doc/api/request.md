# 请求字段解释

## Table of Contents


   * [请求字段解释](#请求字段解释)
      * [Table of Contents](#table-of-contents)
         * [请求示例](#请求示例)
         * [请求值（request）中数据格式分块详细说明](#请求值request中数据格式分块详细说明)
            * [客户端能力相关（device_interface, device_event, device_status）](#客户端能力相关device_interface-device_event-device_status)
            * [请求字段中，.supported_content_type字段的解释](#请求字段中supported_content_type字段的解释)


### 请求示例

给服务端发请求内容。使用sdk的用户，无需关注此节，因为sdk的请求不用手动拼

```javascript
{
    //==========以下是开放sdk会有的字段========================
    "appid": "650DEBC2B99A4dA4",
    "appkey": "2F4B662AF2064323A16122D702160F15",
    "sdk_ui": "no",
    "sdk_init": "no",
    "appname": "com.baidu.duersdk.xiaomi",
    "from_client": "sdk",
    //========================================================
    //string 用户id, 如有Cookie则不需要此字段
    "request_uid": "string",
    //string 输入来源，-1-回访引导请求,0-语音输入，1-键盘输入，2-编辑query，3-引导query，4-重新发送，6-新用户回访引导请求，7-用户上传图片，8-点击导航图标输入，9-applink方式传参数发送，10-自动回复，11-未知，12-对话过程中的特殊回访，13-手百插件新用户引导浮层点击，14-feed流拉取，21-心跳，30-客户端event
    //标识用户发这个请求的方法，参见文档 http://agroup.baidu.com/dbo/md/article/49113
    "query_type": "string",
    //默认为空,类型string， 多个以逗号分隔， 为空可以不填该字段
    "hint_id": "用户选中hint的id"
    //string 机器id
    "CUID": "string",
    //double 经度
    "longitude": double,
    //double 纬度
    "latitude": double,
    //可选，如果经纬度是来自于缓存，增加location_type:cache，add by 王芃、吴芮生2016-08-11
    "location_type": "wgs84",
    //当前定位数据坐标系统，取值为：”bd09ll”（百度球面坐标）或”wgs84”（GPS球面坐标）或”bd09mc”（百度墨卡托坐标）。默认是wgs84
    "location_system"："wgs84"
    //如果用户是语音输入的，存语音输入的id
    "speech_id":"xxxx",
    //string 请求类型，-1-手百插件注册(query为空), 0-输入框输入，1-鼠标点击输入，2-查看聊天历史，3-写入聊天历史，4-注册用户信息，5-查看用户信息，6-查看熊成长信息，7-更改熊身上装备，8-检查是否可以修改昵称, 9-app从后台恢复
    "request_type": "string",
    //string 请求来源,0-和熊对话,1-框中输入，2-主动触发熊，3-首页, 4-feed流,，5-客户端选择操作类型请求
    "request_from": "string",
    //string 服务标识
    "sample_name": "bear_brain_wireless",
    //string 客户端生成的消息id
    "client_msg_id": "string",
    //int 调试标记，1-测试消息 0或字段不存在表示线上消息
    "debug": int,
    //int 消息模式， 1-3D演示模式 0或字段不存在为默认状态
    "mode": int,
    //操作系统， 可选，android/ios
    "operation_system": "ios",
    "operation_system_version":"7.0.0", //操作系统版本号（目前只有对外sdk有该字段），ios取[[[UIDevice currentDevice] systemVersion] floatValue]，安卓取android.os.Build.VERSION.RELEASE
    "device_brand":"apple", //设备品牌 （目前只有对外sdk有该字段），ios写死"apple"，安卓取android.os.Build.BRAND
    "device_model":"iphone 6s", //设备具体型号 （目前只有对外sdk有该字段）ios取 设备型号字符串 sysctlbyname("hw.machine", name, &size, NULL, 0);，安卓取android.os.Build.MODEL
    "device_interface":{
        "Alerts":{},
        "AudioPlayer":{
            "no_pause":1,
            "no_seek":1,
        },
        "PlaybackController":{},
        "Speaker":{},
        "Settings":{},
        "SpeechSynthesizer":{},
        "System":{}
    },
    "device_event":{
        //query_type==30 的时候才会有 device_event
        "header": {
            "namespace": "AudioPlayer",
            "name": "PlaybackStarted",
            "message_id": "message_id-1344"
        },
        "payload": {
            //AudioPlayer里可能出现的payload
            "token": "156",
            "offset_ms": 10000
            //Speaker里可能出现的payload
            "volume": 1,
            //SpeechSynthesizer可能出现的payload
            "token": "156",
            "type": "{{Text/SSML}}",
            "content": ["xxxx1", "xxxx2"],
            "speak_behavior": "REPLACE_ALL",
            "should_get_next_speech": true
        }
    },
    "device_status":{
        "SpeechSynthesizer":{
            "token":"xxx",//正在播放的音频流id
            "offset_ms":20000,//播放到多少ms了
            "player_activity":"PLAYING / FINISHED"
        },
        "Speaker":{
            "volume": 50,
            "muted": false
        },
        "AudioPlayer":{
            "token":"xxx",//正在播放的音频流id
            "offset_ms":20000,//播放到多少ms了
            "player_activity":"IDLE PAUSED PLAYING BUFFER_UNDERRUN FINISHED STOPPED"
        },
        //如果用户界面上有一些可操作元素，需要做语音控制，可以传这个字段
        "UiControl":{
            "items":[
                  {"label":"下一个","url:"xxapp://next"},
                  {"label":"暂停”,url:"xxapp://pause"},
                  {"label":”停止”,url:"xxapp://stop"},
            ],
        },
        //可以传被控制的设备
        "SmartHomeControl":{
            "target_devices":[
                {"name":"客厅的电视","id":"xxxxxx","type":"duer_iot"},//type、device_id可选
            ],
        },
    },
    //app_ver 版本号，2.0.0之后返回现在的v2格式
    "app_ver": "2.0.0",
    "searchbox_ver":"8.0",//宿主版本号，只存在于插件形式，比如手百、地图、浏览器
    //string 可选，默认值是"txt"，可用的值现在有txt / image，消息内容的类型，会决定服务端如何解析request_query
    "content_type": "image",
    //int 可选，content_type=='image'的时候，表示图片的高度
    "image_height": int,
    //int 可选，content_type=='image'的时候，表示图片的宽度
    "image_width": int,
    //string 请求query
    "request_query": "query",
    //数组，标志客户端支持的内容类型，可选，如果不传，认为客户端都支持
    "supported_content_type":["audio","image","video","webview","speech"],
    
    //可选，如果是一个控制指令，可以传target_device_id，这个字段会被透传给bot，作为调用设备云的硬件id
    //未来会变成不传这个字段，靠query解析和设备管理理解出这个字段
    "target_device_id":"xxxxxx",
}
```

### 请求值（request）中数据格式分块详细说明

#### 客户端能力相关（device_interface, device_event, device_status）
 
  * device_interface 标识客户端有哪些能力
    * AudioPlayer
      * no_pause 说明客户端不支持暂停、继续
      * no_seek 说明客户端不支持快进、快退、定位播放
    * SpeechSynthesizer
    * Speaker
  * device_event 客户端事件的类型和内容。只有query_type==30的时候，才会有device_event，此时会忽略query字段（没有文本query），比如下面的端能力，里面都有相关事件的定义
    * [AudioPlayer](../directives/AudioPlayer.md) 音乐播放
    * [Speaker](../directives/Speaker.md) 扬声器控制、设置
    * [SpeechSynthesizer](../directives/SpeechSynthesizer.md) 语音播报（TTS）
例如：

```javascript
    "device_event":{
        "header": {
            "namespace": "AudioPlayer",
            "name": "PlaybackStarted",
            "message_id": "message_id-1344"
        },
        "payload": {
            "token": "156",
            "offset_ms": 10000
        }
    }
```

  * device_status 客户端的当前状态，按能力分类（每种端能力有每种端能力的状态）
    * AudioPlayer
    * SpeechSynthesizer
    * Speaker
例如：

```javascript
    "device_status":{
        "SpeechSynthesizer":{
            "token":"xxx",//正在播放的音频流id
            "offset_ms":20000,//播放到多少ms了
            "player_activity":"PLAYING / FINISHED"
        },
        "Speaker":{
            "volume": 50,
            "muted": false
        },
        "AudioPlayer":{
            "token":"xxx",//正在播放的音频流id
            "offset_ms":20000,//播放到多少ms了
            "player_activity":"IDLE / PAUSED / PLAYING / BUFFER_UNDERRUN / FINISHED / STOPPED"
        }
    }
```
  * target_device_id  可选，如果是一个控制指令，可以传target_device_id，这个字段会被透传给bot，作为调用设备云的硬件id
    * 未来会变成不传这个字段，靠query解析和设备管理理解出这个字段

#### 请求字段中，.supported_content_type字段的解释
表示了端支持的内容类型，bot应该召回端支持的内容类型，**不召回**端不支持的内容
  * audio
  * video
  * image
  * webview
  * speech
