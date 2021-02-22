fx_version 'adamant'
game 'gta5'

author 'Slerbamonsteri'
description 'A text-based roulette script for esx-based FiveM Servers'
version '1.0.1'

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'c/cl_*.lua',
	'config.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	's/sv_*.lua',
	'config.lua'
}

dependencies {
	'es_extended'
}



--Originally made from: https://github.com/KarpoVelho/esx_coinflip
--by Slerbamonsteri | PKRP 
--kjeh räh :-D
--Elasticweed | Added localization