// ReleaseHeli.sqf //
_vehicle 	= _this select 0;
_caller 	= _this select 1;    
_actionID 	= _this select 2; 

_vehicle removeAction _actionID;

_vehicle setVariable ["ReleaseHeli", 1];

_vehicle setVariable ["ActionAdded", 0];

if (!isEngineOn _vehicle) then { 
	_vehicle engineOn true; 
	(driver _vehicle) action ["engineOn", _vehicle];
};

(leader ((group _vehicle))) setBehaviour "AWARE";

waitUntil {!(alive _caller) || !(alive _vehicle) || (time > time + 20)};

_vehicle setVariable ["ReleaseHeli", 0];

_vehicle VehicleChat "Transport to next position!";
