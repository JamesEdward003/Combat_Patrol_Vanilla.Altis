/////--"paramsplus\OpSkill--/////
//hint format ["%1",_this select 0];
switch (_this select 0) do
{
	case 1: {
		
			[EAST,0.1,0.2,0.7,0.6] call BIS_fnc_EXP_camp_setSkill;									
	};
	case 2: {

			[EAST,0.2,0.3,0.7,0.7] call BIS_fnc_EXP_camp_setSkill;					
	};
	case 3: {
		
			[EAST,0.3,0.4,0.8,0.7] call BIS_fnc_EXP_camp_setSkill;									
	};
	case 4: {

			[EAST,0.4,0.5,0.9,0.8] call BIS_fnc_EXP_camp_setSkill;						
	};
};


//private _future = time + 12;
//waitUntil { time >= _future };

//[playerSide, "HQ"] commandChat "OPFOR SKILL SET!";
//uisleep 4;
//[playerSide, "HQ"] commandChat "Let the game begin!";