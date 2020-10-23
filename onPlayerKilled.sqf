/////////////////////"onPlayerKilled.sqf"//////////////////////
private ["_oldUnit","_killer","_respawn","_respawnDelay"];
params ["_oldUnit","_killer","_respawn","_respawnDelay"];
_oldUnit= _this select 0;
missionNamespace setVariable["choosenBuilding", nil];
[_oldUnit,1000] execVM "chosenHeadquarters.sqf";

_storeGear = getUnitLoadOut _oldUnit;
missionNameSpace setVariable ["StoredUnitLoadOut", _storeGear];
