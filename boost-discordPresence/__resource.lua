resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'Boost#7515'
description 'Discord rich presence with ESX compatibility'
version '1.0.4'

shared_script 'config.lua'
client_script {
	'client.lua'
}

server_script{
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}
