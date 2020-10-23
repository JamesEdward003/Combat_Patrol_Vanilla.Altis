/////--"paramsplus\loadout_selection_single.sqf"--/////
switch (_this select 0) do
{
	case 1: 	{

				[_this select 1] execVM "paramsplus\loadouts_diver.sqf";

			};					

	case 2: 	{

				[_this select 1] execVM "paramsplus\loadouts.sqf";
						
			};
};

//private _future = time + 12;
//waitUntil { time >= _future };

//[playerSide, "HQ"] commandChat "LOADOUTS SELECTED!";
//uisleep 4;
//[playerSide, "HQ"] commandChat "Let The Game Begin!";
