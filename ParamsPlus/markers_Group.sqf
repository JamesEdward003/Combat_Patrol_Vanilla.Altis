/////--"paramsplus\markers_Group--/////
private ["_unit","_PMarkers"];
_PMarkers = "PMarkers" call BIS_fnc_getParamValue;
if (_PMarkers isEqualTo 1) exitWith {};

switch (_PMarkers) do
{
	case 1: {
				for "_i" from 0 to count (units group player) - 1 do
				{
					_unit = (units group player) select _i;
					
					_unit setDamage 0;			
				};			
	};
	case 2: {
				for "_i" from 0 to count (units group player) - 1 do
				{
					_unit = (units group player) select _i;
					
					_unit execVM "paramsplus\markers.sqf";			
				};			
	};
	case 3: {	
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					
					_unit execVM "paramsplus\markers.sqf";			
				};									
	};
	case 4: {
				for "_i" from 0 to count (allUnits) - 1 do
				{
					_unit = (allUnits) select _i;
					
					_unit execVM "paramsplus\markers.sqf";		
				};			
	};
};

