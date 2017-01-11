# 度秘开放平台-BotApi接口说明

目的：
  * 为了让能够让度秘内部的rd开发下游bot
  * 为了给未来的bot开放平台做准备

整理度秘系统和bot之间的接口

## 整体格式说明

### 架构描述

![dumi_system](img/system.png)

这篇文档整理的是下游bot的输入输出接口

### 请求格式

以下是现有的协议

```javascript
{
  "user_id": "3101", ///用户id，如果非登录用户会改成
  "query": "张岩", //原始query
  "version": 1, //版本号
  "msg": {   ///老的协议格式，原始的msg，不知为何result_content是个字符串
    "id": "1454319650_5906bphzi",
    "debug": 1,
    "mode": 0,
    "operation_system": "ios",
    "app_ver": "1.4.0",
    "from": "ios",
    "ctime": 1454319650,
    "type": "user",
    "query_type": "1",
    "result_list": [
      {
        "result_confidence": 100,
        "result_content": "{\"answer\":\"张岩\"}\n",
        "result_type": "txt",
        "source_type": ""
      }
    ],
    "request_uid": "1463803763",
    "client_msg_id": "20674",
    "request_from": "0",
    "request_type": "0",
    "sample_name": "bear_brain_wireless"
  },
  "log_id": "5969bdd5126d493387a6b127d8c45ce7", //串起整个请求的id
  "request_type": "dumi", //现在的策略分支
  "params": {
    "loc": "%7B%22crd%22%3A%2212944500.486221_4845580.669330_200%22%2C%22city%22%3A%22%5Cu5317%5Cu4eac%5Cu5e02%22%2C%22addr%22%3A%22%5Cu5317%5Cu4eac%5Cu5e02%5Cu6d77%5Cu6dc0%5Cu533a%5Cu8f6f%5Cu4ef6%5Cu56ed%5Cu897f%5Cu4e09%5Cu8def%22%7D",//其实是地址信息，但有了location之后这个已经没用了
    "cip": "1.2.2.1",//客户端ip
    "bear_params": {
      "nlu_response": "{\"analysis\":{},\"parsed_text\":\"张 岩\",\"raw_text\":\"张岩\",\"results\":[{\"demand\":0,\"domain\":\"universal_search\",\"intent\":\"search\",\"object\":{},\"pushleft_switch\":\"0\",\"score\":1,\"str_result_content\":{},\"str_result_type\":\"\"}],\"sugs\":\"张岩\",\"sugs_types\":\"PAT_EC\"}\n"
    },
    "client_from": "NA",
    "intervene_from": "na",
    "sc_response": "{}"
  },
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
  "page_cnt": 10,
  "page_num": 1,
  "sessions": [
    {
      "action": "get",
      "type": "string",
      "name": "phone",
      "key": "3101",
      "list_sessions": [],
      "list_sessions_str": [
        "{\"SendSMS\":{\"intent\":\"SendSMS\",\"score\":42,\"objects\":[{\"key\":\"MSMOmit\",\"value\":\"\\u8bf4\",\"score\":1},{\"key\":\"_MSMOmit\",\"value\":\"\\u8bf4\",\"score\":1},{\"key\":\"MSGBody\",\"value\":\"\\u4e0d\\u56de\\u5bb6\\u5403\\u996d\",\"score\":1},{\"key\":\"_MSGBody\",\"value\":\"\\u4e0d\\u56de\\u5bb6\\u5403\\u996d\",\"score\":1},{\"key\":\"SendKey\",\"value\":\"\\u53d1\",\"score\":1},{\"key\":\"_SendKey\",\"value\":\"\\u53d1\",\"score\":1},{\"key\":\"WantKey\",\"value\":\"\\u6211\\u8981\",\"score\":1},{\"key\":\"_WantKey\",\"value\":\"\\u6211\\u8981\",\"score\":1}]}}"
      ],
      "hash_sessions": []
    }
  ],
  "user_info": {
    "user_id": "",
    "extra": []
  },
  "data": {
    "status": 0,
    "msg": "OK",
    "da_query_info": [  //现在的qu结果，数组，type是服务（第二级的type是domain，第三级result_list里的type是intent）
      {
        "query": "张岩",
        "type": "qu",
        "result_list": [
          {
            "type": "query",
            "score": 0,
            "result_list": []
          },
          {
            "type": "session",
            "score": 0,
            "result_list": []
          }
        ]
      }
    ],
    "params": [ //其他几个qu结果的原始数据
      {
        "key": "nlu_responce",
        "value": "{\"analysis\":{},\"parsed_text\":\"张 岩\",\"raw_text\":\"张岩\",\"results\":[{\"demand\":0,\"domain\":\"universal_search\",\"intent\":\"search\",\"object\":{},\"pushleft_switch\":\"0\",\"score\":1,\"str_result_content\":{},\"str_result_type\":\"\"}],\"sugs\":\"张岩\",\"sugs_types\":\"PAT_EC\"}\n"
      },
      {
        "key": "qu_responce",
        "value": "{\"err_no\":0, \"result\":[{\"normal\":{}, \"qu\":{\"query_voice\":{\"res\":[{\"domain\":\"phone\", \"intent\":\"F->Phone->Context\", \"score\":1, \"objects\":[{\"key\":\"CallTarget\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_CallTarget\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->Phone->Context(CallTarget(Person 张岩))))\"}, {\"domain\":\"UNDEFINED\", \"intent\":\"F->alarmlocation\", \"score\":5502, \"objects\":[{\"key\":\"Route\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_Route\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->alarmlocation(Route(F->route(Arrival(F->arrival(ARRIVAL(VILLAGE 张岩))))))))\"}, {\"domain\":\"UNDEFINED\", \"intent\":\"F->alarmlocation\", \"score\":5503, \"objects\":[{\"key\":\"Route\", \"value\":\"张岩\", \"score\":1}, {\"key\":\"_Route\", \"value\":\"张岩\", \"score\":1}], \"reduce_tree_info\":\"(query(F->alarmlocation(Route(F->route(Arrival(F->arrival(ARRIVAL(POI(VILLAGE 张岩)))))))))\"}]}}, \"queryId\":1}]}"
      }
    ]
  }
}



```

### 正常返回格式


```javascript

{
  "status": 0,
  "msg": "ok",
  "data": {
    "directives": null,
    "speech": null,
    "resource": null,
    "cards": null,
    "result_list": [
      {
        "confidence": 300,
        "form_confidence": 0,
        "source_type": "phone",
        "source_sub_type": "contact",
        //真正拼的消息其实是这个content字段，现在对外返回的resource、directives等字段都放在这个里面，和result_list平级
        "content": "{\"result_list\":[{\"result_content\":{\"answer\":\"<SYSTEM-NAME>为你查看联系人“张岩”\"},\"result_type\":\"txt\",\"source_type\":\"phone\",\"source_sub_type\":\"contact\",\"voice\":\"<SYSTEM-NAME>为你查看联系人“张岩”\"}],\"type\":\"server\",\"generator\":\"phone_function\",\"user_id\":\"3101\"}",
        "stategy_middle_data": {
          "raw_answer": [
            {
              "title": "",
              "subtitle": "",
              "answer": "<SYSTEM-NAME>为你查看联系人“张岩”",
              "url": ""
            }
          ]
        }
      }
    ],
    "page_num": 1,
    "page_cnt": 1,
    "result_num": 1,
    "service_query_info": [
      {
        "query": "张岩",
        "type": "phone",
        "result_list": [
          {
            "type": "phone",
            "score": 100,
            "result_list": [
              {
                "type": "contact",
                "score": 0,
                "content": "",
                "result_list": [
                  {
                    "key": "name_for_view",
                    "type": "text",
                    "score": 0,
                    "value": [
                      {
                        "name": "name_for_view",
                        "value": "张岩"
                      }
                    ]
                  },
                  {
                    "key": "pinyin_for_view",
                    "type": "text",
                    "score": 0,
                    "value": [
                      {
                        "name": "pinyin_for_view",
                        "value": "zhang+yan"
                      }
                    ]
                  },
                  {
                    "key": "action_type",
                    "type": "text",
                    "score": 0,
                    "value": [
                      {
                        "name": "action_type",
                        "value": "1"
                      }
                    ]
                  },
                  {
                    "key": "show_query",
                    "type": "text",
                    "score": 0,
                    "value": [
                      {
                        "name": "show_query",
                        "value": "张岩"
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    ],
    "server_query_intent": "\"\""
  },
  "sessions": [
    {
      "status": 0,
      "msg": "ok",
      "action": "set",
      "type": "string",
      "name": "phone",
      "key": "3101",
      "list_sessions_str": [
        "{\"empty\":true}"
      ]
    }
  ]
}

```


### 未来的请求格式

```javascript
{
    "query":"",  //string
    "last_query":"",  //string, not ready 
    "user_id":"",  //string
    "location":[   //array
    ],

    //还没有的
    "da_query_info":[],
}
```

### 未来的响应格式

```javascript
{
  "status" : 0,  //0 success，other fail 
  "msg" : "string",  //status 0，msg "success"，status not 0，msg explaining reason
  "data" : {
    //response data
    "result_list":[
        {
            "source_type":"your_app_name",  //string，bot name
            "result_type":"txt",  //string，card type
            "result_content":{
                "answer":"",  //string，text answer
            },
            "voice":"",  //string，tts text
        }
    ],
    //还没有的
    "result":{
        "views",
        "resource",
        "nlu",
        "speech",
        "directives",
        "hint",
    },
    "session":{},
  } 
}

```
