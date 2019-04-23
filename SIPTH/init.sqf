if (!isServer) exitWith {};
diag_log "[SIPTH]: Loading Skalisty Island Pirate's Treasure Hunt";

/////////////////////////
/////////Configs/////////
/////////////////////////

//
// Treasure crate settings
//
ST_radio = true;//use radio message or not
ST_waitTime = 1800 + 100 * floor(random 18);//Time from mission start to the event start
ST_crate_Type = "DZ_AmmoBoxUS";//Type of crate. "DZ_AmmoBoxUS" is very small ammobox
ST_deleteTime = 600;//Time after finding a crate to delete it

//number of objects
ST_numCrate = 5;

//sign and marker
ST_marker_island = true;//Add marker which cover island, from mission start to end
ST_marker_title = "Treasure hunting!";//title of the marker over island
ST_clear_marker = true;//Add marker after clearing a crate or not
ST_Light = true;//Add sign when players get close to crate or not
ST_Light_type = "IR_Strobe_Marker";//class name of sign. Use a class in cfgVehicle or cfgAmmo

//reward
ST_numWeapons = floor(random 2);//Number of weapons to add
ST_numItems = floor(random 6);//Number of Items to add
ST_addGem = true;//Add gems or not
ST_Weapons = ["SCAR_H_STD_TWS_SD","M249_TWS_EP1",
	"M110_NVG_EP1","BAF_AS50_scoped_DZ","m107_DZ","KSVK_DZE","Anzio_20_DZ",
	"M136","RPG18","MAAWS","MetisLauncher","Igla","Strela","Stinger",
	"CDF_dogtags"];//Weapons and tools
ST_Items = ["ItemBriefcase100oz","ItemBriefcaseS100oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemKiloHemp",
	"bulk_ItemSodaCokeFull","bulk_ItemSodaPepsiFull","bulk_FoodbaconCookedFull",
	"FishCookedTrout","FishCookedTuna","FishCookedSeaBass",
	"2000Rnd_762x51_M134","400Rnd_30mm_AGS17","29Rnd_30mm_AGS30","48Rnd_40mm_MK19","100Rnd_127x99_M2","150Rnd_127x107_DSHKM",
	"PG9_AT","OG9_HE"];//Items
ST_Gems = ["ItemBriefcase_Base","ItemRuby","ItemCitrine","ItemEmerald","ItemAmethyst","ItemSapphire","ItemObsidian","ItemTopaz"];//Gems, 1 added

//
// Settings for map objects 
//
ST_numVeins = 16;//The number of veins to spawn in the forests on the island.
ST_numBoats = 2 + floor(random 8);//The number of boats to spawn on the shore
ST_numGraves = ceil(random 10);//The number of graves on the island
ST_Veins = ["Gold_Vein_DZE","Silver_Vein_DZE","Iron_Vein_DZE","Supply_Crate_DZE","Mass_grave_DZ"];//Array of Veins
ST_Boats = ["Land_BoatSmall_2b","Land_BoatSmall_2a","Land_BoatSmall_1"];//Array of Boats
ST_Graves = ["GraveCross1","GraveCross1","GraveCross1","GraveCross2","GraveCross2","GraveCrossHelmet","Land_Church_tomb_1","Land_Church_tomb_2","Land_Church_tomb_3"];//Array of Grave crosses

/////////////////////////
////Load main objects////
/////////////////////////

//Crates
[] execVM "\z\addons\dayz_server\addons\SIPTH\SkalistyTreasure.sqf";

//Veins
call compile preProcessFileLineNumbers "\z\addons\dayz_server\addons\SIPTH\Veins.sqf";

diag_log "[SIPTH]: Loaded";
