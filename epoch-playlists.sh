#!/bin/sh

playlists="
spotify:user:spotify:playlist:7IFiEH9B3SheCcY4IkUXHd
spotify:user:spotify:playlist:2j8kgurwSCA1EBO3ZXxONi
spotify:user:spotify:playlist:2MyIZQgYryXiqViLOkeDCU
spotify:user:spotify:playlist:3mg7N9OFaRZj2b9TiuRviC
spotify:user:spotify:playlist:2wmwN9FiubVkXlqeg3kfIw
spotify:user:spotify:playlist:0VkoGavoVHIBpzIyXP3JdS"

echo $playlists
sh playlists-updated.sh $playlists
