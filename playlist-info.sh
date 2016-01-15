#!/bin/sh

oauth=`cat oauth.txt`

playlist=$1
cut -d: -f4 <<<"${playlist}"

playlist_user=`cut -d: -f3 <<<"${playlist}"`
playlist_id=`cut -d: -f5 <<<"${playlist}"`

echo "$playlist_user $playlist_id"

market=$2

curlresult=`curl -X GET "https://api.spotify.com/v1/users/$playlist_user/playlists/$playlist_id/tracks?market=$market" -H "Accept: application/json" -H "Authorization: Bearer $oauth"`

echo "$curlresult" | jq '.items[].track | {"uri" : .uri, "name" : .name, "playable" : .is_playable}'
