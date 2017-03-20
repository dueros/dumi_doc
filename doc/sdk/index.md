# 安卓sdk

## Table of Contents


   * [安卓sdk](#安卓sdk)
      * [Table of Contents](#table-of-contents)
      * [客户端sdk](#客户端sdk)
         * [下载](#下载)
         * [介绍](#介绍)
         * [常见问题](#常见问题)


## 客户端sdk

### 下载

内有demo工程和可测试的apk，外网用户请下载连线上环境的版本
   * [sdk下载](https://github.com/dueros/dumi_doc/blob/master/doc/sdk/sdk_v2_online.zip)

### 介绍

内部含有文件

   * app-release.apk 这个是demo app，可以安装到手机，可以试用度秘的语音识别、TTS、query理解等功能
   * demo_src.zip 这个是demo app的源代码，是一个android studio工程，可以直接打开、编译。调用sdk的代码请参考此工程
   * duersdk_library.zip  这个是sdk库，可以导入到已有工程中使用

### 常见问题

  * 如何更改appid、appkey
    * 请看demo工程代码中的 app/src/main/java/com/baidu/duersdkdemo/DemoApplication.java
  
  * 设置语音的appid、ak、sk
    * **语音的app id、app key、secret key和度秘的appid、appkey是两个东西**
    * 请到http://yuyin.baidu.com  并且创建应用或者向度秘方直接申请。
    * 在自己工程的AndroidManifast.xml 中配置 com.baidu.speech.APP_ID，com.baidu.speech.API_KEY，com.baidu.speech.SECRET_KEY。
    * 调用示例
```xml
        <!-- 如果集成了ASR模块，需要如下设置 -->
        <meta-data
            android:name="com.baidu.speech.APP_ID"
            android:value="您申请的asr APP_ID" />
        <meta-data
            android:name="com.baidu.speech.API_KEY"
            android:value="您申请的asr API_KEY" />
        <meta-data
            android:name="com.baidu.speech.SECRET_KEY"
            android:value="您申请的 SECRET_KEY " />
```



