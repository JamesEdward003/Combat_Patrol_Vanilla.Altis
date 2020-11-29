/////--"paramsplus\playerSettings_Group.sqf"--/////
private ["_unit","_PSettings"];
_PSettings = "PSettings" call BIS_fnc_getParamValue;
if (_PSettings isEqualTo 1) exitWith {};

switch (_PSettings) do
{
	case 1: {
		
			for "_i" from 0 to count (units group player) - 1 do
			
				{
					_unit = (units group player) select _i;
				
				switch true do 
				
					{
						case (side _unit isEqualTo WEST) :  {
						
							if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};

							_unit action ["WEAPONONBACK", _unit];

							if (isPlayer _unit) then {

							[playerSide, "HQ"] commandChat "Player Settings - None!";

							};

							_unit setDamage 0;
								
						};
						case (side _unit isEqualTo EAST) :  {
													
							_unit execVM "paramsplus\playerSettings.sqf";
						};
						case (side _unit isEqualTo RESISTANCE) :  {
																			
							_unit execVM "paramsplus\playerSettings.sqf";
						};
						case (side _unit isEqualTo CIVILIAN) :  {
						
							_unit setDamage 0;	
						};
					};		
				};						
			};
	case 2: {	
					
			for "_i" from 0 to count (units group player) - 1 do
			
				{
					_unit = (units group player) select _i;

				switch true do 
				
					{
						case (side _unit isEqualTo WEST) :  {
																					
							_unit execVM "paramsplus\playerSettings.sqf";	
						};
						case (side _unit isEqualTo EAST) :  {
													
							_unit execVM "paramsplus\playerSettings.sqf";
						};
						case (side _unit isEqualTo RESISTANCE) :  {
																			
							_unit execVM "paramsplus\playerSettings.sqf";
						};
						case (side _unit isEqualTo CIVILIAN) :  {
						
							_unit setDamage 0;	
						};
					};		
				};						
			};
	case 3: {
				
			for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
			
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
				
				switch true do 
				
					{
						case (side _unit isEqualTo WEST) :  {
							
							_unit execVM "paramsplus\playerSettings.sqf";	
						};
						case (side _unit isEqualTo EAST) :  {
							
							_unit execVM "paramsplus\playerSettings.sqf";	
						};
						case (side _unit isEqualTo RESISTANCE) :  {
													
							_unit execVM "paramsplus\playerSettings.sqf";
						};
						case (side _unit isEqualTo CIVILIAN) :  {
						
							_unit setDamage 0;	
						};
					};		
				};	
			};					
};

