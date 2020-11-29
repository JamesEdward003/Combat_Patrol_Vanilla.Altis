/////--"paramsplus\nightvision_group.sqf"--/////
private ["_unit","_PNightVision"];
_PNightVision = "PNightVision" call BIS_fnc_getParamValue;
if (_PNightVision isEqualTo 1) exitWith {};

_nvList = ["NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","NVGoggles_tna_F","NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F","O_NVGoggles_ghex_F","O_NVGoggles_grn_F","O_NVGoggles_hex_F","O_NVGoggles_urb_F","Integrated_NVG_F","Integrated_NVG_TI_0_F","Integrated_NVG_TI_1_F"];
switch (_PNightVision) do
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
					_unit = (units group player) select _i;
					
					_unit execVM "paramsplus\nightvision.sqf";	
				};		
			};
	case 3: {	
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					
					_unit execVM "paramsplus\nightvision.sqf";			
				};									
			};
	case 4: {	
				for "_i" from 0 to count (allUnits) - 1 do
				{
					_unit = (allUnits) select _i;
					
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
				};									
			};
};

