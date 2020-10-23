//////////////////////////////////////////////////////////////////
_unitvn		= vehicleVarName player;
_classname 	= format ["%1", typeOf player];
_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");
_unitname 	= [name player,name player,name player];
_unitrank   	= rank player;
_unitface	= face player;
_unitvoice	= speaker player;
_plyrgrp		= group player;	
_grpldr		= leader _plyrgrp;
_plyrlo		= getUnitLoadout player;

missionNamespace setVariable ["PlayerProfile",[_unitvn,_className,_displayName,_unitname,_unitrank,_unitface,_unitvoice,_plyrgrp,_grpldr,_plyrlo]];


_PlayerProfile = missionNamespace getVariable "PlayerProfile";

//hint format ["%1",_PlayerProfile];

playerRespawn = {
	for "_i" from 0 to 1 step 0 do
	{
		cutText ["respawning","BLACK IN", 5];
		
		_PlayerProfile = missionNamespace getVariable "PlayerProfile";
//		hint format ["%1",_PlayerProfile];
		_unitvn		= _PlayerProfile select 0;
		_className 	= _PlayerProfile select 1;
		_displayName = _PlayerProfile select 2;
		_unitname 	= _PlayerProfile select 3;
		_unitrank   	= _PlayerProfile select 4;
		_unitface	= _PlayerProfile select 5;
		_unitvoice	= _PlayerProfile select 6;
		_plyrgrp		= _PlayerProfile select 7;	
		_grpldr		= _PlayerProfile select 8;
		_plyrlo		= _PlayerProfile select 9;
		//_className createUnit [position, group, init, skill, rank]	getMarkerPos ["respawn_west", true];
		_className createUnit [getMarkerPos ["respawn_west", true], _plyrgrp, "selectPlayer this; addSwitchableUnit this;"];
		player setVehiclePosition [getMarkerPos ["respawn_west", true], [], 0, "CAN_COLLIDE"];
					
		[player, _unitvn] remoteExec ["setVehicleVarName", groupOwner _plyrgrp];

		[player, _unitrank] remoteExec ["setRank", groupOwner _plyrgrp];

		[player, _unitname] remoteExec ["setName", groupOwner _plyrgrp];

		[player, _unitface] remoteExec ["setFace", groupOwner _plyrgrp];
			
		[player, _unitvoice] remoteExec ["setSpeaker", groupOwner _plyrgrp];
			
		if (_grpldr isEqualTo _unitvn) then {[_plyrgrp, player] remoteExec ["selectLeader", groupOwner _plyrgrp];};
				
		player allowDamage false;
		 		 
		removeAllWeapons player;
		removeAllItems player;
		removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
							
	//	player setUnitLoadout _plyrlo;

//		[player] execVM "loadouts.sqf";

//		[player] execVM "loadoutAdjustments.sqf";

//		[player] execVM "playerSettings.sqf";

		[player] execVM "ParamsPlus\loadout_selection.sqf";
		
//		[player,0.15,.01] execVM "ParamsPlus\regen_health.sqf";
				
		[player] execVM "ParamsPlus\markerGroup.sqf";

		player action ["WEAPONONBACK", player];

		player execVM "ParamsPlus\HolsterWeapon.sqf";
		
		[player] execVM "RallyPoint.sqf";
																	
		BIS_DeathBlur ppEffectAdjust [0.0];
		BIS_DeathBlur ppEffectCommit 0.0;

		private _future = time + 10;
		waitUntil { time >= _future };

		[playerSide, "HQ"] commandChat format ["%1 respawned!",name player];
				
	  	waituntil{!alive player};
		(["HealthPP_black"] call bis_fnc_rscLayer) cutText ["","BLACK IN",8];
		//cutText ["respawning","BLACK IN", 5];
		call playerRespawn;
	};
};

//waitUntil {!alive player};
//call playerRespawn;

