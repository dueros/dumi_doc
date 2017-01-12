

### 未来的请求格式

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

    "query_type":"1",//请求类型，标识用户发这个请求的方法，参见文档 http://agroup.baidu.com/dbo/md/article/49113
    "client_info":{
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

### 未来的响应格式

里面的result结构中的views、resource、nlu、speech、directives、hint都和对外输出的格式里的定义一致

```javascript
{
  "status" : 0,  //0 success，other fail 
  "version": 2,
  "msg" : "string",  //status 0，msg "success"，status not 0，msg explaining reason
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
