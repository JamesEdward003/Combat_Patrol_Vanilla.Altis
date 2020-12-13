// "RespawnInventory.sqf" //
_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 2) exitWith {};

_classname 	= format ["%1", typeOf player];
_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");

[west, _displayname] call BIS_fnc_addRespawnInventory;

[missionNamespace,[_displayname,0,1]] call BIS_fnc_addRespawnInventory;

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

     