/////--"ParamsPlus\RallyTent_Group.sqf--/////
_PRallyTent = "PRallyTent" call BIS_fnc_getParamValue;
if (_PRallyTent isEqualTo 1) exitWith {};

switch (_PRallyTent) do
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

					if ((isPlayer _unit) && (isFormationLeader _unit)) then {_unit execVM "paramsplus\rallytent.sqf"};			
				};						
			};
};

