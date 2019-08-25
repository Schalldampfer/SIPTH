if (!isServer) exitWith {};
diag_log "[NaPTH]: Loading Napf island Pirate's Treasure Hunt";

/////////////////////////
/////////Configs/////////
/////////////////////////

//
// Treasure crate settings
//
ST_radio = true;//use radio message or not
ST_waitTime = 1800 + 100 * floor(random 36);//Time from mission start to the event start
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
ST_numWeapons = ceil(random 2);//Number of weapons to add
ST_numItems = 2 + floor(random 6);//Number of Items to add
ST_addGem = true;//Add gems or not
ST_Weapons = ["MR43_DZ","Winchester1866_DZ","AA12_PMC",
	"MP5_DZ","G36C_DZ","M16A4_DZ","M4A1_DZ","SCAR_L_CQC","L85A2_DZ","BAF_L86A2_ACOG","M14_DZ","FNFAL_DZ","DMR_DZ",
	"SA58_RIS_FL_DZ","AKM_DZ","AK74_DZ","AKS74U_DZ","AK_107_CP","SVD_NSPU_EP1","CZ550_DZ",
	"MAAWS","RPG7V","Igla","Stinger",
	"ChainSawB","ChainSawG","ChainSawP","ChainSawR",
	"AKS_GOLD","revolver_gold_EP1","revolver_gold_EP1",
	"ItemToolbox","ItemKnife","ItemFishingPole","CDF_dogtags"];//Weapons and tools
ST_Items = ["ItemDocument","ItemBriefcase_Base","ItemBriefcase100oz","ItemBriefcaseS100oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemKiloHemp","ItemKiloHemp",
	"bulk_ItemSodaCokeFull","bulk_ItemSodaCokeFull","bulk_ItemSodaPepsiFull","bulk_ItemSodaPepsiFull","bulk_FoodbaconCookedFull","bulk_FoodbaconCookedFull",
	"FishCookedTrout","FishCookedTrout","FishCookedTuna","FishCookedTuna","FishCookedSeaBass",
	"Attachment_Ghillie","Attachment_CCO","Attachment_Holo","Attachment_Kobra","Attachment_ACOG","Attachment_PSO1","Attachment_SCOPED","Attachment_GP25","Attachment_M203","Attachment_Sup545","Attachment_Sup556","Attachment_Sup9","Attachment_SupBizon","Attachment_SupMakarov",
	"Skin_Sniper1_DZ","Skin_Camo1_DZ","Skin_Soldier1_DZ","Skin_Survivor2_DZ","Skin_Rocket_DZ","Skin_RU_Policeman_DZ","Skin_Pilot_EP1_DZ","Skin_Haris_Press_EP1_DZ","Skin_Ins_Soldier_GL_DZ","Skin_GUE_Commander_DZ","Skin_Functionary1_EP1_DZ","Skin_Priest_DZ","Skin_Rocker1_DZ","Skin_Rocker2_DZ","Skin_Rocker3_DZ","Skin_Rocker4_DZ","Skin_Bandit1_DZ","Skin_Bandit2_DZ","Skin_GUE_Soldier_MG_DZ","Skin_GUE_Soldier_Sniper_DZ","Skin_GUE_Soldier_Crew_DZ","Skin_GUE_Soldier_CO_DZ","Skin_GUE_Soldier_2_DZ","Skin_BanditW1_DZ","Skin_BanditW2_DZ","Skin_SurvivorW3_DZ","Skin_SurvivorW2_DZ","Skin_SurvivorWpink_DZ","Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_TK_INS_Warlord_EP1_DZ",
	"Skin_TK_INS_Soldier_EP1_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Drake_Light_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ","Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_Graves_Light_DZ","Skin_Soldier_Sniper_PMC_DZ","Skin_Soldier_TL_PMC_DZ","Skin_TK_Special_Forces_MG_EP1_DZ","Skin_TK_Soldier_Sniper_EP1_DZ","Skin_TK_Commander_EP1_DZ","Skin_RU_Soldier_Crew_DZ","Skin_INS_Lopotev_DZ","Skin_INS_Soldier_AR_DZ","Skin_INS_Soldier_CO_DZ","Skin_INS_Bardak_DZ","Skin_INS_Worker2_DZ","Skin_USMC_Soldier_Officer_DZ","Skin_USMC_Soldier_MG_DZ","Skin_USMC_Soldier_Pilot_DZ","Skin_FR_TL_DZ","Skin_FR_R_DZ","Skin_FR_Marksman_DZ","Skin_FR_Assault_R_DZ","Skin_RU_Soldier_DZ",
	"Skin_RU_Soldier_Officer_DZ","Skin_RUS_Soldier1_DZ","Skin_RUS_Commander_DZ","Skin_MVD_Soldier_DZ","Skin_Ins_Soldier_2_DZ","Skin_Ins_Commander_DZ","Skin_Ins_Soldier_Crew_DZ","Skin_CDF_Soldier_DZ","Skin_Assistant_DZ","Skin_Doctor_DZ","Skin_Worker1_DZ","Skin_Worker3_DZ","Skin_Worker4_DZ","Skin_TK_CIV_Takistani01_EP1_DZ","Skin_TK_CIV_Takistani03_EP1_DZ","Skin_TK_CIV_Takistani04_EP1_DZ","Skin_TK_CIV_Takistani06_EP1_DZ","Skin_TK_INS_Soldier_AR_EP1_DZ","Skin_TK_GUE_Soldier_EP1_DZ","Skin_CZ_Soldier_SL_DES_EP1_DZ","Skin_US_Soldier_EP1_DZ","Skin_UN_CDF_Soldier_EP1_DZ","Skin_UN_CDF_Soldier_Guard_EP1_DZ","Skin_GER_Soldier_TL_EP1_DZ","Skin_BAF_Soldier_Officer_MTP_DZ","Skin_BAF_Soldier_N_MTP_DZ","Skin_FR_Sapper_DZ",
	"1Rnd_Bolt_Explosive"];//Items
ST_Gems = ["ItemRuby","ItemCitrine","ItemEmerald","ItemAmethyst","ItemSapphire","ItemObsidian","ItemTopaz"];//Gems, 1 added

//
// Settings for map objects 
//
ST_numVeins = 10;//The number of veins to spawn in the forests in the are.
ST_numGraves = ceil(random 10);//The number of graves on the area.
ST_Veins = ["Gold_Vein_DZE","Silver_Vein_DZE","Iron_Vein_DZE","Supply_Crate_DZE","Mass_grave_DZ"];//Array of Veins
ST_Graves = ["GraveCross1","GraveCross1","GraveCross1","GraveCross2","GraveCross2","GraveCrossHelmet","Land_Church_tomb_1","Land_Church_tomb_2","Land_Church_tomb_3"];//Array of Grave crosses

//
// Spawn position
//
_point = [
	[16911.188, 7576.2041],
	[7897.9233, 1030.2993],
	[17896.705, 5600.9019],
	[9059.1191, 2091.8223],
	[16760.059, 4485.1768],
	[18181.430, 9595.5459]
] call BIS_fnc_selectRandom;

/////////////////////////
////Load main objects////
/////////////////////////

//Crates
_point execVM "\z\addons\dayz_server\addons\NaPTH\NapfTreasure.sqf";

//Veins
_point call compile preProcessFileLineNumbers "\z\addons\dayz_server\addons\NaPTH\Veins.sqf";

diag_log "[NaPTH]: Loaded";
