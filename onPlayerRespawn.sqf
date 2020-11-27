/////////////////////"onPlayerRespawn.sqf"//////////////////////////
private ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
params ["_newUnit","_oldUnit","_respawn","_respawnDelay"];

waitUntil {(!visiblemap OR !alive _newUnit)};

if (isNil "choosenBuilding") then {
			
	_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

	if (_PRespawnLoadOut isEqualTo 2) then

	{
		_newUnit setUnitLoadout (getUnitLoadout _oldUnit);
	};

} else {
	
	_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

	if (_PRespawnLoadOut isEqualTo 2) then

	{
		_newUnit setUnitLoadout (getUnitLoadout _oldUnit);
	};	

	_chosenBuilding = missionNamespace getVariable "choosenBuilding";
	
	_building = _chosenBuilding select 0;
	
	_marker = _chosenBuilding select 1;

	_newUnit setPos getMarkerPos _marker;
	
	missionNamespace setVariable[ "choosenBuilding", nil];
};


