///////  [_unit] execVM "paramsplus\loadouts_r.sqf";  ///////
//_recruitableunits = ["I_diver_TL_F","I_diver_exp_F","I_diver_F","I_medic_F","I_engineer_F","I_soldier_mine_F","I_Story_Colonel_F","I_Captain_Hladas_F","I_Story_Officer_01_F","I_Story_Crew_F"];
private ["_unit","_typeUnit","_classname","_displayname","_PLoadOut","_PDiverEquip"];
_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
_PDiverEquip = "PDiverEquip" call BIS_fnc_getParamValue;
if (_PLoadOut isEqualTo 1) exitWith {};
if (_PDiverEquip isEqualTo 2) exitWith {};
if (_PDiverEquip isEqualTo 3) exitWith {};

_unit = _this;
_typeUnit = typeOf _unit;

switch (_typeUnit) do {

	case "I_diver_TL_F": { 		//  (REVOLUTION_1)

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
_unit addWeapon "arifle_MX_GL_Black_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";
_unit addVest "V_BandollierB_oli";
_unit addBackpack "B_Kitbag_sgg";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest "I_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "3Rnd_UGL_FlareGreen_F";
_unit addItemToBackpack "3Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 4 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_MilCap_dgtl";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
_unit setName ["Lazaros Elias","Lazaros","Elias"]; 
[_unit,"GreekHead_A3_03","male03gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_diver_exp_F": {		// (REVOLUTION_2)

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
_unit addWeapon "arifle_MX_GL_Black_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";
_unit addVest "V_BandollierB_oli";
_unit addBackpack "B_Kitbag_sgg";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest "I_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "3Rnd_UGL_FlareGreen_F";
_unit addItemToBackpack "3Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 4 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_MilCap_dgtl";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
_unit setName ["Stefanos Petridish","Stefanos","Petridish"];
[_unit,"GreekHead_A3_09","male06gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_diver_F": {	//  (REVOLUTION_3)

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
_unit addWeapon "arifle_MX_GL_Black_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";
_unit addVest "V_BandollierB_oli";
_unit addBackpack "B_Kitbag_sgg";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest "I_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "3Rnd_UGL_FlareGreen_F";
_unit addItemToBackpack "3Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 4 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_MilCap_dgtl";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
_unit setName ["Satiris Rumpesi","Satiris","Rumpesi"];
[_unit,"GreekHead_A3_04","male01gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_medic_F": {		//  (REVOLUTION_4) 

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
_unit addWeapon "arifle_MX_GL_Black_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";
_unit addVest "V_BandollierB_oli";
_unit addBackpack "B_Kitbag_sgg";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest "I_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "3Rnd_UGL_FlareGreen_F";
_unit addItemToBackpack "3Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 4 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_MilCap_dgtl";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
_unit setName ["Michalis Costas","Michalis","Costas"];
[_unit,"GreekHead_A3_04","male05gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_engineer_F": {		//  (REVOLUTION_5) 

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
_unit addWeapon "arifle_MX_GL_Black_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";
_unit addVest "V_BandollierB_oli";
_unit addBackpack "B_Kitbag_sgg";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest "I_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "3Rnd_UGL_FlareGreen_F";
_unit addItemToBackpack "3Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 4 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_MilCap_dgtl";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
_unit setName ["Papa Papadopolis","Papa","Papadopolis"];
[_unit,"GreekHead_A3_09","male03gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_soldier_mine_F": {	//  (REVOLUTION_6) 

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
_unit addWeapon "arifle_MX_GL_Black_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";
_unit addVest "V_BandollierB_oli";
_unit addBackpack "B_Kitbag_sgg";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest "I_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "3Rnd_UGL_FlareGreen_F";
_unit addItemToBackpack "3Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 4 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_MilCap_dgtl";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
_unit setName ["Dimitrias Dukas","Dimitrias","Dukas"];
[_unit,"GreekHead_A3_03","male01gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_Story_Colonel_F": {	//  (REVOLUTION_7) 

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
_unit addWeapon "arifle_MX_GL_Black_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";
_unit addVest "V_BandollierB_oli";
_unit addBackpack "B_Kitbag_sgg";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest "I_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "3Rnd_UGL_FlareGreen_F";
_unit addItemToBackpack "3Rnd_SmokeGreen_Grenade_shell";
for "_i" from 1 to 4 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_MilCap_dgtl";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
_unit setName ["Athanasiadis Akhanteros","Athanasiadis","Akhanteros"];
[_unit,"GreekHead_A3_01","male02gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_Captain_Hladas_F": {	//  (REVOLUTION_8) 

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
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";

comment "Add binoculars";
_unit addWeapon "Binocular";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "SmokeShellGreen";
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
_unit addHeadgear "H_MilCap_dgtl";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

comment "Set identity";
_unit setName ["Harvey Hladik","Harvey","Hladik"];
[_unit,"GreekHead_A3_05","male01gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_Story_Officer_01_F": {	//  (REVOLUTION_9) 

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
_unit addPrimaryWeaponItem "optic_MRCO";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_I_OfficerUniform";
_unit addVest "V_BandollierB_oli";
_unit addBackpack "B_TacticalPack_oli";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addItemToVest "MineDetector";
_unit addItemToVest "SmokeShell";
for "_i" from 1 to 3 do {_unit addItemToVest "6Rnd_45ACP_Cylinder";};
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 4 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
_unit addItemToVest "Laserbatteries";
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "Chemlight_green";};
_unit addHeadgear "H_Beret_blk";
_unit addGoggles "G_Tactical_Clear";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";
	
comment "Set identity";
_unit setName ["Panas Gavras","Panas","Gavras"];
[_unit,"GreekHead_A3_05","male02gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_Story_Crew_F": {	//  (REVOLUTION_10) 

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
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";

comment "Add containers";
_unit forceAddUniform "U_I_pilotCoveralls";
_unit addVest "V_TacVest_oli";
_unit addBackpack "B_TacticalPack_rgr";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "SmokeShellGreen";
for "_i" from 1 to 4 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addItemToUniform "Laserbatteries";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareWhite_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
_unit addHeadgear "H_HelmetCrew_I";
_unit addGoggles "G_Lowprofile";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";
	
comment "Set identity";
_unit setName ["Kyros Kalogeros","Kyros","Kalogeros"];
[_unit,"GreekHead_A3_08","male06gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};	
};

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};

_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 1) then {

	_unit addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		_unit execVM "ParamsPlus\loadouts_r.sqf";
	}];

};

_unit setVariable ["LoadoutDone", true];

_unit action ["WEAPONONBACK", _unit];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Loadouts Done!"

};

