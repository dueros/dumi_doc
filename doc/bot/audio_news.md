## 新闻返回示例:

```javascript
// 播放娱乐新闻
{
    "data":{
        "directives":[
            {
                "header":{
                    "namespace":"SpeechSynthesizer",
                    "name":"Speak",
                    "message_id":"1493864807_662bc4xyq"
                },
                "payload":{
                    "token":"3506569477723439778",
                    "type":"Text",
                    "channel":"Content",
                    "speak_behavior":"REPLACE_ALL",
                    "content":[
                        "格斗狂人徐晓冬发文甄子丹和成龙对比成龙只是个演员",
                        "连王思聪都开始关心此事，称虽然有炒作嫌疑，但是徐晓冬起码在打假，一时让这位格斗狂人成为网红",
                        "MMA徐晓冬成为网红后，最近开始回答网友提问，其中一个问题引起大家热议，有网友问甄子丹和成龙谁更厉害，徐晓冬直言甄子丹和成龙对战的话，毫无疑问甄子丹更强，而成龙就是个演员"
                    ],
                    "should_get_next_speech":true
                }
            }
        ],
        "speech":{
            "type":"Text",
            "content":"为您播放相关新闻的主要内容"
        },
        "resource":{
            "type":"news_ref",
            "data":{
                "api":{
                    "method":"GET",
                    "url":"http://s.xiaodu.baidu.com/v20161223/news/playlist?user_id=qa_test_debug_yinjie_debug_monitor"
                }
            }
        },
        "views":[
            {
                "type":"list",
                "list":[
                    {
                        "title":"格斗狂人徐晓冬发文 甄子丹和成龙对比 成龙只是个演员"
                        "summary":"连王思聪都开始关心此事，称虽然有炒作嫌疑，但是徐晓冬起码在打假，一时让这位格斗狂人成为网红。MMA徐晓冬成为网红后，最近开始回答网友提问，其中一个问题引起大家热议，有网友问甄子丹和成龙谁更厉害，徐晓冬直言甄子丹和成龙对战的话，毫无疑问甄子丹更强，而成龙就是个演员。",
                        "image":"https://t10.baidu.com/it/u=48542835,4216554270&fm=170&s=7D3203D1502A1B132F35F01E03008040&w=218&h=146&img.JPEG",
                        "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3506569477723439778&n_type=1&p_from=5",
                        "site":"热门集结号",
                    },
                    {
                        "title":"又一枚招黑体要逆袭了!真实的娜扎其实是这样的…"
                        "summary":"五一小长假宝宝们休息得可还满意咩？大家一定猜出是谁了吧~凑是她---古力娜扎！一些娜扎的粉丝表示，娜扎能在《花少3》里放飞自我，少了之前上综艺节目的羞涩和紧张，江疏影起到了非常重要的作用，也有观众表示娜扎和江疏影还原了生活中闺蜜们的真实模样~。",
                        "image":"https://t12.baidu.com/it/u=1451155880,534240721&fm=170&s=F92BA05408530BD455267C810300E088&w=218&h=146&img.GIF",
                        "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=2559658158706376148&n_type=0&p_from=5",
                        "site":"新浪娱乐",
                    },
                    {
                        "title":"郑爽至今没有和杨洋走到一起，原来是被他占了先机，亲密关系胜过杨洋！"
                        "summary":"去年的《微微一笑很倾城》中的贝薇薇和肖奈CP，相信给大家的印象很是深刻，网友都说两个人不在一起实在是太可惜啦，甜炸的两个人真的很般配呢。虽然和郑爽组过cp的也不算少，但是貌似和郑爽配的只有杨洋了。近日《翡翠恋人》中郑爽和李钟硕的合影又使网友们发现了新cp。李钟硕揽着郑爽的腰，两人配的一脸，你支持郑爽和那一位男星组cp呢？",
                        "image":"https://t10.baidu.com/it/u=3057389397,2784140068&fm=170&s=A0E066B15C73CE90EE45E45E03008073&w=218&h=146&img.JPEG",
                        "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3418558970771359236&n_type=1&p_from=5",
                        "site":"小兔子娱乐",
                    }
                ],
            }
        ]
        "nlu":{
            "domain":"audio.news",
            "intent":"audio.news.play",
            "slots":{
                "category":"娱乐"
            }
        }
    }
}
```


### nlu部分的说明
intent|slot|slot_name|slot_value
------|----|---------|----------
intent::audio.news.play 新闻播放|分类|category|国际/国内/体育/娱乐/社会/财经/互联网/科技/房产/汽车/教育/时尚/游戏/军事/旅游/生活/人文/创意/搞笑/美图/女人/美食/家居/健康/两性/情感/星座命理/育儿/文化/历史/宠物/科学/动漫/职场/三农/本地/悦读/交通/影视/时事/法律/综合
 |省份|province|浙江
 |城市|city|杭州
 |关键字|keyword|王宝强
 |排序类型|sort_type|最热/最新
intent::audio.news.stop 停止 |              
intent::audio.news.next 下一条 |
intent::audio.news.previous 上一条 | 


### directives 部分的说明

参考：[SpeechSynthesizer](../directives/SpeechSynthesizer.md) 语音播报（TTS）相关指令


### resource 部分的解释说明

存放新闻列表的地址。

说明：当前的data对象下面存在list字段，为短期内兼容之前的协议版本所保留，后续会下线，请勿使用。新闻列表请通过api字段下的url链接获取。

```javascript
"resource": {
    "type": "news_ref",
    "data": {
        "api": {
            "method": "GET",
            "url": "http://s.xiaodu.baidu.com/v20161223/news/playlist?user_id=yinjie05_debug_monitor"
        }
    }
},
```


## 获取新闻播放列表

  * 接口地址：http://s.xiaodu.baidu.com/v20161223/news/playlist?user_id=yinjie05_debug_monitor
            (对应语音交互返回结果的resource.data.api.url字段内容)
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
user_id|string|是|用户ID，用户的唯一标识
appid|string|是|appid
page|int|否|页码，默认为1
page_size|int|否|每页数据量，默认为10

  * 返回码：status为0表示成功，非0表示失败。

  * 说明：当前只支持最多获取10条新闻。

返回格式：

```javascript
{
    "status":0,
    "code":"",
    "data":[
        {
            "id":"3506569477723439778",
            "title":"格斗狂人徐晓冬发文 甄子丹和成龙对比 成龙只是个演员",
            "summary":"连王思聪都开始关心此事，称虽然有炒作嫌疑，但是徐晓冬起码在打假，一时让这位格斗狂人成为网红。MMA徐晓冬成为网红后，最近开始回答网友提问，其中一个问题引起大家热议，有网友问甄子丹和成龙谁更厉害，徐晓冬直言甄子丹和成龙对战的话，毫无疑问甄子丹更强，而成龙就是个演员。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=3506569477723439778",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3506569477723439778&n_type=1&p_from=5",
            "site":"热门集结号",
            "image":"",
            "thumb":"https://t10.baidu.com/it/u=48542835,4216554270&fm=170&s=7D3203D1502A1B132F35F01E03008040&w=218&h=146&img.JPEG",
            "pubtime":"2017-05-04 09:58:56"
        },
        {
            "id":"2559658158706376148",
            "title":"又一枚招黑体要逆袭了!真实的娜扎其实是这样的…",
            "summary":"五一小长假宝宝们休息得可还满意咩？大家一定猜出是谁了吧~凑是她---古力娜扎！一些娜扎的粉丝表示，娜扎能在《花少3》里放飞自我，少了之前上综艺节目的羞涩和紧张，江疏影起到了非常重要的作用，也有观众表示娜扎和江疏影还原了生活中闺蜜们的真实模样~。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=2559658158706376148",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=2559658158706376148&n_type=0&p_from=5",
            "site":"新浪娱乐",
            "image":"",
            "thumb":"https://t12.baidu.com/it/u=1451155880,534240721&fm=170&s=F92BA05408530BD455267C810300E088&w=218&h=146&img.GIF",
            "pubtime":"2017-05-04 09:57:00"
        },
        {
            "id":"3418558970771359236",
            "title":"郑爽至今没有和杨洋走到一起，原来是被他占了先机，亲密关系胜过杨洋！",
            "summary":"去年的《微微一笑很倾城》中的贝薇薇和肖奈CP，相信给大家的印象很是深刻，网友都说两个人不在一起实在是太可惜啦，甜炸的两个人真的很般配呢。虽然和郑爽组过cp的也不算少，但是貌似和郑爽配的只有杨洋了。近日《翡翠恋人》中郑爽和李钟硕的合影又使网友们发现了新cp。李钟硕揽着郑爽的腰，两人配的一脸，你支持郑爽和那一位男星组cp呢？",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=3418558970771359236",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3418558970771359236&n_type=1&p_from=5",
            "site":"小兔子娱乐",
            "image":"",
            "thumb":"https://t10.baidu.com/it/u=3057389397,2784140068&fm=170&s=A0E066B15C73CE90EE45E45E03008073&w=218&h=146&img.JPEG",
            "pubtime":"2017-05-04 09:40:28"
        },
        {
            "id":"3205985826513278211",
            "title":"拍过3级片玩过地下情，被彭于晏暗恋，她最终嫁作他人妇",
            "summary":"彭于晏用自己的蜕变和精湛的演技。7年过去了，彭于晏很多地方都变了。彭于晏的好友余文乐带他去拜。那时在场的香港人无人认识彭于晏。彭于晏的办法很简单：“做她喜欢的事情。彭于晏最终还是没能和舒淇在一起。祝福彭于晏也早点找到自己的另一半吧。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=3205985826513278211",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3205985826513278211&n_type=1&p_from=5",
            "site":"环球旅游",
            "image":"",
            "thumb":"https://t11.baidu.com/it/u=3502029508,2438972355&fm=170&s=65BB33D75413CD88057151F10300C034&w=218&h=146&img.JPEG",
            "pubtime":"2017-05-04 09:39:46"
        },
        {
            "id":"3157049548926521845",
            "title":"他择天记里给鹿晗做配角，被骂惨",
            "summary":"不得不说，看了几集发现，在一众”面瘫‘男主之中，鹿晗相对属于演技自然的那种。到目前爲止除有些台词和情形略显为难，陈长生的各种举措还算行云流水。这回说说在《择天记》中，饰演金玉律的高圣远，他的名字大家有些生疏，但是他的标签可是周迅的老公，大家还记得周迅在微博上发布爱情时分的甘美。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=3157049548926521845",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3157049548926521845&n_type=1&p_from=5",
            "site":"七月杂货铺",
            "image":"",
            "thumb":"https://t11.baidu.com/it/u=1823692162,64319016&fm=170&s=80334F302BF165920CD940C20300A0B2&w=218&h=146&img.JPEG",
            "pubtime":"2017-05-04 09:38:15"
        },
        {
            "id":"2811454756298141532",
            "title":"陕西版《人民的名义》 阵容强大，绝对精彩！",
            "summary":"看着戏中各个新老演员的精湛演技。结果发现阵容强大、演技颜值兼具。李琦，陕西西安人，1955年2月17日。孙浩，陕西西安人，歌手出身，代表作《中华民谣》、《阳光天堂》等，近几年也参演了不少影视作品。最后再来看看陕西话版《人民的名义》。适合《人民的名义》的什么角色。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=2811454756298141532",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=2811454756298141532&n_type=1&p_from=5",
            "site":"汉中微部落",
            "image":"",
            "thumb":"https://t11.baidu.com/it/u=2947932262,3007708866&fm=170&s=C18B93554070B198DDB14C2A03002053&w=218&h=146&img.JPEG",
            "pubtime":"2017-05-04 09:36:15"
        },
        {
            "id":"3829479301106064223",
            "title":"杨幂？吴磊？杨紫？下一个爆火的童星可是他！",
            "summary":"接下来，就跟着小编看下现场情况吧~。我们还将携手目前国内最火的短视频二更，邀请我们参演的小朋友进行微剧、短视频的创作。5月份开始，台州国学儿童剧项目将与各大学校合作，开展萌星杯“中华小故事国学儿童剧”小演员选拔赛。报名地址：椒江区东环大道345台州老广电大楼一楼海视影业。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=3829479301106064223",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3829479301106064223&n_type=1&p_from=5",
            "site":"名人八卦",
            "image":"",
            "thumb":"https://t11.baidu.com/it/u=1222753300,35338058&fm=170&s=12B3538710BB4D9ACAADF8DF03000021&w=218&h=146&img.PNG",
            "pubtime":"2017-05-04 09:31:09"
        },
        {
            "id":"3638621966798515943",
            "title":"《极限挑战》已定档，当三精遇到三傻是否可以超越《奔跑吧》？给我们无穷无尽的快乐！",
            "summary":"《极限挑战》自2015年暑假和大家见面以来，现在也只播出了两季，第三季迟迟不播出一直吊着观众的胃口，着实是让大家等得很焦灼啊。因为节目组一直是在保证质量加上男人帮之间感情深厚，观众也是一直在等待。极限三傻继续傻下去？极限三傻、是颜王孙红雷、大松鼠王迅、小绵羊张艺兴 ，极限三傻带给我们无穷无尽的快乐。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=3638621966798515943",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3638621966798515943&n_type=1&p_from=5",
            "site":"娱乐随便聊",
            "image":"",
            "thumb":"https://t11.baidu.com/it/u=1654168168,1922263267&fm=170&s=FAEDA9444943395B66791C9303008088&w=218&h=146&img.JPEG",
            "pubtime":"2017-05-04 09:25:07"
        },
        {
            "id":"3597096676794455655",
            "title":"泰国女富豪找到第9任老公， 前夫称：一夜28次受不了才离婚的！",
            "summary":"非常感谢朋友们打开小编的文章，我将一如既往的给大家开诚布公的分享一些知识和看法，如果接下来的内容哪怕能对您产生一些小小的快乐，笔者将不胜荣幸！小编话说：谢谢这么优秀的你来看文章，有什么想对小编说的尽管来吧，大家的支持就是我们的动力，欢迎大家踊跃发表评论，欢迎吐槽，让我在评论区看到高逼格的你，小编在评论区等你哦。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=3597096676794455655",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3597096676794455655&n_type=1&p_from=5",
            "site":"盘点奇趣异事",
            "image":"",
            "thumb":"https://t11.baidu.com/it/u=3483554392,2200937200&fm=170&s=A7161DCF48623007429100B003008012&w=218&h=146&img.JPEG",
            "pubtime":"2017-05-04 09:21:25"
        },
        {
            "id":"3370672881399791496",
            "title":"王宝强刚被曝出结婚消息，马蓉父亲立马称要曝大料毁掉他！",
            "summary":"近来，王宝强与熊乃瑾走得比较近，两人经常一起亲密的进入某体育馆做健身，王宝强还亲密的贴身教熊乃瑾武术招式。消息传得沸沸扬扬，粉丝们争先送上了祝福，没想到，马蓉的父亲却见不得宝强好，在微博上大声吆喝，称自己这儿有王宝强的大料，要毁掉王宝强一辈子。微博用户名字是马蓉父亲马阳卫，他第一条微博说：蓉儿现在比较稳定，我老伴本身就要高血压，现在还在监护病房。",
            "content_url":"http://s.xiaodu.baidu.com/v20161223/news/content?id=3370672881399791496",
            "url":"http://m.baidu.com/feed/data/landingpage?s_type=news&dsp=wise&nid=3370672881399791496&n_type=1&p_from=5",
            "site":"娱乐开森妹",
            "image":"",
            "thumb":"https://t11.baidu.com/it/u=3875812192,3041931758&fm=170&s=0F04EA07528880BAB98CA3B603005027&w=218&h=146&img.PNG",
            "pubtime":"2017-05-04 09:18:24"
        }
    ],
    "message":""
}
```


## 获取新闻内容接口

  * 接口地址：http://s.xiaodu.baidu.com/v20161223/news/content?id=17415159588394100071
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
id|string|是|新闻ID，新闻的唯一标识

  * 返回码：status为0表示成功，非0表示失败。

  * 说明：新闻内容包含图片和问题，返回结果中通过type字段区分。

返回格式：
```
{
    status: 0,
    code: "",
    data: [
        {
            type: "image",
            data: {
                big: {
                    height: 680,
                    url: "http://t11.baidu.com/it/u=2235963898,1792389728&fm=170&s=CBD4D1AE0937A5EF5EB9458603003007&w=623&h=680&img.JPEG",
                    width: 623
                },
                original: {
                    height: 680,
                    url: "http://img1.gtimg.com/ent/pics/hv1/217/233/2185/142139257.jpg",
                    width: 623
                },
                original_third: {
                    height: 680,
                    url: "http://img1.gtimg.com/ent/pics/hv1/217/233/2185/142139257.jpg",
                    width: 623
                },
                small: {
                    height: 360,
                    url: "http://t11.baidu.com/it/u=279339871,159264062&fm=170&s=CBD4D1AE0937A5EF5EB9458603003007&w=480&h=360&img.JPEG",
                    width: 480
                }
            }
        },
        {
            type: "text",
            data: "节目录制现场"
        },
        {
            type: "image",
            data: {
                big: {
                    height: 302,
                    url: "http://t11.baidu.com/it/u=2144948446,1705532450&fm=170&s=928048A70E7A72964D19900203001011&w=479&h=302&img.JPEG",
                    width: 479
                },
                original: {
                    height: 302,
                    url: "http://img1.gtimg.com/ent/pics/hv1/222/233/2185/142139262.jpg",
                    width: 479
                },
                original_third: {
                    height: 302,
                    url: "http://img1.gtimg.com/ent/pics/hv1/222/233/2185/142139262.jpg",
                    width: 479
                },
                small: {
                    height: 302,
                    url: "http://t11.baidu.com/it/u=188324419,72406784&fm=170&s=928048A70E7A72964D19900203001011&w=479&h=302&img.JPEG",
                    width: 479
                }
            }
        },
        {
            type: "text",
            data: "黄晓明拍戏受伤"
        },
        {
            type: "image",
            data: {
                big: {
                    height: 680,
                    url: "http://t11.baidu.com/it/u=2176538020,1732823474&fm=170&s=3EE2C704CA23529C260C09B2030080C3&w=509&h=680&img.JPEG",
                    width: 509
                },
                original: {
                    height: 680,
                    url: "http://img1.gtimg.com/ent/pics/hv1/233/233/2185/142139273.jpg",
                    width: 509
                },
                original_third: {
                    height: 680,
                    url: "http://img1.gtimg.com/ent/pics/hv1/233/233/2185/142139273.jpg",
                    width: 509
                },
                small: {
                    height: 360,
                    url: "http://t11.baidu.com/it/u=219913993,99697808&fm=170&s=3EE2C704CA23529C260C09B2030080C3&w=480&h=360&img.JPEG",
                    width: 480
                }
            }
        },
        {
            type: "text",
            data: "黄晓明写真"
        },
        {
            type: "text",
            data: "腾讯娱乐讯昨晚（2月12日）播出的某综艺节目，黄晓明在猜评团中“神探”上身，对于各MC邀请的神秘嘉宾好友几乎每猜必中。"
        },
        {
            type: "text",
            data: "大部分都不是歌手出身的MC们，为了在这次歌会中有精彩的表现，也是极尽突破挑战自我。猜评团成员张大大突然现场爆料黄晓明不仅正在发烧中，还知道他前两周去做正骨，痛到大叫，令黄爸爸凌晨两点在隔壁房间听到儿子的叫声十分心疼。"
        },
        {
            type: "text",
            data: "黄晓明出道近二十年，拍戏一向拼命的他，虽然不是专业动作演员，拍动作戏也尽量亲身上阵，所以多年来身上的大伤小伤一直不断，而为了不影响剧组的进度，常常都是不顾医生的“工作禁令”就回到剧组继续工作。"
        },
        {
            type: "text",
            data: "2003年拍摄《龙票》时在沙漠翻车导致颈椎严重骨折，医生就勒令让黄晓明休息几个月，黄晓明担心剧组工作人员都在等他，坚持继续拍戏，医生说“你疯了吗，如果不好好休息就会瘫痪！”但他仍旧坚持开工，于是，就此留下了严重的后遗症。直到现在，黄晓明都无法睡正常的枕头，必须要特制的圆形枕头睡觉，他的颈椎才不会那么疼。他还曾自曝其实有“威亚恐惧症”，几年前拍摄一部电影时，从威亚上直接掉了下来，脚趾粉碎性骨折，打了4根钢钉，2根钢针。但他在伤后40天还是坚持去拍戏，打着绷带吊着腿继续吊威亚。“劳模”背后的努力和坚持令人敬佩。"
        }
    ],
    message: ""
}
```

