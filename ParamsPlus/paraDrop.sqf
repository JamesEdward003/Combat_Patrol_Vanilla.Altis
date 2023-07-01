////////////////  "ParamsPlus\paraDrop.sqf"  //////////////////
private ["_caller","_position","_target","_is3D","_id"];
params ["_caller","_position","_target","_is3D","_id"];
_caller = _this select 0;
_position = _this select 1;

switch (side _caller) do {
	
	case west: {
			
	_reUnits_w = ["B_Captain_Jay_F","B_CTRG_soldier_AR_A_F","B_CTRG_soldier_GL_LAT_F","B_Story_Protagonist_F","B_CTRG_soldier_engineer_exp_F","B_CTRG_soldier_M_medic_F"];
	_unitrank = ["captain","lieutenant","sergeant","sergeant","sergeant","corporal","corporal"];
		
	if (_position isEqualTo []) then { 
		_position = (screenToWorld [0.5,0.5]);
	} else {
		_position = [_position select 0, _position select 1, 200];
	};

	for "_i" from 0 to count _reUnits_w -1 do {
		_type = _reUnits_w select _i;
		_rank = _unitrank select _i;
		_displayname = gettext (configfile >> "CfgVehicles" >> _type >> "displayName");
		_unit = (group _caller) createUnit [_type, _position, [], 0, "FORM"];
		_group	= group _unit;
		_unit allowDamage false;

		_text = toArray(str _group);
		_text set[0,"**DELETE**"];
		_text set[1,"**DELETE**"];
		_text = _text - ["**DELETE**"];
		_grp = toString(_text);
		_grpCount = (units group _unit) find _unit;
		
		_varname = format ["%1_"+"%2",_grp,_grpCount];			
		
		[_unit, _rank] remoteExec ["setRank", groupOwner (group _caller)];
		[_unit, _varname] remoteExec ["setVehicleVarName", groupOwner (group _caller)];
			
		_chute = createVehicle ["NonSteerable_Parachute_F", (getPos _unit), [], 0, "FLY"];
		_chute setPos (getPos _unit);
		_unit moveinDriver _chute;
		
		_unit execVM "ParamsPlus\loadouts_diver.sqf";
		_unit execVM "ParamsPlus\loadouts.sqf";	
		_unit execVM "ParamsPlus\nightvision.sqf";
		_unit execVM "ParamsPlus\silencers.sqf";
		_unit execVM "ParamsPlus\regen_health.sqf";
		_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
		_unit execVM "ParamsPlus\markers.sqf";
		_unit execVM "ParamsPlus\playerSettings.sqf";
		_unit addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],100,false,true,""];

		_unit allowDamage true;
	};
	_box = createVehicle ["B_supplyCrate_F", _position, [], 0, "FLY"];
	_box setPos _position;
//	_chute = createVehicle ["B_Parachute_02_F", (getPos _box), [], 0, "FLY"];
//	_box attachto [_chute, [0, 0, 0]];
	[objnull, _box] call BIS_fnc_curatorobjectedited;
	waitUntil {sleep 1; !isNil "_box"};   
	["AmmoboxInit", [_box, true, {true}]] spawn BIS_fnc_arsenal;
	waitUntil {((getPos _box) select 2) < 1};
	detach _box;
	"SmokeShellgreen" createVehicle getPos _box;
	"F_40mm_White" createVehicle [getPos _box select 0,getPos _box select 1,+150];
	};
	case east: {
			
	_reUnits_e = ["O_Soldier_GL_F","O_Soldier_AT_F","O_soldier_M_F","O_soldier_exp_F","O_engineer_F","O_soldier_mine_F","O_medic_F"];
	_unitrank = ["captain","lieutenant","sergeant","sergeant","sergeant","corporal","corporal"];
		
	if (_position isEqualTo []) then { 
		_position = (screenToWorld [0.5,0.5]);
	} else {
		_position = [_position select 0, _position select 1, 200];
	};

	for "_i" from 0 to count _reUnits_e -1 do {
		_type = _reUnits_e select _i;
		_rank = _unitrank select _i;
		_displayname = gettext (configfile >> "CfgVehicles" >> _type >> "displayName");
		_unit = (group _caller) createUnit [_type, _position, [], 0, "FORM"];
		_group	= group _unit;
		_unit allowDamage false;

		_text = toArray(str _group);
		_text set[0,"**DELETE**"];
		_text set[1,"**DELETE**"];
		_text = _text - ["**DELETE**"];
		_grp = toString(_text);
		_grpCount = (units group _unit) find _unit;
		
		_varname = format ["%1_"+"%2",_grp,_grpCount];			
		
		[_unit, _rank] remoteExec ["setRank", groupOwner (group _caller)];
		[_unit, _varname] remoteExec ["setVehicleVarName", groupOwner (group _caller)];
		
		_chute = createVehicle ["NonSteerable_Parachute_F", (getPos _unit), [], 0, "FLY"];
		_chute setPos (getPos _unit);
		_unit moveinDriver _chute;
		
		_unit execVM "ParamsPlus\loadouts_e_diver.sqf";
		_unit execVM "ParamsPlus\loadouts_e.sqf";	
		_unit execVM "ParamsPlus\nightvision.sqf";
		_unit execVM "ParamsPlus\silencers.sqf";
		_unit execVM "ParamsPlus\regen_health.sqf";
		_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
		_unit execVM "ParamsPlus\markers.sqf";
		_unit execVM "ParamsPlus\playerSettings.sqf";
		_unit addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],100,false,true,""];

		_unit allowDamage true;
	};
	_box = createVehicle ["B_supplyCrate_F", _position, [], 0, "FLY"];
	_box setPos _position;
//	_chute = createVehicle ["B_Parachute_02_F", (getPos _box), [], 0, "FLY"];
//	_box attachto [_chute, [0, 0, 0]];
	[objnull, _box] call BIS_fnc_curatorobjectedited;
	waitUntil {sleep 1; !isNil "_box"};   
	["AmmoboxInit", [_box, true, {true}]] spawn BIS_fnc_arsenal;
	waitUntil {((getPos _box) select 2) < 1};
	detach _box;
	"SmokeShellgreen" createVehicle getPos _box;
	"F_40mm_White" createVehicle [getPos _box select 0,getPos _box select 1,+150];
	};
	case resistance: {
			
	_reUnits_r = ["I_Story_Colonel_F","I_Captain_Hladas_F","I_Story_Officer_01_F","I_Soldier_LAT_F","I_engineer_F","I_soldier_mine_F","I_medic_F"];
	_unitrank = ["captain","lieutenant","sergeant","sergeant","sergeant","corporal","corporal"];
		
	if (_position isEqualTo []) then { 
		_position = (screenToWorld [0.5,0.5]);
	} else {
		_position = [_position select 0, _position select 1, 200];
	};

	for "_i" from 0 to count _reUnits_r -1 do {
		_type = _reUnits_r select _i;
		_rank = _unitrank select _i;
		_displayname = gettext (configfile >> "CfgVehicles" >> _type >> "displayName");
		_unit = (group _caller) createUnit [_type, _position, [], 0, "FORM"];
		_group	= group _unit;
		_unit allowDamage false;

		_text = toArray(str _group);
		_text set[0,"**DELETE**"];
		_text set[1,"**DELETE**"];
		_text = _text - ["**DELETE**"];
		_grp = toString(_text);
		_grpCount = (units group _unit) find _unit;
		
		_varname = format ["%1_"+"%2",_grp,_grpCount];			
		
		[_unit, _rank] remoteExec ["setRank", groupOwner (group _caller)];
		[_unit, _varname] remoteExec ["setVehicleVarName", groupOwner (group _caller)];
		
		_chute = createVehicle ["NonSteerable_Parachute_F", (getPos _unit), [], 0, "FLY"];
		_chute setPos (getPos _unit);
		_unit moveinDriver _chute;
		
		_unit execVM "ParamsPlus\loadouts_r_diver.sqf";
		_unit execVM "ParamsPlus\loadouts_r.sqf";	
		_unit execVM "ParamsPlus\nightvision.sqf";
		_unit execVM "ParamsPlus\silencers.sqf";
		_unit execVM "ParamsPlus\regen_health.sqf";
		_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
		_unit execVM "ParamsPlus\markers.sqf";
		_unit execVM "ParamsPlus\playerSettings.sqf";
		_unit addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],100,false,true,""];

		_unit allowDamage true;
	};
	_box = createVehicle ["B_supplyCrate_F", _position, [], 0, "FLY"];
	_box setPos _position;
//	_chute = createVehicle ["B_Parachute_02_F", (getPos _box), [], 0, "FLY"];
//	_box attachto [_chute, [0, 0, 0]];
	[objnull, _box] call BIS_fnc_curatorobjectedited;
	waitUntil {sleep 1; !isNil "_box"};   
	["AmmoboxInit", [_box, true, {true}]] spawn BIS_fnc_arsenal;
	waitUntil {((getPos _box) select 2) < 1};
	detach _box;
	"SmokeShellgreen" createVehicle getPos _box;
	"F_40mm_White" createVehicle [getPos _box select 0,getPos _box select 1,+150];
	};
	case civilian: {
			
	_reUnits_c = ["C_Orestes","C_man_p_fugitive_F_euro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_p_beggar_F_afro","C_man_w_worker_F","C_man_polo_2_F"];

	_unitrank = ["captain","lieutenant","sergeant","sergeant","sergeant","corporal","corporal"];
		
	if (_position isEqualTo []) then { 
		_position = (screenToWorld [0.5,0.5]);
	} else {
		_position = [_position select 0, _position select 1, 200];
	};

	for "_i" from 0 to count _reUnits_c -1 do {
		_type = _reUnits_c select _i;
		_rank = _unitrank select _i;
		_displayname = gettext (configfile >> "CfgVehicles" >> _type >> "displayName");
		_unit = (group _caller) createUnit [_type, _position, [], 0, "FORM"];
		_group	= group _unit;
		_unit allowDamage false;

		_text = toArray(str _group);
		_text set[0,"**DELETE**"];
		_text set[1,"**DELETE**"];
		_text = _text - ["**DELETE**"];
		_grp = toString(_text);
		_grpCount = (units group _unit) find _unit;
		
		_varname = format ["%1_"+"%2",_grp,_grpCount];			
		
		[_unit, _rank] remoteExec ["setRank", groupOwner (group _caller)];
		[_unit, _varname] remoteExec ["setVehicleVarName", groupOwner (group _caller)];
		
		_chute = createVehicle ["NonSteerable_Parachute_F", (getPos _unit), [], 0, "FLY"];
		_chute setPos (getPos _unit);
		_unit moveinDriver _chute;

		_unit setUnitLoadout selectRandom ["I_engineer_F","I_soldier_mine_F","I_medic_F","I_soldier_F","I_Soldier_A_F","I_Soldier_LAT_F","I_Soldier_M_F","I_Soldier_AR_F","I_Soldier_TL_F","I_Soldier_SL_F"]; 
		[_unit, selectRandom ["I_engineer_F","I_soldier_mine_F","I_medic_F","I_soldier_F","I_Soldier_A_F","I_Soldier_LAT_F","I_Soldier_M_F","I_Soldier_AR_F","I_Soldier_TL_F","I_Soldier_SL_F"]] remoteExec ["setIdentity", 0, _unit];		
//		_unit execVM "ParamsPlus\loadout_group_unit.sqf";
		_unit setVariable ["LoadoutDone", true];
		_unit action ["WEAPONONBACK", _unit];
		_unit execVM "ParamsPlus\nightvision.sqf";
		_unit execVM "ParamsPlus\silencers.sqf";
		_unit execVM "ParamsPlus\regen_health.sqf";
		_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
		_unit execVM "ParamsPlus\markers.sqf";
		_unit execVM "ParamsPlus\playerSettings.sqf";
		_unit addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],100,false,true,""];

		_unit allowDamage true;
	};
	_box = createVehicle ["B_supplyCrate_F", _position, [], 0, "FLY"];
	_box setPos _position;
//	_chute = createVehicle ["B_Parachute_02_F", (getPos _box), [], 0, "FLY"];
//	_box attachto [_chute, [0, 0, 0]];
	[objnull, _box] call BIS_fnc_curatorobjectedited;
	waitUntil {sleep 1; !isNil "_box"};   
	["AmmoboxInit", [_box, true, {true}]] spawn BIS_fnc_arsenal;
	waitUntil {((getPos _box) select 2) < 1};
	detach _box;
	"SmokeShellgreen" createVehicle getPos _box;
	"F_40mm_White" createVehicle [getPos _box select 0,getPos _box select 1,+150];
	};
};


