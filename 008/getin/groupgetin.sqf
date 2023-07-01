// "groupGetIn.sqf" ////////////////////////////////////////////////
private ["_vehicle","_caller","_unit"];
_vehicle = _this select 0;
_caller = _this select 1;

if ((_vehicle emptyPositions "Driver") isNotEqualTo 0) then {
	_units = (units group _caller) select {(vehicle _x isEqualTo _x)};
	for "_i" from 0 to (_vehicle emptyPositions "Driver") do {
		_unit = _units select _i;
		_unit assignAsDriver _vehicle;
		[_unit] orderGetIn true;
		_unit action ["getInDriver", _vehicle];
		sleep 2;
	};
};
if ((_vehicle emptyPositions "Gunner") isNotEqualTo 0) then {
	_units = (units group _caller) select {(vehicle _x isEqualTo _x)};
	for "_i" from 0 to (_vehicle emptyPositions "Gunner") do {
		_unit = _units select _i;
		_unit assignAsGunner _vehicle;
		[_unit] orderGetIn true;
		_unit action ["getInGunner", _vehicle];
		sleep 1;
	};
};
if ((_vehicle emptyPositions "Commander") isNotEqualTo 0) then {
	_units = (units group _caller) select {(vehicle _x isEqualTo _x)};
	for "_i" from 0 to (_vehicle emptyPositions "Commander") do {
		_unit = _units select _i;
		_unit assignAsCommander _vehicle;
		[_unit] orderGetIn true;
		_unit action ["getInCommander", _vehicle];
		sleep 1;
	};
};
if ((count ([typeOf _vehicle, true] call BIS_fnc_allTurrets)) isNotEqualTo 0) then {
	_units = (units group _caller) select {(vehicle _x isEqualTo _x)};
	_turretPos = ([typeOf _vehicle, true] call BIS_fnc_allTurrets);
	for "_i" from 0 to (count ([typeOf _vehicle, true] call BIS_fnc_allTurrets)) do {
		_unit = _units select _i;		
		_unit assignAsTurret [_vehicle, (_turretPos select _i)];
		[_unit] orderGetIn true;
		_unit action ["getInTurret", _vehicle, (_turretPos select _i)];
		sleep 1;
	};
};
if (((units group _caller) select {(vehicle _x isEqualTo _x)}) isNotEqualTo 0) then {
	_units = (units group _caller) select {(vehicle _x isEqualTo _x)};
	for "_i" from 0 to (_vehicle emptyPositions "") do {
		_unit = _units select _i;
		_unit assignAsCargo _vehicle;
		[_unit] orderGetIn true;
		_unit action ["getInCargo", _vehicle, _i];
		//_unit moveInCargo _vehicle;
		sleep 1;
	};
};
/*
if ((_vehicle emptyPositions "CargoFFV") isNotEqualTo 0) then {
	_units = (units group _caller) select {(vehicle _x isEqualTo _x)};
	for "_i" from 0 to (_vehicle emptyPositions "CargoFFV") do {
		_unit = _units select _i;
		_unit assignAsCargoIndex [_vehicle, _i];
		[_unit] orderGetIn true;
		_unit action ["getInCargo", _vehicle, _vehiclePosition];
		sleep 1;
	};
};
if ((_vehicle emptyPositions "CargoNoFFV") isNotEqualTo 0) then {
	_units = (units group _caller) select {(vehicle _x isEqualTo _x)};
	_vehiclePositionsCargoNoFFV = (_vehicle emptyPositions "CargoNoFFV");
	for "_i" from 0 to (_vehicle emptyPositions "CargoNoFFV") do {
		_unit = _units select _i;
		_unit assignAsCargoIndex [_vehicle, _i];
		[_unit] orderGetIn true;
		_unit action ["getInCargo", _vehicle, _vehiclePosition];
		sleep 1;
	};
};
*/

//allMapMarkers select {toUpper _x find "BIS_SUPP" >= 0}
//hintSilent parseText format["<t size='1' font='PuristaBold' color='#FFFF00'>Assigned Vehicle Role: %1</t>", assignedVehicleRole _caller];

