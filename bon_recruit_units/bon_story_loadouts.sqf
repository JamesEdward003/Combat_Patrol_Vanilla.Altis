/////////   execVM "bon_story_loadouts.sqf"   ///////////
_unit 		= _this select 0;
_loadout 	= [];
	
switch (typeOf _unit) do {

	case "B_Captain_Pettka_F":				{_loadout = _unit call Pettka_Special};
	case "B_CTRG_soldier_GL_LAT_F":			{_loadout = _unit call NorthGate_TeamLeader};
	case "B_Story_Protagonist_F":			{_loadout = _unit call Kerry_Special};
	case "B_CTRG_soldier_engineer_exp_F":	{_loadout = _unit call Explosives_Specialist};
	case "B_CTRG_soldier_AR_A_F":			{_loadout = _unit call McKay_Special};
	case "B_CTRG_soldier_M_medic_F":		{_loadout = _unit call Combat_Life_Saver};
	case "B_Captain_Jay_F":					{_loadout = _unit call McKay_Special};
};
	
uisleep 1;

_unit setVariable ["loadoutDone", true, true];
