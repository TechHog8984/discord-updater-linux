#!/bin/bash

if [ -f discord.deb ]; then
	rm discord.deb
fi

baseurl=$(curl "https://discord.com/api/download?platform=linux&format=deb" | grep -Po "\"https:\/\/stable\.dl2\.discordapp\.net\/apps\/linux\/(\d+\.\d+\.\d+)")
version=${baseurl:46}

newurl="${baseurl:1}/discord-${version}.deb"

curl $newurl -o discord.deb

sudo apt install ./discord.deb
rm discord.deb
