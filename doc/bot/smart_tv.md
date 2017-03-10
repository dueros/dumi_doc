[toc]

# 简介
智能电视是<kbd>DuerOS</kbd>下的一个垂类服务, 通过语音解析和意图识别等能力给盒子提供服务,如:
语音控制换台, 语音检索影片, 根据画面查询人物信息, 控制视频播放的节奏等.

作为<kbd>DuerOS</kbd>的垂类服务, 因此通过<kbd>DuerOS</kbd>的协议字段directives提供给终端使用. <kbd>DuerOS</kbd>的协议以及其他垂类返回格式可直接参考:[<<度秘开放平台OpenAPI使用说明>>](../api/overview.md), 本文档只具体描述智能TV盒子的接口协议.

# 语音播报 Speech
语音播报描述字段speech是与directives指令平行的一个字段, 当服务端返回的数据有需要播放的文本或者其他时, 就需要补充该字段, 客户端通过解析该字段来调用speaker接口. 格式如下:

	"speech": {
	    "type": "Text",  
		"content": "正在为您播放周杰伦的歌曲"
	}

#天气

天气需要填充视图和进行语音播报，天气视图描述字段views，其value为jsonarray格式，客户端通过views字段填充视图，通过解析speech字段进行语音播报. 其中views格式如下:
	
	"views": [
                {
                    "type": "list",
                    "list": [
                        {
                            "summary": "实时：6℃\n温度：-3℃~7℃\n风力：北风4-5级\n空气质量指数：30，优\n来源：中国天气网",
                            "image": "http://xiaodu.baidu.com/img/pic?pic_id=46191609",
                            "title": "北京市今天晴",
                            "url": "https://m.baidu.com/from=2001a/s?word=北京市天气"
                        }
                    ]
                }
            ]

# 指令 Directives
## 设计原型

	{
    "header": {
        "namespace": "tv.xxx",
        "name": "Xxx"
    },
    "payload": {
        "extend":{}
    }
	}
1. 通过header中的namespace和name确定一种指令
2. payload为指令附加的参数
3. extend为扩展字段, 通常情况下都为空, 用户不需关心
4. 尽可能使用全称,而不是简写
5. namespace用小写和"."分隔
6. name采用首字母大写的驼峰命名法


## 详细指令列表

### tv.system.volume.Up
    音量增大
	{
    "header": {
        "namespace": "tv.system.volume",
        "name": "Up"
    },
    "payload": {
        "value": 1,
        "extend": {}
    }
	}
    	
    

### tv.system.volume.Down
	减小音量
	{
    "header": {
        "namespace": "tv.system.volume",
        "name": "Down"
    },
    "payload": {
        "value": 1,
        "extend": {}
    }
	}
	
### tv.system.volume.Set
	设置音量
	{
    "header": {
        "namespace": "tv.system.volume",
        "name": "Set"
    },
    "payload": {
        "value": 1,
        "extend": {}
    }
	}
	
	
### tv.system.volume.Mute
	静音
	{
    "header": {
        "namespace": "tv.system.volume",
        "name": "Mute"
    },
    "payload": {
        "value": 0,
        "extend": {}
    }
	}
       
### tv.system.volume.Unmute
	取消静音
	{
    "header": {
        "namespace": "tv.system.volume",
        "name": "Unmute"
    },
    "payload": {
        "value": 0,
        "extend": {}
    }
	}
       
### tv.system.light.Up
	调高亮度
	{
	    "header": {
        "namespace": "tv.system.light",
        "name": "Up"
    },
    "payload": {
        "value": 2,
        "extend": {}
    }
}
        
### tv.system.light.Down
	调低亮度
	{
    "header": {
        "namespace": "tv.system.light",
        "name": "Down"
    },
    "payload": {
        "value": 2,
        "extend": {}
    }
	}
        
### tv.system.constrast.Up
	对比度增大
	{
    "header": {
        "namespace": "tv.system.constrast",
        "name": "Up"
    },
    "payload": {
        "value": 2,
        "extend": {}
    }
	}
         
### tv.system.contrast.Down
	 对比度减小
	{
    "header": {
        "namespace": "tv.system.constrast",
        "name": "Down"
    },
    "payload": {
        "value": 2,
        "extend": {}
    }
	}
### tv.system.application.Open
	打开应用
	{
    "header": {
        "namespace": "tv.system.application",
        "name": "Open"
    },
    "payload": {
        "name": "应用名称",
        "package_name": "xxxx.apk", 
        "args": "模块名-子模块-子子",
        "deep_link":"",
        "extend": {}
    }
	}
 
### tv.system.application.Close
	关闭应用
	{
    "header": {
        "namespace": "tv.system.application",
        "name": "Close"
    },
    "payload": {
        "name": "应用名称",
        "package_name": "xxxx.apk", 
        "args": "模块名-子模块-子子",
        "deep_link":"",
        "extend": {}
	}

      
### tv.system.application.Upgrade
	升级应用
	{
    "header": {
        "namespace": "tv.system.application",
        "name": "Upgrade"
    },
    "payload": {
        "name": "应用名称",
        "package_name": "xxxx.apk", 
		"args": "",
        "extend": {}
    }
	}

### tv.system.application.Uninstall
	卸载应用
	{
    "header": {
        "namespace": "tv.system.application",
        "name": "Uninstall"
    },
    "payload": {
        "name": "应用名称",
        "package_name": "xxxx.apk", 
        "args": "",
        "extend": {}
    }
	}

### tv.system.command.Go
	//打开主页launcher/系统设置/某个主页模块
	{
    "header": {
        "namespace": "tv.system.command",
        "name": "Go"
    },
    "payload": {
	    "name":"主页", //比如主页, 设置, 某个主页模块名
        "extend": {}
    }
	}

### tv.system.command.Exit
	退出
	{
    "header": {
        "namespace": "tv.system.command",
        "name": "Exit"
    },
    "payload": {
        "extend":{}
    }
	}
### tv.system.command.Back
	返回
	{
    "header": {
        "namespace": "tv.system.command",
        "name": "Back"
    },
    "payload": {
        "extend":{}
    }
	}

### tv.system.command.Sleep
	休眠
	{
        "header": {
            "namespace": "tv.system.command",
            "name": "Sleep"
        },
        "payload": {
            "extend":{}
        }
    }

### tv.system.command.Wake
	唤醒盒子
	{
        "header": {
            "namespace": "tv.system.command",
            "name": "Wake"
        },
        "payload": {
            "extend":{}
        }
    }
  
### tv.system.command.TVOn
	打开电视
	{
        "header": {
            "namespace": "tv.system.command",
            "name": "TVOn"
        },
        "payload": {
            "extend":{}
        }
    }

### tv.system.command.TVOff
	关闭电视
	{
        "header": {
            "namespace": "tv.system.command",
            "name": "TVOff"
        },
        "payload": {
            "extend":{}
        }
    }  
### tv.system.channel.Open
	打开电视台的指令
	{
    "header": {
        "namespace": "tv.system.channel",
        "name": "Open"
    },
    "payload": {
        "channel_name": "北京卫视",
        "channel_code": "btv",
        "extend": {}
    }
	}

### tv.system.channel.Update
	升级直播资源
	{
        "header": {  
	        "namespace": "tv.system.channel",
            "name": "Update", 
         },
        "payload": {  
             "extend": { }
           }
        }
### tv.player.resource.Play
	播放器播放指令
	{
        "header": {  
              "namespace": "tv.player.resource", 
              "name": "Play", 
         },
        "payload": {   //指令的参数
			 "title" : "", //资源名称
			 "description": "" //资源描述信息
			 "uri": "资源唯一标识" //可以是url或者是资源id
			 "time_point" : "",  //播放参数, 跳转到某个时间点进行播放
			 "extend": {}
       }
     }

  
### tv.player.control.Pause
	播放器暂停/继续
	{
        "header": {  
              "namespace": "tv.player.control", 
              "name": "Pause", 
         },
        "payload": {   
			 "value" : 1, //1:暂停 || 0: 继续(取消暂停) 
			 "extend": {}
       }
     }
### tv.player.control.FastForward
	快进
	{
        "header": {  
              "namespace": "tv.player.control", 
               "name": "FastForward", 
            },
        "payload": {   //指令的参数
			   "offset":30   //快进一次跨越的时间, 默认30秒
			   "extend": { }
             }
        }
### tv.player.control.Goto
	指定时间点跳转
	{
        "header": { 
             "namespace": "tv.player.control", 
             "name": "Goto", 
         },
        "payload": {   //指令的参数
	          "time_point": 367 //单位: 秒, 相对于影片开头的秒数                
              "extend" : {}
            }
         }
### tv.player.control.BackForward
	快退指令
	{
        "header": {  
             "namespace": "tv.player.control", 
             "name": "BackForward", 
            },
        "payload": {   //指令的参数
			 "offset":30   //后退一次跨越的时间, 默认30秒
			 "extend": { }
         }
     }

### tv.player.control.Speed
	播放器几倍速播放
	{
        "header": {  
             "namespace": "tv.player.control", 
             "name": "Speed", 
            },
        "payload": {   
             "value" : 2 //几倍速度, 默认2倍
             "extend": {}
         }
      }         
    
### tv.player.control.Previous
	上一集
	{
        "header": {  
             "namespace": "tv.player.control", 
             "name": "Previous", 
            },
        "payload": {   
             "value" : 1 // 上一集
             "extend": {}
         }
      }         

### tv.player.control.Next
	下一集
	{
        "header": {  
             "namespace": "tv.player.control", 
             "name": "Next", 
            },
        "payload": {   
             "value" : 1 //下一集
             "extend": {}
         }
      } 

### tv.player.control.Episode
	第3集
	{
        "header": {  
             "namespace": "tv.player.control", 
             "name": "Episode", 
            },
        "payload": {   
             "value" : 3 //第3集
             "extend": {}
         }
      } 
    
### tv.image.snapshot.Upload
	截图上传指令
	{
        "header": {  
              "namespace": "tv.image.snapshot", 
              "name": "Upload", 
	    },
        "payload": {
		   "behavior" : "" ,
           "extend": {}
    }
            

### tv.view.card.Render
	弹出层的视觉渲染(比如明星识图)
	{
        "header": {  
            "namespace": "tv.view.card", 
            "name": "Render"
         },
        "payload": {  
            "title":"姚明",   
			"description":"中国著名篮球运动员",  
			"thumb":"https://imgsa.baidu.com/baike/sig.jpg",
	        "url":"http://baike.baidu.com/item/%E5%A7%9A%E6%98%8E/28"，
            "extend": {}
         }
      }

### tv.view.text.Render
	对话框中的文本内容
	{
        "header": {  
            "namespace": "tv.view.text", 
            "name": "Render"
         },
        "payload": {  
            "text":"姚明",   			
            "extend": {}
         }
      }
### tv.view.list.Render
	资源列表结果展示
	{
    "header": {
        "namespace": "tv.view.list",
        "name": "Render"
    },
    "payload": {
        "ott_res": [{
            "resource_id": "123331",
            "resource_name": "美国队长",
            "type":"电影",
            "category": "科幻",
            "thumb": "http://aaa.jpg",
            "description": "美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰）带领着全新组建的复仇者联盟，继续维护世界和平。",
            "score": "6.5"}, {}{}{}....{}
        ],
        "dvb_res": [{
            "channel_id": "123331",
            "channel_name": "湖南卫视",
            "resource_name": "快乐大本营",
            "category": "综艺",
            "thumb": "http://aaa.jpg",
            "description": "何炅谢娜的快乐大本营。"},{},{},{}.....{}
        ],
        "extend": {}
    }
	}
### tv.view.detail.Render
	单一结果，直接进详情页
	去掉了resource_url: 原因是统一电影和电视剧字段格式, 把对应的数据放到了item数组里.
	{
        "header": {  
           "namespace": "tv.view.detail", 
            "name": "Render"
         },
        "payload": {   //指令的参数
			"type":"电影", //类型包含电影film, 电视剧tv, 综艺ent
			"resource" : {
				"resource_id":"1231111",
				"resource_name":"美国队长",
				"description":"美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰）带领着全新组建的复仇者联盟，继续维护世界和平。",
				"director":"乔·庄斯顿",
				"actors":"克里斯·埃文斯，海莉·阿特维尔，塞巴斯蒂安·斯坦，雨果·维文，汤米·李·琼斯，史坦利·图齐",
				"era":"2011",
				"area":"美国",
				"category":"科幻,动作",
				"language":"英语",
				"season":"",
				"count":"", //电视剧总集数
				"poster_url":"http://........jpg",
				"items":[ //如果是电视剧, item里每个元素是一集电视
					{"item_id": 1213211,
					 "item_number": "1",
					 "item_url" : "http://123123123.mp4"},{}...{}
				]
			},
			"extend": {}
		}
	} 


# 意图识别 NLU
## MV类目
### 原型
	["我想唱东风破", {
	"domain":"MV",
	"intent":"MV_SEARCH",
	"slots":{
		"song":"东风破",
		"singer":"歌手名(周杰伦)",
		"language":"国语/粤语/英文",
		"emotion":"情感类型(欢快/悲伤)",
		"type":"歌曲类型:民谣什么的",
		"release_time":"发行年代, 如:2016",
		"area":"港台/大陆",
		"resolution":"清晰度",
		"origin_version":"是/否原唱",
		"sort_type":"排序规则(热度/评分等)",
		"album":"专辑名称",
		"lyric":"歌词"
	}

	}]

### 样例
	["我想唱东风破", {
	"domain":"MV",
	"intent":"MV_SEARCH",
	"slots":{
		"song":"东风破",
	}
	}]
	["周杰伦的七里香", {
	"domain":"MV",
	"intent":"MV_SEARCH",
	"slots":{
		"song":"七里香",
		"singer":"周杰伦"
	}
	}]
	["唱首欢快的歌曲", {
	"domain":"MV",
	"intent":"MV_SEARCH",
	"slots":{
		"emotion":"欢快"
	}
	}]
	
## 影视类目
### 原型
	["我想看武林外传", {
	"domain":"FILM",
	"intent":"FILM_SEARCH",
	"slots":{
		"name":"武林外传",
		"category":"电视剧/电影",
		"channel":"电视台[北京卫视, 东方卫视]",
		"series_file":"系列电影[美国队长, 谍影重重]",
		"actor":"演员",
		"director":"导员",
		"presentor":"主持人",
		"film_type":"喜剧/科幻",
		"film_tag":"公主类/暴力类",
		"description":"简介",
		"area":"美国/意大利",
		"time":"公映时间[1994]",
		"is_free":"是否免费[是/否]",
		"is_hot":"是否热映[是/否]",
		"is_pre_release":"是否即将上映[是/否]",
		"whdepart":"第几部",
		"episode":"第几集",
		"hd":"是否高清[是/否]",
		"film_property":"询问的属性[name/category/channel/actor/director/type/area/language/time]",
	}

	}]

### 样例
	["我想看欢乐颂", {
	"domain":"FILM",
	"intent":"FILM_SEARCH",
	"slots":{
		"name":"欢乐颂",
		"category":"电视剧"
	}
	}]
	["看美国队长", {
	"domain":"FILM",
	"intent":"FILM_SEARCH",
	"slots":{
		"name":"美国队长",
		"category":"电影"
	}
	}]
	["我想看陈坤演的爱情片", {
	"domain":"FILM",
	"intent":"FILM_SEARCH",
	"slots":{
		"actor":"陈坤",
		"type":"爱情片"
	}
	}]


## 控制指令类目
### 
	["声音大点", {
	"domain":"COMMAND",
	"intent":"volum.up",
	"slots":{
		"value":1,
	}
	}]
	["声音小点", {
	"domain":"COMMAND",
	"intent":"volum.down",
	"slots":{
		"value":1,
	}
	}]
	["静音", {
	"domain":"COMMAND",
	"intent":"volum.mute",
	"slots":{
	}
	}]
	["取消静音", {
	"domain":"COMMAND",
	"intent":"volum.unmute",
	"slots":{
	}
	}]
	["调节音量到5", {
	"domain":"COMMAND",
	"intent":"volume.set",
	"slots":{
		"value":5
	}
	}]
	["亮度增大", {
	"domain":"COMMAND",
	"intent":"light.up",
	"slots":{
		"value":1
	}
	}]
	["亮度减小", {
	"domain":"COMMAND",
	"intent":"light.down",
	"slots":{
		"value":1
	}
	}]
	["对比度增大", {
	"domain":"COMMAND",
	"intent":"contrast.up",
	"slots":{
		"value":1
	}
	}]
	["对比度减小", {
	"domain":"COMMAND",
	"intent":"contrast.down",
	"slots":{
		"value":1
	}
	}]
	["打开应用", {
	"domain":"COMMAND",
	"intent":"application.open",
	"slots":{
		"name": "应用名称",
	    "package_name": "xxxx.apk", 
	    "args": "模块名-子模块-子子",
	    "deep_link":"",
	}
	}]
	["关闭应用", {
	"domain":"COMMAND",
	"intent":"application.close",
	"slots":{
		"name": "应用名称",
	    "package_name": "xxxx.apk", 
	    "args": "模块名-子模块-子子",
	    "deep_link":"",
	}
	}]
	["卸载爱奇艺", {
	"domain":"COMMAND",
	"intent":"application.uninstall",
	"slots":{
		"name": "应用名称",
	    "package_name": "xxxx.apk", 
	    "args": "模块名-子模块-子子",
	    "deep_link":"",
	}
	}]
	["升级爱奇艺", {
	"domain":"COMMAND",
	"intent":"application.upgrade",
	"slots":{
		"name": "应用名称",
	    "package_name": "xxxx.apk", 
	    "args": "模块名-子模块-子子",
	    "deep_link":"",
	}
	}]
	["回到主页/打开设置", {
	"domain":"COMMAND",
	"intent":"command.go",
	"slots":{
		"name":"主页"，
	}
	}]
	["退出", {
	"domain":"COMMAND",
	"intent":"command.exit",
	"slots":{
	}
	}]
	["返回", {
	"domain":"COMMAND",
	"intent":"command.back",
	"slots":{
	}
	}]
	["关机", {
	"domain":"COMMAND",
	"intent":"command.tvoff",
	"slots":{
	}
	}]
	["开机", {
	"domain":"COMMAND",
	"intent":"command.tvon",
	"slots":{
	}
	}]
	["睡眠", {
	"domain":"COMMAND",
	"intent":"command.sleep",
	"slots":{
	}
	}]
	["唤醒", {
	"domain":"COMMAND",
	"intent":"command.wake",
	"slots":{
	}
	}]
	["打开北京卫视", {
	"domain":"COMMAND",
	"intent":"channel.open",
	"slots":{
		"channel_name": "北京卫视",
		"channel_code": "btv"
	}
	}]
	["升级播放资源", {
	"domain":"COMMAND",
	"intent":"channel.update",
	"slots":{
	}
	}]
	["播放器播放", {
	"domain":"COMMAND",
	"intent":"resource.play",
	"slots":{
		"title" : "", //资源名称
		 "description": "" //资源描述信息
		 "uri": "资源唯一标识" //可以是url或者是资源id
		 "time_point" : "",  //播放参数, 跳转到某个时间点进行播放
	}
	}]
	["播放暂停/继续", {
	"domain":"COMMAND",
	"intent":"player.pause",
	"slots":{
		"value": 1, //1:暂停 || 0: 继续(取消暂停) 
	}
	}]
	["快进", {
	"domain":"COMMAND",
	"intent":"player.fastforward",
	"slots":{
		"offset": 30, //快进一次跨越的时间, 默认30秒
	}
	}]
	["快退", {
	"domain":"COMMAND",
	"intent":"player.backforward",
	"slots":{
		"offset": 30, //快退一次跨越的时间, 默认30秒
	}
	}]
	["按XX倍速播放", {
	"domain":"COMMAND",
	"intent":"player.speed",
	"slots":{
		"value": 2, //几倍速度, 默认2倍 
	}
	}]
	["截图上传指令", {
	"domain":"COMMAND",
	"intent":"snapshot.upload",
	"slots":{
	}
	}]

# ChangeLog
* 2017-2-7
	增加MV类nlu返回的结果
* 2017-2-10
	增加影视类nlu返回的结果
* 2017-2-14 
	命名空间增加前缀tv, 去掉behavior
	增加speech指令解释
* 2017-2-15
	增加打开设置, 打开某个首页模块的指令
	增加了控制指令的nlu返回
 

# 备注
1. 点播资源和直播资源分两个指令，分页问题
~~2.详情页：resoure_url去掉，假如推荐的资源字段，与item_list平级~~
4. list页面加type，方便分类展示
5. 设定所有value都为int类型，更改暂停value=1/0；为区别倍速后退，更改倍速播放的behavior=speedfast; 新增休眠、关机、唤醒、切换分辨率、~~上一集、下一集、第XX集等~~；——By: fanxing01, 2017.02.07
7. view.text.render，用于显示返回的对话框的文本内容，比如未找到相关影片的话术。
8. 需要为应用搜索结果定义接口。
9. 需增加"打开设置"、"打开教育模块"等功能，重新确定指令tv.system.command.GoLauncher；
10. 控制指令的nlu字段设计；