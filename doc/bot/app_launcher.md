#打开应用输出

bot_id： ai.dueros.bot.app_launcher

## v2 协议输出
```javascript
// query： 打开大冒险
{
  "result": {
    "views": {
      "type": "txt",
      "content": "度秘正在为您打开大冒险"
    },
    "nlu": {
      "domain": "app_launcher",
      "intent": "launch_app",
      "slots": {
        "name": "大冒险"
      }
    },
    "resource": {
      "website_url": null,
      "package_name": "com.Game_Swing.StikboldDLC"
    },
    "speech": {
      "type": "txt",
      "content": "度秘正在为您打开大冒险"
    },
    "bot_id": "ai.dueros.bot.app_launcher",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    }
  },
  "id": "1494562066_4851rktsi",
  "logid": "14945620661492",
  "user_id": "test_offline1490608417.0",
  "time": 1494562066,
  "cuid": null,
  "se_query": "打开大冒险",
  "msg": "ok",
  "status": 0
}
```

字段说明：
view:
|字段 | 描述 | 举例 | 
|---|---|---|
|type | 返回展示卡片数据，必选字段，这里默认是文本 | txt | 
|content | 文本内容 | 度秘正在为您打开大冒险 | 

nlu:
|字段 | 描述 | 举例 | 
|---|---|---|
|domain | app_launcher | app_launcher | 
|intent | 意图 | launch_app：打开app<br> close_app: 关闭app<br> uninstall_app:卸载app<br> download_app:下载app<br> search_app:搜索app<br>| 
|slots |从query中提取出来的槽位信息 | "name": "大冒险" | 

resource：
|字段 | 描述 | 举例 | 
|---|---|---|
|website_url | 网址（没有就是null） | www.baidu.com | 
|package_name | 应用包名（存在就返回,不存在，就不返回这个字段，这个主要给电视厂商使用） | com.Game_Swing.StikboldDLC | 

speech:
|字段 | 描述 | 举例 | 
|---|---|---|
|type | 文本格式 | txt | 
|content | 语音文本 | 度秘正在为您打开大冒险 | 
