# 度秘开放平台-BotApi2.0接口说明

## Table of Contents


   * [度秘开放平台-BotApi2.0接口说明](#度秘开放平台-botapi20接口说明)
      * [Table of Contents](#table-of-contents)
      * [交互模式说明](#交互模式说明)
         * [关于confirm的说明](#关于confirm的说明)
      * [请求格式](#请求格式)
      * [未来的响应格式](#未来的响应格式)
      * [bot配置（开放平台的输出）](#bot配置开放平台的输出)


## 交互模式说明

### 关于confirm的说明
![confirm](http://d.hiphotos.baidu.com/xiaodu/pic/item/f9dcd100baa1cd1111c81ea2b012c8fcc3ce2d31.jpg)

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
    "nlu_list":[
        {"score":100,"domain":"remind","intent":"remind","slots":{"event_title":"开会","intent":"设置","remind_time":"{\"month\":\"10\",\"day\":\"21\",\"hour\":\"9\",\"apm\":\"am\"}","__intent__":"setup","__id__":"1483430617165_fu6tll","remind_type_message":"否","remind_type_phone":"否","remind_type_dumi":"否","remind_type_clock":"否","remind_time_type":"abstime","remind_time_data":"1508547600","status":"create_confirm"}},
        {"score":100,"domain":"duer_weather","intent":"sys_weather","slots":{"loc_city":"九江市","loc_county":"九江市","loc_province":"江西省","time":"2017-01-03,2017-01-03"}},
    ],
    //其他da解析结果，会放服务的原始返回，比如分词、语法分析之类的结果
    "nlu_extend":{
        "nlu_responce": "{\"analysis\":{},\"parsed_text\":\"张 岩\",\"raw_text\":\"张岩\",\"results\":[{\"demand\":0,\"domain\":\"universal_search\",\"intent\":\"search\",\"object\":{},\"pushleft_switch\":\"0\",\"score\":1,\"str_result_content\":{},\"str_result_type\":\"\"}],\"sugs\":\"张岩\",\"sugs_types\":\"PAT_EC\"}\n"
        "qu_responce": "{\"err_no\":0, \"result\":[{\"normal\":{}, \"qu\":{\"query_voice\":{\"res\":[{\"domain\":\"phone\", \"intent\":\"F->Phone->Context\", \"score\":1, \"objects\":[{\"key\":\"CallTarget\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_CallTarget\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->Phone->Context(CallTarget(Person 张岩))))\"}, {\"domain\":\"UNDEFINED\", \"intent\":\"F->alarmlocation\", \"score\":5502, \"objects\":[{\"key\":\"Route\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_Route\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->alarmlocation(Route(F->route(Arrival(F->arrival(ARRIVAL(VILLAGE 张岩))))))))\"}, {\"domain\":\"UNDEFINED\", \"intent\":\"F->alarmlocation\", \"score\":5503, \"objects\":[{\"key\":\"Route\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_Route\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->alarmlocation(Route(F->route(Arrival(F->arrival(ARRIVAL(POI(VILLAGE 张岩)))))))))\"}]}}, \"queryId\":1}]}"
    },
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
    /*
    bot_state的取值
    0，根据da给出的intent，返回结果
    1，bot自己改写了intent（返回到了result.nlu里面），返回结果
    2、da返回的槽位值，bot认为有错，返回中给出了相应的错误提示
    3、bot不能响应intent，出了保底话术
    默认为0
    */
    "bot_state":0,
    //rank使用的字段，建议选填，key可以自定，排序的时候会看相关性高低
    "strategy":{
        "title":"标题",
        "content":"主要内容",
        "url":"http://www.baidu.com",//地址，可能会看来源的权威性
        "resource_type":"views,audio", //views和audio的组合，本条结果适合的场景，中控会根据当前应用场景和客户端类型来排序
        "is_valid_result":true,//默认为true，标识这条返回是保底的，还是真的有内容的
    }
  } 
}

```


## bot配置（开放平台的输出）
  * 服务的host定义
    * protocol: https / http / nshead+mcpack
    * domain: 可以是ip/域名；如果是bns，需要设置domain_type
    * domain_type :"dns/bns", //可选，默认是dns
    * port: http默认80, https默认443
    * uri: 地址
  * 只有被定义在intents中，这个intent才会被转发给bot
  * event请求，根据schema中的interface字段和event的namespace，决定是否转发

```javascript
{
  "bot_id":"phone",
  "bot_meta":{  //下游bot元数据
    "description":"返回音乐类结果",  // 文字描述
    "version":"1.0.0",  //版本
    "type":"音乐"  //TODO，bot类型见pm给的分类
  },
  //"url":"http://xiaodu.baidu.com:80/api/phone",

  "protocol": "https / http / nshead+mcpack",
  "domain":"172.0.0.1", //可以是ip；如果是bns，要加domain_type
  "domain_type":"dns/bns", //可选，默认是dns
  "port":"8080", http默认80, https默认443
  "uri":"/saiya/search",
  //标识bot能接受哪些客户端事件
  "interface":{
     "AudioPlayer":{},
  },
  "intents": [
    {
      "intent": "phone",
      "slots": [
        {
          "name": "action_type",
          "type": "ACTION_TYPE"
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
