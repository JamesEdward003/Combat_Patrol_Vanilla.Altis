
class DWARDEN_VANILLA
{
	displayName = "DWARDEN_VANILLA";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Recon";
	show = "true";
	uniformClass = "U_B_GEN_Commander_F";
	backpack = "";
	weapons[] = {"SMG_03C_black","hgun_P07_F","Binocular","Throw","Put"};
	magazines[] = {"SmokeShell","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShellYellow"};
	items[] = {"FirstAidKit"};
	linkedItems[] = {"V_TacVest_gen_F","H_Beret_gen_F","G_Aviator","ItemMap","ItemCompass","ItemWatch","ItemRadio","","","","","","","",""};
};

class DWARDEN_SCOUT
{
	displayName = "DWARDEN_SCOUT";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Recon";
	show = "true";
	uniformClass = "U_C_ConstructionCoverall_Blue_F";
	backpack = "B_OutdoorPack_blu";
	weapons[] = {"arifle_MX_GL_F","hgun_Pistol_heavy_01_F","Laserdesignator","Throw","Put"};
	magazines[] = {"11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","HandGrenade","HandGrenade","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell"};
	items[] = {"FirstAidKit","B_UavTerminal","MineDetector","ToolKit"};
	linkedItems[] = {"V_TacVest_gen_F","H_Beret_gen_F","G_Aviator","ItemMap","ItemCompass","ItemWatch","ItemRadio","B_UavTerminal","NVGoggles","muzzle_snds_H","acc_pointer_IR","optic_Nightstalker","","","","",""};
};

class DWARDEN_DRESS
{
	displayName = "DWARDEN_DRESS";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_C_Uniform_Scientist_01_formal_F";
	backpack = "B_OutdoorPack_blu";
	weapons[] = {"SMG_03_TR_black","hgun_Pistol_heavy_01_F","Laserdesignator","Throw","Put"};
	magazines[] = {"11Rnd_45ACP_Mag","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","HandGrenade","HandGrenade","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell"};
	items[] = {"FirstAidKit","B_UavTerminal","MineDetector","ToolKit"};
	linkedItems[] = {"V_TacVest_gen_F","H_MilCap_blue","G_Aviator","ItemMap","ItemCompass","ItemWatch","ItemRadio","B_UavTerminal","NVGoggles","","","","","","","",""};
};

class REPLACE
{
	displayName = "REPLACE";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_C_Uniform_Scientist_01_formal_F";
	backpack = "B_OutdoorPack_blu";
	weapons[] = {"SMG_03_TR_black","hgun_Pistol_heavy_01_F","Laserdesignator","Throw","Put"};
	magazines[] = {"11Rnd_45ACP_Mag","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","HandGrenade","HandGrenade","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell"};
	items[] = {"FirstAidKit","B_UavTerminal","MineDetector","ToolKit"};
	linkedItems[] = {"V_TacVest_gen_F","H_MilCap_blue","G_Aviator","ItemMap","ItemCompass","ItemWatch","ItemRadio","B_UavTerminal","NVGoggles","","","","","","","",""};
};


comment "Exported from Arsenal by RENFRO";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local this) exitWith {};

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add weapons";
this addWeapon "SMG_03_TR_black";
this addPrimaryWeaponItem "50Rnd_570x28_SMG_03";
this addWeapon "hgun_Pistol_heavy_01_F";
this addHandgunItem "muzzle_snds_acp";
this addHandgunItem "acc_flashlight_pistol";
this addHandgunItem "optic_MRD";
this addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
this forceAddUniform "U_C_Uniform_Scientist_01_formal_F";
this addVest "V_TacVest_gen_F";
this addBackpack "B_OutdoorPack_blu";

comment "Add binoculars";
this addMagazine "Laserbatteries";
this addWeapon "Laserdesignator";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
this addItemToUniform "11Rnd_45ACP_Mag";
this addItemToVest "B_UavTerminal";
this addItemToVest "MineDetector";
for "_i" from 1 to 3 do {this addItemToVest "50Rnd_570x28_SMG_03";};
this addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {this addItemToBackpack "HandGrenade";};
for "_i" from 1 to 5 do {this addItemToBackpack "1Rnd_SmokeYellow_Grenade_shell";};
this addHeadgear "H_MilCap_blue";
this addGoggles "G_Aviator";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "B_UavTerminal";
this linkItem "NVGoggles";

comment "Set identity";
[this,"Default","male11eng"] call BIS_fnc_setIdentity;
[this,"Curator"] call BIS_fnc_setUnitInsignia;

//	SPAR-17 VS CMR-76
//	arifle_SPAR_03_blk_F
//	arifle_SPAR_03_khk_F
//	arifle_SPAR_03_snd_F
//	arifle_SPAR_03_blk_MOS_Pointer_Bipod_F

//	srifle_DMR_07_blk_F_arco_flash_F
//	srifle_DMR_07_blk_F
//	srifle_DMR_07_hex_F
//	srifle_DMR_07_ghex_F
//	srifle_DMR_07_blk_DMS_F
//	srifle_DMR_07_blk_DMS_Snds_F

//	SMG_03_TR_black	ADR-97 TR 5.7 mm (Black)	Submachine Gun	50Rnd_570x28_SMG_03
//	SMG_03C_black

//	U_C_man_sport_3_F
//	U_C_Man_casual_1_F
//	U_C_Man_casual_2_F
//	V_DeckCrew_blue_F
//	H_PASGT_basic_blue_press_F
// 	H_PASGT_basic_blue_F
//	H_PASGT_neckprot_blue_press_F
//	V_Safety_blue_F
//	V_EOD_blue_F
//	V_EOD_IDAP_blue_F

//	U_C_CBRN_Suit_01_Blue_F
//	U_C_Uniform_Scientist_01_formal_F
//	H_Cap_blu
//	H_MilCap_blue
//	H_Hat_blue


