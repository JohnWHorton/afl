<?php
error_reporting(E_ALL ^ E_NOTICE);
	
//require "esconnection.php";
$url = "https://targetcenter.rogueeye.systems:8201/targetcollections/_search?pretty";

require "runcurl.php";


	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$operation = $request->operation;
	$sources = $request->sources;
	$method = "POST";

//tmp
//$sources = array("m1_Social","3248:Facebook");

	$filter="";
	for($i=0; $i<count($sources); $i++) {
		$targetarr = explode(":", $sources[$i]);
		if($i==0) {
			if(count($targetarr)>1) {
				$filter = $filter.'{"bool": {"must": [{"match": {"targetID": "'.$targetarr[0].'"}}, {"match": {"social_network": "'.$targetarr[1].'"}}]}}';				
			} else {
				$filter = $filter.'{"match": {"targetID": "'.$targetarr[0].'" }}';
			}
		} else {
			if(count($targetarr)>1) {
				$filter = $filter.',{"bool": {"must": [{"match": {"targetID": "'.$targetarr[0].'"}}, {"match": {"social_network": "'.$targetarr[1].'"}}]}}';
					
			} else {
				$filter = $filter.',{"match": {"targetID": "'.$targetarr[0].'" }}';	
			}				
		}
	}

$query='
{
  "query": {
    "bool": {
      "must": [],
      "filter": [
		{"bool":{
			"should":['.$filter.'],
			"minimum_should_match":1}}],	
      "should": [],
      "must_not": [{"term": {"targetID": ""}}]
    }},
   "size":10000,
   "sort" : [ {"created_at": {"order": "asc"}}],
   "aggs":{
      "social_networks_aggs":{
         "terms":{
            "field":"social_network"
         }
      },
      "lang_aggs":{
         "terms":{
            "field":"text_lang",
            "size":5
         }
      },
      "sentiment_aggs":{
         "terms":{
            "field":"sentiment",
            "size":5,
                         "exclude": "\"\""
         }
      },
      "device_aggs":{
         "terms":{
            "field":"device_type",
            "size":5,
                        "exclude": "\"\"|null"
         }
      },
      "UserTop10":{
         "terms":{
            "field":"user_screen_name",
            "order":{
               "_count":"desc"
            },
            "size":10,
            "exclude":"\"\""
         },
         "aggs":{
            "USERid":{
               "terms":{
                  "field":"user_id",
                  "order":{
                     "_count":"desc"
                  },
                  "size":10
               },
          "aggs": {
            "4": {
              "terms": {
                "field": "social_network",
                "order": {
                  "_count": "desc"
                },
                "size": 5
              }
            }
          }
            }
         }
      },
		"NetworksOverTime": {
			"date_histogram": {
				"field": "created_at",
				"interval": "1M",
				"min_doc_count": 1
			},
			"aggs": {
				"Networks": {
				  "terms": {
					"field": "social_network",
					"size": 10,
					"order": {
					  "_count": "desc"
					}
				  }
				}
			}
		}   
	}
}';

//echo $query."\n";

	$result = runCurl($url, $userpwd, $method, $query);	
	
//echo $result;

    header('Content-Type: application/json');
	$newarr = [];
	$decall = json_decode($result, true);
	$dec = $decall["hits"]["hits"];
	$src = [];
	
	for($i=0; $i<count($dec); $i++) {
		$src[] = $dec[$i]["_source"];
	}

	$aggs = $decall["aggregations"];
	$newarr['aggs'] = $aggs;
	$newarr['source'] = $src;
	$newjson = json_encode($newarr, true);
	echo $newjson;


?>