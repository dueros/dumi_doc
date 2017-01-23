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


怎么做菜
看看菜谱
教我做饭吧
今天做点啥菜呢
```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {}
}
```



好吃的川菜
好吃的川菜做法
好吃的川菜大全
好吃的川菜菜谱
```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "system": "川菜"
  }
}
```



草鱼怎么做好吃
```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "material": "草鱼"
  }
}
```


做水煮鱼的步骤
水煮鱼做法
```javascript
{
  "domain": "cookbook",
  "intent": "cookbook.open",
  "slots": {
    "dish": "水煮鱼"
  }
}
```
