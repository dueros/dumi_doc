# phone bot输出schema

## 打电话(intent：telephone)
打电话返回的完整例子:
```javascript
//query=打电话给测试薛斌

{
  "result": {
    "bot_id": "phone",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "语音助手正在为您寻找联系人“测试薛斌”"
      },
      {
        "type": "txt",
        "content": "一通电话显得格外珍贵，一条贴心的短信就是浓浓的爱，与身边的人多联系联系",
        "url": "xiaoduapp://phone?pinyin=ce+shi+xue+bin&name=%E6%B5%8B%E8%AF%95%E8%96%9B%E6%96%8C"
      }
    ],
    "nlu": {
      "domain": "phone",
      "intent": "telephone",
      "slots": {
        "name": "测试薛斌",
        "pinyin": "ce+shi+xue+bin"
      }
    },
    "speech": {
      "type": "Text",
      "content": "语音助手正在为您寻找联系人“测试薛斌”"
    }
  },
  "id": "1491445965_354dvoswq",
  "logid": "14914459652028",
  "user_id": "test_waiwang_yinjie_fenji_1111111",
  "time": 1491445965,
  "cuid": "test_waiwang_shiquan_fenji_111111",
  "se_query": "打电话给测试薛斌",
  "msg": "ok",
  "client_msg_id": "58512fc9-d688-4e4e-9263-14495de3a60a",
  "status": 0
}
```
### nlu部分的说明

|slot |desc | value | 
|---|---|---|
|name | 名字 | 中文名 | 
|pinyin | 姓名拼音 | eg:xuebin | 
|number | 电话号码 | eg:10086 | 
|use_sim_index | sim卡号 | 1、2 | 
|same_pinyin_names | 相同拼音联系人 | Eg：[“张棋”,”张起”]|
|status|cancel|取消|


### 多轮状态机
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/b21b32af56cea9946daec3283726f62fb64b13ed)


## 发短信（intent：sms）
发短信返回的完整例子:
```javascript
//query=发短信给测试度秘
{
  "result": {
    "bot_id": "phone",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "请问要发送什么内容？"
      }
    ],
    "nlu": {
      "domain": "phone",
      "intent": "sms",
      "slots": {
        "name": "测试度秘",
        "pinyin": "ce+shi+du+mi"
      }
    },
    "speech": {
      "type": "Text",
      "content": "请问要发送什么内容？"
    }
  },
  "id": "1486353184_3716wf322",
  "logid": "14863531849519",
  "user_id": "test_cuid",
  "time": 1486353184,
  "cuid": "test_cuid",
  "se_query": "发短信给测试度秘",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明

|slot | desc | value | 
|---|---|---|
|name | 名字 | 中文名 | 
|pinyin | 姓名拼音 | eg:xuebin | 
|number | 电话号码 | eg:10086 | 
|use_sim_index | sim卡号 | 1、2 | 
|same_pinyin_names | 相同拼音联系人 | Eg：[“张棋”,”张起”]|
|status|cancel、confirm|确认、取消|
|content|短信内容|Eg：今晚加班晚点回家|

### 多轮状态机
![图片](http://bos.nj.bpc.baidu.com/v1/agroup/2c3ddea49eb9abbdc2161c4bb51a34e516b2361f)

## 通讯录(intent：contact)
通讯录返回的完整例子:
```javascript
//query=把李四的名片发给张三
{
  "result": {
    "bot_id": "phone",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "语音助手正在为你发送“李四”的名片到“张三”"
      }
    ],
    "nlu": {
      "domain": "phone",
      "intent": "contact",
      "slots": {
        "action_type": "2",
        "pinyin_for_view": "li+si",
        "pinyin_to_send": "zhang+san",
        "name_for_view": "李四",
        "name_to_send": "张三"
      }
    },
    "speech": {
      "type": "Text",
      "content": "语音助手正在为你发送“李四”的名片到“张三”"
    }
  },
  "id": "1486365990_8515fq3zv",
  "logid": "14863659908617",
  "user_id": "test_cuid",
  "time": 1486365990,
  "cuid": "test_cuid",
  "se_query": "把李四的名片发给张三",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明
|slot | desc | value | 
|---|---|---|
|action_type | 动作类型 | 0：新建 | 
| |  | 1：查看 | 
| |  | 2：发送 | 
|name_for_view | 查看联系人的名字 | 把A的名片发给B：那么这里填A；若是新建联系人A，这里也是填A | 
|pinyin_for_view | <span style="background-color: rgb(249, 249, 249);">查看联系人的名字的拼音</span> | eg:xue+bin | 
|name_to_send | 发送联系人的名字 | 把A的名片发给B：那么这里填B | 
|pinyin_to_send | 发送联系人的名字的拼音 | eg:xue+bin | 
|number_to_send | 发送联系人的号码 | eg：把A的号码发给18983479834，number_to_send填18983479834 | 
|number | 电话号码 | eg:新建薛斌的号码是1868979721897，number填1868979721897 | 


## 手机设置(intent：phone_settings)
手机设置返回的完整例子:
```javascript
//query=打开蓝牙
{
  "result": {
    "bot_id": "phone",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "世界上最遥远的距离就是：我在您身边，而您却没有打开蓝牙"
      }
    ],
    "nlu": {
      "domain": "phone",
      "intent": "phone_settings",
      "slots": {
        "action_type": "1",
        "setting_name": "bluetooth"
      }
    },
    "speech": {
      "type": "Text",
      "content": "世界上最遥远的距离就是：我在您身边，而您却没有打开蓝牙"
    }
  },
  "id": "1486367016_766faqcvb",
  "logid": "14863670169694",
  "user_id": "test_cuid",
  "time": 1486367016,
  "cuid":"test_cuid",
  "se_query": "打开蓝牙",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明
|slot | desc | value | 
|---|---|---|
|function_name | 功能名称 | font：字体 | 
| |  | vertical_screen_lock:竖屏锁定 | 
| |  | wifi:无线网 | 
| |  | do_not_disturb:勿扰模式 | 
| |  | personal_hotspot:个人热点 | 
| |  | bluetooth:蓝牙 | 
| |  | vpn：专用网络 | 
| |  | airplane_mode:飞行模式 | 
| |  | drive_mode:驾驶模式 | 
| |  | brightness:亮度 | 
| |  | night_mode:夜间模式 | 
| |  | vibration：振动 | 
| |  | assistive_touch:悬浮球 | 
| |  | GPS:定位 | 
| |  | volume：音量 | 
| |  | 4G | 
| |  | 3G | 
| |  | 2G | 
| |  | GPRS | 
| |  | cellular:蜂窝网络 | 
| |  | NFC:NFC | 
| |  | power：电源（对应重启和关闭） | 
| |  | power_save_mode:省电模式 | 
| |  | silent_mode:静音模式 | 
| |  | synchronization：同步 | 
| |  | eye_protect_mode:护眼模式 | 
|action_type | 动作类型 | 0：关闭 | 
| |  | 1：打开 | 
| |  | 2：调大 | 
| |  | 3：调小 | 
| |  | 4：重启 | 

## 打开应用(intent：open_app)
打开应用返回的完整例子:
```javascript
//query=打开支付宝
{
  "result": {
    "bot_id": "phone",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "语音助手正在为您打开支付宝"
      },
      {
        "type": "list",
        "list": [
          {
            "title": "支付宝",
            "summary": "支付宝（中国）网络技术有限公司是国内领先的第三方支付平台，致力于提供“简单、安全、快速”的支付解决方案。",
            "url": "xiaoduapp://openapp?ios_scheme=alipay%3A%2F%2F&appstore_url=https%3A%2F%2Fitunes.apple.com%2Fcn%2Fapp%2Fzhi-fu-bao-zhifubao-kou-bei%2Fid333206289%3Fmt%3D8&android_package=com.eg.android.AlipayGphone&android_url=http%3A%2F%2Fmobile.baidu.com%2F%23%2Fitem%3Fdocid%3D8653239",
            "image": "http://xiaodu.baidu.com/saiya/appicon/37.zhifubao.jpg"
          }
        ]
      }
    ],
    "nlu": {
      "domain": "phone",
      "intent": "open_app",
      "slots": {
        "action_type": "1",
        "name": "支付宝"
      }
    },
    "speech": {
      "type": "Text",
      "content": ""
    }
  },
  "id": "1486368307_142b7clqy",
  "logid": "14863683062888",
  "user_id": "test_cuid",
  "time": 1486368307,
  "cuid": null,
  "se_query": "打开支付宝",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明
|slot | desc | value | 
|---|---|---|
|name | 网站中文名| eg:新浪网 | 
|action_type | 动作类型 | 0：关闭 | 
| |  | 1：打开 | 
| |  | 2：卸载 | 
| |  | 3：下载 | 
| |  | 4：搜索 | 

## 打开网页(intent：open_website)
打开网页返回的完整例子:
```javascript
//query=打开新浪网
{
  "result": {
    "bot_id": "phone",
    "bot_meta": {
      "version": "1.0.0",
      "type": "其他",
      "description": "desc"
    },
    "views": [
      {
        "type": "txt",
        "content": "语音助手为你找到新浪网"
      }
    ],
    "nlu": {
      "domain": "phone",
      "intent": "open_website",
      "slots": {
        "action_type": "1",
        "name": "新浪网",
        "website_url": "http://www.sina.com.cn/"
      }
    },
    "speech": {
      "type": "Text",
      "content": "语音助手为你找到新浪网"
    }
  },
  "id": "1486367770_289g7bs0s",
  "logid": "14863677704443",
  "user_id": "test_cuid",
  "time": 1486367770,
  "cuid": "test_cuid",
  "se_query": "打开新浪网",
  "msg": "ok",
  "status": 0
}
```
### nlu部分的说明
|slot | desc | value | 
|---|---|---|
|name | 网站中文名| eg:新浪网 | 
|website_url|网站地址|eg：http://www.sina.com.cn/
|action_type | 动作类型 | 0：关闭 | 
| |  | 1：打开 | 
