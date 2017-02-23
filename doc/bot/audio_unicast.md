点播功能输出：
服务名：audio_unicast

点播返回示例:

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
                    "url": "http://s.xiaodu.baidu.com/v20161223/unicast/playlist?user_id=XXXX"
                }
            }
        },
        "views": {
            "type": "txt",
            "content": "郭德纲相声"
        }
    }
}
