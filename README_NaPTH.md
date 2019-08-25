Napf Island Pirate's Treasure Hunt by Schalldampfer
==============
2019/7/17

### Description
- This script spawns a mission of treasure hunting on somewhere of Napf island.
- The mission is to find crates which spawn all over the island.
- This script also spawns some map objects (Gold ore veins, supply crates and graves).
- Some settings are configurable in dayz_server\addons\NaPTH\init.sqf
- Basically same thing as SIPTH
### Install Instructions
0.	I assume you have unpacked dayz_server.pbo
1.	In your dayz_server directory, create [addons] directory.
2.	Copy (or move) NaPTH directory in dayz_server\addons\
3.	Open dayz_server\init\server_functions.sqf and add:
	~~~~
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\addons\NaPTH\init.sqf";
	~~~~
	at the bototm of the sqf file.
4.	Open dayz_server\addons\NaPTH\init.sqf and change setting variables as you like.
5.	If you want radio messages but haven't installed the remote message script, then install it.
	Download [Wicked AI](https://github.com/f3cuk/WICKED-AI/archive/master.zip) and see its README.md to know how to install it.
	It's in the section of Optional Radio messages


