/////////////////////"onPlayerKilled.sqf"//////////////////////
private ["_oldUnit","_killer","_respawn","_respawnDelay"];
params ["_oldUnit","_killer","_respawn","_respawnDelay"];
_oldUnit = _this select 0;
missionNamespace setVariable["choosenBuilding", nil];
[_oldUnit,1000] execVM "chosenHeadquarters.sqf";

removeAllActions _oldUnit;

_oldUnit setVariable ["SavedLoadout",(getUnitLoadout _oldUnit)];

if (!isMultiPlayer) then {

	waitUntil { alive player };
		
	_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

	//if (_PRespawnLoadOut isEqualTo 2) then

	//{
		//player setUnitLoadout (getUnitLoadout _oldUnit);
		//player setUnitLoadout (_oldUnit getVariable "SavedLoadout");
	//};	

	waitUntil { !visibleMap OR !isNil "choosenBuilding" };
		
	if (!isNil "choosenBuilding") then {
		_chosenBuilding = missionNamespace getVariable "choosenBuilding";
		_building = _chosenBuilding select 0;
		_marker = _chosenBuilding select 1;

		waitUntil { alive player };
		
		uisleep 1;
			
		player setPos [(getMarkerPos _marker) select 0,(getMarkerPos _marker) select 1,0];
		//hint format ["%1,%2",_building,_marker];
		
		missionNamespace setVariable[ "choosenBuilding", nil];
		
		hint parseText format["<t size='1.25' color='#44ff00'>New headquarters selection successful</t>"];
		uisleep 5;	
		//Remove hint
		hint "";
	} else {		
		//Delete all markers
		waitUntil { !isNil "availableBuildings" };

		availableBuildings = ( missionNamespace getVariable "availableBuildings" );

		waitUntil { alive player };

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
};

