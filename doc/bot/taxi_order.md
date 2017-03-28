# 打车bot多轮状态转移过程
## 状态机
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/14773a5100540790187d37513e15c0c1714e637e)

## Book
### askTime
#### 进入条件
满足如下条件之一：

* 有约车意图
*  时间槽位有值，但是时间不明确或者非法

#### 澄清逻辑
时间澄清策略与提醒时间澄清逻辑一致（非重复提醒），但有如下区别：

+ 有效时间范围：今天、明天、后天，三天之内，超过报非法
+ 最近的可约时间：20分钟后的最近的十分点（10，20，30，40，50，00）
+ 若约车时间小于最近可约时间，自动去最近可约时间，不会报非法
+ 没有凌晨澄清逻辑

说明：时间澄清策略wiki：http://wiki.baidu.com/pages/viewpage.action?pageId=218313803

### askPosition
#### 进入条件
满足如下条件之一：

+ 没有打车目的地
+ 无定位信息且没有出发地址（默认出发地为当期位置）
+ 地址非法

#### 地址处理
异常包括：

+ 出发地城市无法确定
+ 在出发地城市，没有定位到目的地

参考：http://agroup.baidu.com/duer/md/edit/237312

### askCarType
#### 进入条件
满足如下条件之一：

+ 没有car_type
+ car_type指定的车辆类型无法满足（附近没有对应的车辆）

#### 车类型合法性验证
通过车辆数量费用接口，如果车辆数量为0，即为非法。

### askResubmitOrder
#### 进入条件
订单创建过程可能出现如下异常状况：

+ 价格倍数突然变化，比如：临时调价1.5倍
+ 下单失败

上述状况会进入resubmitOrder状态

### 车辆状态Polling
#### 进入条件
如下两种条件会启动订单状态轮询：

+ 即时打车订单创建成功后
+ 约车订单，约定上车时间前30分钟开始

#### 轮询过程
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/a340217441a71bfa2041b8a07dc39c90e533b237)

上述过程，列出了4中轮询过程中的server push

+ 等待司机接单超过1min，这种情况经常出现在用车高峰期。会询问用户是继续等待还是取消订单。
+ 司机接单。如果是约车订单，停止轮询，否则轮询周期改为60s一次。
+ 司机到达。
+ 订单完成。

## CancelOrder
### 生效条件
满足下列条件之一：

+ 当前有订单进行中，且没有上车
+ 有约车订单

说明：

+ 从订单创建成功到上车之前，都可以取消订单
+ 即时的订单取消，不会有confirm；

## WaitOrder
对应订单创建过程中，长时间没有司机接单的情况。

### 生效条件
满足如下条件：

+ 订单创建成功到司机接单期间

说明：

+ 用户肯定答复，仅仅回复话术

## CallDriver
### 进入条件
满足如下条件：

+ 订单状态为司机已接单，以及以后的状态（约车订单也可以呼叫）

## QueryStatus
满足如下条件：

+ 当前有即时打车订单
+ 订单状态为司机已接单，以及以后的状态

# 打车订单创建多轮
## 完整的叫车例子:
```javascript
//query = 帮我叫个出租车去西二旗地铁站
{
    "result": {
        "bot_id": "rent_car",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "下单确认起始地：什刹海街道米粮库社区西北116米\n目的地：西二旗\n车辆类型：出租车"
            },
            {
                "type": "txt",
                "content": "请确认下单"
            }
        ],
        "nlu": {
            "domain": "rent_car",
            "intent": "rent_car.book",
            "slots": {
                "car_type": "出租车",
                "end_point": "西二旗地铁站",
                "loc_fragment": "西",
                "to_loc": "西二旗地铁站"
            }
        },
        "speech": {
            "type": "Text",
            "content": "下单确认起始地：什刹海街道米粮库社区西北116米\n目的地：西二旗\n车辆类型：出租车。请确认下单"
        }
    },
    "id": "1490598241_8768w33x8",
    "logid": "14905982406254",
    "user_id": null,
    "time": 1490598241,
    "cuid": "test",
    "se_query": "帮我叫个出租车去西二旗地铁站",
    "msg": "ok",
    "client_msg_id": "58512fc9-d688-4e4e-9263-14495de3a60a",
    "status": 0
}
```
### nlu部分的说明
intent:rent_car.book  打车意图
### slots 说明
|slot_name|解释|slot_value|说明|
|----|----|--------|--------|
|end_point|目的地|地址，比如西二旗|string|
|car_type|用车类型|比如快车、专车、出租车|string|

## 完整的约车例子
//query = 帮我约个明天上午8点的出租车去西二旗地铁站
```javascript
{
    "result": {
        "bot_id": "rent_car",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "抱歉，目前只有专车支持预约。"
            },
            {
                "type": "txt",
                "content": "下单确认起始地：什刹海街道米粮库社区西北116米\n目的地：西二旗\n车辆类型：专车\n预估价格：88元\n用车时间：03月28日 08时00分"
            },
            {
                "type": "txt",
                "content": "请确认下单"
            }
        ],
        "nlu": {
            "domain": "rent_car",
            "intent": "rent_car.book",
            "slots": {
                "car_type": "专车",
                "end_point": "西二旗地铁站",
                "loc_fragment": "西",
                "reserve_order": "1",
                "service_time": "{\"apm\":\"am\",\"day\":\"next\",\"hour\":\"8\",\"raw\":{\"apm\":\"明天上午\",\"day\":\"明天上午\",\"hour\":\"8点\"}}\n",
                "to_loc": "西二旗地铁站"
            }
        },
        "speech": {
            "type": "Text",
            "content": "抱歉，目前只有专车支持预约。。下单确认起始地：什刹海街道米粮库社区西北116米\n目的地：西二旗\n车辆类型：专车\n预估价格：88元\n用车时间：03月28日 08时00分。请确认下单"
        }
    },
    "id": "1490598770_851ayoo1r",
    "logid": "14905987688475",
    "user_id": null,
    "time": 1490598770,
    "cuid": "test",
    "se_query": "帮我约个明天上午8点的出租车去西二旗地铁站",
    "msg": "ok",
    "client_msg_id": "58512fc9-d688-4e4e-9263-14495de3a60a",
    "status": 0
}
```
### slots 说明
|slot_name|解释|slot_value|说明|
|----|----|--------|--------|
|reserve_order|是否约车|0或者1|string|
|service_time|用车时间|json格式,wiki:todo|string|


## 下单所需槽位搜集完整，确认下单
```javascript
//query = 确认下单
{
    "result": {
        "bot_id": "rent_car",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "正在为你叫车，请耐心等待....."
            }
        ],
        "nlu": {
            "domain": "rent_car",
            "intent": "rent_car.book",
            "slots": {
                "car_type": "出租车",
                "end_point": "西二旗地铁站",
                "loc_fragment": "西",
                "to_loc": "西二旗地铁站",
                "confirm_intent": "1"
            }
        },
        "speech": {
            "type": "Text",
            "content": "正在为你叫车，请耐心等待....."
        }
    },
    "id": "1490598579_192ffpxeh",
    "logid": "14905985779877",
    "user_id": null,
    "time": 1490598579,
    "cuid": "test",
    "se_query": "确认",
    "msg": "ok",
    "client_msg_id": "58512fc9-d688-4e4e-9263-14495de3a60a",
    "status": 0
}
```

## 槽位不完整询问例子
### 问end_point
```javascript
{
...
    "views": [
        {
            "type": "txt",
            "content": "请问你打车去哪？"
        }
    ],
    "nlu": {
        "domain": "rent_car",
        "intent": "rent_car.book",
        "slots": {}
    },
    "speech": {
        "type": "Text",
        "content": "请问你打车去哪？"
    }
...
}
```

### 问约车时间
```javascript
{
...
    "views": [
        {
            "type": "txt",
            "content": "请问预约什么时候的车呢？"
        }
    ],
    "nlu": {
        "domain": "rent_car",
        "intent": "rent_car.book",
        "slots": {
            "car_type": "专车",
            "reserve_order": "1"
        }
    },
    "speech": {
        "type": "Text",
        "content": "请问预约什么时候的车呢？"
    }
...
}
```

### 问车辆类型
```javascript
{
...
    "views": [
        {
            "type": "txt",
            "content": "什刹海街道米粮库社区西北116米到西二旗出租车：最近司机约1分钟抵达，附近10辆车。\n\n快车：。\n\n专车：首汽约车，最近司机约3分钟抵达，附近10辆车，预估96元。\n\n请选择车型"
        }
    ],
    "nlu": {
        "domain": "rent_car",
        "intent": "rent_car.book",
        "slots": {
            "end_point": "西二旗"
        }
    },
    "speech": {
        "type": "Text",
        "content": "什刹海街道米粮库社区西北116米到西二旗出租车：最近司机约1分钟抵达，附近10辆车。\n\n快车：。\n\n专车：首汽约车，最近司机约3分钟抵达，附近10辆车，预估96元。\n\n请选择车型"
    }
...
}
```

### slots 说明
|slot_name|解释|slot_value|说明|
|----|----|--------|--------|
|confirm_intent|确认意图|0或者1|string|


# 打车订单取消intent
//取消打车订单
```javascript
{
    "result": {
        "bot_id": "rent_car",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "订单取消成功"
            }
        ],
        "nlu": {
            "domain": "rent_car",
            "intent": "rent_car.cancel_order",
            "slots": {
                "enum": "取消打车订单"
            }
        },
        "speech": {
            "type": "Text",
            "content": "订单取消成功"
        }
    },
    "id": "1490600187_806d0pb9v",
    "logid": "14906001876248",
    "user_id": null,
    "time": 1490600187,
    "cuid": "test",
    "se_query": "取消打车订单",
    "msg": "ok",
    "client_msg_id": "58512fc9-d688-4e4e-9263-14495de3a60a",
    "status": 0
}
```
### nlu部分的说明
+ intent:rent_car.cancel_order  打车取消意图
+ slots 可不关注

# 查询司机位置intent
```javascript
//query = 司机到哪儿了
{
    "result": {
        "bot_id": "rent_car",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "距你2.2公里，预计5分钟后到达"
            }
        ],
        "nlu": {
            "domain": "rent_car",
            "intent": "rent_car.query_status",
            "slots": {
                "enum": "司机到哪儿了"
            }
        },
        "speech": {
            "type": "Text",
            "content": "距你2.2公里，预计5分钟后到达"
        }
    },
    "id": "1490600411_0474khogv",
    "logid": "14906004108530",
    "user_id": null,
    "time": 1490600411,
    "cuid": "test",
    "se_query": "司机到哪儿了",
    "msg": "ok",
    "client_msg_id": "58512fc9-d688-4e4e-9263-14495de3a60a",
    "status": 0
}
```
### nlu部分的说明
+ intent:rent_car.query_status 查询司机位置intent 
+ slots 可不关注

# 继续等待司机接单intent
```javascript
//query = 司机到哪儿了
{
    "result": {
        "bot_id": "rent_car",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "度秘将为你持续叫车"
            }
        ],
        "nlu": {
            "domain": "rent_car",
            "intent": "rent_car.wait_order",
            "slots": {
                "enum": "继续等待"
            }
        },
        "speech": {
            "type": "Text",
            "content": "度秘将为你持续叫车"
        }
    },
    "id": "1490600411_0474khogv",
    "logid": "14906004108530",
    "user_id": null,
    "time": 1490600411,
    "cuid": "test",
    "se_query": "继续等待",
    "msg": "ok",
    "client_msg_id": "58512fc9-d688-4e4e-9263-14495de3a60a",
    "status": 0
}
```
### nlu部分的说明
+ intent:rent_car.wait_order 继续等待intent
+ slots 可不关注

# UI交互卡片
## 登录

## 绑定银行卡

## 打电话
