/////--"ParamsPlus\Rally.sqf--/////
_PRallyPoint = "PRallyPoint" call BIS_fnc_getParamValue;
if (_PRallyPoint isEqualTo 1) exitWith {};

switch (_PRallyPoint) do
{
	case 1: {	
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;

					_unit setDamage 0;			
				};									
			};
	case 2: {
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;

					if (isPlayer _unit) then {_unit execVM "paramsplus\rallypoint.sqf";};			
				};						
			};
};

