# 通用信息输出schema

## 百科
```javascript
//query = 刘德华
{
  "result": {
    "hint": [
      "梁朝伟和刘德华的演技谁比较好？",
      "刘德华:一位我追了十二年的偶像",
      "刘德华的八卦新闻",
      "刘德华和周杰伦为什么不开微博？",
      "刘德华电影全集国语优酷",
      "刘德华演唱会"
    ],
    "bot_id": "aries_general",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "list",
        "list": [
          {
            "title": "刘德华",
            "summary": "刘德华（Andy Lau），1961年9月27日出生于中国香港，演员、歌手、作词人、制片人。1981年出演电影处女作《彩云曲》。1983年主演的武侠剧《神雕侠侣》在香港获得62点的收视纪录。1985年因拒签五年合约而被TVB雪藏。1988年将事业重心转向电影。1991年创办天幕电影公司。1994年担任剧情片《天与地》的制片人。2000年凭借警匪片《暗战》获得第19届香港电影金像奖最佳男主角奖。2002年主演警匪片《无间道》。2004年凭借警匪片《无间道3：终极无间》获得第41届台湾金马奖最佳男主角奖。2005年获得香港UA院线颁发的“1985-2005年全港最高累积票房香港男演员”奖。2006年获得釜山国际电影节亚洲最有贡献电影人奖。2011年主演剧情片《桃姐》，并凭借该片先后获得台湾金马奖最佳男主角奖、香港电影金像奖最佳男主角奖；同年担任第49届台湾电影金马奖评审团主席",
            "url": "http://baike.baidu.com/item/%E5%88%98%E5%BE%B7%E5%8D%8E/114923",
            "image": "http://t10.baidu.com/it/u=2938670487,4139963420&fm=58"
          }
        ]
      }
    ],
    "nlu": {
      "domain": "universal_search",
      "intent": "baike",
      "slots": {}
    },
    "speech": {
      "type": "Text",
      "content": "刘德华（Andy Lau），1961年9月27日出生于中国香港，演员、歌手、作词人、制片人。1981年出演电影处女作《彩云曲》。1983年主演的武侠剧《神雕侠侣》在香港获得62点的收视纪录。1985年因拒签五年合约而被TVB雪藏。1988年将事业重心转向电影。1991年创办天幕电影公司。1994年担任剧情片《天与地》的制片人。2000年凭借警匪片《暗战》获得第19届香港电影金像奖最佳男主角奖。2002年主演警匪片《无间道》。2004年凭借警匪片《无间道3：终极无间》获得第41届台湾金马奖最佳男主角奖。2005年获得香港UA院线颁发的“1985-2005年全港最高累积票房香港男演员”奖。2006年获得釜山国际电影节亚洲最有贡献电影人奖"
    }
  },
  "id": "1491449455_9725dv17a",
  "logid": "14914494554422",
  "user_id": "test",
  "time": 1491449455,
  "cuid": null,
  "se_query": "刘德华",
  "msg": "ok",
  "status": 0
}
```
## 限行
```javascript
//今日限行
{
  "result": {
    "bot_id": "aries_general",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "今日限行尾号为2和7"
      }
    ],
    "nlu": {
      "domain": "universal_search",
      "intent": "traffic_limit",
      "slots": {}
    },
    "speech": {
      "type": "Text",
      "content": "今日限行尾号为2和7"
    }
  },
  "id": "1491454889_6773438pl",
  "logid": "14914548899843",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1491454889,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "今日限行",
  "msg": "ok",
  "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
  "status": 0
}
```
## 股票
```javascript
//百度股价
{
  "result": {
    "bot_id": "aries_general",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "百度现在172.92美元，跌幅1.30%，已收盘"
      }
    ],
    "nlu": {
      "domain": "universal_search",
      "intent": "stock",
      "slots": {}
    },
    "speech": {
      "type": "Text",
      "content": "百度现在172.92美元，跌幅1.30%，已收盘"
    }
  },
  "id": "1491456519_721eo39ui",
  "logid": "14914565194440",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1491456519,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "百度股价",
  "msg": "ok",
  "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
  "status": 0
}
```
## 汇率
```javascript
//人民币和美元汇率
{
    "result": {
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "1人民币等于0.1450美元"
            }
        ],
        "nlu": {
            "domain": "universal_search",
            "intent": "exchange_rate",
            "slots": {}
        },
        "speech": {
            "type": "Text",
            "content": "1人民币等于0.1450美元"
        }
    },
    "id": "1491457870_555ae9tjh",
    "logid": "14914578698957",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1491457870,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "se_query": "人民币和美元汇率",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0
}
```
## 翻译
```javascript
//我爱你翻译
{
  "result": {
    "bot_id": "aries_general",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "I love you; <法>Je t’aime; <德>Ich liebe Dich; <日>わたしはあなたをあいしています。"
      }
    ],
    "nlu": {
      "domain": "universal_search",
      "intent": "translator",
      "slots": {}
    },
    "speech": {
      "type": "Text",
      "content": "I love you; <法>Je t’aime; <德>Ich liebe Dich; <日>わたしはあなたをあいしています。"
    }
  },
  "id": "1491457017_276ejxzee",
  "logid": "14914570165345",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1491457017,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "我爱你翻译",
  "msg": "ok",
  "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
  "status": 0
}
```
## 计算
```javascript
//10的平方减去5的立方
{
  "result": {
    "bot_id": "aries_general",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "10的平方减去5的立方等于-25"
      }
    ],
    "nlu": {
      "domain": "universal_search",
      "intent": "calculator",
      "slots": {}
    },
    "speech": {
      "type": "Text",
      "content": "10的平方减去5的立方等于-25"
    }
  },
  "id": "1491457120_501abhwca",
  "logid": "14914571192088",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1491457120,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "10的平方减去5的立方",
  "msg": "ok",
  "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
  "status": 0
}
```
## 时间
```javascript
//后天是星期几
{
  "result": {
    "bot_id": "aries_general",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "后天是星期六，2017年4月8日"
      }
    ],
    "nlu": {
      "domain": "universal_search",
      "intent": "time",
      "slots": {}
    },
    "speech": {
      "type": "Text",
      "content": "后天是星期六，2017年4月8日"
    }
  },
  "id": "1491457390_198969bde",
  "logid": "14914573899085",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1
```
## 明星问答
```javascript
//刘德华的老婆是谁
{
  "result": {
    "bot_id": "aries_general",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "刘德华的妻子是朱丽倩"
      }
    ],
    "nlu": {
      "domain": "universal_search",
      "intent": "kg",
      "slots": {}
    },
    "speech": {
      "type": "Text",
      "content": "刘德华的妻子是朱丽倩"
    }
  },
  "id": "1491457512_1398i1u1p",
  "logid": "14914575116103",
  "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "time": 1491457512,
  "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
  "se_query": "刘德华的老婆是谁",
  "msg": "ok",
  "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
  "status": 0
}
```
## 汉语问答
```javascript
//清明时节雨纷纷的下一句
{
    "result": {
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "清明时节雨纷纷的下一句是路上行人欲断魂"
            }
        ],
        "nlu": {
            "domain": "universal_search",
            "intent": "kg",
            "slots": {}
        },
        "speech": {
            "type": "Text",
            "content": "清明时节雨纷纷的下一句是路上行人欲断魂"
        }
    },
    "id": "1491457766_8062iip1o",
    "logid": "14914577654938",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1491457766,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "se_query": "清明时节雨纷纷的下一句",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0
}
```
## 常识问答
```javascript
//世界上最高的山
{
    "result": {
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "世界上最高的山峰是珠穆朗玛峰，高度为8844.46米。"
            }
        ],
        "nlu": {
            "domain": "universal_search",
            "intent": "kg",
            "slots": {}
        },
        "speech": {
            "type": "Text",
            "content": "世界上最高的山峰是珠穆朗玛峰，高度为8844.46米。"
        }
    },
    "id": "1491458111_786bivj2j",
    "logid": "14914581116985",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1491458111,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "se_query": "世界上最高的山",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0
}
```
## 通用搜索
```javascript
//肚子饿了怎么办
{
    "result": {
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "肚子饿了怎么办_百度知道",
                        "summary": "走出门 一直走 遇到红路灯不要向左转 一直走 有车直接撞",
                        "url": "http://zhidao.baidu.com/question/159263414.html"
                    },
                    {
                        "title": "肚子饿了怎么办_有问必答_快速问医生",
                        "summary": "不饱,刚吃完饭一会就感到肚子饿,无论吃得多饱,一会就饿了,我是不是有病啊,这该怎么办啊...",
                        "url": "http://m.120ask.com/askg/bd_detail/34368453"
                    },
                    {
                        "title": "睡前肚子饿了怎么办?10种睡前可以吃的食物~..._百度文库",
                        "summary": "10种睡前可以吃的食物~(46条震撼你的生活小常识)。睡前肚子饿了怎么办?10种睡前可以吃的食物 ...",
                        "url": "http://wenku.baidu.com/view/b717aa8071fe910ef12df884.html"
                    },
                    {
                        "title": "肚子饿了怎么办_百度经验",
                        "summary": "肚子饿了怎么办,很多朋友在废寝忘食工作或者过度放松的情况下往往会忘了吃饭,于是造成的结果就是肚子很饿...",
                        "url": "http://jingyan.baidu.com/article/e3c78d64bbf5c23c4c85f5a5.html",
                        "image": "http://cdn01.baidu-img.cn/timg?wisealaddin&size=u200_200&quality=80&sec=1491457643&di=0061a9dba8a00f7cbcf666b803eea34e&src=http%3A%2F%2Ft11.baidu.com%2Fit%2Fu%3D4234974745%2C3911491710%26fm%3D58%26s%3DCEA41C62D3CB40EB4A5CB9DE000080B1%26bpow%3D800%26bpoh%3D600"
                    },
                    {
                        "title": "半夜里饿了怎么办?没吃的东西的前提下。_百度拇指医生",
                        "summary": "半夜里饿了怎么办?没吃的东西的前提下。最快的减肥:第一种:喝白开水!早上起床后就喝杯白开水既解饿也...",
                        "url": "http://muzhi.baidu.com/question/495721149646178164.html"
                    },
                    {
                        "title": "减肥过程中饿了怎么办_百度经验",
                        "summary": "减肥过程中饿了怎么办,成功减肥者的8大心得。成功瘦身者传授瘦身心得,再配合正确的减肥方法的同时,还...",
                        "url": "http://jingyan.baidu.com/article/e3c78d640308aa3c4c85f5df.html"
                    },
                    {
                        "title": "睡前饿了怎么办,十种可以吃的食物_百度文库",
                        "summary": ",中午吃的像平民,晚上吃的像乞丐 睡前饿了怎么办?10 种睡前可以吃的食物~再也不怕晚上肚子饿啦~ ...",
                        "url": "http://wenku.baidu.com/view/07e1692458fb770bf78a55b5.html"
                    },
                    {
                        "title": "如果大家晚上突然感觉饿了会怎么办?吃还是不吃?..._果壳",
                        "summary": "选择不吃的人,你是靠什么来抵抗自己巨大的饿感?另外,想吃的话吃什么能比较不容易发胖?大家说出来交流下呗~",
                        "url": "http://m.guokr.com/post/455727/"
                    },
                    {
                        "title": "我肚子饿了怎么办啊真的好饿啊,没的吃的 - 爱问知识人",
                        "summary": "好评回答 2163374807 | 11-07-05 0 0 举报 想办法弄点食物吃或者用绳子捆住肚子。...",
                        "url": "http://m.iask.sina.com.cn/b/18838974.html"
                    }
                ]
            }
        ],
        "nlu": {
            "domain": "universal_search",
            "intent": "normal",
            "slots": {}
        },
        "speech": {
            "type": "Text",
            "content": "为你找到以下内容"
        }
    },
    "id": "1491457644_209ce75u4",
    "logid": "14914576433556",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1491457644,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "se_query": "肚子饿了怎么办",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0
}
```

## nlu输出
```javascript
domain： universal_search
intent:
calculator => 计算器
stock => 股票
exchange_rate => 汇率
image => 图片
traffic_limit => 限行
kg => 知识图谱（问答/人物/诗词/汉语...）
short_video => 短视频
app => 应用下载
weather => 天气
tieba => 贴吧
lbs_consume => lbs消费
novel => 小说
teleplay => 电视剧
music => 音乐
car_series => 车系
lottery => 彩票
cookbook => 菜谱
3c => 3C产品
animation => 动漫
douban => 豆瓣
lbs => 导航
train_ticket => 火车票
shopping_search => 购物搜索
nba => NBA
moive_ticket => 电影票
weibo => 微博
constellation => 星座
recruit => 招聘
travel => 旅游
hotel => 酒店
plane_ticket => 飞机票
drugs => 药品
baike => 百科
time => 时间
general_aladdin => 其他泛阿拉丁
```