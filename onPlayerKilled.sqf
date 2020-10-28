/////////////////////"onPlayerKilled.sqf"//////////////////////
private ["_oldUnit","_killer","_respawn","_respawnDelay"];
params ["_oldUnit","_killer","_respawn","_respawnDelay"];
_oldUnit= _this select 0;
missionNamespace setVariable["choosenBuilding", nil];
[_oldUnit,1000] execVM "chosenHeadquarters.sqf";

_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
if (_PLoadOut isEqualTo 3) then 
	{ 
		_storeGear = getUnitLoadOut _oldUnit;
		_oldUnit setVariable ["StoredUnitLoadOut", _storeGear];
	};
	
