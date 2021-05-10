fx_version 'cerulean'
game 'gta5' 


author 'Boost#4383'
description 'Discord rich presence with ESX compatibility'
version '1.0.5'

shared_script 'config.lua'
client_script {
	'client/main.lua'
}

server_script{
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}
