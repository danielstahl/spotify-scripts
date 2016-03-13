#!/bin/sh

oauth=`cat oauth.txt`

track=$1
track_id=`cut -d: -f3 <<<"${track}"`

market=$2
curlresult=`curl -X GET "https://api.spotify.com/v1/tracks/$track_id?market=$market" -H "Accept: application/json" -H "Authorization: Bearer $oauth"`
echo "$curlresult" | jq '{"uri" : .uri, "name" : .name, "playable" : .is_playable}'
