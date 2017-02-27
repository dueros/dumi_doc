## 交互模式说明

### 关于confirm的说明
![confirm](img/confirm.png)

  * 之所以有confirm请求，是因为us会把同一个请求发给多个bot，然后挑选较好的一个。bot返回的结果，有可能不被使用
  * 按bot对请求的处理有无副作用，分为幂等请求和非幂等请求
  * 幂等请求如：
    * 通用信息
    * 天气
  * 非幂等请求如：
    * 提醒（bot会为用户创建提醒）
    * 打车（bot会帮用户叫车）


## 请求格式

```javascript
{
    "version": 2,
    "query":"",  //query，可能已经经过了改写
    "raw_query":"",  //原始query，可选
    "content_type": "image",//可选，默认是txt
    "user_id":"",  //对bot来说，可以唯一标识一个用户的string
    
    "cuid":"",  //设备id，可选
    "dumi_id":"",  //度秘登录用户id，可选
    "baidu_uid":"",  //百度登录后的passport id，可选
    "bot_id":"",//把bot_id带下来，其实可以不看
    
    "log_id":"5969bdd5126d493387a6b127d8c45ce7",
    "confirm":1,//0或者1，0代表可能不会使用bot的返回结果，1代表肯定会使用bot的返回结果。（参考上面的[关于confirm的说明]）

    "query_type":"1",//请求类型，标识用户发这个请求的方法，参见文档 http://agroup.baidu.com/dbo/md/article/49113
    "client_info":{
        "device_interface":{
            "Alerts":{},
            "AudioPlayer":{},
            "PlaybackController":{},
            "Speaker":{},
            "Settings":{},
            "System":{}
        }, //设备支持的接口（包含directive、event等整套实现）

        "device_event":{
            "type":"AudioPlayer.PlaybackStarted"
            //AudioPlayer.PlaybackStarted	Sent when Alexa begins playing the audio stream previously sent in a Play directive. This lets your skill verify that playback began successfully.
            //AudioPlayer.PlaybackFinished	Sent when the stream Alexa is playing comes to an end on its own.
            //AudioPlayer.PlaybackStopped	Sent when Alexa stops playing an audio stream in response to a voice request or an AudioPlayer directive.
            //AudioPlayer.PlaybackNearlyFinished	Sent when the currently playing stream is nearly complete and the device is ready to receive a new stream.
            //AudioPlayer.PlaybackFailed
        },

        "device_status":{
            "AudioPlayer":{
                "audio_item_id":"xxx",//正在播放的音频流id
                "offsetInMilliseconds":20000,//播放到多少ms了
                "playerActivity":"IDLE PAUSED PLAYING BUFFER_UNDERRUN FINISHED STOPPED"
            },
        },
        "operation_system":"android",
        "operation_system_version":"5.0",
        "from_client":"sdk",// sdk/na/shoubai
        "appid":"appid",
        "appkey":"appkey",
        "device_brand":"apple", //设备品牌 （目前只有对外sdk有该字段），ios写死"apple"，安卓取android.os.Build.BRAND
        "device_model":"iphone 6s", //设备具体型号 （目前只有对外sdk有该字段）ios取 设备型号字符串 
        "ua":"",//可选，浏览器的user agent
        "app_ver":"1.0.0"
    },

    //完整的地址信息
    "location": {
        "la": 40.0433,
        "lo": 116.269,
        "bd_la": 40.0508,
        "bd_lo": 116.281,
        "mi_la": 4845580,
        "mi_lo": 12944500,
        "address": "北京市海淀区软件园西三路",
        "city": "北京市",
        "city_code": 131,
        "country": "中国",
        "country_code": 0,
        "direction": "",
        "distance": "",
        "district": "海淀区",
        "province": "北京市",
        "street": "软件园西三路",
        "street_number": "",
        "cip": "1.2.2.1",
        "cip_type": "mockbycity",
        "location_type": "real",
        "sematic_description": "百度科技园内"
    },

    "session": {//是上次user_id + bot_id 请求的返回值里的session，纯kv，内部结构不做限制（串行化保存的值）
        "key":"value",
        "key2":"value2"
    },
    //用户常驻地址，可选，字段和上面location一致
    "freq_location": { "la": 40.0433, "lo": 116.269, "bd_la": 40.0508, "bd_lo": 116.281, "mi_la": 4845580, "mi_lo": 12944500, "address": "北京市海淀区软件园西三路", "city": "北京市", "city_code": 131, "country": "中国", "country_code": 0, "direction": "", "distance": "", "district": "海淀区", "province": "北京市", "street": "软件园西三路", "street_number": "", "cip": "1.2.2.1", "cip_type": "mockbycity", "location_type": "real", "sematic_description": "百度科技园内" },
    //最近几次访问的地址，可选，一个数组，每个元素里面的结构和location 一致
    "last_location":[
        { "la": 40.0433, "lo": 116.269, "bd_la": 40.0508, "bd_lo": 116.281, "mi_la": 4845580, "mi_lo": 12944500, "address": "北京市海淀区软件园西三路", "city": "北京市", "city_code": 131, "country": "中国", "country_code": 0, "direction": "", "distance": "", "district": "海淀区", "province": "北京市", "street": "软件园西三路", "street_number": "", "cip": "1.2.2.1", "cip_type": "mockbycity", "location_type": "real", "sematic_description": "百度科技园内" },
        { "la": 40.0433, "lo": 116.269, "bd_la": 40.0508, "bd_lo": 116.281, "mi_la": 4845580, "mi_lo": 12944500, "address": "北京市海淀区软件园西三路", "city": "北京市", "city_code": 131, "country": "中国", "country_code": 0, "direction": "", "distance": "", "district": "海淀区", "province": "北京市", "street": "软件园西三路", "street_number": "", "cip": "1.2.2.1", "cip_type": "mockbycity", "location_type": "real", "sematic_description": "百度科技园内" },
    ],

    //da解析结果，对一个query可能有多种理解，所以是一个数组
    "nlus":[
        {"domain":"remind","intent":"remind","slots":{"event_title":"开会","intent":"设置","remind_time":"{\"month\":\"10\",\"day\":\"21\",\"hour\":\"9\",\"apm\":\"am\"}","__intent__":"setup","__id__":"1483430617165_fu6tll","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1508547600","status":"create_confirm"}},
        {"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"九江市","loc_county":"九江市","loc_province":"江西省","time":"2017-01-03,2017-01-03"}},
    ],
    //其他da解析结果，会放服务的原始返回，比如分词、语法分析之类的结果
    "da_params":[
      {
        "key": "nlu_responce",
        "value": "{\"analysis\":{},\"parsed_text\":\"张 岩\",\"raw_text\":\"张岩\",\"results\":[{\"demand\":0,\"domain\":\"universal_search\",\"intent\":\"search\",\"object\":{},\"pushleft_switch\":\"0\",\"score\":1,\"str_result_content\":{},\"str_result_type\":\"\"}],\"sugs\":\"张岩\",\"sugs_types\":\"PAT_EC\"}\n"
      },
      {
        "key": "qu_responce",
        "value": "{\"err_no\":0, \"result\":[{\"normal\":{}, \"qu\":{\"query_voice\":{\"res\":[{\"domain\":\"phone\", \"intent\":\"F->Phone->Context\", \"score\":1, \"objects\":[{\"key\":\"CallTarget\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_CallTarget\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->Phone->Context(CallTarget(Person 张岩))))\"}, {\"domain\":\"UNDEFINED\", \"intent\":\"F->alarmlocation\", \"score\":5502, \"objects\":[{\"key\":\"Route\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_Route\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->alarmlocation(Route(F->route(Arrival(F->arrival(ARRIVAL(VILLAGE 张岩))))))))\"}, {\"domain\":\"UNDEFINED\", \"intent\":\"F->alarmlocation\", \"score\":5503, \"objects\":[{\"key\":\"Route\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_Route\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->alarmlocation(Route(F->route(Arrival(F->arrival(ARRIVAL(POI(VILLAGE 张岩)))))))))\"}]}}, \"queryId\":1}]}"
    ],
}
```

## 未来的响应格式

里面的result结构中的views、resource、nlu、speech、directives、hint都和对外输出的格式里的定义一致，详细结构可见([度秘API2.0文档](http://gitlab.baidu.com/wangpeng20/dumi_schema/blob/master/doc/OPENAPI_README.md))

```javascript
{
  "status" : 0,  //0 success，other fail 
  "version": 2,
  "msg" : "string",  //status 0，msg "success"，status not 0，msg explaining reason
  "need_confirm":1, //可选，默认为0，参考前面的[关于confirm的说明]
  "data" : {
    //如果bot没有召回结果，就不要返回result结构了
    "result":{
        //必选
        "views":[],
        //可选
        "resource":{},
        //应该从请求的nlus里选一条返回,可选
        "nlu":{"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"九江市","loc_county":"九江市","loc_province":"江西省","time":"2017-01-03,2017-01-03"}},
        //必选
        "speech":{},
        //可选
        "directives":[],
        //可选
        "hint":[],
        //可选，默认为true，如果为false，客户端应该立即进入收听用户query的状态，不用重新唤醒
        'should_end_session':false, 
    },
    //会被串行化后保存起来，下次同一个 (user_id,bot_id) 请求的时候，会带上
    "session":{
        "key":"value",
        "key2":"value2"
    },
    ///session过期的时间戳，session过了这个时间就不再有效，不返回这个字段的话，默认是当前时间30分钟后
    session_expire:1454319650
  } 
}

```


## bot配置（开放平台的输出）
  * 服务的host定义，url
    * protocol: https / http / nshead+mcpack
    * domain name: 可以是ip；如果是bns，在后面加.serv
    * port: http默认80, https默认443
    * uri
  * 只有被定义在intents中，这个intent才会被转发给bot

```javascript
{
  "bot_id":"phone",
  "bot_meta":{  //下游bot元数据
    "description":"返回音乐类结果",  // 文字描述
    "version":"1.0.0",  //版本
    "type":"音乐"  //TODO，bot类型见pm给的分类
  },
  "url":"http://xiaodu.baidu.com:80/api/phone",
  "intents": [
    {
      "intent": "GetHoroscope",
      "slots": [
        {
          "name": "Sign",
          "type": "LIST_OF_SIGNS"
        },
        {
          "name": "Date",
          "type": "AMAZON.DATE"
        }
      ]
    },
    {
      "intent": "GetLuckyNumbers"
    }
  ]
}
```
