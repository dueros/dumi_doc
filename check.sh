basepath=$(cd `dirname $0`; pwd)
RESOURCE_SCHEMA="-r $basepath/resource/news.schema.json -r $basepath/resource/music.schema.json -r $basepath/resource/weather.schema.json"
ajv -s $basepath/dumi_schema.json $RESOURCE_SCHEMA -d $1
