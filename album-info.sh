#!/bin/sh

oauth=`cat oauth.txt`
album=$1
album_id=`cut -d: -f3 <<<"${album}"`
market=$2
curlresult=`curl -X GET "https://api.spotify.com/v1/albums/$album_id?market=$market" -H "Accept: application/json" -H "Authorization: Bearer $oauth"`
echo "$curlresult" | jq '{"uri" : .uri, "name" : .name, "playable" : .tracks.items | unique_by(.is_playable)[].is_playable}'
