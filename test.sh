ajv -s dumi_schema.json -r news.schema.json -r weather.schema.json -r music.schema.json -d testdata/weather.json
ajv -s dumi_schema.json -r news.schema.json -r weather.schema.json -r music.schema.json -d testdata/news.json
ajv -s dumi_schema.json -r news.schema.json -r weather.schema.json -r music.schema.json -d testdata/music.json
