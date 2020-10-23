/////////////////////"onPlayerRespawn.sqf"//////////////////////////
private ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
params ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
waitUntil {!isNil "choosenBuilding"};
_chosenBuilding = missionNamespace getVariable "choosenBuilding";
_building = _chosenBuilding select 0;
_marker = _chosenBuilding select 1;
	
_newUnit setPos getMarkerPos _marker;

[_newUnit] execVM "ParamsPlus\playerSettings.sqf";

_newUnit setUnitLoadOut [(missionNameSpace getVariable "StoredUnitLoadOut"),true];

