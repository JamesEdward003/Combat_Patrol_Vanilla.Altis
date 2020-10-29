/////--"paramsplus\loadoutAdjustments_group.sqf"--/////
_PloadoutAdjustments = "PloadoutAdjustments" call BIS_fnc_getParamValue;
if (_PloadoutAdjustments isEqualTo 3) exitWith {};
private ["_unit","_PloadoutAdjustments"];
switch (_this select 0) do
{
	case 1: {	
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					
					[_unit] execVM "paramsplus\loadoutAdjustments.sqf";			
				};									
	};
	case 2: {
				for "_i" from 0 to count (units group player) - 1 do
				{
					_unit = units group player select _i;
					
					[_unit] execVM "paramsplus\loadoutAdjustments.sqf";	
				};		
	};
};

