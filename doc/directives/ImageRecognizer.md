# ImageRecognizer


## Table of Contents

## 总体逻辑

  1. 用户发query：帮我看看这是什么水果
  2. 服务端返回ImageRecognizer.StartRecognize directive, 包含type参数：水果
  3. 客户端拍照（或者截图、让用户选图片）后返回ImageRecognizer.Recognize event, 包含type参数：水果，url参数：图片地址，message_id是步骤2中的message_id
  4. 中控把event发给负责图像识别的bot，返回结果（可能要根据da的需求，返回多轮标志）

如果不是完全由语音发起的操作，客户端可以直接由步骤3开始，不传message_id，这种情况下后端需要有明确的图片处理bot

## ImageRecognizer.StartRecognize指令

在[响应](../api/response.md)中的directives字段中的一项

```javascript
{
       "header": {
            "namespace":  "ImageRecognizer",
            "name":  "StartRecognize",
            "message_id": "message_id-1344"
        },
        "payload": {
            "type":"水果"
        }
}
```



## ImageRecognizer.Recognize 事件
识别图片的请求

在[请求](../api/request.md)中的device_event字段

```javascript
{
    "device_event":{
        "header": {
            "namespace":  "ImageRecognizer",
            "name":  "Recognize",
            "message_id": "message_id-1344"
        },
        "payload": {
            "type":"水果", //可选
            "url":"http://f10.baidu.com/it/u=2640880481,1295783988&fm=72"
        }
    }
}
```

