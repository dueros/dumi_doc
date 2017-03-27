# 客户端接入指导

## Table of Contents


   * [客户端接入指导](#客户端接入指导)
      * [Table of Contents](#table-of-contents)
      * [接入流程](#接入流程)
      * [协议解析规范](#协议解析规范)


## 接入流程
  * 申请度秘appid
  * 下载sdk
  * 测试服务端效果
    * 用android studio打开sdk demo工程
    * 修改sdk demo中的appid、appkey为自己的
    * 安装到安卓手机，验证效果
  * 集成sdk到自己的app
    * 解压duersdk_library.zip
    * 导入duersdklib-release.aar到自己的项目

## 协议解析规范

收到的数据结构，请参考[响应字段解释](api/response.md)

  * 有屏幕的设备
    * 必须实现views数据结构里三种卡片的保底展现
	* 根据需求，如果有返回resource，resource的数据结构只和resource的type有关，和bot_id无关，建议使用resource做更强的展现
	* 建议展现hint中的提示给用户点击
  * 没屏幕的设备
	* 必须实现speech的保底播放
	* 建议在服务端返回directives的情况下，实现directives的操作，详细看下面的“客户端能力的申明和实现”
  * 客户端能力的申明和实现
	* 客户端需要申明自己的端能力（device_interface，sdk提供接口设置）
	* 如果客户端申明支持某种能力（比如AudioPlayer），
		* 必须完整实现上报这种能力所需要的的所有device_event，
		* 必须给出获取这种能力的实时状态（device_status）的回调函数
  * 不要依赖bot id做任何客户端逻辑
