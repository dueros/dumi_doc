# API概览

## Table of Contents


   * [API概览](#api概览)
      * [Table of Contents](#table-of-contents)
      * [整体格式说明](#整体格式说明)
         * [架构描述](#架构描述)
         * [概念解释](#概念解释)


## 整体格式说明

### 架构描述
![dumi_system](../img/system.png)

### 概念解释

概念名字     | 概念解释
------------ | -------------
bot | 字面理解就是机器人，是真正负责返回结果的度秘平台子服务
bot列表（服务列表） | 每个合作方可以选择自己想要使用的bot
nlu | Natural Language Understanding (自然语言理解)，可以理解为把用户的自然语言query转换为结构化数据的服务
cuid | 设备id，它与用户id是独立的概念
user_id | 用户id，它与设备id是独立的概念
appid | 每个合作方的id
appkey | 每个合作方的密钥
appqps | 合作方的每秒访问次数限制
appqps | 合作方的每天访问次数限制


