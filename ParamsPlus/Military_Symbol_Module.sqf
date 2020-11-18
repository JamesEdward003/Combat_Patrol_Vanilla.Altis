// "Military_Symbol_Module.sqf" //
//private ["_PSymbols"];
//_PSymbols = "PSymbols" call BIS_fnc_getParamValue;
//if (_PSymbols isEqualTo 1) exitWith {};

switch (_this select 0) do
{
	case 1: 	{
		
				setGroupIconsVisible [false,false];	

			};
	case 2: 	{

				setGroupIconsVisible [true,false];
	
			};
			
	case 3: 	{	

				setGroupIconsVisible [false,true];

			};
	case 4: 	{	

				setGroupIconsVisible [true,true];
								
			};
};

