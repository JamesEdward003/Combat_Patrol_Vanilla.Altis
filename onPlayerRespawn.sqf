/////////////////////"onPlayerRespawn.sqf"//////////////////////////
private ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
params ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
waitUntil {!isNil "choosenBuilding"};
_chosenBuilding = missionNamespace getVariable "choosenBuilding";
_building = _chosenBuilding select 0;
_marker = _chosenBuilding select 1;

_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
if (_PLoadOut isEqualTo 1) then 
	{ 
		_newUnit setUnitLoadout {_newUnit getVariable "StoredUnitLoadOut"};
	};

_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;
if (_PRespawnLoadOut isEqualTo 2) then
	{
		_newUnit setUnitLoadout {_oldUnit getVariable "LoadoutDone"};
	};

_newUnit setPos getMarkerPos _marker;

