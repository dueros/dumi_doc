fridge 类，目前没有多轮交互，而且只支持query理解，不会返回内容，所以请忽略除[nlu](../OPENAPI_README.md#nlu)结构外的其他字段

所以以下示例，返回值只是.result.nlu的内容，先放一个完整内容的示例

```javascript
{
  "result": {
    "bot_id": "fridge",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "度秘为你找到如下结果"
      }
    ],
    "nlu": {
      "domain": "fridge",
      "intent": "fridge.setting.temperature",
      "slots": {
        "room": "冷藏室",
        "set_temp": "1"
      }
    },
    "speech": {
      "type": "Text",
      "content": "度秘为你找到如下结果"
    }
  },
  "id": "1485070067_3463wp76x",
  "logid": "14850700666625",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1485070067,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "冷藏室的温度设置到1度",
  "msg": "ok",
  "status": 0
}
```

### fridge.setting.temperature  调温度
可能的slots：

slot key|slot value
--------|----------
room|冷冻 冷藏 保鲜 速冻 变温 恒温
set_temp|设置温度值，如“1”
temp_down|温度变小
temp_down_size|温度变小幅度
temp_up|温度增加
temp_up_size|温度增加幅度

冷藏室的温度设置到1度
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.temperature",
  "slots": {
    "room": "冷藏室",
    "set_temp": "1"
  }
}
```
冷藏室的温度降低一点
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.temperature",
  "slots": {
    "room": "冷藏室",
    "temp_down": "降低"
  }
}
```

### fridge.app.market 商城相关
打开商城、商城最近有什么活动
```javascript
{
  "domain": "fridge",
  "intent": "fridge.app.market",
  "slots": {}
}
```

查看订单
```javascript
{
  "domain": "fridge",
  "intent": "fridge.app.market",
  "slots": {
    "order": "查看订单"
  }
}
```

查看购物车
```javascript
{
  "domain": "fridge",
  "intent": "fridge.app.market",
  "slots": {
    "cart": "查看购物车"
  }
}
```

我要买虾
我要买水果

```javascript
{
  "domain": "fridge",
  "intent": "fridge.app.market",
  "slots": {
    "category": "虾"
  }  
}
```


### fridge.food.manage 食材管理
slot key|slot value
--------|----------
name|食材名字
add|添加
del|删除
expire_day|过期时间(天)


帮我添加苹果
把苹果放入冰箱
```javascript
{
  "domain": "fridge",
  "intent": "fridge.food.manage",
  "slots": {
    "add": "添加",
    "name": "苹果"
  }
}
```

删除苹果
```javascript
{
  "domain": "fridge",
  "intent": "fridge.food.manage",
  "slots": {
    "del": "删除",
    "name": "苹果"
  }
}
```

今天买个苹果,保质期1天
```javascript
{
  "domain": "fridge",
   "intent": "fridge.food.manage",
   "slots": {
     "add": "买",
     "expire_day": "1",
     "name": "苹果"
   }
}
```


### fridge.food.search 食材查询
slot key|slot value
--------|----------
name|食材名字
expired|已过期
expiring|快过期
normal|正常
fresh|新鲜

冰箱里有什么呀？
```javascript
{
  "domain": "fridge",
  "intent": "fridge.food.search",
  "slots": {}
}
```

新鲜的食材有哪些
```javascript
{
  "domain": "fridge",
  "intent": "fridge.food.search",
  "slots": {
    "fresh": "新鲜"
  }
}
```

有哪些食材快过期了
```javascript
{
  "domain": "fridge",
  "intent": "fridge.food.search",
  "slots": {
    "expiring": "快过期"
  }
}
```

鸡蛋什么时候过期
```javascript
{
  "domain": "fridge",
  "intent": "fridge.food.search",
  "slots": {
    "expired": "过期",
    "name": "鸡蛋"
  }
}
```

### fridge.info.agreement 查看用户协议
看看用户协议
用户协议是什么
用户协议有什么啊
看一下用户协议
```javascript
{
  "domain": "fridge",
  "intent": "fridge.info.agreement",
  "slots": {}
}
```

### fridge.info.service 查看服务
服务是什么
```javascript
{
  "domain": "fridge",
  "intent": "fridge.info.service",
  "slots": {}
}
```


### fridge.info.version  查看系统版本
现在系统是什么版本
```javascript
{
  "domain": "fridge",
  "intent": "fridge.info.version",
  "slots": {}
}
```


### fridge.setting.address  设置用户地址
我现在的地址是哪里
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.address",
  "slots": {}
}
```


### fridge.setting.room 冷冻、xx室控制

slot key|slot value
--------|----------
room| 冷冻 制冷 冷藏
open| 打开
close | 关闭

关闭冷冻室
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.room",
  "slots": {
    "close": "关闭",
    "room": "冷冻"
  }
}
```


### fridge.setting.mode 设置冰箱模式

slot key|slot value
--------|----------
mode| 自动 智能 速冻 休眠 假日 速冷 微冻 零度 冷饮 干货
open| 打开
close | 关闭

进入速冻模式
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.mode",
  "slots": {
    "mode": "速冻",
    "open": "进入"
  }
}
```

关闭速冻模式
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.mode",
  "slots": {
    "close": "关闭",
    "mode": "速冻"
  }
}
```


### fridge.setting.phone_bind 绑定手机
我该怎么绑定
怎么绑定APP
手机怎么控制冰箱
绑定教程看一下
看一下绑定教程
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.phone_bind",
  "slots": {
    "mode": "速冻"
  }
}
```


### fridge.connect
冰箱绑定了哪些设备
```javascript
{
  "domain": "fridge",
  "intent": "fridge.connect",
  "slots": {}
}
```


### fridge.setting.app
打开我的/打开消息中心
```javascript
{
  "domain": "fridge",
  "intent": "fridge.setting.app",
  "slots": {
    "connect": "我的"
  }
}
```


### fridge.image.recognition 图像识别
识别食材
```javascript
{
  "domain": "fridge",
  "intent": "fridge.image.recognition",
  "slots": {}
}
```
