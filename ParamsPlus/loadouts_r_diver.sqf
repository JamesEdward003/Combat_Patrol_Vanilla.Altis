///////  [_unit] execVM "paramsplus\loadouts_r_diver.sqf";  ///////
//_recruitableunits = ["I_diver_TL_F","I_diver_exp_F","I_diver_F","I_medic_F","I_engineer_F","I_soldier_mine_F","I_Story_Colonel_F","I_Captain_Hladas_F","I_Story_Officer_01_F","I_Story_Crew_F"];
private ["_unit","_typeUnit","_classname","_displayname","_PDiverEquip"];
_PDiverEquip = "PDiverEquip" call BIS_fnc_getParamValue;
if (_PDiverEquip isEqualTo 1) exitWith {};

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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_ACPC2_snds_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_Wetsuit";
_unit addVest "V_RebreatherIA";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 8 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addGoggles "G_I_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_Wetsuit";
_unit addVest "V_RebreatherIR";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 8 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
_unit addItemToUniform "Laserbatteries";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
_unit addGoggles "G_I_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_ACPC2_snds_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_Wetsuit";
_unit addVest "V_RebreatherIA";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 8 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addGoggles "G_I_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
_unit setName ["Satiris Rumpesi","Satiris","Rumpesi"];
[_unit,"GreekHead_A3_04","male01gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "I_medic_F": {	//  (REVOLUTION_4) 

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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_ACPC2_snds_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_Wetsuit";
_unit addVest "V_RebreatherIA";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 8 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addGoggles "G_I_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "muzzle_snds_L";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_Wetsuit";
_unit addVest "V_RebreatherB";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 4 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellBlue";};
for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
_unit addItemToUniform "HandGrenade";
_unit addItemToUniform "Chemlight_blue";
_unit addItemToUniform "Laserbatteries";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToBackpack "Chemlight_blue";};
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
_unit addItemToBackpack "APERSMine_Range_Mag";
_unit addGoggles "G_B_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
_unit setName ["Papa Papadopolis","Papa","Papadopolis"];
[_unit,"GreekHead_A3_09","male03per",1,"Revolution"] call BIS_fnc_setIdentity;
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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "muzzle_snds_L";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_Wetsuit";
_unit addVest "V_RebreatherB";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 4 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellBlue";};
for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
_unit addItemToUniform "HandGrenade";
_unit addItemToUniform "Chemlight_blue";
_unit addItemToUniform "Laserbatteries";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToBackpack "Chemlight_blue";};
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
_unit addItemToBackpack "APERSMine_Range_Mag";
_unit addGoggles "G_B_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_ACPC2_snds_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_Wetsuit";
_unit addVest "V_RebreatherIA";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 8 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addGoggles "G_I_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_ACPC2_snds_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_Wetsuit";
_unit addVest "V_RebreatherIA";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 8 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addGoggles "G_I_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
_unit setName ["Harvey Hladik","Harvey","Hladik"];
[_unit,"","male01gre",1,"Revolution"] call BIS_fnc_setIdentity;
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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_ACPC2_snds_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_Wetsuit";
_unit addVest "V_RebreatherIA";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 8 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addGoggles "G_I_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

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
_unit addWeapon "arifle_SDAR_F";
_unit addPrimaryWeaponItem "20Rnd_556x45_UW_mag";
_unit addWeapon "hgun_ACPC2_snds_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_I_Wetsuit";
_unit addVest "V_RebreatherIA";
_unit addBackpack "B_FieldPack_blk";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 8 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
_unit addItemToBackpack "Laserbatteries";
_unit addGoggles "G_I_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "I_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
_unit setName ["Kyros Kalogeros","Kyros","Kalogeros"];
[_unit,"GreekHead_A3_08","male06gre",1,"Revolution"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};
};

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};

_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 2) then {

_unitlo	= getUnitLoadout _unit;

_unit setVariable ["LoadoutDone", _unitlo, true];

} else {

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\loadouts_r_diver.sqf";
}];

_unit setVariable ["LoadoutDone", true];

};

_unit action ["WEAPONONBACK", _unit];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Diver Loadouts Done!"

};

