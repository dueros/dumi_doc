
RESOURCE_SCHEMA="\
-r resource/news.schema.json \
-r resource/music.schema.json \
-r resource/music_ref.schema.json \
-r resource/weather.schema.json"
curl --stderr /dev/null 'http://xiaodu.baidu.com/saiya/ws' --data $'{"appid":"dm1597589043374553","appkey":"303177F7740F4572BF52A9CD6642B7EC","sdk_ui":"no","sdk_init":"no","appname":"com.baidu.duersdk.xiaomi","channel_from":"","channel_ctag":"","from_client":"sdk","location_system":"wgs84","hint_id":"","client_msg_id":"c9bfe944-992b-45b1-8afe-dc2cdaee622a","CUID":"test_1497577830189","operation_system":"android","sample_name":"bear_brain_wireless","request_uid":"DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768","app_ver":"2.0.0","request_query":"\u6211\u8981\u542c\u6b4c","query_type":"0","debug":"0","longitude":116.3881711235,"latitude":39.9315351235,"speech_id":"12345"}' --compressed>test.json;ajv -s dumi_schema.json $RESOURCE_SCHEMA -d test.json
#ajv -s dumi_schema.json $RESOURCE_SCHEMA -d testdata/weather.json
#ajv -s dumi_schema.json $RESOURCE_SCHEMA -d testdata/news.json
#ajv -s dumi_schema.json $RESOURCE_SCHEMA -d testdata/music.json
