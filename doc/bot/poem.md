# poem bot输出schema

## 度秘写诗
```javascript
//query = 写诗
{
    "emotion": 0,
    "hint": [
        "换一首",
        "换主题句",
        "退出写诗",
        "只要文字",
        "换背景"
    ],
    "logid": "14985320644465",
    "request_time": "1498532064859",
    "request_uid": "61AC53709613C6273E6EF36B1A829C64|SSS1",
    "result_list": [
        {
            "result_content": {
                "imgs": [
                    "http://xiaodu.baidu.com/img/pic?pic_id=55680139"
                ],
                "source": null
            },
            "result_type": "img_comm",
            "source_type": "poem",
            "voice": "欢歌笑语满堂香.喜看嫦娥舞霓裳.万户团圆人尽望.中秋佳节好时光.",
            "source_sub_type": "for_you"
        }
    ],
    "se_query": "中秋快乐",
    "service_id": "344",
    "status": 0,
    "tips_num": 0,
    "kuangim_msgid": 1498532064859121,
    "type": "server",
    "send_id": "1498532064_51431pq4y",
    "send_kuangim_msgid": 1498532064514031,
    "count_down": 0,
    "debug_trace": [
        {
            "key": "recall_rule",
            "value": "services_by_da==^talk_service&&qu_domain==!math&!calendar\tservices_remove=aries_general&&next_cmd=break###"
        },
        {
            "key": "recall_service_list",
            "value": "ai.dueros.bot.audio_joke,ai.dueros.bot.faq,ai.dueros.bot.gaokao,audio_news,baojie,cookbook,duer_weather,dumi_talk_guide,hotel,ibf_model1_server,image_service,life_common,light_vertical,movie_satisfy,music,nba_search,o2o_satisfy,online_shopping,phone,poem,recharge,recommend_service_wireless,remind,rent_car,restaurant_bot,sac,sysprofile_service,talk_service,travel_server,user_profile,voice_feed,"
        },
        {
            "key": "da_responce",
            "value": "{"status":0, "msg":"OK", "data":{"da_query_info":[{"type":"rsse", "result_list":[{"type":"rssequery", "score":0, "result_list":[{"type":"querylist", "score":0, "content":"[\\"中秋节图片\\",\\"中秋\\",\\"中秋快乐图片\\",\\"中秋快乐 英文\\",\\"中秋祝福\\",\\"中秋快乐 阖家幸福\\",\\"中秋祝福语\\",\\"中秋快乐藏头诗\\",\\"中秋节快乐\\",\\"作文快乐的中秋节\\"]\\n"}]}]}, {"type":"control.hardware", "result_list":[]}, {"type":"custom", "result_list":[]}, {"query":"中秋快乐", "type":"o2o_satisfy", "result_list":[]}, {"type":"sac", "result_list":[]}, {"type":"life_common", "result_list":[]}, {"type":"online_shopping", "result_list":[]}, {"type":"rent_car", "result_list":[]}, {"type":"hotel", "result_list":[]}, {"type":"restaurant_bot", "result_list":[]}, {"query":"中秋快乐", "type":"movie_satisfy", "result_list":[]}, {"type":"baojie", "result_list":[]}, {"type":"recharge", "result_list":[]}, {"query":"中秋快乐", "type":"nba", "result_list":[]}, {"query":"中秋快乐", "type":"phone", "result_list":[]}, {"query":"中秋快乐", "type":"music", "result_list":[]}, {"query":"中秋快乐", "type":"map", "result_list":[]}, {"query":"中秋快乐", "type":"remind", "result_list":[]}, {"query":"中秋快乐", "type":"user_profile", "result_list":[]}, {"type":"image_service", "result_list":[]}, {"query":"中秋快乐", "type":"confirm", "result_list":[]}, {"type":"sys_profile", "result_list":[]}, {"type":"wechat", "result_list":[]}, {"type":"audio.unicast", "result_list":[]}, {"type":"audio.music", "result_list":[]}, {"type":"audio.live", "result_list":[]}, {"type":"audio.news", "result_list":[]}, {"type":"audio.comedy", "result_list":[]}, {"type":"audio.scene", "result_list":[]}, {"type":"time", "result_list":[]}, {"type":"cookbook", "result_list":[]}, {"type":"ucp_content", "result_list":[]}, {"type":"cooker", "result_list":[]}, {"type":"fridge", "result_list":[]}, {"type":"recommend_service_wireless", "result_list":[]}, {"type":"memory", "result_list":[]}, {"type":"smart_tv", "result_list":[]}, {"type":"tv.live", "result_list":[]}, {"type":"audio.joke", "result_list":[]}, {"type":"slot.decode", "result_list":[{"type":"slot.decode", "score":100, "result_list":[{"type":"slot.decode.time", "score":0, "content":"", "result_list":[{"key":"time", "type":"text", "value":[{"value":"{\\"day\\":\\"15\\",\\"month\\":\\"8\\",\\"raw\\":{\\"day\\":\\"中秋\\",\\"month\\":\\"中秋\\",\\"special_calendar\\":\\"中秋\\"},\\"special_calendar\\":\\"lunar\\"}\\n", "name":"time", "source":"query", "type":"string", "tag_op":1, "session_num":0}], "score":0}]}]}]}, {"type":"puzzle", "result_list":[]}, {"type":"story.children", "result_list":[]}], "params":[{"key":"mmsda_response", "value":"{\\"voiceguidesidentify\\":{\\"is_fullreplace\\":false, \\"fullreplace_query\\":\\"\\", \\"last_query\\":\\"度秘写诗\\", \\"fullreplace_strategy\\":0, \\"strategy_type\\":0}, \\"wise_rewrite\\":{\\"res\\":[], \\"normalize\\":[]}}"}, {"key":"dumi_timeline", "value":"{\\"result_count\\":1, \\"result_list\\":[{\\"rewrite_query\\":\\"中秋快乐\\", \\"srcid_num\\":3, \\"srcids\\":[4, 14138, 91], \\"positions\\":[1, 3, 5], \\"position_flags\\":[1, 1, 1], \\"rw_type\\":8, \\"confidence\\":11}], \\"disp_num\\":140962, \\"click_num\\":141959}"}, {"key":"user_profile", "value":"{}\\n"}, {"key":"qu_service_single_response", "value":"{\\"status\\":0, \\"timestamp\\":0, \\"raw_query\\":\\"中秋快乐\\", \\"intent_candidates\\":[{\\"intent\\":\\"0\\", \\"intent_confidence\\":0, \\"func_slot\\":\\"\\", \\"slots\\":[{\\"offset\\":-1, \\"length\\":-1, \\"original_word\\":\\"\\", \\"normalized_word\\":\\"\\", \\"type\\":\\"\\", \\"confidence\\":0, \\"word_type\\":\\"\\"}], \\"extra_info\\":{\\"parser_qu_da_sug\\":\\"\\"}}]}"}, {"key":"gssda_response", "value":"{\\"result\\":[{\\"normal\\":{\\"danormalanalysis\\":{\\"gssrqt\\":[{\\"srcid\\":8216, \\"type\\":32, \\"degree\\":-1, \\"pos\\":-100, \\"rw_pos\\":-100, \\"subclass\\":0, \\"place\\":-1, \\"lexparse\\":[{\\"degree\\":3, \\"token_num\\":1, \\"rqt_token\\":[{\\"term\\":\\"中秋快乐\\", \\"attr\\":\\"ingt\\"}], \\"ret\\":0}], \\"lexparse_group\\":[{\\"lexparser_res_array_num\\":1, \\"lexparser_res_array\\":[{\\"degree\\":3, \\"token_num\\":1, \\"rqt_token\\":[{\\"term\\":\\"中秋快乐\\", \\"attr\\":\\"ingt\\"}], \\"ret\\":0}]}], \\"query_type\\":36}], \\"query_composition\\":\\"\\", \\"dummy\\":0, \\"feature_res\\":null}, \\"dummy\\":0}}]}"}, {"key":"qu_responce", "value":"{\\"err_no\\":0, \\"result\\":[{\\"normal\\":{}, \\"qu\\":{\\"query_voice\\":{\\"res\\":[]}}, \\"queryId\\":1}]}"}, {"key":"da_sug_query", "value":"{\\"log_id\\":\\"14985320644465\\",\\"query\\":\\"中秋快乐\\",\\"rewrite_query_type\\":\\"no_rewrite\\"}\\n"}, {"key":"personal_com_query", "value":"{\\"home\\":\\"\\",\\"office\\":\\"\\",\\"offset\\":0,\\"query\\":\\"\\",\\"type\\":\\"\\"}\\n"}, {"key":"apollo", "value":"null\\n"}, {"key":"nlu_responce", "value":"{\\"analysis\\":{},\\"parsed_text\\":\\"中秋 快乐\\",\\"raw_text\\":\\"中秋快乐\\",\\"results\\":[{\\"demand\\":0,\\"domain\\":\\"talk\\",\\"intent\\":\\"search\\",\\"object\\":{},\\"pushleft_switch\\":\\"0\\",\\"score\\":1.0,\\"str_result_content\\":{},\\"str_result_type\\":\\"\\"}],\\"sugs\\":\\"中秋快乐\\",\\"sugs_types\\":\\"PAT_EC\\"}\\n"}, {"key":"lexical_analysis", "value":"[{\\"flag\\":2,\\"name\\":\\"basic\\",\\"ner\\":\\"\\",\\"postag\\":\\"中秋_t 快乐_a\\",\\"wordrank\\":\\"中秋_1_0.531013 快乐_2_0.468987\\",\\"wordseg\\":\\"中秋 快乐\\"},{\\"flag\\":4,\\"name\\":\\"segment\\",\\"ner\\":\\"\\",\\"postag\\":\\"中秋快乐_n\\",\\"wordrank\\":\\"中秋快乐_2_1\\",\\"wordseg\\":\\"中秋快乐\\"},{\\"flag\\":8,\\"name\\":\\"sub_phrase\\",\\"ner\\":\\"\\",\\"postag\\":\\"中秋快乐_n\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"中秋快乐\\"},{\\"flag\\":16,\\"name\\":\\"human_name\\",\\"ner\\":\\"\\",\\"postag\\":\\"\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"\\"},{\\"flag\\":32,\\"name\\":\\"book_name\\",\\"ner\\":\\"\\",\\"postag\\":\\"\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"\\"},{\\"flag\\":64,\\"name\\":\\"new_word\\",\\"ner\\":\\"\\",\\"postag\\":\\"\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"\\"},{\\"flag\\":128,\\"name\\":\\"crf_multi\\",\\"ner\\":\\"\\",\\"postag\\":\\"\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"\\"}]\\n"}]}}"
        },
        {
            "key": "ai.dueros.bot.audio_joke_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":1, "page_cnt":1, "result_num":1, "result_list":[{"content":"{\\"result_list\\":[{\\"result_confidence\\":0,\\"result_content\\":{\\"answer\\":\\"\\"},\\"result_type\\":\\"txt\\",\\"source_type\\":\\"ai.dueros.bot.audio_joke\\"}],\\"type\\":\\"user\\",\\"user_id\\":\\"61AC53709613C6273E6EF36B1A829C64|SSS1\\",\\"bot_intent\\":{\\"query\\":\\"中秋快乐\\",\\"query_score\\":0}}", "confidence":0, "form_confidence":0, "source_type":"ai.dueros.bot.audio_joke", "source_sub_type":"ai.dueros.bot.audio_joke", "stategy_middle_data":{"raw_answer":[{"url":"", "title":"", "subtitle":"", "answer":""}], "bot_intent":{"query":"中秋快乐", "query_score":0}}}], "service_query_info":[], "server_query_intent":"\\"\\"", "directives":[], "nlu":{}, "speech":{}, "prompt":{}, "resource":{}, "views":[]}, "keep_silence":null}"
        },
        {
            "key": "ai.dueros.bot.gaokao_responce",
            "value": "{"status":0, "msg":"ok", "data":{"result_num":0, "result_list":[{"content":"{\\"result_list\\":[{\\"result_content\\":{\\"answer\\":\\"我只为你解答高考相关的问题，你可以问我“我适合上什么专业？”\\"},\\"voice\\":\\"我只为你解答高考相关的问题，你可以问我“我适合上什么专业？”\\",\\"result_type\\":\\"txt\\",\\"source_type\\":\\"ai.dueros.bot.gaokao\\",\\"result_confidence\\":100}],\\"instant_url\\":\\"\\",\\"instant\\":\\"\\",\\"hint_mult\\":null,\\"resource\\":{\\"machineContent\\":{\\"content\\":{\\"txt\\":\\"我只为你解答高考相关的问题，你可以问我“我适合上什么专业？” \\",\\"voice\\":\\"我只为你解答高考相关的问题，你可以问我“我适合上什么专业？” \\",\\"link\\":\\"\\",\\"pic\\":{\\"origin\\":{\\"width\\":\\"\\",\\"height\\":\\"\\",\\"url\\":\\"\\"},\\"thumbnail\\":{\\"width\\":\\"\\",\\"height\\":\\"\\",\\"url\\":\\"\\"}}},\\"type\\":0},\\"source_type\\":\\"ai.dueros.bot.gaokao\\"}}", "confidence":0, "form_confidence":0, "source_type":"ai.dueros.bot.gaokao", "source_sub_type":"ai.dueros.bot.gaokao", "stategy_middle_data":{"raw_answer":[{"url":"123", "title":"我只为你解答高考相关的问题，你可以问我“我适合上什么专业？”", "subtitle":"我只为你解答高考相关的问题，你可以问我“我适合上什么专业？”", "answer":"我只为你解答高考相关的问题，你可以问我“我适合上什么专业？”"}]}}]}, "bot_sessions":[{"action":"set", "type":"string", "key":"61AC53709613C6273E6EF36B1A829C64|SSS1", "list_sessions_str":[""]}], "user_info":{"user_id":"61AC53709613C6273E6EF36B1A829C64|SSS1"}, "error":0}"
        },
        {
            "key": "duer_weather_responce",
            "value": "{"status":1, "msg":"error output"}"
        },
        {
            "key": "dumi_talk_guide_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":0, "page_cnt":0, "result_num":0, "result_list":[{"content":"dumi_talk-guide does not deal with such query", "confidence":0, "source_type":"dumi_talk_guide", "source_sub_type":"", "stategy_middle_data":{"bot_intent":{"query":"中秋快乐", "query_score":-1}, "bot_answer":{"answer":"dumi_talk-guide does not deal with such query", "answer_score":-1}, "bot_global_state":{"bot_state":"ignore"}}, "confirm":0}]}}"
        },
        {
            "key": "image_service_responce",
            "value": "{"status":0, "msg":"", "data":{"result_list":[{"confidence":0, "source_type":"image_service", "source_sub_type":"image_service"}]}}"
        },
        {
            "key": "light_vertical_responce",
            "value": "{"status":0, "msg":"ok", "data":{"result_list":[{"content":"{\\"hint_mult\\":{\\"data\\":[],\\"hint_float\\":0,\\"placeholder\\":\\"\\",\\"type\\":\\"multi_column\\"},\\"result_list\\":null}\\n", "confidence":0, "source_type":"light_vertical", "source_sub_type":"", "stategy_middle_data":{"raw_answer":[]}}]}}"
        },
        {
            "key": "music_responce",
            "value": "{"status":0, "msg":"ok"}"
        },
        {
            "key": "phone_responce",
            "value": "{"status":0, "msg":"ok"}"
        },
        {
            "key": "poem_responce",
            "value": "{"status":0, "msg":"ok", "data":{"result_list":[{"content":"{\\"hint_mult\\":{\\"data\\":[{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"换一首\\"},{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"换主题句\\"},{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"退出写诗\\"},{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"只要文字\\"},{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"换背景\\"}],\\"hint_float\\":0,\\"placeholder\\":\\"\\",\\"type\\":\\"multi_column\\"},\\"result_list\\":[{\\"result_content\\":{\\"imgs\\":[\\"http:\\/\\/xiaodu.baidu.com\\/img\\/pic?pic_id=55680139\\"]},\\"result_type\\":\\"img_comm\\",\\"source_type\\":\\"poem\\",\\"voice\\":\\"欢歌笑语满堂香.喜看嫦娥舞霓裳.万户团圆人尽望.中秋佳节好时光.\\"}],\\"source_type\\":\\"poem\\"}\\n", "confidence":260, "source_type":"poem", "source_sub_type":"for_you", "stategy_middle_data":{"bot_global_state":{"bot_state":"multi_clarify"}}}]}, "bot_sessions":[{"status":0, "msg":"ok", "action":"set", "type":"string", "key":"61AC53709613C6273E6EF36B1A829C64|SSS1", "list_sessions":[]}]}"
        },
        {
            "key": "recharge_responce",
            "value": "{"status":0, "msg":"ok"}"
        },
        {
            "key": "recommend_service_wireless_responce",
            "value": "{"status":1, "msg":"err", "data":{"page_num":1, "page_cnt":10, "result_num":1, "result_list":[{"url":"", "title":"", "confidence":-1, "source_type":"recommend_service_wireless"}]}}"
        },
        {
            "key": "remind_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":1, "page_cnt":0, "result_num":1, "result_list":[], "service_query_info":[], "server_query_intent":"\\"\\"", "directives":[], "speech":[], "resource":[], "views":[]}, "bot_sessions":[{"status":0, "msg":"ok", "action":"set", "type":"string", "key":"61AC53709613C6273E6EF36B1A829C64|SSS1", "list_sessions_str":["{\\"empty\\":true}"]}]}"
        },
        {
            "key": "sac_responce",
            "value": "{"status":1, "msg":"talk is upper than 0.95"}"
        },
        {
            "key": "sysprofile_service_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":1, "page_cnt":10, "result_num":0}, "user_info":{"user_id":"", "user_name":"", "last_online_time":0, "last_online_ip":"", "ct_time":0, "age_sysprofile":"", "name_sysprofile":"{\\"confidence\\":100,\\"value\\":\\"权志龙\\"}\\n", "gender_sysprofile":"", "constellation_sysprofile":"", "extra":[{"key":"identity", "value":""}, {"key":"family_name", "value":""}, {"key":"sex", "value":""}, {"key":"sexorientation", "value":""}, {"key":"mood", "value":""}, {"key":"age", "value":""}, {"key":"birthday", "value":""}, {"key":"constellation", "value":""}, {"key":"zodiac", "value":""}, {"key":"height", "value":""}, {"key":"weight", "value":""}, {"key":"school", "value":""}, {"key":"grade", "value":""}, {"key":"work", "value":""}, {"key":"job", "value":""}, {"key":"place_of_origin", "value":""}, {"key":"company", "value":""}, {"key":"marriage", "value":""}, {"key":"idol", "value":""}, {"key":"star", "value":""}, {"key":"like_man_star", "value":""}, {"key":"like_woman_star", "value":""}, {"key":"like_person", "value":""}, {"key":"spouse", "value":""}, {"key":"girl_friend", "value":""}, {"key":"boy_friend", "value":""}, {"key":"food", "value":""}, {"key":"snack", "value":""}, {"key":"sport", "value":""}, {"key":"address", "value":""}, {"key":"actor", "value":""}, {"key":"basketball", "value":""}, {"key":"color", "value":""}, {"key":"football", "value":""}, {"key":"movie", "value":""}, {"key":"music", "value":""}, {"key":"game", "value":""}, {"key":"singer", "value":""}, {"key":"good_at_sport", "value":""}, {"key":"shap", "value":""}, {"key":"name", "value":"权志龙"}], "base_table":{"last_online_ip":"", "last_online_time":0, "ct_time":0}, "public_table":{"item":[{"key":"age", "sub_item":[{"key":"sysprofile", "value":""}]}, {"key":"constellation", "sub_item":[{"key":"sysprofile", "value":""}]}, {"key":"gender", "sub_item":[{"key":"sysprofile", "value":""}, {"key":"default", "value":""}]}, {"key":"name", "sub_item":[{"key":"sysprofile", "value":"{\\"confidence\\":100,\\"value\\":\\"权志龙\\"}\\n"}, {"key":"default", "value":"权志龙"}]}, {"key":"office_location", "sub_item":[{"key":"sysprofile", "value":""}]}]}}}"
        },
        {
            "key": "query_entitys",
            "value": ""
        },
        {
            "key": "rank_priority",
            "value": "kg_service aries_guide aries_dqa aries_general###restaurant_bot o2o_satisfy###rent_car movie_satisfy###audio_news audio_live audio_music audio_unicast###"
        },
        {
            "key": "poem_strategy_model",
            "value": "{"answer_score":0,"count_down":0,"dim_num":60,"feature":[{"feature_name":"","index":0,"value":0.0},{"feature_name":"","index":1,"value":0.0},{"feature_name":"","index":2,"value":0.0},{"feature_name":"NOT_QU_COVER_VERTICAL","index":3,"value":1.0},{"feature_name":"","index":4,"value":0.0},{"feature_name":"NOT_LU_COVER_VERTICAL","index":5,"value":1.0},{"feature_name":"","index":6,"value":0.0},{"feature_name":"QUERY_SCORE","index":7,"value":0.80},{"feature_name":"ANSWER_SCORE","index":8,"value":0.80},{"feature_name":"VERTICAL_TYPE","index":9,"value":1.0}],"feedback_score":0.6715103387832642,"is_valid":true,"merge_score":0.5645073652267456,"model_score":2.194736242294312,"query_score":0,"rank_score":93.21428571430,"rule_model_str":"","source_type":"poem"}\n"
        },
        {
            "key": "da_rewrite_query",
            "value": "中秋快乐"
        },
        {
            "key": "loc",
            "value": "%7B%22addr%22%3A%22%B1%B1%BE%A9%CA%D0%BA%A3%B5%ED%C7%F8%BA%F3%B3%A7%B4%E5%C2%B7%22%2C%22city%22%3A%22%B1%B1%BE%A9%CA%D0%22%2C%22city_code%22%3A131%2C%22crd%22%3A%2212945813.250774_4846735.044703_200%22%7D%0A"
        },
        {
            "key": "poem_strategy_final",
            "value": "{"answer_score":0,"count_down":0,"dim_num":60,"feature":[{"feature_name":"","index":0,"value":0.0},{"feature_name":"","index":1,"value":0.0},{"feature_name":"","index":2,"value":0.0},{"feature_name":"NOT_QU_COVER_VERTICAL","index":3,"value":1.0},{"feature_name":"","index":4,"value":0.0},{"feature_name":"NOT_LU_COVER_VERTICAL","index":5,"value":1.0},{"feature_name":"","index":6,"value":0.0},{"feature_name":"QUERY_SCORE","index":7,"value":0.80},{"feature_name":"ANSWER_SCORE","index":8,"value":0.80},{"feature_name":"VERTICAL_TYPE","index":9,"value":1.0}],"feedback_score":0.6715103387832642,"is_valid":true,"merge_score":0.5645073652267456,"model_score":2.194736242294312,"query_score":0,"rank_score":159.0,"rule_model_str":"source_type==poem\\trank_score=128&&count_down=0###last_source_type==poem&&source_type==poem\\trank_score=159&&count_down=0###","source_type":"poem"}\n"
        }
    ],
    "hint_mult": {
        "data": [
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "换一首"
            },
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "换主题句"
            },
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "退出写诗"
            },
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "只要文字"
            },
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "换背景"
            }
        ],
        "hint_float": 1,
        "placeholder": "",
        "type": "multi_column"
    },
    "source_type": "poem",
    "nlu": {
        "domain": "unknown",
        "intent": "unknown",
        "slots": []
    },
    "ctime": 1498532064,
    "id": "1498532064_8595x2cih"
}
```
## 藏头诗
```javascript
//query = 藏头诗->度秘祝你快乐
{
    "emotion": 0,
    "hint": [
        "换一首",
        "换主题句",
        "退出写诗",
        "只要文字",
        "换背景"
    ],
    "logid": "14985319576499",
    "request_time": "1498531957658",
    "request_uid": "61AC53709613C6273E6EF36B1A829C64|SSS1",
    "result_list": [
        {
            "result_content": {
                "imgs": [
                    "http://xiaodu.baidu.com/img/pic?pic_id=55679976"
                ],
                "source": null
            },
            "result_type": "img_comm",
            "source_type": "poem",
            "voice": "度势虽寒好邀竹.秘心自傲不输松.祝中秋高人不留.你我一大道未动.快意闲情咏岁华.乐情雅趣吟诗梦.",
            "source_sub_type": "cang_tou"
        }
    ],
    "se_query": "度秘祝你快乐",
    "service_id": "344",
    "status": 0,
    "tips_num": 0,
    "kuangim_msgid": 1498531957658658,
    "type": "server",
    "send_id": "1498531957_3017cl18z",
    "send_kuangim_msgid": 1498531957301316,
    "count_down": 0,
    "debug_trace": [
        {
            "key": "recall_rule",
            "value": ""
        },
        {
            "key": "recall_service_list",
            "value": "ai.dueros.bot.audio_joke,ai.dueros.bot.faq,ai.dueros.bot.gaokao,aries_general,audio_news,baojie,cookbook,duer_weather,dumi_talk_guide,hotel,ibf_model1_server,image_service,life_common,light_vertical,movie_satisfy,music,nba_search,o2o_satisfy,online_shopping,phone,poem,recharge,recommend_service_wireless,remind,rent_car,restaurant_bot,sac,sysprofile_service,talk_service,travel_server,user_profile,voice_feed,"
        },
        {
            "key": "da_responce",
            "value": "{"status":0, "msg":"OK", "data":{"da_query_info":[{"type":"rsse", "result_list":[{"type":"rssequery", "score":0, "result_list":[{"type":"querylist", "score":0, "content":"[\\"祝你快乐\\",\\"祝你快乐简谱\\",\\"分手快乐祝你快乐\\",\\"祝你快乐的英文\\",\\"生日快乐祝你快乐\\",\\"祝你快乐 管乐合奏\\",\\"祝你快乐教案\\",\\"祝你快乐 阿杜\\",\\"祝你快乐怎么翻译\\",\\"祝你快乐 mp3微盘\\"]\\n"}]}]}, {"type":"control.hardware", "result_list":[]}, {"type":"custom", "result_list":[]}, {"query":"度秘祝你快乐", "type":"o2o_satisfy", "result_list":[]}, {"type":"sac", "result_list":[]}, {"type":"life_common", "result_list":[]}, {"type":"online_shopping", "result_list":[]}, {"type":"rent_car", "result_list":[]}, {"type":"hotel", "result_list":[]}, {"type":"restaurant_bot", "result_list":[]}, {"query":"度秘祝你快乐", "type":"movie_satisfy", "result_list":[]}, {"type":"baojie", "result_list":[]}, {"type":"recharge", "result_list":[]}, {"query":"度秘祝你快乐", "type":"nba", "result_list":[]}, {"query":"度秘祝你快乐", "type":"phone", "result_list":[]}, {"query":"度秘祝你快乐", "type":"music", "result_list":[]}, {"query":"度秘祝你快乐", "type":"map", "result_list":[]}, {"query":"度秘祝你快乐", "type":"remind", "result_list":[]}, {"query":"度秘祝你快乐", "type":"user_profile", "result_list":[{"type":"", "score":100, "result_list":[{"type":"F->Person->Mood->Check", "score":0, "content":"{\\"order_id\\":0,\\"ordertype_id\\":0,\\"ori_domain\\":\\"F->Person->Mood->Check\\",\\"score\\":83.0,\\"slot_num\\":3}\\n", "result_list":[{"key":"Mood", "type":"text", "value":[{"value":"快乐", "name":"Mood", "source":"query", "type":"string", "tag_op":1, "session_num":0}], "score":0}, {"key":"Person", "type":"text", "value":[{"value":"你", "name":"Person", "source":"query", "type":"string", "tag_op":1, "session_num":0}], "score":0}, {"key":"ProfileWantKey", "type":"text", "value":[{"value":"度秘", "name":"ProfileWantKey", "source":"query", "type":"string", "tag_op":1, "session_num":0}], "score":0}]}]}]}, {"type":"image_service", "result_list":[]}, {"query":"度秘祝你快乐", "type":"confirm", "result_list":[]}, {"type":"sys_profile", "result_list":[]}, {"type":"wechat", "result_list":[]}, {"type":"audio.unicast", "result_list":[]}, {"query":"度秘祝你快乐", "type":"audio.music", "result_list":[{"type":"audio.music", "score":100, "result_list":[{"type":"audio.music.play", "score":0, "content":"", "result_list":[{"key":"search_query", "type":"text", "value":[{"value":"祝你快乐", "name":"search_query", "source":"query", "type":"string", "tag_op":1, "session_num":0}], "score":0}, {"key":"aladin_scrid", "type":"text", "value":[{"value":"8041", "name":"aladin_scrid", "source":"query", "type":"string", "tag_op":1, "session_num":0}], "score":0}]}]}]}, {"type":"audio.live", "result_list":[]}, {"type":"audio.news", "result_list":[]}, {"type":"audio.comedy", "result_list":[]}, {"type":"audio.scene", "result_list":[]}, {"type":"time", "result_list":[]}, {"type":"cookbook", "result_list":[]}, {"type":"ucp_content", "result_list":[]}, {"type":"cooker", "result_list":[]}, {"type":"fridge", "result_list":[]}, {"type":"recommend_service_wireless", "result_list":[]}, {"type":"memory", "result_list":[]}, {"type":"smart_tv", "result_list":[]}, {"type":"tv.live", "result_list":[]}, {"type":"audio.joke", "result_list":[]}, {"type":"slot.decode", "result_list":[]}, {"type":"puzzle", "result_list":[]}, {"type":"story.children", "result_list":[]}], "params":[{"key":"mmsda_response", "value":"{\\"voiceguidesidentify\\":{\\"is_fullreplace\\":false, \\"fullreplace_query\\":\\"\\", \\"last_query\\":\\"藏头诗\\", \\"fullreplace_strategy\\":0, \\"strategy_type\\":0}, \\"wise_rewrite\\":{\\"res\\":[], \\"normalize\\":[]}}"}, {"key":"dumi_timeline", "value":"{\\"result_count\\":1, \\"result_list\\":[{\\"rewrite_query\\":\\"祝你快乐\\", \\"srcid_num\\":2, \\"srcids\\":[8041, 91], \\"positions\\":[1, 3], \\"position_flags\\":[1, 1], \\"rw_type\\":1, \\"confidence\\":11}], \\"disp_num\\":0, \\"click_num\\":0}"}, {"key":"user_profile", "value":"{}\\n"}, {"key":"qu_service_single_response", "value":"{\\"status\\":0, \\"timestamp\\":0, \\"raw_query\\":\\"度秘祝你快乐\\", \\"intent_candidates\\":[{\\"intent\\":\\"0\\", \\"intent_confidence\\":0, \\"func_slot\\":\\"\\", \\"slots\\":[{\\"offset\\":-1, \\"length\\":-1, \\"original_word\\":\\"\\", \\"normalized_word\\":\\"\\", \\"type\\":\\"\\", \\"confidence\\":0, \\"word_type\\":\\"\\"}], \\"extra_info\\":{\\"parser_qu_da_sug\\":\\"\\"}}]}"}, {"key":"gssda_response", "value":"{\\"result\\":[{\\"normal\\":{\\"danormalanalysis\\":{\\"query_composition\\":\\"\\", \\"dummy\\":0, \\"feature_res\\":null}, \\"dummy\\":0}}]}"}, {"key":"qu_responce", "value":"{\\"err_no\\":0, \\"result\\":[{\\"normal\\":{}, \\"qu\\":{\\"query_voice\\":{\\"res\\":[{\\"domain\\":\\"person\\", \\"intent\\":\\"F->Person->Mood->Check\\", \\"score\\":83, \\"objects\\":[{\\"key\\":\\"_F->Person->Mood->Check\\", \\"value\\":\\"度秘你快乐\\", \\"score\\":1, \\"offset\\":0, \\"length\\":10}, {\\"key\\":\\"Mood\\", \\"value\\":\\"快乐\\", \\"score\\":1, \\"offset\\":4294967295, \\"length\\":0}, {\\"key\\":\\"_Mood\\", \\"value\\":\\"快乐\\", \\"score\\":1, \\"offset\\":4294967295, \\"length\\":0}, {\\"key\\":\\"Person\\", \\"value\\":\\"你\\", \\"score\\":1, \\"offset\\":4294967295, \\"length\\":0}, {\\"key\\":\\"_Person\\", \\"value\\":\\"你\\", \\"score\\":1, \\"offset\\":4294967295, \\"length\\":0}, {\\"key\\":\\"ProfileWantKey\\", \\"value\\":\\"度秘\\", \\"score\\":1, \\"offset\\":4294967295, \\"length\\":0}, {\\"key\\":\\"_ProfileWantKey\\", \\"value\\":\\"度秘\\", \\"score\\":1, \\"offset\\":4294967295, \\"length\\":0}], \\"reduce_tree_info\\":\\"(query(F->Person->Mood->Check(ProfileWantKey 度秘)(Person(System 你))(Mood 快乐)))\\"}]}}, \\"queryId\\":1}]}"}, {"key":"da_sug_query", "value":"{\\"log_id\\":\\"14985319576499\\",\\"query\\":\\"度秘祝你快乐\\",\\"rewrite_query_type\\":\\"no_rewrite\\"}\\n"}, {"key":"personal_com_query", "value":"{\\"home\\":\\"\\",\\"office\\":\\"\\",\\"offset\\":0,\\"query\\":\\"\\",\\"type\\":\\"\\"}\\n"}, {"key":"apollo", "value":"null\\n"}, {"key":"nlu_responce", "value":"{\\"analysis\\":{},\\"parsed_text\\":\\"度 秘 祝 你 快乐\\",\\"raw_text\\":\\"度秘祝你快乐\\",\\"results\\":[{\\"demand\\":0,\\"domain\\":\\"universal_search\\",\\"intent\\":\\"search\\",\\"object\\":{},\\"pushleft_switch\\":\\"0\\",\\"score\\":0.7303638458251953,\\"str_result_content\\":{},\\"str_result_type\\":\\"\\"}],\\"sugs\\":\\"度秘祝你快乐\\",\\"sugs_types\\":\\"PAT_EC\\"}\\n"}, {"key":"lexical_analysis", "value":"[{\\"flag\\":2,\\"name\\":\\"basic\\",\\"ner\\":\\"\\",\\"postag\\":\\"度_v 秘_j 祝_v 你_r 快乐_a\\",\\"wordrank\\":\\"度_2_0.199778 秘_2_0.206569 祝_1_0.195274 你_1_0.0700263 快乐_2_0.328353\\",\\"wordseg\\":\\"度 秘 祝 你 快乐\\"},{\\"flag\\":4,\\"name\\":\\"segment\\",\\"ner\\":\\"\\",\\"postag\\":\\"度_v 秘_j 祝你快乐_n\\",\\"wordrank\\":\\"度_1_0.190027 秘_2_0.196486 祝你快乐_2_0.613486\\",\\"wordseg\\":\\"度 秘 祝你快乐\\"},{\\"flag\\":8,\\"name\\":\\"sub_phrase\\",\\"ner\\":\\"\\",\\"postag\\":\\"祝你快乐_n\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"祝你快乐\\"},{\\"flag\\":16,\\"name\\":\\"human_name\\",\\"ner\\":\\"\\",\\"postag\\":\\"\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"\\"},{\\"flag\\":32,\\"name\\":\\"book_name\\",\\"ner\\":\\"\\",\\"postag\\":\\"\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"\\"},{\\"flag\\":64,\\"name\\":\\"new_word\\",\\"ner\\":\\"\\",\\"postag\\":\\"度秘_n\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"度秘\\"},{\\"flag\\":128,\\"name\\":\\"crf_multi\\",\\"ner\\":\\"\\",\\"postag\\":\\"\\",\\"wordrank\\":\\"\\",\\"wordseg\\":\\"\\"}]\\n"}]}}"
        },
        {
            "key": "ai.dueros.bot.audio_joke_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":1, "page_cnt":1, "result_num":1, "result_list":[{"content":"{\\"result_list\\":[{\\"result_confidence\\":0,\\"result_content\\":{\\"answer\\":\\"\\"},\\"result_type\\":\\"txt\\",\\"source_type\\":\\"ai.dueros.bot.audio_joke\\"}],\\"type\\":\\"user\\",\\"user_id\\":\\"61AC53709613C6273E6EF36B1A829C64|SSS1\\",\\"bot_intent\\":{\\"query\\":\\"度秘祝你快乐\\",\\"query_score\\":0}}", "confidence":0, "form_confidence":0, "source_type":"ai.dueros.bot.audio_joke", "source_sub_type":"ai.dueros.bot.audio_joke", "stategy_middle_data":{"raw_answer":[{"url":"", "title":"", "subtitle":"", "answer":""}], "bot_intent":{"query":"度秘祝你快乐", "query_score":0}}}], "service_query_info":[], "server_query_intent":"\\"\\"", "directives":[], "nlu":{}, "speech":{}, "prompt":{}, "resource":{}, "views":[]}, "keep_silence":null}"
        },
        {
            "key": "ai.dueros.bot.gaokao_responce",
            "value": "{"status":0, "msg":"ok", "data":{"result_num":0, "result_list":[{"content":"{\\"result_list\\":[{\\"result_content\\":{\\"answer\\":\\"我只为你解答高考相关的问题，你可以问我“武汉大学怎么样？”\\"},\\"voice\\":\\"我只为你解答高考相关的问题，你可以问我“武汉大学怎么样？”\\",\\"result_type\\":\\"txt\\",\\"source_type\\":\\"ai.dueros.bot.gaokao\\",\\"result_confidence\\":100}],\\"instant_url\\":\\"\\",\\"instant\\":\\"\\",\\"hint_mult\\":null,\\"resource\\":{\\"machineContent\\":{\\"content\\":{\\"txt\\":\\"我只为你解答高考相关的问题，你可以问我“武汉大学怎么样？” \\",\\"voice\\":\\"我只为你解答高考相关的问题，你可以问我“武汉大学怎么样？” \\",\\"link\\":\\"\\",\\"pic\\":{\\"origin\\":{\\"width\\":\\"\\",\\"height\\":\\"\\",\\"url\\":\\"\\"},\\"thumbnail\\":{\\"width\\":\\"\\",\\"height\\":\\"\\",\\"url\\":\\"\\"}}},\\"type\\":0},\\"source_type\\":\\"ai.dueros.bot.gaokao\\"}}", "confidence":0, "form_confidence":0, "source_type":"ai.dueros.bot.gaokao", "source_sub_type":"ai.dueros.bot.gaokao", "stategy_middle_data":{"raw_answer":[{"url":"123", "title":"我只为你解答高考相关的问题，你可以问我“武汉大学怎么样？”", "subtitle":"我只为你解答高考相关的问题，你可以问我“武汉大学怎么样？”", "answer":"我只为你解答高考相关的问题，你可以问我“武汉大学怎么样？”"}]}}]}, "bot_sessions":[{"action":"set", "type":"string", "key":"61AC53709613C6273E6EF36B1A829C64|SSS1", "list_sessions_str":[""]}], "user_info":{"user_id":"61AC53709613C6273E6EF36B1A829C64|SSS1"}, "error":0}"
        },
        {
            "key": "duer_weather_responce",
            "value": "{"status":1, "msg":"error output"}"
        },
        {
            "key": "dumi_talk_guide_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":0, "page_cnt":0, "result_num":0, "result_list":[{"content":"dumi_talk-guide does not deal with such query", "confidence":0, "source_type":"dumi_talk_guide", "source_sub_type":"", "stategy_middle_data":{"bot_intent":{"query":"度秘祝你快乐", "query_score":-1}, "bot_answer":{"answer":"dumi_talk-guide does not deal with such query", "answer_score":-1}, "bot_global_state":{"bot_state":"ignore"}}, "confirm":0}]}}"
        },
        {
            "key": "image_service_responce",
            "value": "{"status":0, "msg":"", "data":{"result_list":[{"confidence":0, "source_type":"image_service", "source_sub_type":"image_service"}]}}"
        },
        {
            "key": "light_vertical_responce",
            "value": "{"status":0, "msg":"ok", "data":{"result_list":[{"content":"{\\"hint_mult\\":{\\"data\\":[],\\"hint_float\\":0,\\"placeholder\\":\\"\\",\\"type\\":\\"multi_column\\"},\\"result_list\\":null}\\n", "confidence":0, "source_type":"light_vertical", "source_sub_type":"", "stategy_middle_data":{"raw_answer":[]}}]}}"
        },
        {
            "key": "music_responce",
            "value": "{"status":0, "msg":"ok"}"
        },
        {
            "key": "phone_responce",
            "value": "{"status":0, "msg":"ok"}"
        },
        {
            "key": "poem_responce",
            "value": "{"status":0, "msg":"ok", "data":{"result_list":[{"content":"{\\"hint_mult\\":{\\"data\\":[{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"换一首\\"},{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"换主题句\\"},{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"退出写诗\\"},{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"只要文字\\"},{\\"id\\":\\"{\\\\\\"guide_intent\\\\\\":\\\\\\"poem\\\\\\"}\\\\n\\",\\"value\\":\\"换背景\\"}],\\"hint_float\\":0,\\"placeholder\\":\\"\\",\\"type\\":\\"multi_column\\"},\\"result_list\\":[{\\"result_content\\":{\\"imgs\\":[\\"http:\\/\\/xiaodu.baidu.com\\/img\\/pic?pic_id=55679976\\"]},\\"result_type\\":\\"img_comm\\",\\"source_type\\":\\"poem\\",\\"voice\\":\\"度势虽寒好邀竹.秘心自傲不输松.祝中秋高人不留.你我一大道未动.快意闲情咏岁华.乐情雅趣吟诗梦.\\"}],\\"source_type\\":\\"poem\\"}\\n", "confidence":260, "source_type":"poem", "source_sub_type":"cang_tou", "stategy_middle_data":{"bot_global_state":{"bot_state":"multi_clarify"}}}]}, "bot_sessions":[{"status":0, "msg":"ok", "action":"set", "type":"string", "key":"61AC53709613C6273E6EF36B1A829C64|SSS1", "list_sessions":[]}]}"
        },
        {
            "key": "recharge_responce",
            "value": "{"status":0, "msg":"ok"}"
        },
        {
            "key": "recommend_service_wireless_responce",
            "value": "{"status":1, "msg":"err", "data":{"page_num":1, "page_cnt":10, "result_num":1, "result_list":[{"url":"", "title":"", "confidence":-1, "source_type":"recommend_service_wireless"}]}}"
        },
        {
            "key": "remind_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":1, "page_cnt":0, "result_num":1, "result_list":[], "service_query_info":[], "server_query_intent":"\\"\\"", "directives":[], "speech":[], "resource":[], "views":[]}, "bot_sessions":[{"status":0, "msg":"ok", "action":"set", "type":"string", "key":"61AC53709613C6273E6EF36B1A829C64|SSS1", "list_sessions_str":["{\\"empty\\":true}"]}]}"
        },
        {
            "key": "sac_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":1, "page_cnt":1, "result_num":0, "result_list":[{"confidence":0, "source_type":"sac", "stategy_middle_data":{"intent":{"slots_map":[], "intent":"NONE"}, "slot":{"slots_map":[], "state":"NONE"}}}], "service_query_info":[{"type":"sac", "result_list":[]}]}}"
        },
        {
            "key": "sysprofile_service_responce",
            "value": "{"status":0, "msg":"ok", "data":{"page_num":1, "page_cnt":10, "result_num":0}, "user_info":{"user_id":"", "user_name":"", "last_online_time":0, "last_online_ip":"", "ct_time":0, "age_sysprofile":"", "name_sysprofile":"{\\"confidence\\":100,\\"value\\":\\"权志龙\\"}\\n", "gender_sysprofile":"", "constellation_sysprofile":"", "extra":[{"key":"identity", "value":""}, {"key":"family_name", "value":""}, {"key":"sex", "value":""}, {"key":"sexorientation", "value":""}, {"key":"mood", "value":""}, {"key":"age", "value":""}, {"key":"birthday", "value":""}, {"key":"constellation", "value":""}, {"key":"zodiac", "value":""}, {"key":"height", "value":""}, {"key":"weight", "value":""}, {"key":"school", "value":""}, {"key":"grade", "value":""}, {"key":"work", "value":""}, {"key":"job", "value":""}, {"key":"place_of_origin", "value":""}, {"key":"company", "value":""}, {"key":"marriage", "value":""}, {"key":"idol", "value":""}, {"key":"star", "value":""}, {"key":"like_man_star", "value":""}, {"key":"like_woman_star", "value":""}, {"key":"like_person", "value":""}, {"key":"spouse", "value":""}, {"key":"girl_friend", "value":""}, {"key":"boy_friend", "value":""}, {"key":"food", "value":""}, {"key":"snack", "value":""}, {"key":"sport", "value":""}, {"key":"address", "value":""}, {"key":"actor", "value":""}, {"key":"basketball", "value":""}, {"key":"color", "value":""}, {"key":"football", "value":""}, {"key":"movie", "value":""}, {"key":"music", "value":""}, {"key":"game", "value":""}, {"key":"singer", "value":""}, {"key":"good_at_sport", "value":""}, {"key":"shap", "value":""}, {"key":"name", "value":"权志龙"}], "base_table":{"last_online_ip":"", "last_online_time":0, "ct_time":0}, "public_table":{"item":[{"key":"age", "sub_item":[{"key":"sysprofile", "value":""}]}, {"key":"constellation", "sub_item":[{"key":"sysprofile", "value":""}]}, {"key":"gender", "sub_item":[{"key":"sysprofile", "value":""}, {"key":"default", "value":""}]}, {"key":"name", "sub_item":[{"key":"sysprofile", "value":"{\\"confidence\\":100,\\"value\\":\\"权志龙\\"}\\n"}, {"key":"default", "value":"权志龙"}]}, {"key":"office_location", "sub_item":[{"key":"sysprofile", "value":""}]}]}}}"
        },
        {
            "key": "query_entitys",
            "value": ""
        },
        {
            "key": "rank_priority",
            "value": "kg_service aries_guide aries_dqa aries_general###restaurant_bot o2o_satisfy###rent_car movie_satisfy###audio_news audio_live audio_music audio_unicast###"
        },
        {
            "key": "poem_strategy_model",
            "value": "{"answer_score":0,"count_down":0,"dim_num":60,"feature":[{"feature_name":"","index":0,"value":0.0},{"feature_name":"NLU_GROUP_MATCH_SCORE","index":1,"value":1.0},{"feature_name":"","index":2,"value":0.0},{"feature_name":"NOT_QU_COVER_VERTICAL","index":3,"value":1.0},{"feature_name":"","index":4,"value":0.0},{"feature_name":"NOT_LU_COVER_VERTICAL","index":5,"value":1.0},{"feature_name":"","index":6,"value":0.0},{"feature_name":"QUERY_SCORE","index":7,"value":0.80},{"feature_name":"ANSWER_SCORE","index":8,"value":0.80},{"feature_name":"VERTICAL_TYPE","index":9,"value":1.0}],"feedback_score":0.7801147103309631,"is_valid":true,"merge_score":0.6921893954277039,"model_score":3.173397302627563,"query_score":0,"rank_score":96.30541871919999,"rule_model_str":"","source_type":"poem"}\n"
        },
        {
            "key": "da_rewrite_query",
            "value": "度秘祝你快乐"
        },
        {
            "key": "loc",
            "value": "%7B%22addr%22%3A%22%B1%B1%BE%A9%CA%D0%BA%A3%B5%ED%C7%F8%BA%F3%B3%A7%B4%E5%C2%B7%22%2C%22city%22%3A%22%B1%B1%BE%A9%CA%D0%22%2C%22city_code%22%3A131%2C%22crd%22%3A%2212945813.977000_4846734.410094_200%22%7D%0A"
        },
        {
            "key": "poem_strategy_final",
            "value": "{"answer_score":0,"count_down":1000,"dim_num":60,"feature":[{"feature_name":"","index":0,"value":0.0},{"feature_name":"NLU_GROUP_MATCH_SCORE","index":1,"value":1.0},{"feature_name":"","index":2,"value":0.0},{"feature_name":"NOT_QU_COVER_VERTICAL","index":3,"value":1.0},{"feature_name":"","index":4,"value":0.0},{"feature_name":"NOT_LU_COVER_VERTICAL","index":5,"value":1.0},{"feature_name":"","index":6,"value":0.0},{"feature_name":"QUERY_SCORE","index":7,"value":0.80},{"feature_name":"ANSWER_SCORE","index":8,"value":0.80},{"feature_name":"VERTICAL_TYPE","index":9,"value":1.0}],"feedback_score":0.7801147103309631,"is_valid":true,"merge_score":0.6921893954277039,"model_score":3.173397302627563,"query_score":0,"rank_score":159.0,"rule_model_str":"source_type==poem\\trank_score=128&&count_down=0###last_source_type==poem&&source_type==poem\\trank_score=159&&count_down=0###query_type==0|1|2&&b_feedback_key==1\\tcount_down=1000###","source_type":"poem"}\n"
        }
    ],
    "hint_mult": {
        "data": [
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "换一首"
            },
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "换主题句"
            },
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "退出写诗"
            },
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "只要文字"
            },
            {
                "id": "{"guide_intent":"poem"}\n",
                "value": "换背景"
            }
        ],
        "hint_float": 1,
        "placeholder": "",
        "type": "multi_column"
    },
    "source_type": "poem",
    "nlu": {
        "domain": "unknown",
        "intent": "unknown",
        "slots": []
    },
    "ctime": 1498531957,
    "id": "1498531957_658fh2ldg"
}
```