/////////////////		execVM "SpawnTeam.sqf"	 //////////////////
switch (side player) do {
	
	case west: {
		
		_reUnits_w = ["B_Captain_Pettka_F","B_Captain_Jay_F","B_CTRG_soldier_AR_A_F","B_CTRG_soldier_GL_LAT_F","B_Story_Protagonist_F","B_CTRG_soldier_engineer_exp_F","B_CTRG_soldier_M_medic_F"];
			
		_reGrp_w = [(screenToWorld [0.5,0.5]), side player, _reUnits_w, [[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0]],["Captain","Captain","Lieutenant","Sergeant","Sergeant","Corporal","Corporal"],[],[],[],0] call BIS_fnc_spawnGroup;	

		for "_i" from 0 to count (units _reGrp_w) do {
			
			 _unit = (units _reGrp_w) select _i;
			 
			[_unit] execVM "ParamsPlus\loadouts.sqf";
			[_unit] execVM "ParamsPlus\loadouts_diver.sqf";
			[_unit] execVM "ParamsPlus\loadoutAdjustments.sqf";
			[_unit] execVM "ParamsPlus\markerGroup.sqf";
			[_unit] execVM "ParamsPlus\regen_health.sqf";
			[_unit] joinSilent (group player);
			 _unit addAction ["<t color='#00FFFF'>Dismiss</t>",BON_RECRUIT_PATH+"dismiss.sqf",[],100,false,true,""];
			 _unit action ["WEAPONONBACK", _unit];																	
			 _unit allowDamage true;
		};
	};		
	case east: {		//_reUnits_e_diver = ["O_diver_TL_F","O_diver_exp_F","O_diver_F"];
		
		_reUnits_e = ["O_Story_Colonel_F","O_Story_CEO_F","O_officer_F","O_A_soldier_TL_F","O_Soldier_GL_F","O_Soldier_AT_F","O_soldier_M_F","O_A_soldier_F","O_soldier_exp_F","O_engineer_F","O_soldier_mine_F","O_medic_F"];
		
		_reGrp_e = [(screenToWorld [0.5,0.5]), side player, _reUnits_e, [[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0]],["Colonel","Major","Captain","Captain","Lieutenant","Lieutenant","Lieutenant","Sergeant","Sergeant","Sergeant","Corporal","Corporal"],[],[],[],0] call BIS_fnc_spawnGroup;
					
		for "_i" from 0 to count (units _reGrp_e) do {
			
			 _unit = (units _reGrp_e) select _i;
			
			[_unit] execVM "ParamsPlus\loadouts_e.sqf";
			[_unit] execVM "ParamsPlus\loadouts_e_diver.sqf";
			[_unit] execVM "ParamsPlus\loadoutAdjustments.sqf";
			[_unit] execVM "ParamsPlus\markerGroup.sqf";
			[_unit] execVM "ParamsPlus\regen_health.sqf";
			[_unit] joinSilent (group player);
			 _unit addAction ["<t color='#00FFFF'>Dismiss</t>",BON_RECRUIT_PATH+"dismiss.sqf",[],100,false,true,""];
			 _unit action ["WEAPONONBACK", _unit];																	
			 _unit allowDamage true;
		};
	};		
	case resistance: {	//_reUnits_r_diver = ["I_diver_TL_F","I_diver_exp_F","I_diver_F"];
		
		_reUnits_r = ["I_Story_Colonel_F","I_Captain_Hladas_F","I_Story_Officer_01_F","I_Story_Crew_F","I_engineer_F","I_soldier_mine_F","I_medic_F"];
		
		_reGrp_r = [(screenToWorld [0.5,0.5]), side player, _reUnits_r, [[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0],[0,4,0]],["Colonel","Captain","Lieutenant","Sergeant","Sergeant","Corporal","Corporal"],[],[],[],0] call BIS_fnc_spawnGroup;	

		for "_i" from 0 to count (units _reGrp_r) do {
			
			 _unit = (units _reGrp_r) select _i;
			
			[_unit] execVM "ParamsPlus\loadouts_g.sqf";
			[_unit] execVM "ParamsPlus\loadouts_g_diver.sqf";
			[_unit] execVM "ParamsPlus\loadoutAdjustments.sqf";
			[_unit] execVM "ParamsPlus\markerGroup.sqf";
			[_unit] execVM "ParamsPlus\regen_health.sqf";
			[_unit] joinSilent (group player);
			 _unit addAction ["<t color='#00FFFF'>Dismiss</t>",BON_RECRUIT_PATH+"dismiss.sqf",[],100,false,true,""];
			 _unit action ["WEAPONONBACK", _unit];																	
			 _unit allowDamage true;
		};
	};
};

