// "assignGetIn.sqf" //
_unit = _this select 0;

_vehicles = [];
// find and add in all the different vehicles used.

{
_veh = vehicle _x;
if (_veh != _x AND !(_veh in _vehicles)) then {_vehicles = _vehicles + [_veh]};
} foreach units group _this;

assignGetIn = false; publicVariable "assignGetIn";
waitUntil {assignGetIn};

// first add a driver to all of the able vehicles.
{
_veh = _x;
if (canMove _veh) then {
	{
		_unit = _x;
		if (isNull (assignedVehicle _unit) AND isNull (assignedDriver _veh)) then {
			_unit enableAI "MOVE";
			_unit assignAsDriver _veh;
			[_unit] orderGetin true;
		};
	} foreach units group _this;
};
} foreach _vehicles;

// second add a gunner to all of the able vehicles.
{
_veh = _x;
if (canMove _veh) then {
	{
		_unit = _x;
		if (isNull (assignedVehicle _unit) AND isNull (assignedGunner _veh)) then {
			_unit enableAI "MOVE";
			_unit assignAsGunner _veh;
			[_unit] orderGetin true;
		};
	} foreach units group _this;
};
} foreach _vehicles;

// third add a gunner to all of the able vehicles.
{
_veh = _x;
if (canMove _veh) then {
	{
		_unit = _x;
		if (isNull (assignedVehicle _unit) AND isNull (assignedCommander _veh)) then {
			_unit enableAI "MOVE";
			_unit assignAsCommander _veh;
			[_unit] orderGetin true;
		};
	} foreach units group _this;
};
} foreach _vehicles;

// last add in cargo rest of group.
{
_veh = _x;
if (canMove _veh) then {
	_freeCargo = _veh emptyPositions "Cargo";
	{
		_unit = _x;
		if (isNull (assignedVehicle _unit) AND _freeCargo != 0) then {
			_freeCargo = _freeCargo - 1;
			_unit enableAI "MOVE";
			_unit assignAsCargo _veh;
			[_unit] orderGetin true;
		};
	} foreach units group _this;
};
} foreach _vehicles;

//Kilo6_2 addVehicle MH47E_Kilo6_2; (units Kilo6_2) allowGetIn true; (units Kilo6_2) orderGetIn true; (leader Kilo6_2) moveInDriver MH47E_Kilo6_2; {_x moveInTurret [MH47E_Kilo6_2, [_forEachIndex-1]]} forEach units Kilo6_2;
