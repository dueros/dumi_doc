# 通用信息输出schema

## 百科
```javascript
//query = 刘德华
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "baike",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "刘德华_百度百科",
                        "summary": "刘德华（Andy Lau），1961年9月27日出生于中国香港，演员、歌手、作词人、制片人。1981年出演电影处女作《彩云曲》。1983年主演的武侠剧《神雕侠侣》在香港获得62点的收视纪录。1985年因拒签五年合约而被TVB雪藏。1988年将事业重心转向电影。1991年创办天幕电影公司。1994年担任剧情片《天与地》的制片人。2000年凭借警匪片《暗战》获得第19届香港电影金像奖最佳男主角奖。2004年凭借警匪片《无间道3：终极无间》获得第41届台湾金马奖最佳男主角奖。2005年获得香港UA院线颁发的“1985-2005年全港最高累积票房香港男演员”奖。2006年获得釜山国际电影节亚洲最有贡献电影人奖。2011年主演剧情片《桃姐》，并凭借该片先后获得台湾金马奖最佳男主角奖、香港电影金像奖最佳男主角奖；同年担任第49届台湾电影金马奖评审团主席。2017年主演警匪动作片《拆弹专家》",
                        "url": "https://ss0.baidu.com/9rM4dzva2gU2pMbgoY3K/item/%E5%88%98%E5%BE%B7%E5%8D%8E/114923?fr=aladdin",
                        "image": "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2938670487,4139963420&fm=58"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": " 刘德华（Andy Lau），1961年9月27日出生于中国香港，演员、歌手、作词人、制片人。1981年出演电影处女作《彩云曲》。1983年主演的武侠剧《神雕侠侣》在香港获得62点的收视纪录。1985年因拒签五年合约而被TVB雪藏。1988年将事业重心转向电影。1991年创办天幕电影公司。1994年担任剧情片《天与地》的制片人。2000年凭借警匪片《暗战》获得第19届香港电影金像奖最佳男主角奖。2004年凭借警匪片《无间道3：终极无间》获得第41届台湾金马奖最佳男主角奖。2005年获得香港UA院线颁发的“1985-2005年全港最高累积票房香港男演员”奖。2006年获得釜山国际电影节亚洲最有贡献电影人奖。2011年主演剧情片《桃姐》，并凭借该片先后获得台湾金马奖最佳男主角奖、香港电影金像奖最佳男主角奖；同年担任第49届台湾电影金马奖评审团主席。2017年主演警匪动作片《拆弹专家》"
        }
    },
    "id": "1497432473_2428xywdg",
    "logid": "14974324727514",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497432473,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "刘德华",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 802
}

//query = 刘德华（纯文本输出）
{
    "result": {
        "hint": [
            "梁朝伟和刘德华的演技谁比较好？",
            "刘德华:一位我追了十二年的偶像",
            "刘德华的八卦新闻",
            "刘德华和周杰伦为什么不开微博？",
            "刘德华电影全集国语优酷",
            "刘德华演唱会"
        ],
        "nlu": {
            "domain": "universal_search",
            "intent": "baike",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": " 刘德华（Andy Lau），1961年9月27日出生于中国香港，演员、歌手、作词人、制片人。1981年出演电影处女作《彩云曲》。1983年主演的武侠剧《神雕侠侣》在香港获得62点的收视纪录。1985年因拒签五年合约而被TVB雪藏。1988年将事业重心转向电影。1991年创办天幕电影公司。1994年担任剧情片《天与地》的制片人。2000年凭借警匪片《暗战》获得第19届香港电影金像奖最佳男主角奖。2004年凭借警匪片《无间道3：终极无间》获得第41届台湾金马奖最佳男主角奖。2005年获得香港UA院线颁发的“1985-2005年全港最高累积票房香港男演员”奖。2006年获得釜山国际电影节亚洲最有贡献电影人奖。2011年主演剧情片《桃姐》，并凭借该片先后获得台湾金马奖最佳男主角奖、香港电影金像奖最佳男主角奖；同年担任第49届台湾电影金马奖评审团主席。2017年主演警匪动作片《拆弹专家》"
            }
        ],
        "speech": {
            "type": "Text",
            "content": " 刘德华（Andy Lau），1961年9月27日出生于中国香港，演员、歌手、作词人、制片人。1981年出演电影处女作《彩云曲》。1983年主演的武侠剧《神雕侠侣》在香港获得62点的收视纪录。1985年因拒签五年合约而被TVB雪藏。1988年将事业重心转向电影。1991年创办天幕电影公司。1994年担任剧情片《天与地》的制片人。2000年凭借警匪片《暗战》获得第19届香港电影金像奖最佳男主角奖。2004年凭借警匪片《无间道3：终极无间》获得第41届台湾金马奖最佳男主角奖。2005年获得香港UA院线颁发的“1985-2005年全港最高累积票房香港男演员”奖。2006年获得釜山国际电影节亚洲最有贡献电影人奖。2011年主演剧情片《桃姐》，并凭借该片先后获得台湾金马奖最佳男主角奖、香港电影金像奖最佳男主角奖；同年担任第49届台湾电影金马奖评审团主席。2017年主演警匪动作片《拆弹专家》"
        }
    },
    "id": "1497432669_357347d5f",
    "logid": "14974326698500",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497432669,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "刘德华",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 193
}
```
## 限行
```javascript
//今日限行
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "traffic_limit",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "为你找到以下图片",
                        "image": "http://xiaodu.baidu.com/img/pic?pic_id=54261165",
                        "url": "http://justfortest.nj.m.baidu.com/uiapi/f24b0b/aladdin.html?from=1009717l&cip=61.135.169.80&count=1&os=1&usdata=1&target=_blank&word=%E5%8C%97%E4%BA%AC%E5%B8%82%E4%BB%8A%E6%97%A5%E9%99%90%E8%A1%8C&loc=%7B%22crd%22%3A%2212957817.404506_4829433.130120_200%22%2C%22city%22%3A%22%5Cu5317%5Cu4eac%5Cu5e02%22%2C%22addr%22%3A%22%5Cu5317%5Cu4eac%5Cu5e02%5Cu897f%5Cu57ce%5Cu533a%5Cu897f%5Cu697c%5Cu5df715%5Cu53f7%22%2C%22city_code%22%3A131%7D&give=chezhu_limit&pu=sz%401320_480%2Ccua%40_avLC_aE-i4qywoUfpw1zyaBXi4Xa2iLA%2Ccut%40_u2g8juSvh_Dh2IJgNvHtyN6moi5pQqAC%2Cosname%40baiduboxapp%2Cctv%402%2Ccfrom%40757b%2Ccen%40cuid_cua_cut%2Ccsrc%40app_dumi_voice"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "北京今日限行尾号为5和0"
        }
    },
    "id": "1497432721_922dgzprz",
    "logid": "14974327215379",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497432721,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "今日限行",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 536
}

//今日限行（纯文本输出）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "traffic_limit",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "北京今日限行尾号为5和0"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "北京今日限行尾号为5和0"
        }
    },
    "id": "1497432788_263bu5naw",
    "logid": "14974327888613",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497432788,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "今日限行",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 253
}
```
## 股票
```javascript
//百度股价
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "stock",
            "slots": {}
        },
        "resource": {
            "data": {
                "ExtendedLocation": "",
                "OriginQuery": "百度股价",
                "TitleSuffix": "test",
                "appinfo": "",
                "dispNum": 3,
                "fetchkey": "百度股价",
                "listNum": 3,
                "normdisp": 1,
                "open_query_uri": "code",
                "open_resource_name": "stock_meigu",
                "otherinfo": "{}",
                "resNum": 3,
                "resourceid": "8191",
                "result": [
                    {
                        "change": "-0.87(-0.48%)",
                        "code": "BIDU",
                        "current_price": "179.19",
                        "info": [
                            {
                                "color": "#0f990f",
                                "name": "今开",
                                "value": "181.52"
                            },
                            {
                                "color": "",
                                "name": "昨收",
                                "value": "180.06"
                            },
                            {
                                "color": "#0f990f",
                                "name": "最高",
                                "value": "181.52"
                            },
                            {
                                "color": "#f54545",
                                "name": "最低",
                                "value": "177.24"
                            },
                            {
                                "color": "",
                                "name": "成交量",
                                "value": "257.12万"
                            },
                            {
                                "color": "",
                                "name": "市盈率",
                                "value": "39.73"
                            },
                            {
                                "color": "",
                                "name": "每股收益",
                                "value": "4.51"
                            },
                            {
                                "color": "",
                                "name": "总市值",
                                "value": "619.33亿"
                            },
                            {
                                "color": "",
                                "name": "换手率",
                                "value": "0.72%"
                            }
                        ],
                        "name": "百度",
                        "time": "2017/06/13 16:00:00",
                        "trade_condition": "收盘"
                    },
                    {
                        "change": "",
                        "code": "BIDU",
                        "current_price": "",
                        "info": "",
                        "name": "百度",
                        "time": "",
                        "trade_condition": "收盘"
                    },
                    {
                        "change": "",
                        "code": "BIDU",
                        "current_price": "",
                        "info": "",
                        "name": "百度",
                        "time": "",
                        "trade_condition": "收盘"
                    }
                ],
                "showlamp": "1",
                "speech": "百度现在179.19美元，跌幅0.48%，已收盘",
                "template_pattern_demand_index": 0,
                "term_demand": -1,
                "tplt": "stockdynamic_moretab",
                "url": "http://xueqiu.com/S/BIDU"
            },
            "type": "stock"
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "为你找到以下图片",
                        "image": "http://xiaodu.baidu.com/img/pic?pic_id=54261558",
                        "url": "http://justfortest.nj.m.baidu.com/uiapi/4fb32b/aladdin.html?from=1009717l&cip=61.135.169.80&count=1&os=1&usdata=1&target=_blank&word=%E7%99%BE%E5%BA%A6%E8%82%A1%E4%BB%B7&give=stockdynamic_moretab&pu=sz%401320_480%2Ccua%40_avLC_aE-i4qywoUfpw1zyaBXi4Xa2iLA%2Ccut%40_u2g8juSvh_Dh2IJgNvHtyN6moi5pQqAC%2Cosname%40baiduboxapp%2Cctv%402%2Ccfrom%40757b%2Ccen%40cuid_cua_cut%2Ccsrc%40app_dumi_voice"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "百度现在179.19美元，跌幅0.48%，已收盘"
        }
    },
    "id": "1497432815_56230jij0",
    "logid": "14974328157567",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497432815,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "百度股价",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 304
}

//百度股价（纯文本输出）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "stock",
            "slots": {}
        },
        "resource": {
            "data": {
                "ExtendedLocation": "",
                "OriginQuery": "百度股价",
                "TitleSuffix": "test",
                "appinfo": "",
                "dispNum": 3,
                "fetchkey": "百度股价",
                "listNum": 3,
                "normdisp": 1,
                "open_query_uri": "code",
                "open_resource_name": "stock_meigu",
                "otherinfo": "{}",
                "resNum": 3,
                "resourceid": "8191",
                "result": [
                    {
                        "change": "-0.87(-0.48%)",
                        "code": "BIDU",
                        "current_price": "179.19",
                        "info": [
                            {
                                "color": "#0f990f",
                                "name": "今开",
                                "value": "181.52"
                            },
                            {
                                "color": "",
                                "name": "昨收",
                                "value": "180.06"
                            },
                            {
                                "color": "#0f990f",
                                "name": "最高",
                                "value": "181.52"
                            },
                            {
                                "color": "#f54545",
                                "name": "最低",
                                "value": "177.24"
                            },
                            {
                                "color": "",
                                "name": "成交量",
                                "value": "257.12万"
                            },
                            {
                                "color": "",
                                "name": "市盈率",
                                "value": "39.73"
                            },
                            {
                                "color": "",
                                "name": "每股收益",
                                "value": "4.51"
                            },
                            {
                                "color": "",
                                "name": "总市值",
                                "value": "619.33亿"
                            },
                            {
                                "color": "",
                                "name": "换手率",
                                "value": "0.72%"
                            }
                        ],
                        "name": "百度",
                        "time": "2017/06/13 16:00:00",
                        "trade_condition": "收盘"
                    },
                    {
                        "change": "",
                        "code": "BIDU",
                        "current_price": "",
                        "info": "",
                        "name": "百度",
                        "time": "",
                        "trade_condition": "收盘"
                    },
                    {
                        "change": "",
                        "code": "BIDU",
                        "current_price": "",
                        "info": "",
                        "name": "百度",
                        "time": "",
                        "trade_condition": "收盘"
                    }
                ],
                "showlamp": "1",
                "speech": "百度现在179.19美元，跌幅0.48%，已收盘",
                "template_pattern_demand_index": 0,
                "term_demand": -1,
                "tplt": "stockdynamic_moretab",
                "url": "http://xueqiu.com/S/BIDU"
            },
            "type": "stock"
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "百度现在179.19美元，跌幅0.48%，已收盘"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "百度现在179.19美元，跌幅0.48%，已收盘"
        }
    },
    "id": "1497432995_2025f7lyn",
    "logid": "14974329946093",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497432995,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "百度股价",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 244
}
```
## 汇率
```javascript
//人民币和美元汇率
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "exchange_rate",
            "slots": {}
        },
        "resource": {
            "data": {
                "exchange_amount": "1人民币元=0.1472美元",
                "exchange_currency": "美元",
                "exchange_ratio": "1人民币元=0.1472美元",
                "original_amount": null,
                "original_currency": "人民币元",
                "speech": "1元人民币等于0.1472美元"
            },
            "type": "exchange"
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "为你找到以下图片",
                        "image": "http://xiaodu.baidu.com/img/pic?pic_id=54262028",
                        "url": "https://sp3.baidu.com/84oIbT3kAMgDnd_/&pu=sz%401320_480%2Ccua%40_avLC_aE-i4qywoUfpw1zyaBXi4Xa2iLA%2Ccut%40_u2g8juSvh_Dh2IJgNvHtyN6moi5pQqAC%2Cosname%40baiduboxapp%2Cctv%402%2Ccfrom%40757b%2Ccen%40cuid_cua_cut%2Ccsrc%40app_dumi_voice/s?word=%E4%BA%BA%E6%B0%91%E5%B8%81%E5%92%8C%E7%BE%8E%E5%85%83%E6%B1%87%E7%8E%87&give=bigcard"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "1人民币等于0.1472美元"
        }
    },
    "id": "1497433040_655f9vaye",
    "logid": "14974330402373",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433040,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "人民币和美元汇率",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 521
}

//人民币和美元汇率（纯文本输出）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "exchange_rate",
            "slots": {}
        },
        "resource": {
            "data": {
                "exchange_amount": "1人民币元=0.1472美元",
                "exchange_currency": "美元",
                "exchange_ratio": "1人民币元=0.1472美元",
                "original_amount": null,
                "original_currency": "人民币元",
                "speech": "1元人民币等于0.1472美元"
            },
            "type": "exchange"
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "1人民币等于0.1472美元"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "1人民币等于0.1472美元"
        }
    },
    "id": "1497433087_326bip8ca",
    "logid": "14974330872416",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433087,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "人民币和美元汇率",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 217
}
```
## 翻译
```javascript
//我爱你翻译
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "translator",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "为你找到以下图片",
                        "image": "http://xiaodu.baidu.com/img/pic?pic_id=54262186",
                        "url": "http://justfortest.nj.m.baidu.com/uiapi/5f91a3/aladdin.html?from=1009717l&cip=61.135.169.80&count=1&os=1&usdata=1&target=_blank&word=%E6%88%91%E7%88%B1%E4%BD%A0%E7%BF%BB%E8%AF%91&loc=%7B%22crd%22%3A%2212957817.675767_4829432.896599_200%22%2C%22city%22%3A%22%5Cu5317%5Cu4eac%5Cu5e02%22%2C%22addr%22%3A%22%5Cu5317%5Cu4eac%5Cu5e02%5Cu897f%5Cu57ce%5Cu533a%5Cu897f%5Cu697c%5Cu5df715%5Cu53f7%22%2C%22city_code%22%3A131%7D&give=dictwisenew&pu=sz%401320_480%2Ccua%40_avLC_aE-i4qywoUfpw1zyaBXi4Xa2iLA%2Ccut%40_u2g8juSvh_Dh2IJgNvHtyN6moi5pQqAC%2Cosname%40baiduboxapp%2Cctv%402%2Ccfrom%40757b%2Ccen%40cuid_cua_cut%2Ccsrc%40app_dumi_voice"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "1 I love you; 2  <法>Je t’aime; 3  <德>Ich liebe Dich; 4  <日>わたしはあなたをあいしています。"
        }
    },
    "id": "1497433114_412ga26o4",
    "logid": "14974331131296",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433114,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "我爱你翻译",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 833
}

//我爱你翻译（纯文本输出）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "translator",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "1 I love you; 2  <法>Je t’aime; 3  <德>Ich liebe Dich; 4  <日>わたしはあなたをあいしています。"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "1 I love you; 2  <法>Je t’aime; 3  <德>Ich liebe Dich; 4  <日>わたしはあなたをあいしています。"
        }
    },
    "id": "1497433157_937d0s6mt",
    "logid": "14974331577477",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433157,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "我爱你翻译",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 246
}
```
## 计算
```javascript
//10的平方减去5的立方
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "calculator",
            "slots": {}
        },
        "resource": {
            "data": {
                "input": "(10^2)-(5^3)",
                "output": "-25",
                "speech": "10的平方减5的立方等于负25"
            },
            "type": "calculate"
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "为你找到以下图片",
                        "image": "http://xiaodu.baidu.com/img/pic?pic_id=53990217",
                        "url": "http://justfortest.nj.m.baidu.com/uiapi/ac60c7/aladdin.html?from=1009717l&cip=61.135.169.80&count=1&os=1&usdata=1&target=_blank&word=10%E7%9A%84%E5%B9%B3%E6%96%B9%E5%87%8F%E5%8E%BB5%E7%9A%84%E7%AB%8B%E6%96%B9&give=calculator&pu=sz%401320_480%2Ccua%40_avLC_aE-i4qywoUfpw1zyaBXi4Xa2iLA%2Ccut%40_u2g8juSvh_Dh2IJgNvHtyN6moi5pQqAC%2Cosname%40baiduboxapp%2Cctv%402%2Ccfrom%40757b%2Ccen%40cuid_cua_cut%2Ccsrc%40app_dumi_voice"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "10的平方减5的立方等于负25"
        }
    },
    "id": "1497433188_324dkg9kg",
    "logid": "14974331874825",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433188,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "10的平方减去5的立方",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 511
}

//10的平方减去5的立方（纯文本输出）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "calculator",
            "slots": {}
        },
        "resource": {
            "data": {
                "input": "(10^2)-(5^3)",
                "output": "-25",
                "speech": "10的平方减5的立方等于负25"
            },
            "type": "calculate"
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "10的平方减5的立方等于负25"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "10的平方减5的立方等于负25"
        }
    },
    "id": "1497433232_64857gw6e",
    "logid": "14974332323613",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433232,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "10的平方减去5的立方",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 239
}
```
## 时间
```javascript
//后天是星期几
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "time",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "后天是星期五，2017年6月16日"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "后天是星期五，2017年6月16日"
        }
    },
    "id": "1497433387_3367ow2dk",
    "logid": "14974333866325",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433387,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "后天是星期几",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 692
}

//纽约时间（世界时间）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "time",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "为你找到以下图片",
                        "image": "http://xiaodu.baidu.com/img/pic?pic_id=54262904",
                        "url": "http://justfortest.nj.m.baidu.com/uiapi/659f88/aladdin.html?from=1009717l&cip=61.135.169.80&count=1&os=1&usdata=1&target=_blank&word=%E7%BA%BD%E7%BA%A6%E7%8E%B0%E5%9C%A8%E5%87%A0%E7%82%B9&loc=%7B%22crd%22%3A%2212957817.434604_4829432.738026_200%22%2C%22city%22%3A%22%5Cu5317%5Cu4eac%5Cu5e02%22%2C%22addr%22%3A%22%5Cu5317%5Cu4eac%5Cu5e02%5Cu897f%5Cu57ce%5Cu533a%5Cu897f%5Cu697c%5Cu5df715%5Cu53f7%22%2C%22city_code%22%3A131%7D&give=worldtime&pu=sz%401320_480%2Ccua%40_avLC_aE-i4qywoUfpw1zyaBXi4Xa2iLA%2Ccut%40_u2g8juSvh_Dh2IJgNvHtyN6moi5pQqAC%2Cosname%40baiduboxapp%2Cctv%402%2Ccfrom%40757b%2Ccen%40cuid_cua_cut%2Ccsrc%40app_dumi_voice"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "纽约时间现在是6月14日上午5点43分，星期三，比北京慢了12个小时"
        }
    },
    "id": "1497433429_777d2xi2v",
    "logid": "14974334298067",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433429,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "纽约几点了",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 551
}
```
## 明星问答
```javascript
//刘德华的老婆是谁
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "kg",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "刘德华妻子 朱丽倩",
                        "summary": "朱丽倩（Carol），1966年4月6日出生于马来西亚槟城。选美小姐，平面模特，刘德华妻子。1984年，她和姐妹参加当地的“新潮小姐”选美获得季军，之后赴香港学美容；1985年至1987年间做过平面模特；2008年6月23日与刘德华在拉斯维加斯注册结婚；2012年5月9日，朱丽倩在香港养和医院产下女儿刘向蕙，刘德华也正式升格成为爸爸。",
                        "url": "https://ss0.baidu.com/9rM4dzva2gU2pMbgoY3K/item/%E6%9C%B1%E4%B8%BD%E5%80%A9/10364866",
                        "image": "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3326600681,3785049593&fm=58"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "刘德华的妻子是朱丽倩"
        }
    },
    "id": "1497433650_695adwurw",
    "logid": "14974336508340",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433650,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "刘德华的老婆是谁",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 484
}

//刘德华的老婆是谁（纯文本）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "kg",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "刘德华的妻子是朱丽倩"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "刘德华的妻子是朱丽倩"
        }
    },
    "id": "1497433708_526fpmqgz",
    "logid": "14974337085267",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433708,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "刘德华的老婆是谁",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 250
}
```
## 汉语问答
```javascript
//清明时节雨纷纷的下一句
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "kg",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "清明时节雨纷纷的下一句路上行人欲断魂\n\n全文:\n清明时节雨纷纷，路上行人欲断魂。\n借问酒家何处有？牧童遥指杏花村。",
                "url": "http://hanyu.baidu.com/shici/detail?pid=62bd01655ee04c60b01c1ee41bce805b&query=%E6%B8%85%E6%98%8E%E6%97%B6%E8%8A%82%E9%9B%A8%E7%BA%B7%E7%BA%B7%E7%9A%84%E4%B8%8B%E4%B8%80%E5%8F%A5&srcid=28239&from=kg2"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "清明时节雨纷纷的下一句是路上行人欲断魂"
        }
    },
    "id": "1497433727_3789c0vpf",
    "logid": "14974337265925",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433727,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "清明时节雨纷纷的下一句",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 823
}

//清明时节雨纷纷的下一句（纯文本输出）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "kg",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "清明时节雨纷纷的下一句是路上行人欲断魂"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "清明时节雨纷纷的下一句是路上行人欲断魂"
        }
    },
    "id": "1497433766_452f3pz32",
    "logid": "14974337659799",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433766,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "清明时节雨纷纷的下一句",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 561
}
```
## 常识问答
```javascript
//世界上最高的山
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "kg",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "为你找到以下图片",
                        "image": "http://xiaodu.baidu.com/img/pic?pic_id=54263824",
                        "url": "https://sp3.baidu.com/84oIbT3kAMgDnd_/&pu=sz%401320_480%2Ccua%40_avLC_aE-i4qywoUfpw1zyaBXi4Xa2iLA%2Ccut%40_u2g8juSvh_Dh2IJgNvHtyN6moi5pQqAC%2Cosname%40baiduboxapp%2Cctv%402%2Ccfrom%40757b%2Ccen%40cuid_cua_cut%2Ccsrc%40app_dumi_voice/s?word=%E4%B8%96%E7%95%8C%E4%B8%8A%E6%9C%80%E9%AB%98%E7%9A%84%E5%B1%B1&give=ks_general"
                    }
                ]
            }
        ],
        "speech": {
            "type": "Text",
            "content": "世界上最高的山峰是珠穆朗玛峰，高度为8844.46米。"
        }
    },
    "id": "1497433797_414azaxl1",
    "logid": "14974337965407",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433797,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "世界上最高的山",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 911
}

//世界上最高的山（纯文本输出）
{
    "result": {
        "nlu": {
            "domain": "universal_search",
            "intent": "kg",
            "slots": {}
        },
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "txt",
                "content": "世界上最高的山峰是珠穆朗玛峰，高度为8844.46米。"
            }
        ],
        "speech": {
            "type": "Text",
            "content": "世界上最高的山峰是珠穆朗玛峰，高度为8844.46米。"
        }
    },
    "id": "1497433840_8793ftgm8",
    "logid": "14974338407166",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1497433840,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138123",
    "se_query": "世界上最高的山",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0,
    "timeuse": 274
}
```
## 通用搜索
```javascript
//肚子饿了怎么办
{
    "result": {
        "bot_id": "aries_general",
        "bot_meta": {
            "version": "1.0.0",
            "type": "其他",
            "description": "desc"
        },
        "views": [
            {
                "type": "list",
                "list": [
                    {
                        "title": "肚子饿了怎么办_百度知道",
                        "summary": "走出门 一直走 遇到红路灯不要向左转 一直走 有车直接撞",
                        "url": "http://zhidao.baidu.com/question/159263414.html"
                    },
                    {
                        "title": "肚子饿了怎么办_有问必答_快速问医生",
                        "summary": "不饱,刚吃完饭一会就感到肚子饿,无论吃得多饱,一会就饿了,我是不是有病啊,这该怎么办啊...",
                        "url": "http://m.120ask.com/askg/bd_detail/34368453"
                    },
                    {
                        "title": "睡前肚子饿了怎么办?10种睡前可以吃的食物~..._百度文库",
                        "summary": "10种睡前可以吃的食物~(46条震撼你的生活小常识)。睡前肚子饿了怎么办?10种睡前可以吃的食物 ...",
                        "url": "http://wenku.baidu.com/view/b717aa8071fe910ef12df884.html"
                    },
                    {
                        "title": "肚子饿了怎么办_百度经验",
                        "summary": "肚子饿了怎么办,很多朋友在废寝忘食工作或者过度放松的情况下往往会忘了吃饭,于是造成的结果就是肚子很饿...",
                        "url": "http://jingyan.baidu.com/article/e3c78d64bbf5c23c4c85f5a5.html",
                        "image": "http://cdn01.baidu-img.cn/timg?wisealaddin&size=u200_200&quality=80&sec=1491457643&di=0061a9dba8a00f7cbcf666b803eea34e&src=http%3A%2F%2Ft11.baidu.com%2Fit%2Fu%3D4234974745%2C3911491710%26fm%3D58%26s%3DCEA41C62D3CB40EB4A5CB9DE000080B1%26bpow%3D800%26bpoh%3D600"
                    },
                    {
                        "title": "半夜里饿了怎么办?没吃的东西的前提下。_百度拇指医生",
                        "summary": "半夜里饿了怎么办?没吃的东西的前提下。最快的减肥:第一种:喝白开水!早上起床后就喝杯白开水既解饿也...",
                        "url": "http://muzhi.baidu.com/question/495721149646178164.html"
                    },
                    {
                        "title": "减肥过程中饿了怎么办_百度经验",
                        "summary": "减肥过程中饿了怎么办,成功减肥者的8大心得。成功瘦身者传授瘦身心得,再配合正确的减肥方法的同时,还...",
                        "url": "http://jingyan.baidu.com/article/e3c78d640308aa3c4c85f5df.html"
                    },
                    {
                        "title": "睡前饿了怎么办,十种可以吃的食物_百度文库",
                        "summary": ",中午吃的像平民,晚上吃的像乞丐 睡前饿了怎么办?10 种睡前可以吃的食物~再也不怕晚上肚子饿啦~ ...",
                        "url": "http://wenku.baidu.com/view/07e1692458fb770bf78a55b5.html"
                    },
                    {
                        "title": "如果大家晚上突然感觉饿了会怎么办?吃还是不吃?..._果壳",
                        "summary": "选择不吃的人,你是靠什么来抵抗自己巨大的饿感?另外,想吃的话吃什么能比较不容易发胖?大家说出来交流下呗~",
                        "url": "http://m.guokr.com/post/455727/"
                    },
                    {
                        "title": "我肚子饿了怎么办啊真的好饿啊,没的吃的 - 爱问知识人",
                        "summary": "好评回答 2163374807 | 11-07-05 0 0 举报 想办法弄点食物吃或者用绳子捆住肚子。...",
                        "url": "http://m.iask.sina.com.cn/b/18838974.html"
                    }
                ]
            }
        ],
        "nlu": {
            "domain": "universal_search",
            "intent": "normal",
            "slots": {}
        },
        "speech": {
            "type": "Text",
            "content": "为你找到以下内容"
        }
    },
    "id": "1491457644_209ce75u4",
    "logid": "14914576433556",
    "user_id": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "time": 1491457644,
    "cuid": "DAFABB5EBE29BC13C7CBAADBEF6BD166|234418820138768",
    "se_query": "肚子饿了怎么办",
    "msg": "ok",
    "client_msg_id": "c9bfe944-992b-45b1-8afe-dc2cdaee622a",
    "status": 0
}
```

## nlu输出
```javascript
domain： universal_search
intent:
calculator => 计算器
stock => 股票
exchange_rate => 汇率
image => 图片
traffic_limit => 限行
kg => 知识图谱（问答/人物/诗词/汉语...）
short_video => 短视频
app => 应用下载
weather => 天气
tieba => 贴吧
lbs_consume => lbs消费
novel => 小说
teleplay => 电视剧
music => 音乐
car_series => 车系
lottery => 彩票
cookbook => 菜谱
3c => 3C产品
animation => 动漫
douban => 豆瓣
lbs => 导航
train_ticket => 火车票
shopping_search => 购物搜索
nba => NBA
moive_ticket => 电影票
weibo => 微博
constellation => 星座
recruit => 招聘
travel => 旅游
hotel => 酒店
plane_ticket => 飞机票
drugs => 药品
baike => 百科
time => 时间
general_aladdin => 其他泛阿拉丁
```