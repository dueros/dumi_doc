# Speaker

## Table of Contents


## addWakeWord指令
音量绝对控制指令, volumn取值为[0,100]
```json
{
    "header": {
        "namespace": "Wakeup",
        "name": "addWakeWord",
        "message_id": "message_id-1344"
    },
    "payload": {
        "word": '小度你好' //将要加入到客户端的唤醒词，会替换掉客户端最老的一个
    }
}
```


## Wakeup状态上报
正常请求中也需要上报Wakeup模块的状态
```json
"device_status":{
    "Wakeup":{
        "words":["小度你好"],//当前客户端设置的唤醒词，不包含内置的“小度小度”，按加入时间从新->老排序
        "maxWords":1 //最多可以设置几个唤醒词
    }
}
```


