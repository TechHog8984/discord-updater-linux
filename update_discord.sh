#!/bin/bash

if [ -f discord.tar.gz ]; then
	rm discord.tar.gz
fi
if [ -d /usr/share/discord ]; then
	sudo rm -rf /usr/share/discord
fi
if [ -f ~/.local/share/applications/discord.desktop ]; then
	sudo rm ~/.local/share/applications/discord.desktop
fi

baseurl=$(curl "https://discord.com/api/download?platform=linux&format=tar.gz" | grep -Po "\"https:\/\/stable\.dl2\.discordapp\.net\/apps\/linux\/([\d\.]+)")
version=${baseurl:46}

newurl="${baseurl:1}/discord-${version}.tar.gz"

curl $newurl -o discord.tar.gz

tar -xf discord.tar.gz
rm discord.tar.gz
cp Discord/discord.desktop ~/.local/share/applications/discord.desktop
sudo mv Discord /usr/share/discord
