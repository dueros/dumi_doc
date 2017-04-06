#weather bot输出schema

## 天气意图（intent：weather）
```javascript
{
    "action_list": [
        {
            "action_id": "slot_clarify_sys_time",
            "action_type": {
                "act_target": "slot",
                "act_target_detail": "sys_time",
                "act_type": "clarify",
                "act_type_detail": ""
            },
            "arg_list": [],
            "code_actions": {},
            "confidence": 1,
            "exe_status": [],
            "main_exe": "",
            "say": "请明确一下:sys_time"
        }
    ],
    "bot-session": "{\"action_info\":{\"action_name\":\"\",\"clarify_slot\":\"\",\"is_clarify\":false},\"intent_clarify_cands\":[],\"interaction_state\":\"\",\"qu_cloud_history\":[{\"client_results\":\"\",\"qu_history_item\":{\"extra_info\":{},\"func_slot\":\"\",\"intent\":\"SYS_WEATHER\",\"intent_confidence\":100.0,\"raw_query\":\"北京天气\",\"slots\":[]}}],\"stored_nlu_result\":{},\"timestamp\":1488888873,\"user_slots\":{\"error_no\":0,\"slot_map\":{\"domain\":{\"error_no\":0,\"slot\":{\"custom_data\":{\"error_no\":0},\"error_no\":0,\"slot_name\":\"domain\",\"state\":2,\"tag_map\":{\"\":{\"custom_data\":{\"error_no\":0,\"original_word\":\"\",\"tag_type\":\"\"},\"error_no\":0,\"state\":2,\"tag_name\":\"\",\"turn\":0,\"weight\":0.0}},\"weight\":0.0},\"slot_name\":\"domain\",\"turn\":0},\"sys_loc\":{\"error_no\":0,\"slot\":{\"custom_data\":{\"error_no\":0},\"error_no\":0,\"slot_name\":\"sys_loc\",\"state\":2,\"tag_map\":{\"北京市\":{\"custom_data\":{\"error_no\":0,\"original_word\":\"北京\",\"tag_type\":\"\"},\"error_no\":0,\"state\":2,\"tag_name\":\"北京市\",\"turn\":0,\"weight\":0.0}},\"weight\":0.0},\"slot_name\":\"sys_loc\",\"turn\":0}}}}\n",
    "log_id": "qa_test_debug_chenchen20_debug_monitor_uniq_id_ABCDEFG",
    "msg": "ok",
    "qu_res": {
        "intent_candidates": [
            {
                "extra_info": {},
                "func_slot": "",
                "intent": "SYS_WEATHER",
                "intent_confidence": 100,
                "slots": [
                    {
                        "confidence": 100,
                        "length": 4,
                        "normalized_word": "北京市",
                        "offset": 0,
                        "original_word": "北京",
                        "type": "sys_loc",
                        "word_type": ""
                    }
                ]
            },
            {
                "extra_info": {},
                "func_slot": "",
                "intent": "SYS_WEATHER",
                "intent_confidence": 100,
                "slots": [
                    {
                        "confidence": 100,
                        "length": 4,
                        "normalized_word": "北京天气",
                        "offset": 0,
                        "original_word": "北京",
                        "type": "sys_loc",
                        "word_type": ""
                    }
                ]
            },
            {
                "extra_info": {
                    "reduce_tree_info": "(query(F->weather(WeatherFocus(WeatherStatus 天气))(REGION(CITY 北京))))"
                },
                "func_slot": "info",
                "intent": "SYS_WEATHER",
                "intent_confidence": -100,
                "slots": [
                    {
                        "confidence": 5.2023e-34,
                        "length": -1,
                        "normalized_word": "北京",
                        "offset": -1,
                        "original_word": "北京",
                        "type": "sys_loc",
                        "word_type": ""
                    }
                ]
            }
        ],
        "log_id": "qa_test_debug_chenchen20_debug_monitor_uniq_id_ABCDEFG",
        "raw_query": "北京天气",
        "status": 0,
        "timestamp": 0
    },
    "schema": {
        "bot_merged_slots": [
            {
                "begin": 0,
                "confidence": 0,
                "length": 0,
                "merge_method": "update",
                "normalized_word": "北京市",
                "original_word": "北京",
                "session_offset": 0,
                "type": "sys_loc",
                "word_type": ""
            }
        ],
        "current_qu_intent": "SYS_WEATHER",
        "intent_confidence": 100
    },
    "status": 0
}
```