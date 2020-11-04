/// init.sqf ///
[playerSide, "HQ"] commandChat "Initiating Init!";

_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
if (_PLoadOut isEqualTo 1) then 
{
	addMissionEventHandler ["entityKilled", { 
		params ["_unit"]; 
		if (_PRespawnLoadout isEqualTo 2 && !isPlayer _unit) then {
			_unit setVariable ["loadout", getUnitLoadout _unit];
		} else {
			_unit setVariable ["loadout", true];
		}
	}];

	addMissionEventHandler ["entityRespawned", { 
		params ["_unit"];
		if (!isNil {_unit getVariable "loadout"} && !isPlayer _unit) then {
			_unit setUnitLoadout {_unit getVariable "loadout"};
		};
	}]; 
};

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	{_x enableAi "MOVE"} forEach units group player;
}];

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



