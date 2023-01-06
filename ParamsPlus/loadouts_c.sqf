///////  [_unit] execVM "paramsplus\loadouts_c.sqf";  ///////
//_recruitableunits = ["c_nikos","C_Orestes","C_man_p_fugitive_F","C_man_p_fugitive_F_euro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_p_beggar_F_afro","C_man_w_worker_F","C_man_polo_2_F","C_man_p_shorts_1_F"];
//c_nikos (Revolution_1)
//C_Orestes (Revolution_2)
//C_man_p_fugitive_F_euro (Revolution_3)
//C_man_p_beggar_F_euro (Revolution_4)
//C_man_p_beggar_F_asia (Revolution_5)
//C_man_p_beggar_F_afro (Revolution_6)
//C_man_w_worker_F (Revolution_7)
//C_man_polo_2_F (Revolution_8)
private ["_unit","_typeUnit","_classname","_displayname","_PLoadOut","_PDiverEquip"];
_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
_PDiverEquip = "PDiverEquip" call BIS_fnc_getParamValue;
if (_PLoadOut isEqualTo 1) exitWith {};
if (_PDiverEquip isEqualTo 2) exitWith {};
if (_PDiverEquip isEqualTo 3) exitWith {};

_unit = _this;

switch (typeOf _unit) do {

	case "c_nikos" : {

comment "Exported from Arsenal by RENFRO";

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
_unit setName ["Constantine Nikos","Constantine","Nikos"]; 
[_unit,"GreekHead_A3_04","male03gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_Orestes" : {

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
_unit setName ["Cranius Orestes","Cranius","Orestes"];
[_unit,"GreekHead_A3_09","male06gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_p_fugitive_F_euro" : {

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
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_p_beggar_F_euro": {

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
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_p_beggar_F_asia" : {

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
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_p_beggar_F_afro" : {	

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
[_unit,"AfricanHead_03","male01gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_w_worker_F" : {

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
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_polo_2_F" : {

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
[_unit,"","male01gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_p_shorts_1_F" : {	

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
_unit setName ["Panos Mylonaki","Panos","Mylonaki"];
[_unit,"GreekHead_A3_05","male02gre",1,"Jester"] call BIS_fnc_setIdentity;
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_pilot_F" : {	


comment "Exported from Arsenal by RENFRO";

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
_unit addHandgunItem "muzzle_snds_L";
_unit addHandgunItem "acc_flashlight_pistol";
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
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "Chemlight_green";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_HelmetIA";
_unit addGoggles "G_Tactical_Black";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
[_unit,"GreekHead_A3_06","male03gre"] call BIS_fnc_setIdentity;
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
	
comment "Set identity";
_unit setName ["Evangelos Cosmos","Evangelos","Cosmos"];
[_unit,"GreekHead_A3_06","male03gre",1,"Cosmos"] call BIS_fnc_setIdentity;
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};

	case "C_man_p_fugitive_F" : {

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
[_unit,"BI"] call BIS_fnc_setUnitInsignia;
};	
};

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};

_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 1) then {

	_unit addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		_unit execVM "ParamsPlus\loadouts_c.sqf";
	}];

};

_unit setVariable ["LoadoutDone", true];

_unit action ["WEAPONONBACK", _unit];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Loadouts Done!"

};

