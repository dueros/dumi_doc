# 剧本文档
基于封闭query集合

## 目录
  * [剧本文档](#剧本文档)
    * [目录](#目录)
    * [多轮原则](#多轮原则)
    * [冰箱日历剧本](#冰箱日历剧本)
      * [冰箱日历第一轮](#冰箱日历第一轮)
      * [冰箱日历第二轮](#冰箱日历第二轮)
      * [冰箱日历第三轮](#冰箱日历第三轮)
      * [冰箱日历第四轮](#冰箱日历第四轮)
      * [冰箱日历第五轮](#冰箱日历第五轮)
      * [冰箱日历提出其他需求](#冰箱日历提出其他需求)
      * [冰箱日历退出多轮](#冰箱日历退出多轮)
    * [外卖剧本](#外卖剧本)
      * [外卖第一轮](#外卖第一轮)
      * [外卖第二轮](#外卖第二轮)
      * [外卖第三轮](#外卖第三轮)
      * [外卖第四轮](#外卖第四轮)
      * [外卖提出其他需求](#外卖提出其他需求)
      * [外卖退出多轮](#外卖退出多轮)

## 多轮原则
1. 若用户不说话——3min退出
2. 若用户提出其他需求，回复通用话术
  * 兜底话术1:对不起，没听懂你的意思+“上一轮提问”
3. 若用户主动说不需要——退出多轮，回复话术
  * 话术：好的，若有需要随时找我

## 冰箱日历剧本
总共五轮对话 + 提出其他需求 + 退出多轮

### 冰箱日历第一轮

发送query： 今天是哪一天

返回结果：
* 今天是2017年3月2日，农历春分。春天来了，让我给你介绍春天适合吃什么吧。

```javascript
{
  "result": {
    "bot_id": "fridge_play",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "今天是2017年3月2日，农历春分。春天来了，让我给你介绍春天适合吃什么吧。"
      }
    ],
    "nlu": {
      "domain": "fridge_play",
      "intent": "fridge_play",
      "slots": {
        "round_index": "1",
        "status": "confirm"
      }
    },
    "speech": {
      "type": "Text",
      "content": "今天是2017年3月2日，农历春分。春天来了，让我给你介绍春天适合吃什么吧。"
    }
  },
  "id": "1485067723_5104pwkkq",
  "logid": "14850677233921",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1485067723,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "今天是哪一天",
  "msg": "ok",
  "status": 0
}
```

其中**nlu**为返回的解析结果：

key     | value     | 说明
------------ | ------------- | -------------
domain | fridge_play | 冰箱剧本
intent | fridge_play | 冰箱剧本
slots | dictionary | 槽位信息

**slots**下面字段含义：

key     | value     | 说明
------------ | ------------- | -------------
round_index | 1 | 剧本第一轮
status | confirm | 本轮状态为确认

### 冰箱日历第二轮

发送query： 好的/需要

返回结果：
* 春天，四季之首，正值乍暖还寒之时。适合清补，柔补，要注意饮食搭配。为你推荐的食品有山药、芦笋、菠菜、南瓜、芹菜。你知道春季吃山药的好处吗？

```javascript
"nlu": {
      "domain": "fridge_play",
      "intent": "fridge_play",
      "slots": {
        "round_index": "2",
        "status": "confirm",
        "random_index": "1"
      }
    }
```

**slots**下面字段含义：

key     | value     | 说明
------------ | ------------- | -------------
round_index | 2 | 剧本第二轮
status | confirm | 本轮状态为确认
random_index | 0~4 | 随机数，代表食材5种随机出（食品有山药、芦笋、菠菜、南瓜、芹菜）

### 冰箱日历第三轮

发送query： 知道/不知道

返回结果：
* 山药具有生津益肺,补脾养胃,补肾涩精的作用。需要我为你介绍山药都有哪些做法吗？

```javascript
"nlu": {
  "domain": "fridge_play",
  "intent": "fridge_play",
  "slots": {
    "round_index": "3",
    "status": "confirm",
    "random_index": "1"
  }
```

**slots**下面字段含义：

key     | value     | 说明
------------ | ------------- | -------------
round_index | 3 | 剧本第三轮
status | confirm | 本轮状态为确认
random_index | 0~4 | 返回第二轮中的随机数

### 冰箱日历第四轮

发送query： 好的/需要

返回结果：
* 有山药排骨汤、清炒山药片、小米红枣山药粥、香菇山药炒肉片等。要不要看看山药排骨汤的做法？

```javascript
"nlu": {
  "domain": "fridge_play",
  "intent": "fridge_play",
  "slots": {
    "round_index": "4",
    "status": "confirm",
    "random_index": "2"
  }
```

**slots**下面字段含义：

key     | value     | 说明
------------ | ------------- | -------------
round_index | 4 | 剧本第四轮
status | confirm | 本轮状态为确认
random_index | 0~3 | 随机数：菜谱4种随机出

### 冰箱日历第五轮

发送query： 好的/需要

返回结果：
* 好的，若有需要随时找

```javascript
"nlu": {
  "domain": "fridge_play",
  "intent": "fridge_play",
  "slots": {
    "round_index": "5",
    "status": "confirm",
    "random_index": "2"
  }
```

**slots**下面字段含义：

key     | value     | 说明
------------ | ------------- | -------------
round_index | 5 | 剧本第五轮
status | confirm | 本轮状态为确认
random_index | 0~3 | 返回第二轮中的随机数

### 冰箱日历提出其他需求

发送query： aaaa

返回结果：
* 对不起，没听懂你的意思+"上一轮提问"

```javascript
"nlu": {
  "domain": "fridge_play",
  "intent": "fridge_play",
  "slots": {
    "round_index": "1",
    "status": "not_understand",
    "da_system_not_understand": "1"
  }
```

**slots**下面字段含义：

key     | value     | 说明
------------ | ------------- | -------------
round_index | 1 | 重复第一轮的问题
status | not_understand | 本轮状态为未识别出剧本需求
da_system_not_understand | 1/2 | 返回本轮第几次未识别出需求; 1：重复问上一轮的问题，2：退出多轮

### 冰箱日历退出多轮

发送query： 不需要

返回结果：
* 1.排骨段放在清水里，轻轻揉搓几下，这样表面的血污也可以去除部分。记得不要揉太久，血都肉出来，味道会差。2.凉水下锅，加入排骨块儿，少量姜片，煮开。……

```javascript
"nlu": {
  "domain": "fridge_play",
  "intent": "fridge_play",
  "slots": {
    "round_index": "1",
    "status": "cancel"
  }
```

**slots**下面字段含义：

key     | value     | 说明
------------ | ------------- | -------------
round_index | 1 | 剧本第1轮后的回复
status | cancel | 本轮状态为退出多轮


## 外卖剧本
总共四轮对话 + 提出其他需求 + 退出多轮

### 外卖第一轮

发送query： 你好，巴布/巴布，你好

返回结果：
* 主人，您好

```javascript
{
  "result": {
    "bot_id": "fridge_play",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "主人，您好"
      }
    ],
    "nlu": {
      "domain": "fridge_play",
      "intent": "fridge_play",
      "slots": {
        "round_index": "1",
        "status": "confirm"
      }
    },
    "speech": {
      "type": "Text",
      "content": "主人，您好"
    }
  },
  "id": "1487324378_2419fhcye",
  "logid": "14873243787076",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1487324378,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "你好，巴布",
  "msg": "ok",
  "status": 0
}
```

### 外卖第二轮

发送query： 我想点外卖

返回结果：
* 已为您推荐如下附近外卖：1.麦当劳 2.吉野家 3.必胜客

### 外卖第三轮

发送query： 我想吃麦当劳

返回结果：
* 该外卖提供如下套餐：1.板烧鸡腿堡 2.麦辣鸡翅 3.巨无霸

### 外卖第四轮

发送query： 我选1套餐/我选套餐1

返回结果：
* 正在为您下单，请稍等。下单完成，外卖员将于30分钟内送餐上门，请注意查收

### 外卖提出其他需求

发送query： aaaa

返回结果：
* 对不起，没听懂你的意思+"上一轮提问"

### 外卖退出多轮

发送query： 外卖不需要

返回结果：
* 好的，若有需要随时找

