//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////
_vehicle 	= _this select 0;
_caller 	= _this select 1;   
if (_caller == vehicle _caller) then {_vehicle = cursorTarget} else {_vehicle = vehicle player};

_vehicle addAction ["Service", "008\x_reload.sqf",[],3,false,true,"","_this distance _target<8"]; 

player commandChat format["%1 addaction by %2", typeOf _vehicle, name _caller];
