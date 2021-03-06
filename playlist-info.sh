#!/bin/sh

oauth=`cat oauth.txt`

playlist=$1

playlist_user=`cut -d: -f3 <<<"${playlist}"`
playlist_id=`cut -d: -f5 <<<"${playlist}"`

echo "$playlist_user $playlist_id"

market=$2

curlresult=`curl -X GET "https://api.spotify.com/v1/users/$playlist_user/playlists/$playlist_id?market=$market" -H "Accept: application/json" -H "Authorization: Bearer $oauth"`

echo "$curlresult" | jq '{"uri" : .uri, "name" : .name, "updated" : .tracks.items[0].added_at, "description" : .description, "image" : .images[0].url}'

