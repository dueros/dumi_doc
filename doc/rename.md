### bot

bot_id_v2|bot_id|描述|测试query
---------|------|----|---------
ai.dueros.bot.information_general|aries_general|通用信息查询|周杰伦是谁
ai.dueros.bot.life(x)|life_common|生活服务；鲜花、美容、理发、导航、周边、路况|附近堵车么;故宫在哪里;附近的饭馆
ai.dueros.bot.service_general|sac|通用服务入口|我要买火车票
ai.dueros.bot.restaurant|restaurant_bot|美食服务|北京哪里的烤鸭好吃
ai.dueros.bot.reminder(x)|remind|提醒、闹钟|5分钟之后提醒我
ai.dueros.bot.news_general(x)|recommend_service_wireless|笑话、新闻|讲个笑话
ai.dueros.bot.system_profile|sysprofile_service|系统画像（可根据端类型自定义返回内容）|你是什么星座的
ai.dueros.bot.phone(x)|[phone](bot/phone.md)|电话指令、打开app、网页、通信录、我的位置|
ai.dueros.bot.movie|movie_satisfy|电影|正在上映的电影
ai.dueros.bot.take_out|o2o_satisfy|外卖|帮我叫个外卖
ai.dueros.bot.taxi_order|rent_car|打车|我要打车
ai.dueros.bot.image_search|image_satisfy|图片搜索（多模sdk）|（用多模sdk上传图片）
ai.dueros.bot.gaokao|duer_gaokao_server|高考志愿填报|我要报志愿;北京650分能上什么大学
ai.dueros.bot.tv_play_info|drama_satisfy|电视剧|琅琊榜
ai.dueros.bot.travel|travel_server|旅游，景点，hi周末|最近有什么演唱会？
ai.dueros.bot.phone_charge|recharge|手机充值（必须登录）|帮我充值话费
ai.dueros.bot.online_shopping|online_shopping|在线购物|网购高露洁
ai.dueros.bot.hotel_info|hotel|酒店|附近的酒店
ai.dueros.bot.nba|sport_server|部分NBA功能？|
ai.dueros.bot.nba|nba_search|NBA|nba
ai.dueros.bot.cleaning_service|baojie|保洁（必须登陆）|帮我找个保洁
ai.dueros.bot.weather|duer_weather|天气|今天天气怎么样
ai.dueros.bot.smart_talk|talk_service|开放集合聊天|（兜底服务）
ai.dueros.bot.small_talk|doudi_server|聊天封闭集合兜底|（兜底服务）
ai.dueros.bot.smart_tv|smart_tv|电视（有电视剧）|我想看琅琊榜
ai.dueros.bot.speaker_hardware_control|[speaker_hardware](bot/speaker_hardware.md)|扬声器控制|声音大一点
ai.dueros.bot.audio_news|audio_news|新闻|英特尔的最新新闻
ai.dueros.bot.audio_music|[audio_music](bot/audio_music.md)|音乐|放一首周杰伦的歌
ai.dueros.bot.audio_cast|audio_unicast|点播垂类（有声资源）|播放郭德纲的相声
ai.dueros.bot.audio_scene|audio_scene|场景化垂类|进入助眠模式
ai.dueros.bot.audio_live|audio_live|直播垂类|播放北京文艺广播
ai.dueros.bot.fridge_control|[fridge](bot/fridge.md)|冰箱指令|
ai.dueros.bot.cookbook|[cookbook](bot/cookbook.md)|菜谱|



### intent

intent_id|domain|intent|描述|slots(可用的槽位)|example
---------|------|------|----|-----------------|-------
ai.dueros.audio.AskAudioCast|audio.unicast|audio.unicast.ask|
ai.dueros.audio.AskAudioLive|audio.live|audio.live.ask|
ai.dueros.audio.AskAudioMusic|audio.music|audio.music.ask|
ai.dueros.audio.EnterScene|audio.scene|audio.scene.enter|
ai.dueros.audio.ExitScene|audio.scene|audio.scene.exit|
ai.dueros.audio.PlayAudioCast|audio.unicast|audio.unicast.play|
ai.dueros.audio.PlayAudioLive|audio.live|audio.live.play|
ai.dueros.audio.PlayAudioNews|audio.news|audio.news.play|
ai.dueros.audio.PlayMusic|audio.music|audio.music.play|
ai.dueros.control.common.Collect|control.common|control.common.collect|
ai.dueros.control.common.ControlApps|control.common|control.common.apps|
ai.dueros.control.common.ControlPage|control.common|control.common.page|
ai.dueros.control.common.ControlSpeed|control.common|control.common.speed|
ai.dueros.control.common.Focus|control.common|control.common.focus|
ai.dueros.control.common.Play|control.common|control.common.play|
ai.dueros.control.common.SetPlayMode|control.common|control.common.play_mode|
ai.dueros.control.common.Switch|control.common|control.common.switch|
ai.dueros.control.hardware.ControlBluetooth|control.hardware|control.hardware.bluetooth|
ai.dueros.control.hardware.ControlBrightness|control.hardware|control.hardware.bright|
ai.dueros.control.hardware.ControlContrast|control.hardware|control.hardware.contrast|
ai.dueros.control.hardware.ControlPower|control.hardware|control.hardware.power|
ai.dueros.control.hardware.ControlScreen|control.hardware|control.hardware.screen|
ai.dueros.control.hardware.ControlVolume|control.hardware|control.hardware.volume|
ai.dueros.cookbook.OpenBook|cookbook|cookbook.open|
ai.dueros.cookbook.Collect|cookbook|cookbook.collect|
ai.dueros.cookbook.Step|cookbook|cookbook.step|
ai.dueros.cookbook.Video|cookbook|cookbook.video|
ai.dueros.fridge.BindPhone|fridge|fridge.setting.phone_bind|
ai.dueros.fridge.CheckService|fridge|fridge.info.service|
ai.dueros.fridge.CheckSytemVersion|fridge|fridge.info.version|
ai.dueros.fridge.CheckUserAgreement|fridge|fridge.info.agreement|
ai.dueros.fridge.Connect|fridge|fridge.connect|
ai.dueros.fridge.ManageAddress|fridge|fridge.setting.address|
ai.dueros.fridge.ManageFood|fridge|fridge.food.manage|
ai.dueros.fridge.OpenOnlineShoppingMall|fridge|fridge.app.market|
ai.dueros.fridge.SearchFood|fridge|fridge.food.search|
ai.dueros.fridge.SetMode|fridge|fridge.setting.mode|
ai.dueros.fridge.SetTemperature|fridge|fridge.setting.temperature|
ai.dueros.fridge.TimeShutdown|fridge|fridge.setting.timeout_off|
ai.dueros.joke.Joke|joke|joke|
ai.dueros.lbs.AskNearby|lbs|nearby|周边查询类需求|start_point(出发地),start_point_bd_la(出发地纬度),start_point_bd_lo(出发地经度),user_location_city(用户当前所在城市),end_point(目的地),travel_type(出行方式),坐标类型为bd09ll(百度经纬度坐标)|附近的飞机场
ai.dueros.lbs.CheckPoi|lbs|poi|地址查询类需求|poi(地址字符串)|射阳在哪儿
ai.dueros.lbs.CheckTraffic|lbs|traffic_condition|路况查询类需求|start_point(出发地),start_point_bd_la(出发地纬度),start_point_bd_lo(出发地经度),user_location_city(用户当前所在城市),end_point(目的地),travel_type(出行方式),坐标类型为bd09ll(百度经纬度坐标)|导航从北京到上海
ai.dueros.lbs.Navigate|lbs|navigation|导航查询类需求|start_point(出发地),start_point_bd_la(出发地纬度),start_point_bd_lo(出发地经度),user_location_city(用户当前所在城市),end_point(目的地),travel_type(出行方式),坐标类型为bd09ll(百度经纬度坐标)|导航从北京到上海
ai.dueros.memo.Memo_manage|memory|memory_manage|
ai.dueros.memo.Memorize|memory|memory|
ai.dueros.music.AskMusicInfo|music|music|音乐类需求|action_type(0. 关闭 1. 打开 2. 播放 3. 暂停 4. 下一首 5. 上一首 6. 换一首 7. 重播), song(歌名), singer(歌手), music_language(语言), music_emotion(情感，如悲伤、欢快等), music_tag, music_type(嘻哈、摇滚、儿歌等)|
ai.dueros.music.Sing|music|music_sing|让度秘唱歌，类似调戏|CommandAccepter, action_type(0. 关闭 1. 打开 2. 播放 3. 暂停 4. 下一首 5. 上一首 6. 换一首 7. 重播), song(歌名), singer(歌手)|
ai.dueros.phone.Cancel|phone|cancel|
ai.dueros.phone.Confirm|phone|confirm|
ai.dueros.phone.OpenApp|phone|open_app|
ai.dueros.phone.OpenContact|phone|contact|联系人查询需求|action_type(1：查看 0：新建 2：发送), pinyin_for_view(要查看的联系人的拼音), name_for_view(要查看的联系人的名字), pinyin_to_send(要发送的联系人的拼音), name_to_send(要发送的联系人的名字)|告诉我张凤仪的电话号码, 庞翔宇的电话号码发给张凤仪
ai.dueros.phone.OpenPhoneSetting|phone|phone_settings|
ai.dueros.phone.OpenWebsite|phone|open_website|打开网址|action_type, name, website_url|携程火车票
ai.dueros.phone.Phone|phone|telephone|
ai.dueros.phone.Sms|phone|sms|发短信|content(短信内容), number(目标号码), name(目标姓名), pinyin(目标姓名拼音)|短信发给15140559455
ai.dueros.reminder.ReminderManage|remind|remind_manage|
ai.dueros.reminder.Remind|remind|remind|提醒、闹钟|action, event_title, intent, remind_time, remind_type_message, remind_type_phone, remind_type_dumi, remind_type_clock, remind_time_type, remind_time_value, remind_time_data, status|设置提醒每天晚上9点半洗衣服。
ai.dueros.restaurant.Find|restaurant_bot|find|美食、团购|catetag, fragment, location, sortby, cuisine, crowd, groupon|附近有什么好吃的饭馆
ai.dueros.system_profile.AskConstellation|sysprofile|sysprofile.constellation|
ai.dueros.system_profile.AskLanguage|sysprofile|sysprofile.language|
ai.dueros.system_profile.AskVersion|sysprofile|sysprofile.version|
ai.dueros.system_profile.AskSystemProfile|sys_profile|sys_profile|
ai.dueros.system_profile.AskSystemProfile|sysprofile|sysprofile.common_ask|
ai.dueros.system_profile.GetFavouriteManStar|sysprofile|sysprofile.like_man_star|
ai.dueros.system_profile.GetFavouritePerson|sysprofile|sysprofile.like_person|
ai.dueros.system_profile.GetFavouriteSinger|sysprofile|sysprofile.like_singer|
ai.dueros.system_profile.GetFavouriteSport|sysprofile|sysprofile.like_sport|
ai.dueros.system_profile.GetFavouriteWomanStar|sysprofile|sysprofile.like_woman_star|
ai.dueros.system_profile.GetFeature|sysprofile|sysprofile.function|
ai.dueros.system_profile.fridge.AskWarranty|sysprofile|sysprofile.fridge.maintenance_period|
ai.dueros.system_profile.fridge.GetAbnormality|sysprofile|sysprofile.fridge.abnormal|
ai.dueros.system_profile.fridge.GetCustomerService|sysprofile|sysprofile.fridge.customer_service|
ai.dueros.system_profile.fridge.GetRepair|sysprofile|sysprofile.fridge.repair|
ai.dueros.taxi_order.CallDriver|rent_car|rent_car.call_driver|
ai.dueros.taxi_order.CancelOrder|rent_car|rent_car.cancel_order|
ai.dueros.taxi_order.CheckOrder|rent_car|rent_car.query_status|
ai.dueros.taxi_order.Order|rent_car|rent_car.book|
ai.dueros.taxi_order.WaitOrder|rent_car|rent_car.wait_order|
ai.dueros.ticket.BookFlightTicket|travel_ticket|flight_ticket|
ai.dueros.ticket.BookTrainTicket|22|22|火车票|end_point(终点站), start_point(起点站), search_type(如：高铁), start_time(时间)|给我买张到武汉的高铁票
ai.dueros.ticket.BookTrainTicket|travel_ticket|train_ticket|
ai.dueros.time.CheckLocalDate|time|time_local_date|
ai.dueros.time.CheckLocalTimezone|time|time_local_zone|
ai.dueros.time.CheckLocalTime|time|time_local_time|
ai.dueros.timer.Time|timer|timer|
ai.dueros.weather.Ask|duer_weather|sys_weather|天气|loc_city(城市), loc_county(国家), loc_province(省), time(时间)|北京明天天气如何
