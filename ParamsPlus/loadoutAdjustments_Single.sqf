/////--"paramsplus\loadoutAdjustments_Single.sqf"--/////
switch (_this select 0) do
{
	case 1: 	{	
	
				[_this select 1] execVM "paramsplus\loadoutAdjustments.sqf";	
											
			};
	
	case 2: 	{

				[_this select 1] setDamage 0;		
				
			};
};


//private _future = time + 12;
//waitUntil { time >= _future };

//[playerSide, "HQ"] commandChat "LOADOUT ADJUSTMENTS SET!";
//uisleep 4;
//[playerSide, "HQ"] commandChat "Let the game begin!";
