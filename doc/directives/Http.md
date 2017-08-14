# HTTP请求

## 摘要

本接口定义云端要求设备端执行HTTP请求的指令，设备端收到指令后向指定URL发起HTTP请求。在设备端完成HTTP请求后，将HTTP结果以事件方式上报给云端。

使用场景：例如HTTP请求可以使用在通过局域网控制智能灯。

## DoHttpRequest指令

指定设备端执行一个HTTP请求。

### 消息样例

```json
"directive": {
  "header": {
    "namespace": "ai.dueros.device_interface.http",
    "name": "DoHttpRequest",
    "message_id": "{{STRING}}",
    "dialog_request_id": "{{STRING}}"
  },
  "payload": {
    "token": "{{STRING}}",
    "url": "{{STRING}}",
    "headers": {
      "{{STRING}}": "{{STRING}}"
    },
    "body": {
      "data_type": "{{STRING}}",
      "data": "{{STRING}}"
    },
    "method": "{{STRING}}"
  }
}
```

### Payload参数说明

  - token
    - 本次请求的唯一标识
  - url
    - 请求的地址
  - (optional) headers
    - 本字段存放HTTP请求的header，key和value都是文本数据
  - (optional) body
    - 本字段存放HTTP请求的body，详细格式如data_type和data字段描述
  - data_type
    - data字段中的数据格式，有三种格式：
        - "TEXT": request body是utf-8文本数据时，data字段内容为body内容本身
        - "BASE64_ENCODED_BINARY": request body是二进制数据时，data字段内容为经过Base64编码的结果
        - "ATTACHMENT_CID"：request body大小超过8KB时，采用multipart message格式发送数据；data字段内容为CID描述即"cid:<id>"，例如"cid:<1234>"
  - data
    - 具体数据，格式如data_type描述
  - method
    - HTTP请求的类型，取值如下：
        - "GET"
        - "POST"
        - "PUT"
        - "DELETE"

## HttpRequestSucceeded事件

设备端请求成功后上报的事件，这里请求成功指连接HttpServer成功并获取到HTTP响应，HTTP响应的状态可能是正常状态（例如200）或非正常状态（例如404、500）。
连接HttpServer失败无法获取状态码时，是HTTP请求失败，对应到HttpRequestFailed事件。

### 消息样例

```json
"event": {
  "header": {
    "namespace": "ai.dueros.device_interface.http",
    "name": "HttpRequestSucceeded",
    "message_id": "{{STRING}}"
  },
  "payload": {
    "token": "{{STRING}}",
    "code": "{{STRING}}",
    "headers": {
      "{{STRING}}": "{{STRING}}"
    },
    "body": {
      "data_type": "{{STRING}}",
      "data": "{{STRING}}"
    }
  }
}
```

### Payload参数说明

  - token
    - 本次请求的唯一标识
  - code
    - HTTP请求返回的状态码
  - (optional) headers
    - 本字段存放HTTP 响应的header，key和value都是文本数据
  - (optional) body
    - 本字段存放HTTP响应的body，详细格式如data_type和data描述
  - data_type
    - data字段中的数据格式，有三种格式：
        - "TEXT": response body是utf-8文本数据时，data字段内容为body内容本身
        - "BASE64_ENCODED_BINARY": response body是二进制数据时，data字段内容为经过Base64编码的结果
        - "ATTACHMENT_CID"：response body超过1MB时，采用multipart message格式发送数据；data字段内容为CID描述即"cid:<id>"，例如"cid:<1234>"; 
  - data
    - 具体数据，格式如data_type描述

## HttpRequestFailed事件

设备端请求失败后上报的事件，这里请求失败指连接HttpServer失败，例如DNS解析失败或无法连接到HTTP Server。

连接HttpServer获取到HTTP状态码（例如200、404、500）时，是HTTP请求成功，对应到HttpRequestSucceeded事件。

### 消息样例

```json
"event": {
  "header": {
    "namespace": "ai.dueros.device_interface.http",
    "name": "HttpRequestFailed",
    "message_id": "{{STRING}}"
  },
  "payload": {
    "token": "{{STRING}}",
    "reason": "{{STRING}}",
    "error_message": "{{STRING}}"
  }
}
```

### Payload参数说明

  - token
    - 本次请求的唯一标识
  - reason
    - 请求失败的原因，取值如下：
        - "DNS_RESOLVE_FAILED": DNS解析失败
        - "CONNECT_FAILED": 连接HTTP Server失败
        - "OTHER": 其他失败
  - error_message
    - HTTP 请求失败时的消息描述，是可打印的字符串 
