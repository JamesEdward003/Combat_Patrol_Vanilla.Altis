// "UnlimitedAmmo_Group.sqf" //
private ["_unit","_BI_CP_UnlimitedAmmo"];
_BI_CP_UnlimitedAmmo = "BI_CP_UnlimitedAmmo" call BIS_fnc_getParamValue;
if (_BI_CP_UnlimitedAmmo isEqualTo 1) exitWith {};

switch (_BI_CP_UnlimitedAmmo) do
{
	case 1: {
		
			for "_i" from 0 to count (units group _unit) - 1 do
			
				{
					_unit = (units group _unit) select _i;
				
				switch true do 
				
					{
						case (side _unit isEqualTo WEST) :  {
						
							if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};

							_unit action ["WEAPONONBACK", _unit];

							if (isPlayer _unit) then {

							[playerSide, "HQ"] commandChat format ["%1, Unlimited Ammo Not Installed!",name _unit];

							};

							_unit setDamage 0;
								
						};
						case (side _unit isEqualTo EAST) :  {
													
							_unit execVM "UnlimitedAmmo.sqf";
						};
						case (side _unit isEqualTo RESISTANCE) :  {
																			
							_unit execVM "UnlimitedAmmo.sqf";
						};
						case (side _unit isEqualTo CIVILIAN) :  {
													
							_unit execVM "UnlimitedAmmo.sqf";
						};
					};		
				};						
			};
	case 2: {	
					
			for "_i" from 0 to count (units group _unit) - 1 do
			
				{
					_unit = (units group _unit) select _i;

				switch true do 
				
					{
						case (side _unit isEqualTo WEST) :  {
																					
							_unit execVM "UnlimitedAmmo.sqf";	
						};
						case (side _unit isEqualTo EAST) :  {
													
							_unit execVM "UnlimitedAmmo.sqf";
						};
						case (side _unit isEqualTo RESISTANCE) :  {
																			
							_unit execVM "UnlimitedAmmo.sqf";
						};
						case (side _unit isEqualTo CIVILIAN) :  {
													
							_unit execVM "UnlimitedAmmo.sqf";
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
													
							_unit execVM "UnlimitedAmmo.sqf";	
						};
						case (side _unit isEqualTo EAST) :  {
													
							_unit execVM "UnlimitedAmmo.sqf";	
						};
						case (side _unit isEqualTo RESISTANCE) :  {
													
							_unit execVM "UnlimitedAmmo.sqf";
						};
						case (side _unit isEqualTo CIVILIAN) :  {
													
							_unit execVM "UnlimitedAmmo.sqf";	
						};
					};		
				};	
			};					
};

