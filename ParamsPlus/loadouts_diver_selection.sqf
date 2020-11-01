/////--"paramsplus\loadouts_diver_selection.sqf"--/////
_PDiverEquip = "PDiverEquip" call BIS_fnc_getParamValue;
if (_PDiverEquip isEqualTo 1) exitWith {};
private ["_unit","_PDiverEquip"];
switch (_this select 0) do
{				
	case 1: {
				for "_i" from 0 to count (units group player) - 1 do
				{
					_unit = (units group player) select _i;
				
				switch true do 
					{
						case (side _unit isEqualTo WEST) :  {
						
							_unit setDamage 0;	
						};
						case (side _unit isEqualTo EAST) :  {

							_unit setDamage 0;
						};
						case (side _unit isEqualTo RESISTANCE) :  {
						
							_unit setDamage 0;
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
						
							_unit addEventHandler ["Respawn",{_this execVM "paramsplus\loadouts.sqf"}];
							
							[_unit] execVM "paramsplus\loadouts.sqf";	
						};
						case (side _unit isEqualTo EAST) :  {

							_unit addEventHandler ["Respawn",{_this execVM "paramsplus\loadouts_e.sqf"}];
													
							[_unit] execVM "paramsplus\loadouts_e.sqf";
						};
						case (side _unit isEqualTo RESISTANCE) :  {
						
							_unit addEventHandler ["Respawn",{_this execVM "paramsplus\loadouts_g.sqf"}];
													
							[_unit] execVM "paramsplus\loadouts_g.sqf";
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
						
							_unit addEventHandler ["Respawn",{_this execVM "paramsplus\loadouts_diver.sqf"}];
							
							[_unit] execVM "paramsplus\loadouts_diver.sqf";	
						};
						case (side _unit isEqualTo EAST) :  {
						
							_unit addEventHandler ["Respawn",{_this execVM "paramsplus\loadouts_e_diver.sqf"}];
							
							[_unit] execVM "paramsplus\loadouts_e_diver.sqf";	
						};
						case (side _unit isEqualTo RESISTANCE) :  {
						
							_unit addEventHandler ["Respawn",{_this execVM "paramsplus\loadouts_g_diver.sqf"}];
							
							[_unit] execVM "paramsplus\loadouts_g_diver.sqf";
						};
						case (side _unit isEqualTo CIVILIAN) :  {
						
							_unit setDamage 0;	
						};
					};		
				};	
			};	
};
