/////--"paramsplus\Regen_Health_Group.sqf"--/////
_PRegenHealth = "PRegenHealth" call BIS_fnc_getParamValue;
if (_PRegenHealth isEqualTo 4) exitWith {};
private ["_unit","_PRegenHealth"];
switch (_this select 0) do
{
	case 1: 	{	
				missionNameSpace setVariable ["RegenHealthVar",15];
				
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
										
					[_unit] execVM "paramsplus\Regen_Health.sqf";			
				};									
			};
	case 2: 	{
				missionNameSpace setVariable ["RegenHealthVar",25];
				
				for "_i" from 0 to (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
										
					[_unit] execVM "paramsplus\Regen_Health.sqf";	
				};			
			};
	case 3: 	{	
				missionNameSpace setVariable ["RegenHealthVar",35];
				
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
										
					[_unit] execVM "paramsplus\Regen_Health.sqf";		
				};									
			};
	case 4: 	{
				for "_i" from 0 to (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					
					_unit setDamage 0;		
				};			
			};
};


//private _future = time + 12;
//waitUntil { time >= _future };

//[playerSide, "HQ"] commandChat "REGENERATIVE HEALTH ADJUSTMENTS SET!";
//uisleep 4;
//[playerSide, "HQ"] commandChat "Let the game begin!";
