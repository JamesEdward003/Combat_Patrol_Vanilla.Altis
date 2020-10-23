/// init.sqf ///
["Preload"] call BIS_fnc_arsenal;
_vdist = viewdistance;
setviewdistance (2 * _vdist);

waitUntil {!isNil "BIS_CP_initDone"};

//addMissionEventHandler ["entityKilled", { 
//    params ["_unit"]; 
//    if (isNil {_unit getVariable "loadout"} && !isPlayer _unit) then {
//      _unit setVariable ["loadout", getUnitLoadout _unit];
//    };
//}];

//addMissionEventHandler ["entityRespawned", { 
//    params ["_unit"];
//    if (!isNil {_unit getVariable "loadout"} && !isPlayer _unit) then {
//    _unit setUnitLoadout {_unit getVariable "loadout"};
//    };
//}]; 

//addMissionEventHandler ["Map", {
//	params ["_mapIsOpened", "_mapIsForced"];
//	{_x enableAi "MOVE"} forEach units group player;
//}];

//addMissionEventHandler ["MapSingleClick", {
//	params ["_units", "_pos", "_alt", "_shift"];
//}];

//addMissionEventHandler ["TeamSwitch", {
//	params ["_previousUnit", "_newUnit"];
//}];

addMissionEventHandler ["GroupIconClick", {
	params [
		"_is3D", "_group", "_waypointId",
		"_mouseButton", "_posX", "_posY",
		"_shift", "_control", "_alt"
	];
	if (_shift) then {{_x allowDamage false} forEach units _group};
	if (_alt) then {{_x allowDamage true} forEach units _group};
}];

//execVM "drawIcons.sqf";

//private _future = time + 30;
//waitUntil { time >= _future };

//[missionNamespace, "arsenalClosed", {
//	player setVariable ["ready",true,true];
//}] remoteExecCall ["BIS_fnc_addScriptedEventHandler",[0,-2] select isDedicated];
//waitUntil {{_x getVariable ["ready",false]} count allPlayers >= (playersNumber west +playersNumber east +playersNumber civilian +playersNumber independent)};
//systemChat "DONE";

