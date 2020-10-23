/////--"paramsplus\groupMarkers--/////
_PMarkers = "PMarkers" call BIS_fnc_getParamValue;
if (_PMarkers isEqualTo 3) exitWith {};
private ["_unit","_PMarkers"];
switch (_this select 0) do
{
	case 1: {	
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					
					[_unit] execVM "paramsplus\markerGroup.sqf";			
				};									
	};
	case 2: {
				for "_i" from 0 to count (units group player) - 1 do
				{
					_unit = (units group player) select _i;
					
					[_unit] execVM "paramsplus\markerGroup.sqf";			
				};			
	};
	case 3: {
				for "_i" from 0 to count (units group player) - 1 do
				{
					_unit = (units group player) select _i;
					
					_unit setDamage 0;			
				};			
	};
};


//private _future = time + 12;
//waitUntil { time >= _future };

//[playerSide, "HQ"] commandChat "GROUP MARKERS SET!";
//uisleep 4;
//[playerSide, "HQ"] commandChat "Let the game begin!";
