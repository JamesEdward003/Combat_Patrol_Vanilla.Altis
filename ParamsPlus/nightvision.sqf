///  		[player] execVM "paramsplus\nightvision.sqf";		  ///
_PNightVision = "PNightVision" call BIS_fnc_getParamValue;
if (_PNightVision isEqualTo 1) exitWith {};
private ["_unit","_nvList","_nv","_ldList","_PNightVision"];
_unit = _this;

waitUntil { !(isNil {_unit getVariable "LoadoutDone"}) };

private _future = time + 1;
waitUntil { time >= _future };

_nvList = ["NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","NVGoggles_tna_F","NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F","O_NVGoggles_ghex_F","O_NVGoggles_grn_F","O_NVGoggles_hex_F","O_NVGoggles_urb_F","Integrated_NVG_F","Integrated_NVG_TI_0_F","Integrated_NVG_TI_1_F"];

_ldList = ["Binocular","Laserdesignator","Laserdesignator_02","Laserdesignator_03","Laserdesignator_01_khk_F","Laserdesignator_02_ghex_F"];

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then
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
			_unit removeWeaponGlobal _nv;	
			
		};	
	};
};

if (!isPlayer _unit) then 
	{
	for "_i" from 0 to count _ldList -1 do
	{
		_ld = _ldList select _i;
		if (([_unit, _ld] call BIS_fnc_hasItem) isEqualTo true) then {
					
			_unit removeWeaponGlobal _ld;			
		};	
	};
};

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\nightvision.sqf";
}];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "NightVision Adjustments Done!";

};

