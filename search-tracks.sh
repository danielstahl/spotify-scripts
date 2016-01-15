#!/bin/sh

#oauth='BQBSNPgTwGw_RcQO7h59Sp8SEuuOF4IpHzAa7cv1Y7EHgn25cp3kV7JC9A2bWBheGuCIUFBu10h3sDbxzdgJu7h1DQcDRe3ZIhd_2hdKTm8SSWu3cfib4quCiX6JLHIpTh8B-_iUCWy--OGjBpqo57xUjfR0K3yGckwPALfzI-FLNvkDr9m1F8i1H2W-i-8IZJtLeoQUwd8HiUxmdqBlbhG0OFZ5mLzzeq0cMFJXgwLNrZNu1kofZ2-kJYHbSwKU55xprgg_dNTXPe5C14SirkXoDKv8_aOGVVAU_kuPdaYi4PC4'
oauth=`cat oauth.txt`
market=$1

search=`echo -ne $2 | uni2ascii -s -aJ`

curlresult=`curl -X GET "https://api.spotify.com/v1/search?type=track&q=$search&market=$market" -H "Accept: application/json" -H "Authorization: Bearer $oauth"`

echo $curlresult | jq '.tracks.items[] | {"uri" : .uri, "name" : .name, "album" : .album.name, "artist" : .artists[0].name}'
