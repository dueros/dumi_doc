
RESOURCE_SCHEMA="-r resource/news.schema.json -r resource/music.schema.json -r resource/weather.schema.json"
ajv -s dumi_schema.json $RESOURCE_SCHEMA -d testdata/weather.json
ajv -s dumi_schema.json $RESOURCE_SCHEMA -d testdata/news.json
ajv -s dumi_schema.json $RESOURCE_SCHEMA -d testdata/music.json
