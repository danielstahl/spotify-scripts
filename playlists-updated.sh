#!/bin/sh

oauth=`cat oauth.txt`

total=""
for playlist in "$@"
do
  playlist_user=`cut -d: -f3 <<<"${playlist}"`
  playlist_id=`cut -d: -f5 <<<"${playlist}"`

  curlresult=`curl -X GET "https://api.spotify.com/v1/users/$playlist_user/playlists/$playlist_id" -H "Accept: application/json" -H "Authorization: Bearer $oauth"`

  temp=`echo "$curlresult" | jq '.name, .tracks.items[0].added_at'`
  total="$total\n$temp"
done
echo $total
