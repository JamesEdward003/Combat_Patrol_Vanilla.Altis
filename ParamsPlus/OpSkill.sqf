/////--"paramsplus\OpSkill--/////
// [side,skillMin,skillAimMin,skillMax,skillAimMax] call BIS_fnc_EXP_camp_setSkill
private ["_unit","_OSkill"];
_OSkill = "OSkill" call BIS_fnc_getParamValue;

switch (_OSkill) do
{
	case 1: {
		
			[EAST,0.1,0.2,0.6,0.6] call BIS_fnc_EXP_camp_setSkill;									
	};
	case 2: {

			[EAST,0.2,0.3,0.7,0.7] call BIS_fnc_EXP_camp_setSkill;					
	};
	case 3: {
		
			[EAST,0.3,0.4,0.8,0.8] call BIS_fnc_EXP_camp_setSkill;									
	};
	case 4: {

			[EAST,0.4,0.5,0.9,0.9] call BIS_fnc_EXP_camp_setSkill;						
	};
};

[playerSide, "HQ"] commandChat "OPFOR SKILL SET!";

