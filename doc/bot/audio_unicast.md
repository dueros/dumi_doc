点播功能输出：
服务名：audio_unicast

点播返回示例:
```javascript
// 播放相声

{
    "data": {
        "directives": [
            {
                "header": {
                  "message_id": "14851538172760",
                  "name": "Play",
                  "namespace": "AudioPlayer"
                },
                "payload": {
                    "play_behavior": "REPLACE_ALL",
                    "audio_item": {
                        "audio_item_id": "55690041011",
                        "stream": {
                            "url": "http://fdfs.xmcdn.com/group3/M01/77/42/wKgDsVKMdDLCVKUUAIMXy99Q7Vo340.mp3",
                            "stream_format": "mp3",
                            "offset_ms": 0,
                            "token": "55690041011",
                            "progress_report_interval_ms": 50000
                        }
                    }
                }
            }
        ],
        "speech": {
            "type": "Text",
            "content": "播放郭德纲相声"
        },
        "resource": {
            "type": "unicast_ref",
            "data": {
                "api": {
                    "method": "GET",
                    "url": "http://s.xiaodu.baidu.com/v20161223/unicast/playlist?cuid=XXXX"
                }
            }
        },
        "views": {
            "type": "txt",
            "content": "郭德纲相声"
        }
    }
}
```


### 1、专辑列表
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/albumlist
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
category|int|是|分类ID
cuid|string|是|设备ID，设备的唯一标识
page|int|是|页码
pagesize|int|是|每页数据量
sort|string |否 |排序：热门：grade、最新：album_last_track_time(默认：热门) 
orderby |string |否 |倒序：desc, 正序 asc （默认：asc） 


返回格式：
```javascript
{
	 status: 0,
     code: null,
     data: 
        {
            "page" : 1,        //当前页
            "total_page" : 10,  //总页数
            "list" 
               [
					{
						"id":1,  //专辑ID
						"album_title":"逻辑思维",  //专辑名
						"include_track_count":100,  //节目总数
						"pic": 
						{
							"small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
      						"middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
      						"large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
						},
						"play_count":188376,  //播放量
						"category_name":"资讯",  //分类
						"category_id":3,  //分类ID
						"update_time":1479966445,  //更新时间
						"create_time":1481595445,  //创建时间
						"source": "喜马拉雅",  //资源方
						"source_icon": "XXX.icon",  //资源方Icon
					},
					{
						"id":1,
						"album_title":"逻辑思维2",
						"include_track_count":160,
						"pic": 
						{							
						    "small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
      						"middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
      						"large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
						},
						"play_count":188300,
						"category_name":"资讯",
						"category_id":3,
						"update_time":1479966445,
						"create_time":1481595445,
					}
				]
		}
}

```


### 2、获得某个专辑的节目列表
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/tracklist
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
albumid	|int	|是	|专辑ID
cuid	|string	|是	|设备ID，设备的唯一标识
page	|int	|是	|页码
pagesize	|int	|是	|每页数据量
sort |int |否 |正序：acs、倒序：desc 

返回格式：
```javascript
{
	status: 0,
    code: null,
    data: 
        {
            "page" : 1,        //当前页
            "total_page" : 10,  //总页数
            "list" 
               [
					{
						"id":1,  //节目ID
						"track_title":"大保镖",  //节目名
						"duration":100,  //节目时长
						"pic": {							
						    "small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
      						"middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
      						"large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
						},
						"play_count":188376,  //播放量
						"category_name":"相声",  //分类名
						"category_id":3,  //分类ID
						"update_time":1479966445, //更新时间
						"create_time":1481595445,  //创建时间
						"source": "喜马拉雅",  //资源方
						"source_icon": "XXX.icon",  //资源方Icon
					},
					{
						"id":1,
						"track_title":"逗你玩",
						"duration":160,
						"pic": {							
						    "small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
      						"middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
      						"large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
						},
						"play_count":188300,
						"category_name":"资讯",
						"category_id":3,
						"update_time":1479966445,
						"create_time":1481595445,
						"source": "喜马拉雅",
						"source_icon": "XXXXX.icon"
					}
				]
		}
}

```

### 3、获取节目信息
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/trackplay
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
trackid	|int	|是	|专辑ID
cuid	|string	|是	|设备ID，设备的唯一标识



返回格式：
```javascript
{
	status: 0,
	code: null,
	data:
		{
			"id":1,
			"track_title":"逗你玩",
			"duration":160,
			"pic":
			{								
			    "small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
      			"middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
      			"large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
			},
			"play_count":188300,
			"category_name":"资讯",
			"category_id":3,
			"update_time":1479966445,
			"create_time":1481595445,
			"source": "喜马拉雅",  //资源方
			"source_icon": "XXX.icon",  //资源方Icon
			"play_url": 
			{
				"mp3":{
					"32": "http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_32.mp3",
					"64": "http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_64.mp3",
				},
				"acc":{					
					"32": "http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_32.mp3",
					"64": http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_64.mp3,
					"128": "http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_64.mp3",
				},
				"m4a":{
						"24":"http://audio.xmcdn.com/group7/M03/03/FE/wKgDWlbB5mCj94OWAFBSGzSmA1g528.m4a",
					"64": "http://audio.xmcdn.com/group7/M03/03/DA/wKgDX1bB5l3S4rnMANJrwQTRSPo780.m4a",
				},
			},
		}
}

```


### 4、获取播放列表接口：
  * 接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/playlist
  * 请求方式：GET
  * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid	|string	|是	|设备ID，设备的唯一标识
page	|int	|是	|页码
pagesize	|int	|是	|每页数据量

返回格式：
```javascript
{
	status: 0,
	code: null,
	data:
		{
			"id":1,
			"track_title":"逗你玩",
			"duration":160,
			"pic": 
			{								
			    "small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
      			"middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
      			"large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
			},

			"play_count":188300,
			"category_name":"资讯",
			"category_id":3,
			"update_time":1479966445,
			"create_time":1481595445,
			"source": "喜马拉雅",  //资源方
			"source_icon": "XXX.icon",  //资源方Icon
			"play_url": 
			{
				"mp3":{
					"32": "http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_32.mp3",
					"64": "http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_64.mp3",
				},
				"acc":{					
					"32": "http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_32.mp3",
					"64": http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_64.mp3,
					"128": "http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_64.mp3",
				},
				"m4a":{
					"24":"http://audio.xmcdn.com/group7/M03/03/FE/wKgDWlbB5mCj94OWAFBSGzSmA1g528.m4a",
					"64": "http://audio.xmcdn.com/group7/M03/03/DA/wKgDX1bB5l3S4rnMANJrwQTRSPo780.m4a",
				},
			},
		}
}

```

#### 5、播放历史接口：
 * 接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/history
 * 请求方式：GET
 * 请求参数：

参数|类型|是否必须|备注
----|----|--------|----
cuid |string |是 |设备ID，设备的唯一标识 
page |int |是 |页码 
pagesize |int |是 |每页数据量 

 * 返回格式：
 
 ```javascript
 {
	status: 0,
	code: null,
	data:
		{
            "page" : 1,        //当前页
            "total_page" : 10,  //总页数
            "list" 
               [
				{
					"id":1, //节目ID
					"track_title":"逗你玩",  //节目名
					"album_id":23,  //专辑ID
					"album_name": "逻辑思维",  //专辑名
					"duration": 220,  //节目时长，单位：s
					"offset": 100, //播放到的断点位置，单位：s，0为播放完毕
					"update_time":1479966445,
					"create_time":1481595445,
					"source": "喜马拉雅",  //资源方
					"source_icon": "XXX.icon",  //资源方Icon
				},
				{
					"id":2, //节目ID
					"track_title":"大保镖",  //节目名
					"album_id":23,  //专辑ID
					"album_name": "逻辑思维",  //专辑名
					"duration": 160,  //节目时长，单位：s
					"offset": 50, //播放到的断点位置，单位：s，0为播放完毕
					"update_time":1479966445,
					"create_time":1481595445,
				},
			]
		}
}

 ```

