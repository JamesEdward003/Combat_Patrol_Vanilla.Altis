/////--"paramsplus\Regen_Health_Group.sqf"--/////
private ["_unit","_PRegenHealth"];
_PRegenHealth = "PRegenHealth" call BIS_fnc_getParamValue;
if (_PRegenHealth isEqualTo 1) exitWith {};

switch (_PRegenHealth) do
{
	case 1: 	{	
	
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					
					_unit setDamage 0;		
				};	
												
			};
	case 2: 	{
				//missionNameSpace setVariable ["RegenHealthVar",15];
				
				[missionNameSpace, "RegenHealthVar", 15] call BIS_fnc_setServerVariable;

				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
										
					_unit execVM "paramsplus\Regen_Health.sqf";	
				};			
			};
	case 3: 	{	
				//missionNameSpace setVariable ["RegenHealthVar",25];
				
				[missionNameSpace, "RegenHealthVar", 25] call BIS_fnc_setServerVariable;

				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
										
					_unit execVM "paramsplus\Regen_Health.sqf";		
				};									
			};
	case 4: 	{
				//missionNameSpace setVariable ["RegenHealthVar",35];
				
				[missionNameSpace, "RegenHealthVar", 35] call BIS_fnc_setServerVariable;
				
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
										
					_unit execVM "paramsplus\Regen_Health.sqf";			
				};			
			};
};

