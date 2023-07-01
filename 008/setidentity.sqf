//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
private ["_vehicle","_crewIDs","_unit","_i"];
_vehicle = _this select 0;

_crewIDs = ["Pilot1","CoPilot1","Gunner1","Gunner2","Gunner3"];

//hintSilent format ["%1",crew _vehicle]; copyToClipboard format ["%1",crew _vehicle];

for "_i" from 0 to count (crew _vehicle) - 1 do {

	_unit = (crew _vehicle) select _i;
	
	_unit setIdentity (_crewIDs select _i);		
};	

