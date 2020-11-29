/////////////////////"onPlayerRespawn.sqf"//////////////////////////
private ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
params ["_newUnit","_oldUnit","_respawn","_respawnDelay"];
	
_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 2) then

{
	//_newUnit setUnitLoadout (getUnitLoadout _oldUnit);
	_newUnit setUnitLoadout (_oldUnit getVariable "SavedLoadout");
};	

waitUntil { !visibleMap OR !isNil "choosenBuilding" };
	
if (!isNil "choosenBuilding") then {
	_chosenBuilding = missionNamespace getVariable "choosenBuilding";
	_building = _chosenBuilding select 0;
	_marker = _chosenBuilding select 1;
	
	_newUnit setPos [(getMarkerPos _marker) select 0,(getMarkerPos _marker) select 1,0];
	hint format ["%1,%2",_building,_marker];
	
	missionNamespace setVariable[ "choosenBuilding", nil];
	
	hint parseText format["<t size='1.25' color='#44ff00'>New headquarters selection successful</t>"];
	uisleep 5;	
	//Remove hint
	hint "";
} else {		
	//Delete all markers
	availableBuildings = ( missionNamespace getVariable "availableBuildings" );

		//Delete all markers
		{
			_x params["","_marker"];
			deleteMarkerLocal _marker;
		} forEach availableBuildings;

	//Remove this event
	//ctrlRemoveEventHandler[ "MouseButtonDblClick", CEH_MBDC ];
	
	missionNamespace setVariable[ "choosenBuilding", nil];
	
	hint parseText format["<t size='1.25' color='#ff6161'>New headquarters selection canceled</t>"];
	uisleep 5;
	//Remove hint
	hint "";
};
