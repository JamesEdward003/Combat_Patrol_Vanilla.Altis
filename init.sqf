/// init.sqf /// Test 11-23-2020 
[playerSide, "HQ"] commandChat "Initiating Init!";

_PLoadOut = "PLoadOut" call BIS_fnc_getParamValue;
if (_PLoadOut isEqualTo 1) then 
{
	addMissionEventHandler ["entityKilled", { 
		params ["_unit"]; 
		if (_PRespawnLoadout isEqualTo 2 && !isPlayer _unit) then {
			_unit setVariable ["loadout", getUnitLoadout _unit];
		} else {
			_unit setVariable ["loadout", true];
		}
	}];

	addMissionEventHandler ["entityRespawned", { 
		params ["_unit"];
		if (!isNil {_unit getVariable "loadout"} && !isPlayer _unit) then {
			_unit setUnitLoadout {_unit getVariable "loadout"};
		};
	}]; 
};

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	{_x enableAi "MOVE"} forEach units group player;
}];

addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	_units setPos _pos;
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
{	// Ripped out of BIS_fnc_moduleRespawnVehicle by Karel Moricky
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

//Assault
[west, "B_SquadLeader"] call BIS_fnc_addRespawnInventory;
[west, "B_Autorifleman"] call BIS_fnc_addRespawnInventory;
[west, "B_Marksman"] call BIS_fnc_addRespawnInventory;
[west, "B_Grenadier"] call BIS_fnc_addRespawnInventory;
[west, "B_Rifleman"] call BIS_fnc_addRespawnInventory;
[west, "B_AT"] call BIS_fnc_addRespawnInventory;
[west, "B_Engineer"] call BIS_fnc_addRespawnInventory;
[west, "B_CombatLifesaver"] call BIS_fnc_addRespawnInventory;

//Limited Equipment
[west, "B_SquadLeader_L"] call BIS_fnc_addRespawnInventory;
[west, "B_Marksman_L"] call BIS_fnc_addRespawnInventory;
[west, "B_Autorifleman_L"] call BIS_fnc_addRespawnInventory;
[west, "B_Grenadier_L"] call BIS_fnc_addRespawnInventory;
[west, "B_Rifleman_L"] call BIS_fnc_addRespawnInventory;
[west, "B_AT_L"] call BIS_fnc_addRespawnInventory;
[west, "B_Engineer_L"] call BIS_fnc_addRespawnInventory;
[west, "B_CombatLifesaver_L"] call BIS_fnc_addRespawnInventory;

//Survivor
[west, "B_SquadLeader_S"] call BIS_fnc_addRespawnInventory;
[west, "B_Marksman_S"] call BIS_fnc_addRespawnInventory;
[west, "B_Autorifleman_S"] call BIS_fnc_addRespawnInventory;
[west, "B_Grenadier_S"] call BIS_fnc_addRespawnInventory;
[west, "B_Rifleman_S"] call BIS_fnc_addRespawnInventory;
[west, "B_AT_S"] call BIS_fnc_addRespawnInventory;
[west, "B_Engineer_S"] call BIS_fnc_addRespawnInventory;
[west, "B_CombatLifesaver_S"] call BIS_fnc_addRespawnInventory;

//Recon
[missionNamespace,["PETTKA",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["NORTHGATE",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["KERRY",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["MCKAY",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["JAMES",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["HARDY",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["JAY",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["DWARDEN",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["DWARDEN_SCOUT",0,1]] call BIS_fnc_addRespawnInventory;
[missionNamespace,["DWARDEN_DRESS",0,1]] call BIS_fnc_addRespawnInventory;

//[west, "PETTKA"] call BIS_fnc_addRespawnInventory;
//[west, "NORTHGATE"] call BIS_fnc_addRespawnInventory;
//[west, "KERRY"] call BIS_fnc_addRespawnInventory;
//[west, "MCKAY"] call BIS_fnc_addRespawnInventory;
//[west, "JAMES"] call BIS_fnc_addRespawnInventory;
//[west, "HARDY"] call BIS_fnc_addRespawnInventory;
//[west, "JAY"] call BIS_fnc_addRespawnInventory;
//[west, "DWARDEN"] call BIS_fnc_addRespawnInventory;     
     
//[missionNamespace,["PETTKA",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["NORTHGATE",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["KERRY",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["MCKAY",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["JAMES",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["HARDY",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["JAY",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["DWARDEN",1,1]] call BIS_fnc_addRespawnInventory;

     
     