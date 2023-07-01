//////////////////////////////////////////////////////////////////
_unitvn		= vehicleVarName player;
_type 		= typeOf player;
_unitname 	= ["William Taylor","William","Taylor"];
_unitrank   	= rank player;
_plyrgrp		= group player;
_grpldr		= leader _plyrgrp;

missionNamespace setVariable ["PlayerProfile",[_unitvn,_type,_unitname,_unitrank,_plyrgrp,_grpldr]];	

_pp = missionNamespace getVariable "PlayerProfile";

//hint format ["%1",_pp];

BIS_CP_respawn = {

	// --- respawn position setup (group leader)
	
	_mrkr = createMarker ["respawn_leader", position leader BIS_CP_grpMain];
	_null = [BIS_CP_grpMain, "respawn_leader", groupId BIS_CP_grpMain] call BIS_fnc_addRespawnPosition;
	
	// --- keep respawn on the leader
	
	_null = [] spawn {
		_oldPos = [0,0,0];
		while {TRUE} do {
			_pos = position leader BIS_CP_grpMain;
			if (_pos distance _oldPos > 5) then {
				"respawn_leader" setMarkerPos _pos;
				_oldPos = _pos;
			};
			sleep 5;
		};
	};
	/*
		_null = [] spawn {
			sleep 0.01;
			while {!visibleMap} do {
				openMap [TRUE, FALSE];
			};
			BIS_blackoutHandle = [] spawn {
				while {TRUE} do {
					waitUntil {!visibleMap};
					titleCut ["", "BLACK FADED", 9999];
					waitUntil {visibleMap};
					titleCut ["", "BLACK IN", 0.25];
				};
			};
			mapAnimAdd [0, 1, [worldSize / 2, worldSize / 2]];
			mapAnimCommit;
		};	
	_null = [] spawn {
		waitUntil {!isNil "BIS_CP_death"};
		if !(["BIS_CP_taskSurvive"] call BIS_fnc_taskCompleted) then {
			["BIS_CP_taskSurvive", "Failed"] call BIS_fnc_taskSetState;
		};
	};

	// --- heavy losses handle

	_null = [] spawn {
		[{([BIS_CP_grpMain] call BIS_fnc_respawnTickets) <= floor (BIS_CP_preset_tickets / 2)}, 1] call BIS_fnc_CPWaitUntil;
		call BIS_fnc_CPObjHeavyLosses;
	};

	//call BIS_fnc_CPObjBriefingSetup;

	if (isServer) then {
		[{missionNamespace getVariable ["BIS_CP_objectiveDone", FALSE] || missionNamespace getVariable ["BIS_CP_objectiveFailed", FALSE] || !isNil "BIS_CP_missionFail_death"}, 1] call BIS_fnc_CPWaitUntil;
		[{!isNil "BIS_CP_missionFail_death" || ({_x distance BIS_CP_exfilPos < 30 && alive _x} count units BIS_CP_grpMain == ({alive _x} count units BIS_CP_grpMain) && {alive _x} count units BIS_CP_grpMain > 0)}, 1] call BIS_fnc_CPWaitUntil;
		if !(isNil "BIS_CP_missionFail_death") exitWith {
			if (missionNamespace getVariable ["BIS_CP_objectiveDone", FALSE]) then {
				missionNamespace setVariable ["BIS_CP_ending", 5, TRUE];
			} else {
				missionNamespace setVariable ["BIS_CP_ending", 4, TRUE];
			}
		};
		["BIS_CP_taskExfil", "Succeeded"] call BIS_fnc_taskSetState;
		if (isNil "BIS_CP_death") then {
			["BIS_CP_taskSurvive", "Succeeded"] call BIS_fnc_taskSetState;
		};
		if (missionNamespace getVariable ["BIS_CP_objectiveDone", FALSE]) then {
			missionNamespace setVariable ["BIS_CP_ending", 1, TRUE];
		} else {
			if (([BIS_CP_grpMain] call BIS_fnc_respawnTickets) == 0 && {!alive _x} count units BIS_CP_grpMain > 0) then {
				missionNamespace setVariable ["BIS_CP_ending", 3, TRUE];
			} else {
				missionNamespace setVariable ["BIS_CP_ending", 2, TRUE];
			};
		};
	} else {
		[{(missionNamespace getVariable ["BIS_CP_ending", 0]) > 0}, 1] call BIS_fnc_CPWaitUntil;
	};
	if !(isDedicated) then {setPlayerRespawnTime 10};
	
	switch (BIS_CP_ending) do {
		case 1: {playSound selectRandom ["cp_exfil_successful_primary_done_1", "cp_exfil_successful_primary_done_2", "cp_exfil_successful_primary_done_3"];};
		case 2: {playSound selectRandom ["cp_exfil_successful_primary_failed_1", "cp_exfil_successful_primary_failed_2", "cp_exfil_successful_primary_failed_3"];};
		case 3: {playSound selectRandom ["cp_exfil_successful_primary_done_1", "cp_exfil_successful_primary_done_2", "cp_exfil_successful_primary_done_3"];};
		case 4: {playSound selectRandom ["cp_exfil_successful_primary_failed_1", "cp_exfil_successful_primary_failed_2", "cp_exfil_successful_primary_failed_3"];};
		case 5: {playSound selectRandom ["cp_exfil_successful_primary_failed_1", "cp_exfil_successful_primary_failed_2", "cp_exfil_successful_primary_failed_3"];};
	};
	
	missionNamespace setVariable format ["['BIS_CP_ending',%1]",missionNamespace getVariable "BIS_CP_ending"];
	missionNamespace setVariable format ["['BIS_CP_objectiveDone',%1]",missionNamespace getVariable "BIS_CP_objectiveDone"];
	missionNamespace setVariable format ["['BIS_CP_objectiveFailed',%1]",missionNamespace getVariable "BIS_CP_objectiveFailed"];
	missionNamespace setVariable format ["['BIS_CP_missionFail_death',%1]",missionNamespace getVariable "BIS_CP_missionFail_death"];
	missionNamespace setVariable format ["['BIS_CP_objectiveTimeout',%1]",missionNamespace getVariable "BIS_CP_objectiveTimeout"];
	missionNamespace setVariable format ["['BIS_CP_voting_countdown_end',%1]",missionNamespace getVariable "BIS_CP_voting_countdown_end"];
	missionNamespace setVariable format ["['BIS_CP_targetLocationPos',%1]",missionNamespace getVariable "BIS_CP_targetLocationPos"];
	missionNamespace setVariable format ["['BIS_CP_targetLocationID',%1]",missionNamespace getVariable "BIS_CP_targetLocationID"];
	missionNamespace setVariable format ["['BIS_CP_alarm',%1]",missionNamespace getVariable "BIS_CP_alarm"];
	missionNamespace setVariable format ["['BIS_forcerInsertionDir',%1]",missionNamespace getVariable "BIS_forcerInsertionDir"];
	missionNamespace setVariable format ["['BIS_CP_initDone',%1]",missionNamespace getVariable "BIS_CP_initDone"];
	missionNamespace setVariable format ["['BIS_CP_death',%1]",missionNamespace getVariable "BIS_CP_death"];
	sleep 3;
	if (hasInterface) then {
		player setVariable format ["['BIS_CP_votedFor',%1]",missionNamespace getVariable "BIS_CP_votedFor"];
		//forceRespawn player;

	// --- respawn position setup (group leader)

	_mrkr = createMarker ["respawn_leader", position leader BIS_CP_grpMain];
	_null = [BIS_CP_grpMain, "respawn_leader", groupId BIS_CP_grpMain] call BIS_fnc_addRespawnPosition;
	
	// --- keep respawn on the leader
	
	_null = [] spawn {
		_oldPos = [0,0,0];
		while {TRUE} do {
			_pos = position leader BIS_CP_grpMain;
			if (_pos distance _oldPos > 5) then {
				"respawn_leader" setMarkerPos _pos;
				_oldPos = _pos;
			};
			sleep 5;
		};
	};
	};

	switch (BIS_CP_ending) do {
		case 1: {playSound selectRandom ["cp_exfil_successful_primary_done_1", "cp_exfil_successful_primary_done_2", "cp_exfil_successful_primary_done_3"]; sleep 3; ["CPEndTotalVictory"] call BIS_fnc_endMission};
		case 2: {playSound selectRandom ["cp_exfil_successful_primary_failed_1", "cp_exfil_successful_primary_failed_2", "cp_exfil_successful_primary_failed_3"]; sleep 3; ["CPEndFullExfil"] call BIS_fnc_endMission};
		case 3: {["CPEndPartialExfil", FALSE] call BIS_fnc_endMission};
		case 4: {["CPEndAllDeadMissionFail", FALSE] call BIS_fnc_endMission};
		case 5: {["CPEndAllDeadMissionSuccess", FALSE] call BIS_fnc_endMission};
	};
BIS_CP_respawn = {
	missionNamespace setVariable format ["['BIS_CP_ending',%1]",missionNamespace getVariable "BIS_CP_ending"];
	missionNamespace setVariable format ["['BIS_CP_objectiveDone',%1]",missionNamespace getVariable "BIS_CP_objectiveDone"];
	missionNamespace setVariable format ["['BIS_CP_objectiveFailed',%1]",missionNamespace getVariable "BIS_CP_objectiveFailed"];
	missionNamespace setVariable format ["['BIS_CP_missionFail_death',%1]",missionNamespace getVariable "BIS_CP_missionFail_death"];
	missionNamespace setVariable format ["['BIS_CP_objectiveTimeout',%1]",missionNamespace getVariable "BIS_CP_objectiveTimeout"];
	missionNamespace setVariable format ["['BIS_CP_voting_countdown_end',%1]",missionNamespace getVariable "BIS_CP_voting_countdown_end"];
	missionNamespace setVariable format ["['BIS_CP_targetLocationPos',%1]",missionNamespace getVariable "BIS_CP_targetLocationPos"];
	missionNamespace setVariable format ["['BIS_CP_targetLocationID',%1]",missionNamespace getVariable "BIS_CP_targetLocationID"];
	missionNamespace setVariable format ["['BIS_CP_alarm',%1]",missionNamespace getVariable "BIS_CP_alarm"];
	missionNamespace setVariable format ["['BIS_forcerInsertionDir',%1]",missionNamespace getVariable "BIS_forcerInsertionDir"];
	missionNamespace setVariable format ["['BIS_CP_initDone',%1]",missionNamespace getVariable "BIS_CP_initDone"];
	missionNamespace setVariable format ["['BIS_CP_death',%1]",missionNamespace getVariable "BIS_CP_death"];
	sleep 3;
	if (hasInterface) then {
		player setVariable format ["['BIS_CP_votedFor',%1]",missionNamespace getVariable "BIS_CP_votedFor"];
		//forceRespawn player;
	};
};
call BIS_CP_respawn;
*/
};

playerRespawn = {
for "_i" from 0 to 1 step 0 do
{
	cutText ["respawning","BLACK IN", 5];
	
	_pp = missionNamespace getVariable "PlayerProfile";
	hint format ["%1",_pp];
	_unitvn		= _pp select 0;
	_type 		= _pp select 1;
	_unitname 	= _pp select 2;
	_unitrank   = _pp select 3;
	_plyrgrp	= _pp select 4; 
	_grpldr		= _pp select 5;
		//type createUnit [position, group, init, skill, rank]	getMarkerPos ["respawn_west", true];
		_type createUnit [getMarkerPos ["respawn_west", true], _plyrgrp, "selectPlayer this; addSwitchableUnit this;"];
		player setVehiclePosition [getMarkerPos ["respawn_west", true], [], 0, "CAN_COLLIDE"];
					
		[player, _unitvn] remoteExec ["setVehicleVarName", groupOwner _plyrgrp];

		[player, _unitrank] remoteExec ["setRank", groupOwner _plyrgrp];

		[player, _unitname] remoteExec ["setName", groupOwner _plyrgrp];
		
		if (_grpldr isEqualTo _unitvn) then {[_plyrgrp, player] remoteExec ["selectLeader", groupOwner _plyrgrp];};

		player call SF_TeamLeader_diver_dry;
				
		player execVM "ParamsPlus\markers.sqf";
		
		player execVM "ParamsPlus\loadoutAdjustments.sqf";
		
		player execVM "ParamsPlus\playerSettings.sqf";

		player execVM "ParamsPlus\RallyPoint.sqf";
		
		player execVM "ParamsPlus\RallyTent.sqf";

		player action ["WEAPONONBACK", player];

		BIS_DeathBlur ppEffectAdjust [0.0];
		BIS_DeathBlur ppEffectCommit 0.0;

		private _future = time + 10;
		waitUntil { time >= _future };

		[playerSide, "HQ"] commandChat format ["%1 respawned!",name player];

		private _future = time + 40;
		waitUntil { time >= _future };

		player execVM "ParamsPlus\menu.sqf";

		[player,"MenuSupport"] call BIS_fnc_addCommMenuItem;

		[playerSide, "HQ"] commandChat format ["Good Luck %1!",name player];

		waitUntil {!alive player};
		call playerRespawn;
		call BIS_CP_respawn;
	};
};

waitUntil {!alive player};
call playerRespawn;

