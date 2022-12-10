/*
	Author: Revo

	Description:
	Retrieves loadout of unit and formats it for CfgRespawnLoadouts. Content is copied to clipboard and returned by function.
	[_x] execVM "Revo.sqf";
	
	Parameter(s):
	0: Object - Object to take the loadout from
	1: String - Class name of the respawn loadout
	2: String - Display name of the respawn loadout
	3: String - Icon path displayed next to display name
	4: String - Loadouts are assigned to a role, possible values:
		"Assistant"
		"CombatLifeSaver"
		"Crewman"
		"Default"
		"Grenadier"
		"MachineGunner"
		"Marksman"
		"MissileSpecialist"
		"Rifleman"
		"Sapper"
		"SpecialOperative"
		"Unarmed"
	5: String - Condition for the respawn loadout to be shown. Code inside string has to return boolean. _this refers to the unit inside the respawn screen

	Returns:
	String - Exports formatted loadout
*/
_unit = _this select 0;

params
[
	["_object",_unit,[objNull]],
	["_class","REPLACE",[""]],
	["_displayName","REPLACE",[""]],
	["_icon","\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa",[""]],
	["_role","Default",[""]],
	["_conditionShow","true",[""]]
];

private _indent = "	";
private _class = format ["class %1",_class];
private _displayName = format ["displayName = ""%1"";",_displayName];
private _icon = format ["icon = ""%1"";",_icon];
private _role = format ["role = ""%1"";",_role];
private _conditionShow = format ["show = ""%1"";",_conditionShow];
private _uniformClass = format ["uniformClass = ""%1"";",uniform _object];
private _backpack = format ["backpack = ""%1"";",backpack _object];
private _export = _class + endl + "{" + endl + _indent + _displayName + endl + _indent + _icon + endl + _indent + _role + endl + _indent + _conditionShow + endl + _indent + _uniformClass + endl + _indent + _backpack + endl;
private _weapons = weapons _object;
private _primWeaponItems = primaryWeaponItems _object;
private _secWeaponItems = secondaryWeaponItems _object;
private _assignedItems = assigneditems _object;
// From BIS_fnc_exportLoadout START
private _fnc_addArray =
{
	params ["_name","_array"];
	_export = _export + format [_indent + "%1[] = {",_name];
	{
		if (_foreachindex > 0) then {_export = _export + ",";};
		_export = _export + format ["""%1""",_x];
	} foreach _array;
	_export = _export + "};" + endl;
};

["weapons",_weapons + ["Throw","Put"]] call _fnc_addArray;
["magazines",magazines _object] call _fnc_addArray;
["items",items _object] call _fnc_addArray;
["linkedItems",[vest _object,headgear _object,goggles _object] + _assignedItems - _weapons + _primWeaponItems + _secWeaponItems] call _fnc_addArray;
// From BIS_fnc_exportLoadout END
_export = _export + "};" + endl + "// Visit https://community.bistudio.com/wiki/Arma_3_Respawn for detailed information";

copyToClipboard _export;
_export

/*
class SQUADLEADER
{
	displayName = "SQUADLEADER";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_B_CombatUniform_mcam";
	backpack = "B_TacticalPack_mcamo";
	weapons[] = {"arifle_MX_GL_F","hgun_Pistol_heavy_01_F","Laserdesignator","Throw","Put"};
	magazines[] = {"11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","Chemlight_green","Chemlight_green","Chemlight_green","Chemlight_red","Chemlight_red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","HandGrenade","HandGrenade","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","UGL_FlareGreen_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareRed_F","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","SmokeShell","SmokeShell","SmokeShell","SmokeShell"};
	items[] = {"FirstAidKit","B_UavTerminal","MineDetector","ToolKit"};
	linkedItems[] = {"V_PlateCarrierSpec_mtp","H_Cap_usblack","G_Goggles_VR","ItemMap","ItemCompass","ItemWatch","ItemRadio","B_UavTerminal","","acc_pointer_IR","optic_Nightstalker","","","","",""};
};
class AUTORIFLEMAN
{
	displayName = "AUTORIFLEMAN";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_B_CombatUniform_mcam";
	backpack = "B_Carryall_oli";
	weapons[] = {"arifle_Katiba_GL_F","launch_NLAW_F","hgun_Pistol_heavy_01_F","Laserdesignator","Throw","Put"};
	magazines[] = {"11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","Chemlight_green","Chemlight_green","Chemlight_green","Chemlight_red","Chemlight_red","Chemlight_red","1Rnd_HE_Grenade_shell","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green","NLAW_F","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"};
	items[] = {"FirstAidKit","B_UavTerminal","MineDetector"};
	linkedItems[] = {"V_PlateCarrierSpec_mtp","H_Cap_usblack","G_Goggles_VR","ItemMap","ItemCompass","ItemWatch","ItemRadio","B_UavTerminal","","acc_pointer_IR","optic_Nightstalker","","","","",""};
};
class MARKSMAN
{
	displayName = "MARKSMAN";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_B_CombatUniform_mcam";
	backpack = "B_TacticalPack_mcamo";
	weapons[] = {"srifle_EBR_F","hgun_Pistol_heavy_01_F","Rangefinder","Throw","Put"};
	magazines[] = {"11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","Chemlight_green","Chemlight_green","Chemlight_green","Chemlight_red","Chemlight_red","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell"};
	items[] = {"FirstAidKit","B_UavTerminal","MineDetector","ToolKit","Medikit","FirstAidKit","FirstAidKit"};
	linkedItems[] = {"V_PlateCarrierSpec_mtp","H_Cap_usblack","G_Goggles_VR","ItemMap","ItemCompass","ItemWatch","ItemRadio","B_UavTerminal","","acc_pointer_IR","optic_Nightstalker","","","","",""};
};
class JTAC
{
	displayName = "JTAC";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_B_CombatUniform_mcam";
	backpack = "";
	weapons[] = {"arifle_MXM_Hamr_LP_BI_F","hgun_P07_F","Laserdesignator","Throw","Put"};
	magazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","Chemlight_green","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShellGreen","Chemlight_green","Laserbatteries","Chemlight_green"};
	items[] = {"FirstAidKit","MineDetector"};
	linkedItems[] = {"V_PlateCarrier1_rgr","H_Cap_usblack","G_Goggles_VR","ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","","acc_pointer_IR","optic_Nightstalker","bipod_01_F_snd","","","",""};
};
class GRENADIER
{
	displayName = "GRENADIER";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_B_CombatUniform_mcam";
	backpack = "B_TacticalPack_mcamo";
	weapons[] = {"arifle_MX_GL_F","hgun_Pistol_heavy_01_F","Laserdesignator","Throw","Put"};
	magazines[] = {"11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","Chemlight_green","Chemlight_green","Chemlight_green","Chemlight_red","Chemlight_red","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","HandGrenade","HandGrenade","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","UGL_FlareGreen_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareRed_F","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","1Rnd_SmokeGreen_Grenade_shell"};
	items[] = {"FirstAidKit","B_UavTerminal","MineDetector","ToolKit"};
	linkedItems[] = {"V_PlateCarrierSpec_mtp","H_Cap_usblack","G_Goggles_VR","ItemMap","ItemCompass","ItemWatch","ItemRadio","B_UavTerminal","","acc_pointer_IR","optic_Nightstalker","","","","",""};
};
class MEDIC
{
	displayName = "MEDIC";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_B_CombatUniform_mcam";
	backpack = "";
	weapons[] = {"arifle_MXM_Hamr_LP_BI_F","hgun_P07_F","Laserdesignator","Throw","Put"};
	magazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","Chemlight_green","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShellGreen","Chemlight_green","Laserbatteries","Chemlight_green"};
	items[] = {"FirstAidKit","MineDetector"};
	linkedItems[] = {"V_PlateCarrier1_rgr","H_Cap_usblack","G_Goggles_VR","ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","","acc_pointer_IR","optic_Nightstalker","bipod_01_F_snd","","","",""};
};
class MEDIC-ENGINEER
{
	displayName = "MEDIC-ENGINEER";
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	role = "Default";
	show = "true";
	uniformClass = "U_B_CombatUniform_mcam";
	backpack = "B_TacticalPack_mcamo";
	weapons[] = {"srifle_EBR_F","hgun_Pistol_heavy_01_F","Rangefinder","Throw","Put"};
	magazines[] = {"11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","11Rnd_45ACP_Mag","Chemlight_green","Chemlight_green","Chemlight_green","Chemlight_red","Chemlight_red","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell","Chemlight_green","Chemlight_red"};
	items[] = {"FirstAidKit","B_UavTerminal","MineDetector","ToolKit","Medikit","FirstAidKit","FirstAidKit"};
	linkedItems[] = {"V_PlateCarrierSpec_mtp","H_Cap_usblack","G_Goggles_VR","ItemMap","ItemCompass","ItemWatch","ItemRadio","B_UavTerminal","","acc_pointer_IR","optic_Nightstalker","","","","",""};
};

*/

