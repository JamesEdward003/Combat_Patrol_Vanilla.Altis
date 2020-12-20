/// init.sqf /// Test 11-23-2020 
[playerSide, "HQ"] commandChat "Initiating Init!";

addMissionEventHandler ["Loaded", {
	params ["_saveType"];
	"save"
}];
addMissionEventHandler ["Loaded", {
	params ["_saveType"];
	"autoSave"
}];
addMissionEventHandler ["Loaded", {
	params ["_saveType"];
	"continue"
}];

addMissionEventHandler ["EntityKilled", { 
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	removeAllActions _unit;
}];

//addMissionEventHandler ["EntityRespawned", { 
//	params ["_entity", "_corpse"];
//	if (!isPlayer _entity) then {
//	_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;
//	if (_PRespawnLoadOut isEqualTo 2) then
//		{
//			if (isNull _corpse) exitWith {};
//			_entity setUnitLoadout (getUnitLoadout _corpse);
//		};
//		_droppedGear = nearestObjects [_corpse, ["WeaponHolder", "WeaponHolderSimulated", "GroundWeaponHolder"], 10];
//        	sleep 5;
//            {deleteVehicle _x} forEach _droppedGear + [_corpse];
//	};
//}]; 

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	{_x enableAi "MOVE"} forEach units group player;
}];

addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	if (_shift) then {
	deleteVehicle LZ;
	if ((getMarkerPos "LZ") isEqualTo [0,0,0]) then {deleteMarker "LZ"};
	if (!((getMarkerPos "LZ") isEqualTo [0,0,0])) then {deleteMarker "LZ"};
	LZ = "Land_HelipadEmpty_F" createVehicle _pos;		  
	createMarkerLocal ["LZ", _pos];
	"LZ" setMarkerTypeLocal "mil_objective";
	"LZ" setMarkerShapeLocal "Icon";
	"LZ" setMarkerTextLocal " LZ";
	"LZ" setMarkerSizeLocal [1,1];
	"LZ" setMarkerColorLocal "colorblack";	
	hint parseText format["<t size='1.25' color='#44ff00'>Check Map Objective!</t>"];};
}];

addMissionEventHandler ["TeamSwitch", {
	params ["_previousUnit", "_newUnit"];
	_previousUnit enableAI "TeamSwitch";
}];

addMissionEventHandler ["GroupIconClick", {
	params [
		"_is3D", "_group", "_waypointId",
		"_mouseButton", "_posX", "_posY",
		"_shift", "_control", "_alt"
	];
	if (_shift) then {{_x allowDamage false} forEach units _group};
	if (_alt) then {{_x allowDamage true} forEach units _group};
}];

//_newVehicle call KS_fnc_vehicleRespawnNotification;
//or
//[_newVehicle] call KS_fnc_vehicleRespawnNotification;

KS_fnc_vehicleRespawnNotification =
{
	params [ ["_vehicle", objNull, [objNull]] ];
	
	if ( isNull _vehicle ) exitWith {};
	
	private _vehicleSide = [_vehicle, true] call bis_fnc_objectSide;
	private _cfgVeh = configfile >> "cfgvehicles" >> typeOf _vehicle;
	private _displayName = gettext (_cfgVeh >> "displayName");
	private _picture = (gettext (_cfgVeh >> "picture")) call bis_fnc_textureVehicleIcon;
	private _respawnName = format [localize "str_a3_bis_fnc_respawnmenuposition_grid",mapgridposition (position _vehicle)];
	[["RespawnVehicle",[_displayName, _respawnName, _picture]], "BIS_fnc_showNotification", _vehicleSide] call bis_fnc_mp;
};

[ "supportCalled", "onEachFrame",
{
	if ((player getVariable "BIS_SUPP_request") select 0 != "" && count ((player getVariable "BIS_SUPP_request") select 1) == 3 && (player getVariable "BIS_SUPP_selectedProvider") getVariable "BIS_SUPP_supporting") then {
		hint parseText format["<t size='1.25' color='#44ff00'>Support Called!</t>"];
	};
}
] call BIS_fnc_addStackedEventHandler;

[ "supportCalled", "onEachFrame", {
	if ( ( player getVariable "BIS_SUPP_request" ) select 0 == "Artillery" && ( player getVariable "bis_supp_selectedmodule" ) == arty_one && ( player getVariable "BIS_SUPP_selectedProvider" ) getVariable[ "BIS_SUPP_supporting", false ] ) then {
		//do what ever here
		hint parseText format["<t size='1.25' color='#44ff00'>Artillery Support Called!</t>"];
	};
}] call BIS_fnc_addStackedEventHandler;

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

["Preload"] call BIS_fnc_arsenal;

waitUntil { !isNil "BIS_CP_initDone" };
_startTime = time;
waitUntil {_startTime + 100 > time};
	
_PCivilians = "PCivilians" call BIS_fnc_getParamValue;

if (_PCivilians isEqualTo 2) then {
	
	if ( isNil { missionNamespace getVariable "StoryLines" } ) then {
	_texts = [ 
	["One...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Two...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Three...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Four...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Five...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Six...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."]
	];
		missionNamespace setVariable ["StoryLines",_texts];
	};

	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType"];
		copyToClipboard format ["%1,%2,%3,%4,%5,%6,%7,%8,%9,%10,%11", _channel, _owner, _from, _text, _person, _name, _strID, _forcedDisplay, _isPlayerMessage, _sentenceType, _chatMessageType];
		if (_chatMessageType isEqualTo 0) then {
		_texts = missionNamespace getVariable "StoryLines"; 
		_txts = _texts select 0;                                  
		[[(_txts select 0),1,4,1],[(_txts select 1),1,4,1],[(_txts select 2),1,4,1],[(_txts select 3),1,4,1]] spawn BIS_fnc_EXP_camp_SITREP;
		_texts = _texts - [_txts]; 
		missionNamespace setVariable ["StoryLines",_texts];};
	}];
};

//Adjust MARTA MILITARY ICONS distance to be seen from stock distance	
//[] spawn {
//	while {true} do {
//		sleep 2;
//		player setVariable [ "MARTA_REVEAL", allGroups select {side _x != playerSide && leader _x distance2D player < 300}];
//		player setVariable [ "MARTA_HIDE", allGroups select {side _x == playerSide or side _x == civilian or (leader _x distance2D player >= 300)}];
//	}
//};

    