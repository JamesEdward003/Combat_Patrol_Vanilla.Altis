///////  [_unit] execVM "paramsplus\loadouts_diver.sqf";  ///////
//_loadOutArray = [Pettka_Special,NorthGate_TeamLeader,Kerry_Special,Explosives_Specialist,McKay_Special,Combat_Life_Saver];
//_recruitableunits = ["B_Captain_Pettka_F","B_CTRG_soldier_GL_LAT_F","B_Story_Protagonist_F","B_CTRG_soldier_engineer_exp_F","B_CTRG_soldier_AR_A_F","B_CTRG_soldier_M_medic_F","B_Captain_Jay_F"];
// B_Captain_Pettka_F-03-Pettka // B_CTRG_soldier_GL_LAT_F-09-Northgate // B_Story_Protagonist_F-04-Kerry // B_CTRG_soldier_AR_A_F-06-McKay // B_CTRG_soldier_M_medic_F-04-Combat_Life_Saver // B_CTRG_soldier_engineer_exp_F-06-Explosives_Specialist // B_Captain_Jay_F-06-Explosives_Specialist //
private ["_unit","_typeUnit","_classname","_displayname","_PDiverEquip"];
_PDiverEquip = "PDiverEquip" call BIS_fnc_getParamValue;
if (_PDiverEquip isEqualTo 1) exitWith {};

_unit = _this;

switch (typeOf _unit) do {

	case "B_Captain_Pettka_F": { 		//  Pettka_Special

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
for "_i" from 1 to 3 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
for "_i" from 1 to 4 do {_unit addItemToUniform "20Rnd_556x45_UW_mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellBlue";};
_unit addItemToUniform "HandGrenade";
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_blue";};
_unit addItemToBackpack "Laserbatteries";
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
_unit addItemToBackpack "20Rnd_556x45_UW_mag";
_unit addGoggles "G_B_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_06","male03eng",1,"Nomad"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "B_CTRG_soldier_GL_LAT_F": {		// NorthGate_TeamLeader

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
_unit addWeapon "launch_NLAW_F";
_unit addSecondaryWeaponItem "NLAW_F";
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
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "APERSMine_Range_Mag";
for "_i" from 1 to 3 do {_unit addItemToBackpack "Chemlight_blue";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
_unit addItemToBackpack "NLAW_F";
_unit addGoggles "G_B_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_20","male09eng",1,"Nomad"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "B_CTRG_soldier_engineer_exp_F": {		//  Explosives_Specialist

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
[_unit,"WhiteHead_18","male04eng",1,"Nomad"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "B_Story_Protagonist_F": {	//  Kerry_Special

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
_unit addItemToBackpack "APERSMine_Range_Mag";
for "_i" from 1 to 3 do {_unit addItemToBackpack "Chemlight_blue";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "APERSTripMine_Wire_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "APERSBoundingMine_Range_Mag";};
_unit addGoggles "G_B_Diving";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_07","male04eng",1,"Nomad"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "B_CTRG_soldier_AR_A_F": {	//  McKay_Special

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
[_unit,"WhiteHead_08","male06eng",1,"Nomad"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "B_CTRG_soldier_M_medic_F": {		//  Combat_Life_Saver

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
[_unit,"WhiteHead_03","male12eng",1,"Nomad"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "B_Captain_Jay_F": {	//  Jay_Special

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
[_unit,"WhiteHead_09","male07eng",1,"Nomad"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};
};

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};

_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 1) then {

	_unit addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		_unit execVM "ParamsPlus\loadouts_diver.sqf";
	}];

};

_unit setVariable ["LoadoutDone", true];

_unit action ["WEAPONONBACK", _unit];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Diver Loadouts Done!"

};

