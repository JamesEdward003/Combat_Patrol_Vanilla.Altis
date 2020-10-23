/////--"ParamsPlus\Rally.sqf--/////
switch (_this select 0) do
{
	case 1: {	
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					if (isPlayer _unit) then {[_unit] execVM "paramsplus\rallypoint.sqf";};			
				};									
	};
	case 2: {
				for "_i" from 0 to count (if ismultiplayer then {playableunits} else {switchableunits}) - 1 do
				{
					_unit = (if ismultiplayer then {playableunits} else {switchableunits}) select _i;
					_unit setDamage 0;			
				};							
	};
};


//private _future = time + 12;
//waitUntil { time >= _future };

//[playerSide, "HQ"] commandChat "GROUP MARKERS SET!";
//uisleep 4;
//[playerSide, "HQ"] commandChat "Let the game begin!";
