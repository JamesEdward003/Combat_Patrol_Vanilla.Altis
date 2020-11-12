///  		[player] execVM "paramsplus\silencers.sqf";		  ///
_PSilencers = "PSilencers" call BIS_fnc_getParamValue;
if (_PSilencers isEqualTo 1) exitWith {};
private ["_unit","_muzzleList","_ml","_PSilencers"];
_unit = _this;

waitUntil { !(isNil {_unit getVariable "LoadoutDone"}) };

private _future = time + 1;
waitUntil { time >= _future };

_muzzleList = ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_acp","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_570","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_58_blk_F","muzzle_snds_58_wdm_F","muzzle_snds_58_ghex_F","muzzle_snds_58_hex_F","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F","muzzle_snds_B_lush_F","muzzle_snds_B_arid_F"];

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

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\silencers.sqf";
}];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Silencer Adjustments Done!";

};

