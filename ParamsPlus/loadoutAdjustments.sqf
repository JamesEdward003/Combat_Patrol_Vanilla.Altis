///  		[player] execVM "paramsplus\loadoutAdjustments.sqf";		  ///
_PloadoutAdjustments = "PloadoutAdjustments" call BIS_fnc_getParamValue;
if (_PloadoutAdjustments isEqualTo 3) exitWith {};
private ["_unit","_classname","_displayname","_nvList","_nv","_muzzleList","_ml","_ldList","_PloadoutAdjustments"];
_unit = _this select 0;
//_classname 	= format ["%1", typeOf _unit];
//_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");
waitUntil { !(isNil {_unit getVariable "LoadoutDone"}) };

_nvList = ["NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","NVGoggles_tna_F","NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F","O_NVGoggles_ghex_F","O_NVGoggles_grn_F","O_NVGoggles_hex_F","O_NVGoggles_urb_F","Integrated_NVG_F","Integrated_NVG_TI_0_F","Integrated_NVG_TI_1_F"];

_muzzleList = ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_acp","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_570","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_58_blk_F","muzzle_snds_58_wdm_F","muzzle_snds_58_ghex_F","muzzle_snds_58_hex_F","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F","muzzle_snds_B_lush_F","muzzle_snds_B_arid_F"];

_ldList = ["Binocular","Laserdesignator","Laserdesignator_02","Laserdesignator_03","Laserdesignator_01_khk_F","Laserdesignator_02_ghex_F"];

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo true) then
{
	if (([_unit, "G_Goggles_VR"] call BIS_fnc_hasItem) isEqualTo true) then {
		
		_unit unassignItem "G_Goggles_VR";
		_unit unLinkItem "G_Goggles_VR";
		_unit removeItem "G_Goggles_VR";
		_unit assignItem "G_B_Diving";
		_unit addGoggles "G_B_Diving";
		
	};
} else {
	for "_i" from 0 to count _nvList -1 do
	{
		_nv = _nvList select _i;
		if (([_unit, _nv] call BIS_fnc_hasItem) isEqualTo true) then {
					
			_unit unassignItem _nv;	
			_unit unLinkItem _nv;
			_unit removeItem _nv;
			_unit removeWeapon _nv;	
			
		};	
	};
	for "_i" from 0 to count _muzzleList -1 do
	{
		_ml = _muzzleList select _i;
		if (([_unit, _ml] call BIS_fnc_hasItem) isEqualTo true) then {
				
			_unit unassignItem _ml;
			_unit unLinkItem _ml;
			_unit removePrimaryWeaponItem _ml;	
			_unit removeHandgunItem _ml;
					
		};	
	};
};

if (!isPlayer _unit) then 
	{
	for "_i" from 0 to count _ldList -1 do
	{
		_ld = _ldList select _i;
		if (([_unit, _ld] call BIS_fnc_hasItem) isEqualTo true) then {
					
			_unit unassignItem _ld;
			_unit removePrimaryWeaponItem _ld;			
		};	
	};
};

if (isMultiPlayer) then
{	
	_unit addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		_unit execVM "ParamsPlus\loadoutAdjustments.sqf";
	}];
};

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Loadout Adjustments Done!";

};

