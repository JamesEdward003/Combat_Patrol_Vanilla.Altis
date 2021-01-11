// _unit execVM "paramsplus\AiSkill.sqf" //
_unit = _this;

_AiSkill = switch true do {

	case (side _unit isEqualTo WEST) :  {

		AISkill = "Bskill" call BIS_fnc_getParamValue;
	};
	case (side _unit isEqualTo EAST) :  {

		AISkill = "Oskill" call BIS_fnc_getParamValue;
	};
	case (side _unit isEqualTo RESISTANCE) :  {

		AISkill = "Oskill" call BIS_fnc_getParamValue;
	};
	case (side _unit isEqualTo CIVILIAN) :  {

		AISkill = "Oskill" call BIS_fnc_getParamValue;
	};
};

switch (AISkill) do  {
		
//________________	Rookie	________________

	case 1: {
	
		if (((alive _unit)) && (!(_unit getVariable ["AISkill",false]))) then {
			_unit setSkill ["aimingAccuracy", 0.1 + (random 0.05)];
			_unit setSkill ["aimingShake", 0.1 + (random 0.05)];
			_unit setSkill ["aimingSpeed", 0.1 + (random 0.05)];
			_unit setSkill ["commanding", 0.1 + (random 0.05)];
			_unit setSkill ["courage", 0.1 + (random 0.05)];
			_unit setSkill ["general", 0.1 + (random 0.05)];
			_unit setSkill ["reloadSpeed", 0.1 + (random 0.05)];
			_unit setSkill ["spotDistance", 0.1 + (random 0.05)];
			_unit setSkill ["spotTime", 0.1+ (random 0.05)];
			};						
			_unit setVariable ["AISkill",true];
			{waitUntil {!alive _unit};
			_unit setVariable ["AISkill",false];		 

	};
	
//________________	Recruit	________________

	case 2: {
		
		if (((alive _unit)) && (!(_unit getVariable ["AISkill",false]))) then {
			_unit setSkill ["aimingAccuracy", 0.2 + (random 0.05)];
			_unit setSkill ["aimingShake", 0.2 + (random 0.05)];
			_unit setSkill ["aimingSpeed", 0.2 + (random 0.05)];
			_unit setSkill ["commanding", 0.2 + (random 0.05)];
			_unit setSkill ["courage", 0.2 + (random 0.05)];
			_unit setSkill ["general", 0.2 + (random 0.05)];
			_unit setSkill ["reloadSpeed", 0.2 + (random 0.05)];
			_unit setSkill ["spotDistance", 0.2 + (random 0.05)];
			_unit setSkill ["spotTime", 0.2+ (random 0.05)];
			};						
			_unit setVariable ["AISkill",true];
			{waitUntil {!alive _unit};
			_unit setVariable ["AISkill",false];		 

	};

//________________	Veteran	________________

	case 3: {	
		
		if (((alive _unit)) && (!(_unit getVariable ["AISkill",false]))) then {		
			_unit setSkill ["aimingAccuracy", 0.5 + (random 0.20)];
			_unit setSkill ["aimingShake", 0.5 + (random 0.20)];
			_unit setSkill ["aimingSpeed", 0.5 + (random 0.20)];
			_unit setSkill ["commanding", 0.5 + (random 0.20)];
			_unit setSkill ["courage", 0.5 + (random 0.20)];
			_unit setSkill ["general", 0.5 + (random 0.20)];
			_unit setSkill ["reloadSpeed", 0.5 + (random 0.20)];
			_unit setSkill ["spotDistance", 0.5 + (random 0.20)];
			_unit setSkill ["spotTime", 0.5 + (random 0.20)];
			};						
			_unit setVariable ["AISkill",true];
			{waitUntil {!alive _unit};
			_unit setVariable ["AISkill",false];		 
			
	};

//________________	Expert	________________

	case 4: {		
		
		if (((alive _unit)) && (!(_unit getVariable ["AISkill",false]))) then {	
			_unit setSkill ["aimingAccuracy", 0.75 + (random 0.25)];
			_unit setSkill ["aimingShake", 0.75 + (random 0.25)];
			_unit setSkill ["aimingSpeed", 0.75 + (random 0.25)];
			_unit setSkill ["commanding", 0.75 + (random 0.25)];
			_unit setSkill ["courage", 0.75 + (random 0.25)];
			_unit setSkill ["general", 0.75 + (random 0.25)];
			_unit setSkill ["reloadSpeed", 0.75 + (random 0.25)];
			_unit setSkill ["spotDistance", 0.75 + (random 0.25)];
			_unit setSkill ["spotTime", 0.75 + (random 0.25)];
			};						
			_unit setVariable ["AISkill",true];
			{waitUntil {!alive _unit};
			_unit setVariable ["AISkill",false];		 

	};


//________________	Random	________________	

	case 5:	{		
		
		if (((alive _unit)) && (!(_unit getVariable ["AISkill",false]))) then {
			_unit setSkill ["aimingAccuracy", 0.25 + (random 0.75)];
			_unit setSkill ["aimingShake", 0.25 + (random 0.75)];
			_unit setSkill ["aimingSpeed", 0.25 + (random 0.75)];
			_unit setSkill ["commanding", 0.25 + (random 0.75)];
			_unit setSkill ["courage", 0.25 + (random 0.75)];
			_unit setSkill ["general", 0.25 + (random 0.75)];
			_unit setSkill ["reloadSpeed", 0.25 + (random 0.75)];
			_unit setSkill ["spotDistance", 0.25 + (random 0.75)];
			_unit setSkill ["spotTime", 0.25+ (random 0.75)];
			};						
			_unit setVariable ["AISkill",true];
			{waitUntil {!alive _unit};
			_unit setVariable ["AISkill",false];		 

	};

};

