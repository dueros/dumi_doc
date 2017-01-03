
cat >querys <<END
我在哪里
我要吃饭
北京天气
叫个外卖
我要打车
讲个笑话
北京附近有什么好玩的地方
高考志愿
退出
藏头诗
百度
退出
附近的好饭店
打电话给王芃
英特尔的新闻
姚明的身高
刘德华的老婆
END

cp test_querys querys

OUTPUT_DIR=output
mkdir -p $OUTPUT_DIR
for query in $(cat querys)
do
    cat >request <<END
    { "appid": "dm5C60F68C963F4A66", "appkey": "675C78EA90BF418D875317CEA172A7AE", "sdk_ui": "no", "sdk_init": "no", "appname": "com.baidu.duersdk.xiaomi", "channel_from": "", "channel_ctag": "", "from_client": "sdk", "location_system": "wgs84", "hint_id": "", "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a", "CUID": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768", "operation_system": "android", "sample_name": "bear_brain_wireless", "request_uid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768", "app_ver": "1.0.0", "request_query": "$query", "query_type": "0", "debug": "0", "longitude": 116.3881711235, "latitude": 39.9315351235 }
END
    #curl 'http://nj03-rp-m22nlp156.nj03.baidu.com:8186/saiya/ws2' -d "$(cat request)" > testdata/${query}.json
    #exit 0
    curl 'http://nj03-rp-m22nlp156.nj03.baidu.com:8186/saiya/ws2' -s -d "$(cat request)" > ${OUTPUT_DIR}/${query}.json
    ./check.sh ${OUTPUT_DIR}/${query}.json
done
