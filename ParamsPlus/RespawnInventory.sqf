// "RespawnInventory.sqf" //
_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 2) exitWith {};

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

     