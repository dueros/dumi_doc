# nlu+resource合作方式资源播放状态上报接口

## 背景

资源方对回传他们资源的播放状态要求很强硬，（包括用户ID（加密后）、声音音频ID、声音播放时长等等）——若违反则资源方将停止与百度的合作协议。

所以：`基于nlu+resource的合作方式，合作方也需要上报资源播放状态。`

ps:上报的端上的播放状态也为多轮解析提供了支撑。

声明：`合作方若没有按照规范上报客户端的播放状态，则需要自行承担相关资源方停止合作的风险`

## 上报接口

<table>
<tr>
<td>URL</td>
<td>https://xiaodu.baidu.com/saiya/mediastat</td>

</tr>
<tr>
<td>Method</td>
<td>POST</td>

</tr>
</table>

## 接口参数

### 参数说明
<table>
   <tr>
      <td>key</td>
      <td>内容</td>
      <td>类型</td>
      <td>是否可能为空</td>
      <td>示例</td>
      <td>备注</td>
   </tr>
   <tr>
      <td>bot_id</td>
      <td>垂类bot标识</td>
      <td>string</td>
      <td>否</td>
      <td>audio_news</td>
      <td></td>
   </tr>
   <tr>
      <td>url</td>
      <td>播放的资源地址</td>
      <td>string</td>
      <td>否</td>
      <td>http://fdfs.***.com/group3/M01/77/42/wKgDsVKMdDLCVKUUAIMXy99Q7Vo340.mp3</td>
      <td>播放资源地址</td>
   </tr>
   <tr>
      <td>appid</td>
      <td>合作方标识</td>
      <td>string</td>
      <td>否</td>
      <td>dm4B485F6F3BE40F**</td>
      <td></td>
   </tr>
   <tr>
      <td>appkey</td>
      <td>合作方标识</td>
      <td>string</td>
      <td>否</td>
      <td>92D6A5FD2E69A84847147E69FA70B1**</td>
      <td></td>
   </tr>
   <tr>
      <td>cuid</td>
      <td>用户标识</td>
      <td>string</td>
      <td>否</td>
      <td>2D6A5FD2E69A84847147E6</td>
      <td></td>
   </tr>
   <tr>
      <td>token</td>
      <td>资源id</td>
      <td>string</td>
      <td>否</td>
      <td>188376</td>
      <td></td>
   </tr>
   <tr>
      <td>offset_ms</td>
      <td>播放时长</td>
      <td>int</td>
      <td>是</td>
      <td>20000</td>
      <td>单位ms</td>
   <tr>
      <td>action</td>
      <td>用户动作</td>
      <td>enum</td>
      <td>是</td>
      <td>PLAYING</td>
      <td>PLAYING</td>
   </tr>
   <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>STOPPED</td>
   </tr>
   <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>PAUSED</td>
   </tr>
   <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>FINISHED</td>
   </tr>
</table>

### post body 示例
``` 
curl -X POST -H "Content-Type: application/json" -H "Cache-Control: no-cache"  -d '{	
  "bot_id": "audio_news",
  "url": "http://fdfs.***.com/group3/M01/77/42/wKgDsVKMdDLCVKUUAIMXy99Q7Vo340.mp3",
  "appid": "dm4B485F6F3BE40F",
  "appkey": "92D6A5FD2E69A84847147E69FA70B1",
  "cuid": "2D6A5FD2E69A84847147E6",
  "token": "188376",
  "offset_ms": 2000000000,
  "action": "PLAYING"
}' "https://xiaodu.baidu.com/saiya/mediastat" ` 

```
