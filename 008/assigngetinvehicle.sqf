// "assignGetInVehicle.sqf" //
private ["_vehicle","_caller"];
_vehicle = _this select 0;
_caller = _this select 1;

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
	} foreach units group _caller;
};
} foreach _vehicle;

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
	} foreach units group _caller;
};
} foreach _vehicle;

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
	} foreach units group _caller;
};
} foreach _vehicle;

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
	} foreach units group _caller;
};
} foreach _vehicle;
