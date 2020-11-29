/// init.sqf /// Test 11-23-2020 
[playerSide, "HQ"] commandChat "Initiating Init!";


	addMissionEventHandler ["EntityKilled", { 
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		removeAllActions _unit;
	}];

	addMissionEventHandler ["EntityRespawned", { 
		params ["_entity", "_corpse"];
		if (!isPlayer _entity) then {
		_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;
		if (_PRespawnLoadOut isEqualTo 2) then
			{
				if (isNull _corpse) exitWith {};
				_entity setUnitLoadout (getUnitLoadout _corpse);
			};
			_droppedGear = nearestObjects [_corpse, ["WeaponHolder", "WeaponHolderSimulated", "GroundWeaponHolder"], 10];
        	sleep 5;
            {deleteVehicle _x} forEach _droppedGear + _corpse;
		};
	}]; 

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	{_x enableAi "MOVE"} forEach units group player;
}];

//addMissionEventHandler ["MapSingleClick", {
//	params ["_units", "_pos", "_alt", "_shift"];
//	"respawn_west" setMarkerPos _pos;
//	respawn_west setPos _pos;
//}];

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

     