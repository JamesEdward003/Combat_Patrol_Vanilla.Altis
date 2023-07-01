///////  _unit execVM "paramsplus\loadouts.sqf";  ///////
//B_Soldier_SL_F (Rambo_1)
//B_soldier_AR_F (Rambo_2)
//B_medic_F (Rambo_3)
//B_Soldier_GL_F (Rambo_4)
//B_Soldier_GL_F (Rambo_5)
//B_soldier_M_F (Rambo_6)
//B_medic_F (Rambo_7)
//B_soldier_LAT_F (Rambo_8)
waitUntil {!isNull player && alive player};
private ["_PLoadOutsWeaponsUnit","_PLoadOutsGroupUnit","_PLoadOut","_PDiverEquip","_PRespawnLoadOut"];
_PLoadOutsWeaponsUnit = "PLoadOutsWeaponsUnit" call BIS_fnc_getParamValue;
_PLoadOutsGroupUnit = "PLoadOutsGroupUnit" call BIS_fnc_getParamValue;
_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
_PDiverEquip = "PDiverEquip" call BIS_fnc_getParamValue;

if (_PLoadOutsWeaponsUnit isEqualTo 2) exitWith {};
if (_PLoadOutsWeaponsUnit isEqualTo 3) exitWith {};
if (_PLoadOutsGroupUnit isEqualTo 2) exitWith {};
if (_PLoadOutsGroupUnit isEqualTo 3) exitWith {};
if (_PLoadOut isEqualTo 1) exitWith {};
if (_PDiverEquip isEqualTo 2) exitWith {};
if (_PDiverEquip isEqualTo 3) exitWith {};

_unit = _this;

switch (typeOf _unit) do {

	case "B_officer_F": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED OFFICER

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
[_unit,"WhiteHead_08","male09eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Soldier_TL_F": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED TEAM LEADER

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
[_unit,"WhiteHead_08","male09eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_recon_JTAC_F": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED JTAC

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
[_unit,"WhiteHead_08","male02eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Soldier_SL_F": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED SQUAD LEADER

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
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 5 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";
_unit addItemToBackpack "11Rnd_45ACP_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_19","male02eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Soldier_TL_F": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED TEAM LEADER

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
[_unit,"WhiteHead_08","male09eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_soldier_AR_F": {	//	GRENADE LAUNCHER EQUIPPED AUTORIFLEMAN
	
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
_unit addWeapon "arifle_MX_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
_unit addItemToVest "HandGrenade";
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_red";};
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
[_unit,"WhiteHead_08","male11eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_soldier_LAT_F": {	//	GRENADE LAUNCHER/PCML-NLAW/LASERDESIGNATOR EQUIPPED Rifleman (AT)

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
[_unit,"WhiteHead_14","male09eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Soldier_F": {	//	GRENADE LAUNCHER/LASERDESIGNATOR EQUIPPED Rifleman

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
[_unit,"WhiteHead_08","male08eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_soldier_repair_F": {	//	GRENADE LAUNCHER/LASERDESIGNATOR/MINE DETECTOR/TOOLKIT EQUIPPED Repair Specialist

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
[_unit,"WhiteHead_08","male07eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Soldier_GL_F": {	//	GRENADE LAUNCHER/LASERDESIGNATOR/MINE DETECTOR/TOOLKIT EQUIPPED Grenadier

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
[_unit,"WhiteHead_15","male08eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_medic_F": {	//	MEDIKIT/TOOLKIT/MINE DETECTOR/RANGEFINDER EQUIPPED Combat Life Saver

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
[_unit,"WhiteHead_17","male09eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_soldier_M_F": {	//	MEDIKIT/MINE DETECTOR/LASER DESIGNATOR EQUIPPED Marksman
	
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
_unit addWeapon "arifle_MXM_Hamr_LP_BI_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_unit addWeapon "hgun_P07_F";
_unit addHandgunItem "muzzle_snds_L";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrier1_rgr";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_mag";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 7 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "Chemlight_green";
_unit addItemToVest "Laserbatteries";
_unit addHeadgear "H_Cap_usblack";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit linkItem "NVGoggles";

comment "Set identity";
[_unit,"WhiteHead_14","male09eng"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Captain_Pettka_F": { 		//  Pettka Grenadier

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
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 5 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "HandGrenade";};
_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";
_unit addItemToBackpack "11Rnd_45ACP_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Beret_Colonel";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"Whitehead_02","male11eng",1,"Snake"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_CTRG_soldier_GL_LAT_F": {		// NorthGate GL-LAT
	
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
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
_unit addWeapon "launch_NLAW_F";
_unit addSecondaryWeaponItem "NLAW_F";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 5 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "NLAW_F";};
_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";
_unit addItemToBackpack "11Rnd_45ACP_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Beret_02";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_18","male01eng","Viper"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Story_Protagonist_F": {	//  Kerry 

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
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 5 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";
_unit addItemToBackpack "11Rnd_45ACP_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Beret_02";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_03","male05eng",1,"Viper"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_CTRG_soldier_AR_A_F": {	//  McKay - Autorifleman

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
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 5 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";
_unit addItemToBackpack "11Rnd_45ACP_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Beret_02";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_04","male06eng",1,"Viper"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_CTRG_soldier_M_medic_F": {		//  James - Combat_Life_Saver

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
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 5 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "HandGrenade";};
_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";
_unit addItemToBackpack "11Rnd_45ACP_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Beret_02";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_06","male07eng",1,"Viper"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_CTRG_soldier_engineer_exp_F": {		//  Hardy - Explosives_Specialist

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
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 5 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";
_unit addItemToBackpack "11Rnd_45ACP_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Beret_02";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_07","male08eng",1,"Viper"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Captain_Jay_F": {	//  Captain Jay

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
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
_unit addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
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
for "_i" from 1 to 2 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 5 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShellGreen";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "30Rnd_65x39_caseless_black_mag";
_unit addItemToBackpack "11Rnd_45ACP_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Beret_02";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_OPFOR";

comment "Set identity";
[_unit,"WhiteHead_08","male09eng",1,"Viper"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};
/*
	case "B_Captain_Dwarden_F": {	//  Dwarden_Dress

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
_unit addWeapon "SMG_03_TR_black"; // "arifle_MX_GL_F"; // 

_unit addPrimaryWeaponItem "50Rnd_570x28_SMG_03"; // "30Rnd_65x39_caseless_mag"; //
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_C_Uniform_Scientist_01_formal_F"; // "U_C_ConstructionCoverall_Blue_F"; // dlc > "U_C_man_sport_3_F"; // 
_unit addVest "V_TacVest_gen_F";
_unit addBackpack "B_OutdoorPack_blu";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "50Rnd_570x28_SMG_03";}; // "30Rnd_65x39_caseless_mag";}; // 
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "1Rnd_SmokeYellow_Grenade_shell";};
_unit addHeadgear "H_MilCap_blue"; // "H_Beret_gen_F"; // dlc > "H_PASGT_basic_blue_press_F"; // 
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[_unit,"Dwarden","male11eng",1,"Nomad"] call BIS_fnc_setIdentity; // Dwarden // Default
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};
*/
	case "B_Captain_Dwarden_F": {	//  Dwarden_Scout

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
_unit addWeapon "arifle_MX_GL_F"; // "SMG_03_TR_black";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";

_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag"; // "50Rnd_570x28_SMG_03";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_C_ConstructionCoverall_Blue_F"; // "U_C_Uniform_Scientist_01_formal_F";
_unit addVest "V_TacVest_gen_F";
_unit addBackpack "B_OutdoorPack_blu";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";}; // "50Rnd_570x28_SMG_03";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "1Rnd_SmokeYellow_Grenade_shell";};
_unit addHeadgear "H_Beret_gen_F"; // "H_MilCap_blue";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
[_unit,"Dwarden","male11eng",1,"Nomad"] call BIS_fnc_setIdentity; // Dwarden // Default
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};

	case "B_Story_SF_Captain_F": {	//  Captain Miller  -  Sharpshooter

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
_unit addWeapon "srifle_LRR_camo_F";
_unit addPrimaryWeaponItem "optic_MRCO";
_unit addPrimaryWeaponItem "7Rnd_408_Mag";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CTRG_1";
_unit addVest "V_PlateCarrierL_CTRG";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 4 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "7Rnd_408_Mag";
for "_i" from 1 to 6 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 4 do {_unit addItemToVest "7Rnd_408_Mag";};
for "_i" from 1 to 6 do {_unit addItemToVest "MiniGrenade";};
for "_i" from 1 to 4 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
_unit addHeadgear "H_HelmetB_light_snakeskin";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGoggles_INDEP";

comment "Set identity";
[_unit,"WhiteHead_22_a","male11eng",1,"Ghost"] call BIS_fnc_setIdentity;
[_unit,"111thID"] call BIS_fnc_setUnitInsignia;
};
};

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};

_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 1) then {

	_unit addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		_unit execVM "ParamsPlus\loadouts.sqf";
	}];
};

_unit setVariable ["LoadoutDone", true];

_unit action ["WEAPONONBACK", _unit];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Loadouts Done!";

};

