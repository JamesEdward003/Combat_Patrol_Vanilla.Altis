/////////////////////   "RespawnScript.sqf"   //////////////////////
private ["_oldUnit","_killer","_respawn","_respawnDelay"];
params ["_oldUnit","_killer","_respawn","_respawnDelay"];
_oldUnit = _this select 0;

[_oldUnit, 20, 100] execVM "primePos.sqf";

[_oldUnit, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;

_oldUnit setVariable["Saved_Loadout",getUnitLoadout _oldUnit];


{ _x addEventHandler ["killed",{[]call RespawnScript}];
} forEach (if ismultiplayer then {playableunits} else {switchableunits});


