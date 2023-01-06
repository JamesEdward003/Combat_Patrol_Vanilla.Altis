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
				
		[player] execVM "markerGroup.sqf";
		
		[player] execVM "loadoutAdjustments.sqf";
		
		[player] execVM "playerSettings.sqf";

		player action ["WEAPONONBACK", player];

		[player] execVM "RallyPoint.sqf";
																	
		BIS_DeathBlur ppEffectAdjust [0.0];
		BIS_DeathBlur ppEffectCommit 0.0;

		private _future = time + 10;
		waitUntil { time >= _future };

		[playerSide, "HQ"] commandChat format ["%1 respawned!",name player];
				
		waitUntil {!alive player};
		call playerRespawn;
	};
};

waitUntil {!alive player};
call playerRespawn;

