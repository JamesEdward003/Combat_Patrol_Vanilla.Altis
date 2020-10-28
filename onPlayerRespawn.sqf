/////////////////////"onPlayerRespawn.sqf"//////////////////////////
private ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
params ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
waitUntil {!isNil "choosenBuilding"};
_chosenBuilding = missionNamespace getVariable "choosenBuilding";
_building = _chosenBuilding select 0;
_marker = _chosenBuilding select 1;

_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
if (_PLoadOut isEqualTo 3) then 
	{ 
		_unit setUnitLoadout {_unit getVariable "StoredUnitLoadOut"};
	};	
	
_newUnit setPos getMarkerPos _marker;

