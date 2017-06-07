<?php
$time1=microtime(true);
require("vendor/autoload.php");
use JsonSchema\SchemaStorage;
use JsonSchema\Validator;
use JsonSchema\Constraints\Factory;


// Schema must be decoded before it can be used for validation
$jsonSchemaObject = json_decode(file_get_contents("dumi_schema.json"));
$newsSchemaObject = json_decode(file_get_contents("resource/news.schema.json"));
$weatherSchemaObject = json_decode(file_get_contents("resource/weather.schema.json"));
$musicSchemaObject = json_decode(file_get_contents("resource/music.schema.json"));

// The SchemaStorage can resolve references, loading additional schemas from file as needed, etc.
$schemaStorage = new SchemaStorage();

// This does two things:
// 1) Mutates $jsonSchemaObject to normalize the references (to file://mySchema#/definitions/integerData, etc)
// 2) Tells $schemaStorage that references to file://mySchema... should be resolved by looking in $jsonSchemaObject
$schemaStorage->addSchema('https://xiaodu.baidu.com/schema/dumi_schema.json', $jsonSchemaObject);
$schemaStorage->addSchema('https://xiaodu.baidu.com/schema/news.schema.json', $newsSchemaObject);
$schemaStorage->addSchema('https://xiaodu.baidu.com/schema/weather.schema.json', $weatherSchemaObject);
$schemaStorage->addSchema('https://xiaodu.baidu.com/schema/music.schema.json', $musicSchemaObject);

// Provide $schemaStorage to the Validator so that references can be resolved during validation
$jsonValidator = new Validator( new Factory($schemaStorage));

// JSON must be decoded before it can be validated
$jsonToValidateObject = json_decode(file_get_contents("testdata/news.json"));
var_dump($jsonToValidateObject);

// Do validation (use isValid() and getErrors() to check the result)
$jsonValidator->check($jsonToValidateObject, $jsonSchemaObject);

if ($jsonValidator->isValid()) {
    echo "The supplied JSON validates against the schema.\n";
} else {
    echo "JSON does not validate. Violations:\n";
    foreach ($jsonValidator->getErrors() as $error) {
        echo sprintf("[%s] %s\n", $error['property'], $error['message']);
    }
}
var_dump(microtime(true)-$time1);
