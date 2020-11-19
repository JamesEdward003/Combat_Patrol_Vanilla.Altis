/// init.sqf ///
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

//addMissionEventHandler ["MapSingleClick", {
//	params ["_units", "_pos", "_alt", "_shift"];
//}];

//addMissionEventHandler ["TeamSwitch", {
//	params ["_previousUnit", "_newUnit"];
//}];

addMissionEventHandler ["GroupIconClick", {
	params [
		"_is3D", "_group", "_waypointId",
		"_mouseButton", "_posX", "_posY",
		"_shift", "_control", "_alt"
	];
	if (_shift) then {{_x allowDamage false} forEach units _group};
	if (_alt) then {{_x allowDamage true} forEach units _group};
}];

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

//_newVehicle call KS_fnc_vehicleRespawnNotification;
//or
//[_newVehicle] call KS_fnc_vehicleRespawnNotification;

[ "supportCalled", "onEachFrame",
{
	if ((player getVariable "BIS_SUPP_request") select 0 != "" && count ((player getVariable "BIS_SUPP_request") select 1) == 3 && (player getVariable "BIS_SUPP_selectedProvider") getVariable "BIS_SUPP_supporting") then {
		hint parseText format["<t size='1.25' color='#44ff00'>Support Called!</t>"];
	};
}
] call BIS_fnc_addStackedEventHandler;

//[ "supportCalled", "onEachFrame", {
//	if ( ( player getVariable "BIS_SUPP_request" ) select 0 == "Artillery" && ( player getVariable "bis_supp_selectedmodule" ) == arty_one && ( player getVariable "BIS_SUPP_selectedProvider" ) getVariable[ "BIS_SUPP_supporting", false ] ) then {
//		//do what ever here
//		hint parseText format["<t size='1.25' color='#44ff00'>Arty_One is providing support!</t>"];
//	};
//}] call BIS_fnc_addStackedEventHandler;

