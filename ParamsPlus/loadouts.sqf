///////  [_unit] execVM "paramsplus\loadouts.sqf";  ///////
//["Officer","Team Leader","Recon JTAC","Squad Leader","Autorifleman","Rifleman (AT)","Rifleman","Repair Specialist","Grenadier","Combat Life Saver","Marksman"];
//_recruitableunits = ["B_Captain_Pettka_F","B_CTRG_soldier_GL_LAT_F","B_Story_Protagonist_F","B_CTRG_soldier_engineer_exp_F","B_CTRG_soldier_AR_A_F","B_CTRG_soldier_M_medic_F","B_Captain_Jay_F"];
_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
if (_PLoadOut isEqualTo 3) exitWith {};
private ["_unit","_classname","_displayname","_PLoadOut"];
_unit = _this select 0;
_classname 	= format ["%1", typeOf _unit];
_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");

switch (_displayname) do {

	case "Officer": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_01_MRD_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_TacticalPack_mcamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "Laserbatteries";
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
_unit addHeadgear "H_MilCap_mcamo";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Team Leader": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_01_MRD_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_TacticalPack_mcamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "Laserbatteries";
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Recon JTAC": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_01_MRD_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_TacticalPack_mcamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "Laserbatteries";
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

case "Squad Leader": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_MX_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_TacticalPack_mcamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 7 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Autorifleman": {	//	GRENADE LAUNCHER/JAVELIN EQUIPPED
	
comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addWeapon "rhs_weap_fgm148";
_unit addSecondaryWeaponItem "rhs_fgm148_magazine_AT";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_Carryall_oli";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
_unit addItemToBackpack "rhs_fgm148_magazine_AT";
for "_i" from 1 to 8 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Rifleman (AT)": {	//	GRENADE LAUNCHER/PCML-NLAW/LASERDESIGNATOR EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addWeapon "launch_NLAW_F";
_unit addSecondaryWeaponItem "NLAW_F";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_Carryall_mcamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "NLAW_F";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Rifleman": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_MX_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_TacticalPack_mcamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 7 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Repair Specialist": {	//	GRENADE LAUNCHER/LASERDESIGNATOR/MINE DETECTOR/TOOLKIT EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_MX_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_TacticalPack_mcamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Grenadier": {	//	GRENADE LAUNCHER/LASERDESIGNATOR/MINE DETECTOR/TOOLKIT EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_MX_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_TacticalPack_mcamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 7 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Combat Life Saver": {	//	MEDIKIT/TOOLKIT/MINE DETECTOR/RANGEFINDER EQUIPPED

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "srifle_EBR_F";
_unit addPrimaryWeaponItem "muzzle_snds_B";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "20Rnd_762x51_Mag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrierSpec_mtp";
_unit addBackpack "B_TacticalPack_mcamo";

comment "Add binoculars";
_unit addWeapon "Rangefinder";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "20Rnd_762x51_Mag";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male11eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "Marksman": {	//	MEDIKIT/MINE DETECTOR/LASER DESIGNATOR EQUIPPED

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
this addWeapon "arifle_MXM_Hamr_LP_BI_F";
this addPrimaryWeaponItem "muzzle_snds_H";
this addPrimaryWeaponItem "acc_pointer_IR";
this addPrimaryWeaponItem "optic_Nightstalker";
this addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
this addWeapon "hgun_P07_F";
this addHandgunItem "muzzle_snds_L";
this addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
this forceAddUniform "U_B_CombatUniform_mcam";
this addVest "V_PlateCarrier1_rgr";

comment "Add binoculars";
this addMagazine "Laserbatteries";
this addWeapon "Laserdesignator";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {this addItemToUniform "30Rnd_65x39_caseless_mag";};
this addItemToUniform "Chemlight_green";
this addItemToVest "MineDetector";
for "_i" from 1 to 7 do {this addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "Chemlight_green";
this addItemToVest "Laserbatteries";
this addHeadgear "H_Cap_usblack";
this addGoggles "G_Diving";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "ItemGPS";
this linkItem "NVGoggles";

comment "Set identity";
[this,"WhiteHead_08","male12eng"] call BIS_fnc_setIdentity;
[this,"111thID"] call BIS_fnc_setUnitInsignia;
};
};

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};
_unit setVariable ["loadout", getUnitLoadout _unit];
_unit action ["WEAPONONBACK", _unit];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Loadouts Done!";

};
