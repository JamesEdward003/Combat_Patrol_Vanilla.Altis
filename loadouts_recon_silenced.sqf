///////  loadouts_recon_silenced.sqf  ///////
Recon_TeamLeader = {

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _this) exitWith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add weapons";
_this addWeapon "arifle_Mk20_F";
_this addPrimaryWeaponItem "muzzle_snds_M";
_this addPrimaryWeaponItem "acc_flashlight";
_this addPrimaryWeaponItem "optic_Nightstalker";
_this addPrimaryWeaponItem "30Rnd_556x45_Stanag";
_this addWeapon "launch_NLAW_F";
_this addSecondaryWeaponItem "NLAW_F";
_this addWeapon "hgun_Pistol_heavy_01_green_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "acc_flashlight_pistol";
_this addHandgunItem "optic_MRD";
_this addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_this forceAddUniform "U_O_SpecopsUniform_ocamo";
_this addVest "V_PlateCarrierH_CTRG";
_this addBackpack "B_AssaultPack_cbr";

comment "Add binoculars";
_this addMagazine "Laserbatteries";
_this addWeapon "Laserdesignator";

comment "Add items to containers";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "Chemlight_green";
_this addItemToUniform "11Rnd_45ACP_Mag";
for "_i" from 1 to 2 do {_this addItemToUniform "30Rnd_556x45_Stanag";};
_this addItemToUniform "Chemlight_red";
_this addItemToUniform "SmokeShellGreen";
_this addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 4 do {_this addItemToVest "11Rnd_45ACP_Mag";};
for "_i" from 1 to 4 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_green";};
for "_i" from 1 to 4 do {_this addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_red";};
_this addItemToVest "APERSMine_Range_Mag";
_this addItemToVest "Laserbatteries";
_this addItemToBackpack "MineDetector";
_this addItemToBackpack "MRAWS_HE_F";
_this addItemToBackpack "NLAW_F";
_this addItemToBackpack "APERSTripMine_Wire_Mag";
_this addHeadgear "H_HelmetB_grass";
_this addGoggles "G_Goggles_VR";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this linkItem "NVGoggles";

comment "Set identity";
[_this,"WhiteHead_03","male11eng"] call BIS_fnc_setIdentity;

_this addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

if (isMultiplayer) then
{
	if ( isNil{_this getVariable "loadouts_MP"} ) then 
	{	
		_this addEventHandler ["Respawn",{_this call Recon_TeamLeader; hint "respawn loadout"}];
		_this setVariable ["loadouts_MP", true];
	};
};
};

Recon_Grenadier = {

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _this) exitWith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add weapons";
_this addWeapon "arifle_MX_GL_F";
_this addPrimaryWeaponItem "muzzle_snds_H";
_this addPrimaryWeaponItem "acc_flashlight";
_this addPrimaryWeaponItem "optic_Nightstalker";
_this addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "acc_flashlight_pistol";
_this addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_this forceAddUniform "U_O_SpecopsUniform_ocamo";
_this addVest "V_PlateCarrierH_CTRG";
_this addBackpack "B_FieldPack_ocamo";

comment "Add binoculars";
_this addWeapon "Rangefinder";

comment "Add items to containers";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_this addItemToUniform "30Rnd_65x39_caseless_mag";};
_this addItemToUniform "Chemlight_red";
_this addItemToUniform "9Rnd_45ACP_Mag";
_this addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_red";};
for "_i" from 1 to 4 do {_this addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_this addItemToVest "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_green";};
_this addItemToVest "APERSMine_Range_Mag";
for "_i" from 1 to 4 do {_this addItemToVest "9Rnd_45ACP_Mag";};
_this addItemToBackpack "FirstAidKit";
for "_i" from 1 to 6 do {_this addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_this addItemToBackpack "3Rnd_UGL_FlareRed_F";};
for "_i" from 1 to 4 do {_this addItemToBackpack "3Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {_this addItemToBackpack "30Rnd_65x39_caseless_mag";};
_this addItemToBackpack "Chemlight_red";
for "_i" from 1 to 2 do {_this addItemToBackpack "3Rnd_UGL_FlareGreen_F";};
_this addHeadgear "H_HelmetB_grass";
_this addGoggles "G_Goggles_VR";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this linkItem "NVGoggles";

comment "Set identity";
[_this,"GreekHead_A3_07","male11eng"] call BIS_fnc_setIdentity;

_this addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

if (isMultiplayer) then
{
	if ( isNil{_this getVariable "loadouts_MP"} ) then 
	{	
		_this addEventHandler ["Respawn",{_this call Recon_Grenadier}];
		_this setVariable ["loadouts_MP", true];
	};
};
};

Recon_Marksman = {

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _this) exitWith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add weapons";
_this addWeapon "arifle_MXM_F";
_this addPrimaryWeaponItem "muzzle_snds_H";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addPrimaryWeaponItem "optic_DMS";
_this addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_this addPrimaryWeaponItem "bipod_02_F_hex";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "acc_flashlight_pistol";
_this addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_this forceAddUniform "U_B_CombatUniform_mcam";
_this addVest "V_PlateCarrierH_CTRG";

comment "Add binoculars";
_this addMagazine "Laserbatteries";
_this addWeapon "Laserdesignator";

comment "Add items to containers";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_this addItemToUniform "30Rnd_65x39_caseless_mag";};
_this addItemToUniform "Chemlight_red";
_this addItemToUniform "Laserbatteries";
_this addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_green";};
for "_i" from 1 to 4 do {_this addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_this addItemToVest "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_red";};
for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_65x39_caseless_mag";};
_this addHeadgear "H_HelmetB_desert";
_this addGoggles "G_Goggles_VR";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this linkItem "NVGoggles";

comment "Set identity";
[_this,"WhiteHead_01","male12eng"] call BIS_fnc_setIdentity;

_this addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

if (isMultiplayer) then
{
	if ( isNil{_this getVariable "loadouts_MP"} ) then 
	{	
		_this addEventHandler ["Respawn",{_this call Recon_Marksman}];
		_this setVariable ["loadouts_MP", true];
	};
};
};

Recon_Paramedic = {

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _this) exitWith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add weapons";
_this addWeapon "arifle_Katiba_F";
_this addPrimaryWeaponItem "muzzle_snds_H";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addPrimaryWeaponItem "optic_Nightstalker";
_this addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "acc_flashlight_pistol";
_this addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_this forceAddUniform "U_B_CombatUniform_mcam";
_this addVest "V_PlateCarrierH_CTRG";

comment "Add binoculars";
_this addWeapon "Rangefinder";

comment "Add items to containers";
_this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToUniform "9Rnd_45ACP_Mag";};
_this addItemToUniform "30Rnd_65x39_caseless_green";
for "_i" from 1 to 2 do {_this addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_this addItemToUniform "Chemlight_red";};
_this addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_green";};
for "_i" from 1 to 4 do {_this addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_this addItemToVest "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_red";};
for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_65x39_caseless_green";};
_this addHeadgear "H_HelmetB_snakeskin";
_this addGoggles "G_Goggles_VR";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this linkItem "NVGoggles";

comment "Set identity";
[_this,"WhiteHead_16","male07eng"] call BIS_fnc_setIdentity;

_this addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

if (isMultiplayer) then
{
	if ( isNil{_this getVariable "loadouts_MP"} ) then 
	{	
		_this addEventHandler ["Respawn",{_this call Recon_Paramedic}];
		_this setVariable ["loadouts_MP", true];
	};
};
};

Recon_Scout = {

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _this) exitWith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add weapons";
_this addWeapon "arifle_MX_SW_F";
_this addPrimaryWeaponItem "muzzle_snds_H_MG";
_this addPrimaryWeaponItem "optic_NVS";
_this addPrimaryWeaponItem "100Rnd_65x39_caseless_mag";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "acc_flashlight_pistol";
_this addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_this forceAddUniform "U_B_CombatUniform_mcam_vest";
_this addVest "V_PlateCarrierH_CTRG";

comment "Add binoculars";
_this addMagazine "Laserbatteries";
_this addWeapon "Laserdesignator_02";

comment "Add items to containers";
_this addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_this addItemToUniform "9Rnd_45ACP_Mag";};
_this addItemToUniform "30Rnd_65x39_caseless_mag";
_this addItemToUniform "Chemlight_green";
_this addItemToUniform "Chemlight_red";
_this addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_blue";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_red";};
for "_i" from 1 to 2 do {_this addItemToVest "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_this addItemToVest "9Rnd_45ACP_Mag";};
_this addHeadgear "H_HelmetB_grass";
_this addGoggles "G_Goggles_VR";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this linkItem "NVGoggles";

comment "Set identity";
[_this,"WhiteHead_12","male09eng"] call BIS_fnc_setIdentity;

_this addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

if (isMultiplayer) then
{
	if ( isNil{_this getVariable "loadouts_MP"} ) then 
	{	
		_this addEventHandler ["Respawn",{_this call Recon_Scout}];
		_this setVariable ["loadouts_MP", true];
	};
};
};

Recon_LAT = {

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _this) exitWith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add weapons";
_this addWeapon "arifle_MX_SW_F";
_this addPrimaryWeaponItem "muzzle_snds_H";
_this addPrimaryWeaponItem "acc_pointer_IR";
_this addPrimaryWeaponItem "optic_Nightstalker";
_this addPrimaryWeaponItem "100Rnd_65x39_caseless_mag";
_this addPrimaryWeaponItem "bipod_01_F_snd";
_this addWeapon "launch_RPG32_F";
_this addSecondaryWeaponItem "RPG32_F";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "acc_flashlight_pistol";
_this addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_this forceAddUniform "U_B_CombatUniform_mcam_vest";
_this addVest "V_PlateCarrierH_CTRG";
_this addBackpack "B_AssaultPack_cbr";

comment "Add binoculars";
_this addWeapon "Rangefinder";

comment "Add items to containers";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "Chemlight_green";
for "_i" from 1 to 4 do {_this addItemToUniform "9Rnd_45ACP_Mag";};
_this addItemToUniform "Chemlight_red";
_this addItemToUniform "SmokeShellGreen";
_this addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 4 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 4 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_green";};
for "_i" from 1 to 2 do {_this addItemToVest "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_this addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_red";};
for "_i" from 1 to 2 do {_this addItemToBackpack "RPG32_F";};
_this addItemToBackpack "RPG32_HE_F";
_this addHeadgear "H_HelmetB_grass";
_this addGoggles "G_Goggles_VR";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this linkItem "NVGoggles";

comment "Set identity";
[_this,"AfricanHead_03","male02eng"] call BIS_fnc_setIdentity;

_this addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

if (isMultiplayer) then
{
	if ( isNil{_this getVariable "loadouts_MP"} ) then 
	{	
		_this addEventHandler ["Respawn",{_this call Recon_LAT}];
		_this setVariable ["loadouts_MP", true];
	};
};
};

Recon_Demolition = {

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _this) exitWith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add weapons";
_this addWeapon "srifle_EBR_F";
_this addPrimaryWeaponItem "20Rnd_762x51_Mag";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "acc_flashlight_pistol";
_this addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_this forceAddUniform "U_B_CombatUniform_mcam_vest";
_this addVest "V_PlateCarrierH_CTRG";
_this addBackpack "B_Kitbag_cbr";

comment "Add binoculars";
_this addWeapon "Rangefinder";

comment "Add items to containers";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "Chemlight_green";
for "_i" from 1 to 5 do {_this addItemToUniform "9Rnd_45ACP_Mag";};
_this addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_this addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_blue";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_red";};
for "_i" from 1 to 4 do {_this addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 3 do {_this addItemToVest "9Rnd_45ACP_Mag";};
_this addItemToBackpack "MineDetector";
_this addItemToBackpack "Medikit";
_this addItemToBackpack "ToolKit";
_this addItemToBackpack "SatchelCharge_Remote_Mag";
_this addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
_this addHeadgear "H_HelmetB_grass";
_this addGoggles "G_Goggles_VR";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this linkItem "NVGoggles";

comment "Set identity";
[_this,"WhiteHead_18","male05eng"] call BIS_fnc_setIdentity;

_this addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

if (isMultiplayer) then
{
	if ( isNil{_this getVariable "loadouts_MP"} ) then 
	{	
		_this addEventHandler ["Respawn",{_this call Recon_Demolition}];
		_this setVariable ["loadouts_MP", true];
	};
};
};

Recon_JTAC = {

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _this) exitWith {};

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add weapons";
_this addWeapon "arifle_MX_GL_F";
_this addPrimaryWeaponItem "muzzle_snds_H";
_this addPrimaryWeaponItem "acc_flashlight";
_this addPrimaryWeaponItem "optic_Nightstalker";
_this addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_this addWeapon "hgun_ACPC2_F";
_this addHandgunItem "muzzle_snds_acp";
_this addHandgunItem "acc_flashlight_pistol";
_this addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_this forceAddUniform "U_B_CombatUniform_mcam_vest";
_this addVest "V_PlateCarrierH_CTRG";
_this addBackpack "B_FieldPack_ocamo";

comment "Add binoculars";
_this addMagazine "Laserbatteries";
_this addWeapon "Laserdesignator";

comment "Add items to containers";
_this addItemToUniform "FirstAidKit";
_this addItemToUniform "Chemlight_green";
for "_i" from 1 to 2 do {_this addItemToUniform "30Rnd_65x39_caseless_mag";};
_this addItemToUniform "9Rnd_45ACP_Mag";
_this addItemToUniform "UGL_FlareGreen_F";
_this addItemToVest "FirstAidKit";
_this addItemToVest "MineDetector";
for "_i" from 1 to 2 do {_this addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_this addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_blue";};
for "_i" from 1 to 2 do {_this addItemToVest "Chemlight_red";};
for "_i" from 1 to 4 do {_this addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_this addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_this addItemToVest "Laserbatteries";};
_this addItemToBackpack "FirstAidKit";
for "_i" from 1 to 6 do {_this addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_this addItemToBackpack "3Rnd_UGL_FlareRed_F";};
for "_i" from 1 to 4 do {_this addItemToBackpack "3Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {_this addItemToBackpack "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {_this addItemToBackpack "3Rnd_UGL_FlareGreen_F";};
_this addHeadgear "H_HelmetB_grass";
_this addGoggles "G_Goggles_VR";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this linkItem "NVGoggles";

comment "Set identity";
[_this,"WhiteHead_10","male09eng"] call BIS_fnc_setIdentity;

_this addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

if (isMultiplayer) then
{
	if ( isNil{_this getVariable "loadouts_MP"} ) then 
	{	
		_this addEventHandler ["Respawn",{_this call Recon_JTAC}];
		_this setVariable ["loadouts_MP", true];
	};
};
};

recon_functionsLoaded = true;

[playerSide, "HQ"] commandChat "Recon Loadout Done!";

