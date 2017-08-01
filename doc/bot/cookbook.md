cookbook 类，满足食材、菜谱类需求，目前没有多轮交互，而且只支持query理解，不会返回内容，所以请忽略除[nlu](../OPENAPI_README.md#nlu)结构外的其他字段

所以以下示例，返回值只是.result.nlu的内容，先放一个完整内容的示例

```javascript
{
  "result": {
    "bot_id": "cookbook",
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
      "domain": "cookbook",
      "intent": "cookbook.open",
      "slots": {
        "dish": "西红柿炒鸡蛋"
      }
    },
    "speech": {
      "type": "Text",
      "content": "度秘为你找到如下结果"
    }
  },
  "id": "1485139903_1013gs22f",
  "logid": "14851399025585",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1485139903,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "怎么做西红柿炒鸡蛋",
  "msg": "ok",
  "status": 0
}
```

### cookbook.open

slot key|slot value
--------|----------
material|食材
system|菜系
dish|菜名
tag|类别：热门、特色、当季
season|季节
flavor|口味
holiday|节日
people|人群
symptom|症状

- 怎么做菜
- 看看菜谱
- 教我做饭吧
- 今天做点啥菜呢

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {}
}
```


- 好吃的川菜
- 好吃的川菜做法
- 好吃的川菜大全
- 好吃的川菜菜谱

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "system": "川菜"
  }
}
```

- 草鱼怎么做好吃

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "material": "草鱼"
  }
}
```

- 查找热门食谱
- 特色食谱教学
- 当季菜做法大全

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "tag": "热门"
  }
}
```

- 夏至适合吃的菜
- 大暑适合吃的菜

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "season": "夏至"
  }
}
```

- 看看川味儿菜谱
- 教我做酸甜口味的菜吧
- 口味偏甜的菜有哪些

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "flavor": "酸甜口味"
  }
}
```

- 年夜饭做啥菜呢
- 春节吃什么好

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "holiday": "春节"
  }
}
```

- 适合老年人吃的菜
- 适合做饭初学者的菜谱
- 孕妇菜谱大全

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "people": "孕妇"
  }
}
```

### cookbook.health
健康类饮食

slot key|slot value
--------|----------
health|健康用途, 如: "补肾"、"美白"
suited|代表适合
unsuited|代表不适合

- 补肾食谱
- 美白应该吃什么
- 拉肚子不应该吃什么

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.health",
  "slots": {
    "health": "补肾",
    "suited": "应该",
  }
}
```


### cookbook.step
精确菜名的步骤播报

slot key|slot value
--------|----------
dish|菜名

- 做水煮鱼的步骤
- 水煮鱼步骤详解
- 水煮鱼的做法和步骤

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.step",
  "slots": {
    "dish": "水煮鱼"
  }
}
```

### cookbook.collect
查看收藏

slot key|slot value
--------|----------
open|打开
collect|收藏
cancel|取消

- 查看收藏
- 打开收藏的菜谱
- 看看收藏菜谱
- 我收藏了哪些菜
- 打开收藏菜谱

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.collect",
  "slots": {
    "open": "收藏"
  }
}
```

### cookbook.video
食谱视频

slot key|slot value
--------|----------
dish|菜名
open|打开
close|关闭
pause|暂停

- 播放菜谱视频
- 暂停菜谱视频
- 关闭菜谱视频
- 水煮鱼的视频
- 水煮鱼视频教学

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.video",
  "slots": {
    "dish": "水煮鱼"
  }
}
```

### cookbook.material
食材操作

slot key|slot value
--------|----------
open|代表打开食材操作，如:"看"
close|代表关闭食材操作，如:"关闭"

- 我要看菜谱中有的食材
- 关闭食材用料列表

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.material",
  "slots": {
    "open": "看"
  }
}
```

### cookbook.close
关闭菜谱

- 关闭菜谱

```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.close",
  "slots": {
  }
}
```
