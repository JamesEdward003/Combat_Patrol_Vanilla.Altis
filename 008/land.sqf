// land.sqf //
_vehicle 	= _this select 0;
_caller 	= _this select 1;   
if (_caller == vehicle _caller) then {_vehicle = cursorTarget} else {_vehicle = vehicle player};
_vehicle land "LAND"; PAPABEAR=[(side _vehicle),"HQ"]; PAPABEAR SideChat "Vehicle landing, engines off";
uisleep 10;
_vehicle land "LAND";
	if (isEngineOn _vehicle) then { 
		_vehicle engineOn false; 
		(driver _vehicle) action ["engineOff", _vehicle];};

