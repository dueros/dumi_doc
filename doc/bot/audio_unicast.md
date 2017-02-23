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
                            "progress_report_interval_ms": 1000
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
            "type": "unicast",
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

###专辑列表
    *接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/albumlist
    *请求方式：GET
    *请求参数：
参数|类型|是否必须|备注
----|----|--------|----
category|int|是|分类ID
cuid|string|是|设备ID，设备的唯一标识
page|int|是|页码
pagesize|int|是|每页数据量

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
						"id":1,
						"album_title":"逻辑思维",
						"include_track_count":100,
						"cover_url_small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
						"cover_url_middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
						"cover_url_large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
						"play_count":188376,
						"category_name":"资讯",
						"category_id":3,
						"update_time":1479966445,
						"create_time":1481595445,
					},
					{
						"id":1,
						"album_title":"逻辑思维2",
						"include_track_count":160,
						"cover_url_small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
						"cover_url_middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
						"cover_url_large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
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

2、获得某个专辑的节目列表
接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/tracklist
请求方式：GET
请求参数：
参数	类型	是否必须	备注
albumid	int	是	专辑ID
cuid	string	是	设备ID，设备的唯一标识
page	int	是	页码
pagesize	int	是	每页数据量

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
						"id":1,
						"track_title":"大保镖",
						"duration":100,
						"cover_url_small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
						"cover_url_middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
						"cover_url_large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
						"play_count":188376,
						"category_name":"相声",
						"category_id":3,
						"update_time":1479966445,
						"create_time":1481595445,
					},
					{
						"id":1,
						"track_title":"逗你玩",
						"duration":160,
						"cover_url_small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
						"cover_url_middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
						"cover_url_large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
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

3、获取节目信息
接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/trackplay
请求方式：GET
请求参数：
参数	类型	是否必须	备注
trackid	int	是	专辑ID
cuid	string	是	设备ID，设备的唯一标识



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
			"cover_url_small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
			"cover_url_middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
			"cover_url_large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
			"play_count":188300,
			"category_name":"资讯",
			"category_id":3,
			"update_time":1479966445,
			"create_time":1481595445,
			"playurl": 
			{
				"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_32.mp3",
				"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_64.mp3",
			},
		}
}
```

4、获取播放列表接口：
接口地址：http://s.xiaodu.baidu.com/v20161223/resource/unicast/playlist
请求方式：GET
请求参数：
参数	类型	是否必须	备注
trackid	int	是	专辑ID
cuid	string	是	设备ID，设备的唯一标识
page	int	是	页码
pagesize	int	是	每页数据量

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
					"id":1,
					"track_title":"逗你玩",
					"duration":160,
					"cover_url_small":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_small.jpg",
					"cover_url_middle":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_meduim.jpg",
					"cover_url_large":"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_mobile_large.jpg",
					"play_count":188300,
					"category_name":"资讯",
					"category_id":3,
					"update_time":1479966445,
					"create_time":1481595445,
					"playurl": 
					{
						"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_32.mp3",
						"http://fdfs.xmcdn.com/group3/M09/34/94/wKgDsVMUWC-i2BqxAALZkSLeN4o874_64.mp3",
					},
				}
			]
		}
}
```
