/////--"paramsplus\silencers_Group.sqf"--/////
private ["_unit","_muzzleList","_ml","_PSilencers"];
_PSilencers = "PSilencers" call BIS_fnc_getParamValue;
if (_PSilencers isEqualTo 1) exitWith {};

_muzzleList = ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_acp","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_570","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_58_blk_F","muzzle_snds_58_wdm_F","muzzle_snds_58_ghex_F","muzzle_snds_58_hex_F","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F","muzzle_snds_B_lush_F","muzzle_snds_B_arid_F"];

switch (_PSilencers) do
{
	case 1: {
				for "_i" from 0 to count (allUnits) - 1 do
				{
					_unit = allUnits select _i;
					
					_unit setDamage 0;	
				};		
			};
	case 2: {
				for "_i" from 0 to count (units group player) - 1 do
				{
					_unit = units group player select _i;
					
					_unit execVM "paramsplus\silencers.sqf";	
				};		
			};
	case 3: {	
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					
					_unit execVM "paramsplus\silencers.sqf";			
				};									
			};

	case 4: {	
				for "_i" from 0 to count (allUnits) - 1 do
				{
					_unit = (allUnits) select _i;
					
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
			};
};

