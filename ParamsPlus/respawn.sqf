///////  execVM "respawn.sqf"  ///////
_unitvn		= vehicleVarName player;
_classname 	= format ["%1", typeOf player];
_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");
_unitname 	= [name player,name player,name player];
_unitrank   	= rank player;
_unitface	= face player;
_unitvoice	= speaker player;
_unitskill	= skill player;
_plyrgrp		= group player;	
_grpldr		= leader _plyrgrp;
_plyrlo		= getUnitLoadout player;

missionNamespace setVariable ["PlayerProfile",[_unitvn,_className,_displayName,_unitname,_unitrank,_unitface,_unitvoice,_unitskill,_plyrgrp,_grpldr,_plyrlo]];

_PlayerProfile = missionNamespace getVariable "PlayerProfile";

//hint format ["%1",_PlayerProfile];

//copyToClipboard format ["%1",_PlayerProfile];

playerRespawn = {

	cutText ["respawning","BLACK IN", 5];
	
	_PlayerProfile = missionNamespace getVariable "PlayerProfile";
	
//	hint format ["%1",_PlayerProfile];

//	copyToClipboard format ["%1",_PlayerProfile];

		_unitvn		= _PlayerProfile select 0;
		_className 	= _PlayerProfile select 1;
		_displayName = _PlayerProfile select 2;
		_unitname 	= _PlayerProfile select 3;
		_unitrank   	= _PlayerProfile select 4;
		_unitface	= _PlayerProfile select 5;
		_unitvoice	= _PlayerProfile select 6;
		_unitskill	= _PlayerProfile select 7;
		_plyrgrp		= _PlayerProfile select 8;	
		_grpldr		= _PlayerProfile select 9;
		_plyrlo		= _PlayerProfile select 10;
		//_className createUnit [position, group, init, skill, rank]	getMarkerPos ["respawn_west", true];
		 _className createUnit [getMarkerPos ["respawn_west", true], _plyrgrp, "selectPlayer this; addSwitchableUnit this;"];
		 player setVehiclePosition [getMarkerPos ["respawn_west", true], [], 0, "CAN_COLLIDE"];
					
		[player, _unitvn] remoteExec ["setVehicleVarName", groupOwner _plyrgrp];

		[player, _unitrank] remoteExec ["setRank", groupOwner _plyrgrp];

		[player, _unitname] remoteExec ["setName", groupOwner _plyrgrp];

		[player, _unitface] remoteExec ["setFace", groupOwner _plyrgrp];
			
		[player, _unitvoice] remoteExec ["setSpeaker", groupOwner _plyrgrp];
		
		[player, _unitskill] remoteExec ["setSkill", groupOwner _plyrgrp];
				
		if (_grpldr isEqualTo _unitvn) then {[_plyrgrp, player] remoteExec ["selectLeader", groupOwner _plyrgrp];};
								
_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;
if (_PRespawnLoadOut isEqualTo 2) then 
{
	player setUnitLoadOut _plyrlo;
	player setVariable ["LoadoutDone", true];
};

execVM "ParamsPlus\Military_Symbol_Module.sqf";
execVM "ParamsPlus\loadouts_diver_selection.sqf";
execVM "ParamsPlus\loadout_selection.sqf";
execVM "ParamsPlus\UnlimitedAmmo_Group.sqf";
execVM "ParamsPlus\nightvision_Group.sqf";
execVM "ParamsPlus\silencers_Group.sqf";
execVM "ParamsPlus\markers_Group.sqf";
execVM "ParamsPlus\regen_health_Group.sqf";
execVM "ParamsPlus\CtrlM_Medic.sqf";
execVM "ParamsPlus\GiGoEH_Group.sqf";
execVM "ParamsPlus\RallyPoint_Group.sqf";

player action ["WEAPONONBACK", player];

execVM  "briefing.sqf";

openmap [false,false];

BIS_DeathBlur ppEffectAdjust [0.0];
BIS_DeathBlur ppEffectCommit 0.0;

if ( isNil{player getVariable "CommAirLift"} ) then
{	
	[player,"AirLift"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommAirLift", true];	
};
if ( isNil{player getVariable "CommArty"} ) then
{	
	[player,"Artillery"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommArty", true];	
};
if ( isNil{player getVariable "CommHalo"} ) then
{	
	[player,"HaloJump"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommHalo", true];	
};
if ( isNil{player getVariable "CommCargo"} ) then
{	
	[player,"SpawnCargoDrop"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommCargo", true];	
};
if ( isNil{player getVariable "CommMortar"} ) then
{	
	[player,"SpawnMortar"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommMortar", true];	
};
if ( isNil{player getVariable "CommMortarBag"} ) then
{	
	[player,"SpawnMortarBag"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommMortarBag", true];	
};
if ( isNil{player getVariable "CommParaDrop"} ) then
{	
	[player,"SpawnParaDrop"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommParaDrop", true];	
};
if ( isNil{player getVariable "CommReenforcements"} ) then
{	
	[player,"SpawnReenforcements"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommReenforcements", true];	
};
if ( isNil{player getVariable "CommWindSpeed"} ) then
{	
	[player,"WindSpeed"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommWindSpeed", true];	
};
if ( isNil{player getVariable "CommZorilya"} ) then
{	
	[player,"ZorilyasUnits"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommZorilya", true];	
};
if ( isNil{player getVariable "CommGroupManager"} ) then
{	
	execVM "Group_Manager.sqf";
	player setVariable ["CommGroupManager", true];	
};

		private _future = time + 10;
		waitUntil { time >= _future };

		[playerSide, "HQ"] commandChat format ["%1 respawned!",name player];
				
		waitUntil {!alive player};
		call playerRespawn;
//	};
};

waitUntil {!alive player};
call playerRespawn;

