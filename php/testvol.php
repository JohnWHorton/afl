<?php
error_reporting(E_ALL ^ E_NOTICE);
	
require "esconnection.php";
require "runcurl.php";
require "filters.php";

$query='
{
  "query": {
    "bool": {
      "must": [{"exists": {"field": "coordinates"}}],
      "filter": [{
"geo_polygon": {"coordinates": {"points": [{"lat": 37.80382173550305,"lon": -122.40290188414926},{"lat": 37.80371328830903,"lon": -122.39343128917628},{"lat": 37.79720616526163,"lon": -122.39384305417519},{"lat": 37.797531535028654,"lon": -122.4027646291496},{"lat": 37.80382173550305,"lon": -122.40290188414926}]},"ignore_unmapped": true}}],
      "should": [],
      "must_not": [{"term": {"description": ""}}]
    }},
   "sort" : [ {"created_at": {"order": "asc"}}],
   "size" : 10000,
   "_source": ["created_at","coordinates","social_network"]
}';

/*$query='{
  "query": {
    "bool": {
      "must": [],
      "filter": [
        {
          "bool": {
            "should": [
              {
                "exists": {
                  "field": "description"
                }
              }
            ],
            "minimum_should_match": 1
          }
        },
        {
"geo_polygon": {"coordinates": {"points": [{"lat": 37.80382173550305,"lon": -122.40290188414926},{"lat": 37.80371328830903,"lon": -122.39343128917628},{"lat": 37.79720616526163,"lon": -122.39384305417519},{"lat": 37.797531535028654,"lon": -122.4027646291496},{"lat": 37.80382173550305,"lon": -122.40290188414926}]},"ignore_unmapped": true}},
        {
          "range": {
            "created_at": {
              "gte": "2020-01-01T12:39:42.046Z",
              "lte": "2021-01-04T13:39:42.046Z",
              "format": "strict_date_optional_time"
            }
          }
        }
      ]
    }
  }
}';*/

	$result = runCurl($url, $userpwd, $method, $query);	
//	$thejson = json_encode($result,JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK); //json_encode($result);

//	echo $thejson;
//header('Content-Type: application/json');
	echo $result;


?>