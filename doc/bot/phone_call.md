#打电话应用输出

bot_id： ai.dueros.bot.phone_call

## v2 协议输出
```javascript
{
  "result": {
    "views": {
      "type": "txt",
      "content": "度秘为您找到相关的联系人:测试薛斌"
    },
    "nlu": {
      "domain": "phone",  // TODO：确认打电话个发短信的名称
      "intent": "telephone",  
      // TODO: 确认名称。
      // 目前da解析结果：打电话是telephone，发短信是sms
      // 看看是否需要丰富：
      // 目前打电话包含：1. 请问要打给谁？；2. 电话主动取消； 3. 拨出电话。 
      // 发短信包括：1. 请问要发给谁？；2. 请问要发送什么内容？；3. 短信问确认: 请问你要发送、取消还是修改？；4. 短信主动取消；5. 短信结束，正在为你发送短信
      "slots": {
        "name": "测试薛斌",
        "use_sim_index": "1", // sim卡
        "carrier": "联通"   // 联通，移动，电信
      }
    },
    "resource": {
     // TDDO: 带确认下面解析的名称
      "pinyin": "ce+shi+xue+bin", // 姓名拼音
      "same_pinyin_names": "[“张棋”,”张起”]", // 相同拼音的联系人
      "high_confidence_similar_names": ["张宁","张玲"], // 高置信度相似拼音
      "include_names": "[\"测试薛斌\"]", // 通讯录包含查找名称
      "similar_names": "["张层","张增"]", // 底置信度相似拼音
      "similar_include_names": "["张莹莹","张怡怡"]", // 包含底置信度相似拼音
      "recommend_names": "[\"测试薛斌\"]" // 模糊匹配命中名字
      "yellow_pages": "[{"name":"搜狐客服电话","number":"01062726666"}]"  // 阿拉丁黄页客服
    },
    "speech": {
      "type": "txt",
      "content": "度秘为您找到相关的联系人:测试薛斌"
    },
    "bot_id": "ai.dueros.bot.phone_call",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    }
  },
  "id": "1494935842_931dttn5s",
  "logid": "14949358421483",
  "user_id": "test_offline1490608414.0",
  "time": 1494935842,
  "cuid": null,
  "se_query": "打电话给薛冰",
  "msg": "ok",
  "status": 0
}
```


字段说明：
### view:

|字段 | 描述 | 举例 | 
|---|---|---|
|type | 返回展示卡片数据，必选字段，这里默认是文本 | txt | 
|content | 文本内容 | 度秘为您找到相关的联系人:测试薛斌 | 

### nlu:

|slot |desc | value | 
|---|---|---|
|name | 名字 | 中文名 | 
|number | 电话号码 | eg:10086 | 
|use_sim_index | sim卡号 | 1、2 | 
|status|cancel|取消|


### resource：

|字段 | 描述 | 举例 | 
|---|---|---|
|pinyin | 姓名拼音 | eg:xuebin | 
|same_pinyin_names | 相同拼音联系人 | Eg：[“张棋”,”张起”]|
|include_names | 通讯录包含联系人 | Eg：["张宁宁","张玲玲"]|
|high_confidence_similar_names | 高置信度相似拼音 | Eg：["张宁","张玲"]|
|similar_names | 低置信度相似拼音 | Eg：["张层","张增"]|
|similar_include_names | 包含底置信度相似拼音 | Eg：["张莹莹","张怡怡"]|
|recommend_names | 模糊匹配命中名字 | Eg：["张莹莹","张怡怡"] 排序规则：name、same-pingyin-name、high-confidence—Similar–names、include-name、Similar–names、Similar–include-names|
|yellow_pages | 客服黄页 | Eg：[{"name":"搜狐客服电话","number":"01062726666"}]|


### speech:

|字段 | 描述 | 举例 | 
|---|---|---|
|type | 文本格式 | txt | 
|content | 语音文本 | 度秘为您找到相关的联系人:测试薛斌 | 
