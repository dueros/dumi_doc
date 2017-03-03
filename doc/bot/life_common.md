

# life_common服务

## 介绍

生活服务，满足用户导航、路况、地址查询、周边查找（包括鲜花、美发、KTV等）查找需求。支持query理解，输出nlu信息。服务会返回百度地图落地页url，应用方可以根据服务返回的NLU槽位（slots）拼接百度地图schema调起百度地图app。

### 常见查询请求

导航支持：从当前地点到某个位置的导航、以及从地点A到地点B的导航，如果用户query包含出行方式，会优先给出该出行方式的导航结果。

周边查找支持的常见类目：

吃喝：美食、小吃快餐、火锅、中餐、酒吧、咖啡厅

住宿：酒店、快捷酒店、星级酒店、特价酒店、宾馆、公寓酒店、招待所、青年旅社

出行：公交站、地铁站、加油站、停车场、火车票代售点、汽车站

娱乐：网吧、洗浴、足疗、KTV、电影院、按摩

生活：银行、超市、医院、药店、厕所、ATM、快递、花点、照相馆、幼儿园、菜市场、小学、书店、车管所、眼镜店、五金店、蛋糕店、美容美发

景点：景点、公园、名胜古迹、度假村、步行街

购物：商场、万达广场、丽人、宜家

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
        "user_location_city": "北京市"
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
### nlu说明

| 槽位（slot）           | 槽位描述（desc） | 槽位值（value）     |
| ------------------ | ---------- | -------------- |
| end_point          | 搜索目标名称     | eg: 地铁站        |
| start_point        | 搜索中心点名称    | eg: 百度大厦       |
| start_point_bd_la  | 搜索中心点纬度    | eg: 40.056974  |
| start_point_bd_lo  | 搜索中心点经度    | eg: 116.307689 |
| user_location_city | 用户当前所在城市   | 北京市            |

### 调起百度地图APP方法

使用的百度地图的**周边搜索**调起方法，在百度地图APP查看给定的关键字、检索条件的检索结果。

**URL接口：**

```
baidumap://map/place/search
```

**参数说明:**

| 参数名称     | 描述                                    | nlu槽位对应关系                                | 是否必选                                     | 格式(示例)                                   |
| -------- | ------------------------------------- | ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| query    | 关键词                                   | 填入end_point槽位                            | 必选                                       | 地铁站                                      |
| region   | 城市名或县名                                | 填入user_location_city槽位                   | 选择方式：地点搜索限定范围可以由region和location +  radius方式进行，其中location +  radius优先级高于region | 北京市                                      |
| location | 中心点经纬度，或中心点经纬度和名称描述，注意，名称不参与检索，只负责显示。 | nlu槽位包含start_point_bd_la,start_point_bd_lo时使用，如果为两个坐标都为空则不填入 | 同上                                       | 经纬度: 39.9761,116.3282；经纬度和名称:  latlng:39.9761,116.3282\|name:中关村 (注意：坐标先纬度，后经度)；经纬度和名称:  latlng:39.9761,116.3282\|name:中关村 (注意：坐标先纬度，后经度)。 |
| radius   | 检索半径,单位:m                             | 填入默认值1000                                | 同上                                       | 1000m                                    |

**使用示例:**

```java
// 周边搜索
"baidumap://map/place/search?query=地铁站&region=北京市&location=40.056974,116.307689&radius=1000"
```

显示效果如下

<img src="http://gitlab.baidu.com/wangpeng20/dumi_schema/raw/master/doc/img/lifecommon_lbs_nearby.jpg" width = "30%" />

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
### nlu说明

| slot | desc  | value     |
| ---- | ----- | --------- |
| poi  | 地址字符串 | eg: 百度科技园 |

### 调起百度地图APP方法

使用的百度地图的**poi地址解析**调起方法，在百度地图APP查看该地址对应的坐标点的详细信息。

**URL接口：**

```
baidumap://map/geocoder
```

**参数说明:**

| 参数名称    | 描述   | nlu槽位对应关系    | 是否必选 | 格式(示例) |
| ------- | ---- | ------------ | ---- | ------ |
| address | 地址名称 | 对应nlu中的poi槽位 | 必选   | 百度科技园  |

**使用示例:**

```java
// 地址解析

"baidumap://map/geocoder?src=dumi&address=百度科技园"
```

显示效果如下

<img src="http://gitlab.baidu.com/wangpeng20/dumi_schema/raw/master/doc/img/lifecommon_lbs_poi.jpg" width = "30%" />

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
        "url": "http://api.map.baidu.com/direction?origin=百度科技园&destination=西二旗地铁站&mode=transit&region=北京市&output=html&src=dumi"
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
### nlu说明

| slot               | desc     | value          |
| ------------------ | -------- | -------------- |
| end_point          | 目的地      | eg: 西二旗地铁站     |
| start_point        | 出发地      | eg: 百度大厦       |
| start_point_bd_la  | 出发地纬度    | eg: 40.056974  |
| start_point_bd_lo  | 出发地经度    | eg: 116.307689 |
| user_location_city | 用户当前所在城市 | eg:北京市         |
| travel_type        | 出行方式     | TAXI：出租车       |
|                    |          | DRIVE：驾车       |
|                    |          | PUBTRANS：公共交通  |
|                    |          | WALK：步行        |

### 调起百度地图APP方法

使用的百度地图的**路线规划**调起方法，在百度地图APP中查看公交、驾车、步行导航路线规划结果。

**URL接口：**

```
baidumap://map/direction
```

**参数说明:**

| 参数名称        | 描述                                       | nlu槽位对应关系                                | 是否必选                                   | 格式(示例)                                   |
| ----------- | ---------------------------------------- | ---------------------------------------- | -------------------------------------- | ---------------------------------------- |
| origin      | 起点名称或经纬度，或者可同时提供名称和经纬度，此时经纬度优先级高，将作为导航依据，名称只负责展示 |                                          | origin和destination二者至少一个有值（默认值是当前定位地址） | 经纬度: 39.9761,116.3282经纬度和名称: latlng:39.9761,116.3282\|name:中关村 (注意：坐标先纬度，后经度) |
| destination | 终点名称或经纬度，或者可同时提供名称和经纬度，此时经纬度优先级高，将作为导航依据，名称只负责展示。 |                                          | 同上                                     | 经纬度: 39.9761,116.3282经纬度和名称: latlng:39.9761,116.3282\|name:中关村 (注意：坐标先纬度，后经度) |
| mode        | 导航模式，可选transit（公交）、driving（驾车）、walking（步行）和riding（骑行）.默认:driving | 对应nlu中的出行方式槽位：TAXI（出租车）对应driving，DRIVE（驾车）对应driving; PUBTRANS（公共交通）对应transit; WALK（步行）对应walking; | 可选                                     | 根据travel_type槽位映射，添入对应mode（driving,transit,walking） |
| region      | 城市名或县名                                   | 对应user_location_city                     | 可选                                     | 北京市                                      |

**使用示例:**

```java
//公交路线规划示例：

"baidumap://map/direction?origin=百度科技园&destination=西二旗地铁站&mode=transit"

//驾车路线规划示例：
 
"baidumap://map/direction?region=北京市&origin=百度科技园&destination=西二旗地铁站&mode=driving"

//步行路线规划示例：

"baidumap://map/direction?region=北京市&origin=百度科技园&destination=西二旗地铁站&mode=walking"
```


<img src="http://gitlab.baidu.com/wangpeng20/dumi_schema/raw/master/doc/img/lifecommon_lbs_nav.jpg" width = "30%" />
