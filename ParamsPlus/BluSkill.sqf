/////--"ParamsPlus\BluSkill--/////
switch (_this select 0) do
{
	case 1: {
		
			[WEST,0.1,0.2,0.7,0.6] call BIS_fnc_EXP_camp_setSkill;									
	};
	case 2: {

			[WEST,0.2,0.3,0.7,0.7] call BIS_fnc_EXP_camp_setSkill;					
	};
	case 3: {
		
			[WEST,0.3,0.4,0.8,0.7] call BIS_fnc_EXP_camp_setSkill;								
	};
	case 4: {

			[WEST,0.4,0.5,0.9,0.8] call BIS_fnc_EXP_camp_setSkill;						
	};
};

[playerSide, "HQ"] commandChat "BLUFOR SKILL SET!";

