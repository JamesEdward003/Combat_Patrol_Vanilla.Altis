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
/*
if !(player getVariable ["civSuitPowers_eh",false]) then
{
	[
		"checkEquippedUniform",
		"onEachFrame",
		{
			params ["_unit"];
			_civSuitArray = [U_NikosAgedBody,U_OrestesBody,U_C_Poor_1,U_C_Poor_2,U_C_Poloshirt_burgundy,U_C_WorkerCoveralls,U_C_Poor_shorts_1];
			if (uniform _unit in _civSuitArray) then
			{
				[ [], "fnc_civSuitPowers", _unit ] call BIS_fnc_MP;
				Civilian setFriend [East, 1];
				East setFriend [Civilian, 1];
				Civilian setFriend [West, 1];
				West setFriend [Civilian, 1];
				Civilian setFriend [Resistance, 1];
				Resistance setFriend [Civilian, 1];
			}
			else
			{
				Civilian setFriend [East, 0];
				East setFriend [Civilian, 0];
				Civilian setFriend [West, 0];
				West setFriend [Civilian, 0];
				Civilian setFriend [Resistance, 0];
				Resistance setFriend [Civilian, 0];
			};
		},
		[player]
	] call BIS_fnc_addStackedEventHandler;
	player setVariable ["civSuitPowers_eh",true];
};
*/








