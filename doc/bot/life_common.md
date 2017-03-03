

# life_common服务

## 介绍

生活服务，满足导航、路况、地址查询、周边查找（包括鲜花、美发、KTV等）生活服务查找需求。支持query理解，输出nlu信息。返回百度地图落地页url，应用方可以根据服务返回的槽位（slots）信息拼接百度地图schema调起百度地图app。

## bot输出schema

### domain: lbs

## 周边查询(intent: nearby)
周边查询返回的完整例子:
```javascript
//query=百度大厦附近的地铁站
{
  "result": {
    "bot_id": "life_common",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "为你找到百度大厦附近的地铁站",
        "url": "http://api.map.baidu.com/place/search?query=地铁站&location=40.056974,116.307689&coord_type=bd09ll&radius=1000&region=北京市&output=html&src=dumi"
      }
    ],
    "nlu": {
      "domain": "lbs",
      "intent": "nearby",
      "slots": {
        "end_point": "地铁站",
        "start_point": "百度大厦",
        "start_point_bd_la": "40.056974",
        "start_point_bd_lo": "116.307689",
        "user_location_city": "北京市",
        "travel_type": ""
      }
    },
    "speech": {
      "type": "Text",
      "content": "为你找到百度大厦附近的地铁站"
    }
  },
  "id": "1486365914_104fngxrj",
  "logid": "14863659133650",
  "user_id": "test_cuid",
  "time": 1486365914,
  "cuid": null,
  "se_query": "百度大厦附近的地铁站",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明

| slot               | desc     | value          |
| ------------------ | -------- | -------------- |
| end_point          | 搜索目标     | eg: 地铁站        |
| start_point        | 搜索中心点    | eg: 百度大厦       |
| start_point_bd_la  | 搜索中心点纬度  | eg: 40.056974  |
| start_point_bd_lo  | 搜索中心点经度  | eg: 116.307689 |
| user_location_city | 用户当前所在城市 | 北京市            |

### 百度地图uri拼接规则

使用的百度地图的**周边搜索**接口，调用该接口可以在调起百度地图时，根据给定的关键字、检索条件进行检索。

```javascript
URL接口：baidumap://map/place/search
```

**参数说明:**

|          |                                       |                                          |                                          |
| -------- | ------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| 参数名称     | 描述                                    | 是否必选                                     | 格式(示例)                                   |
| query    | 关键词                                   | 必选                                       |                                          |
| region   | 城市名或县名                                | 选择方式：地点搜索限定范围可以由region、bounds和location + radius方式进行，其中bounds优先级最高、region优先级最低 |                                          |
| location | 中心点经纬度，或中心点经纬度和名称描述，注意，名称不参与检索，只负责显示。 | 同上                                       | 经纬度: 39.9761,116.3282经纬度和名称: latlng:39.9761,116.3282\|name:中关村 (注意：坐标先纬度，后经度) |
| radius   | 检索半径,单位:m                             |                                          |                                          |

**使用示例:**

```java
Intent i1 = new Intent();

// 周边搜索

i1.setData(Uri.parse("baidumap://map/place/search?query=地铁站&region=北京市&location=40.056974,116.307689&radius=1000"));

startActivity(i1);
```

显示效果如下

<img src="http://gitlab.baidu.com/wangpeng20/dumi_schema/raw/master/doc/img/lifecommon_lbs_nearby.jpg" width = "25%" />





## 地址查询(intent: poi)

地址查询返回的完整例子:
```javascript
//query=百度科技园在哪里
{
  "result": {
    "bot_id": "life_common",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "为你找到百度科技园",
        "url": "http://api.map.baidu.com/geocoder?address=百度科技园&output=html&src=dumi"
      }
    ],
    "nlu": {
      "domain": "lbs",
      "intent": "poi",
      "slots": {
        "poi": "百度科技园"
      }
    },
    "speech": {
      "type": "Text",
      "content": "为你找到百度科技园"
    }
  },
  "id": "1486353184_3716wf322",
  "logid": "14863531849519",
  "user_id": "test_cuid",
  "time": 1486353184,
  "cuid": "test_cuid",
  "se_query": "百度科技园在哪里",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明

| slot | desc  | value     |
| ---- | ----- | --------- |
| poi  | 地址字符串 | eg: 百度科技园 |

### 百度地图uri拼接规则

使用的百度地图的**poi地址解析**接口，调用该接口可以在调起百度地图时，在图区显示地址对应的坐标点。

```javascript
URL接口：baidumap://map/geocoder
```

**参数说明:**

| 参数名称    | 描述                    | 是否必选 | 格式(示例) |
| ------- | --------------------- | ---- | ------ |
| address | 地址名称，请在这里填入nlu中的poi槽位 | 必选   | 百度科技园  |

**使用示例:**

```java
Intent i1 = new Intent();

// 地址解析

i1.setData(Uri.parse("baidumap://map/geocoder?src=dumi&address=百度科技园"));
 
startActivity(i1);
```

显示效果如下

<img src="http://gitlab.baidu.com/wangpeng20/dumi_schema/raw/master/doc/img/lifecommon_lbs_poi.jpg" width = "25%" />

## 导航查询(intent: navigation)

导航查询返回的完整例子:
```javascript
//query=导航从百度科技园到西二旗地铁站
{
  "result": {
    "bot_id": "life_common",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "为你找到从百度科技园到西二旗地铁站的路线，建议出行方式：驾车",
        "url": "http://api.map.baidu.com/direction?origin=%E7%99%BE%E5%BA%A6%E7%A7%91%E6%8A%80%E5%9B%AD&destination=%E8%A5%BF%E4%BA%8C%E6%97%97%E5%9C%B0%E9%93%81%E7%AB%99&mode=transit&region=%E5%8C%97%E4%BA%AC%E5%B8%82&output=html&src=dumi"
      }
    ],
    "nlu": {
      "domain": "lbs",
      "intent": "navigation",
      "slots": {
        "end_point": "西二旗地铁站",
        "start_point": "百度科技园",
        "start_point_bd_la": "",
        "start_point_bd_lo": "",
        "user_location_city": "北京市",
        "travel_type": ""
      }
    },
    "speech": {
      "type": "Text",
      "content": "为你找到从百度科技园到西二旗地铁站的路线，建议出行方式：驾车"
    }
  },
  "id": "1486365990_8515fq3zv",
  "logid": "14863659908617",
  "user_id": "test_cuid",
  "time": 1486365990,
  "cuid": "test_cuid",
  "se_query": "导航从百度科技园到西二旗地铁站",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明

| slot               | desc     | value          |
| ------------------ | -------- | -------------- |
| end_point          | 目的地      | eg: 西二旗地铁站     |
| start_point        | 出发地      | eg: 百度大厦       |
| start_point_bd_la  | 出发地纬度    | eg: 40.056974  |
| start_point_bd_lo  | 出发地经度    | eg: 116.307689 |
| user_location_city | 用户当前所在城市 | 北京市            |