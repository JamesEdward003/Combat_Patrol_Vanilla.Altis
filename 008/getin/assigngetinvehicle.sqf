// "assignGetInVehicle.sqf" //
private ["_vehicle","_caller"];
_vehicle = _this select 0;
_caller = _this select 1;


if (canMove _vehicle) then {
	{
		private _unit = _x;
		if (isNull (assignedDriver _vehicle)) then {
			_unit enableAI "MOVE";
			_unit assignAsDriver _vehicle;
			[_unit] orderGetin true;
		};
	} foreach units group _caller;

	{
		private _unit = _x;
		if (isNull (assignedGunner _vehicle)) then {
			_unit enableAI "MOVE";
			_unit assignAsGunner _vehicle;
			[_unit] orderGetin true;
		};
	} foreach units group _caller;

	{
		private _unit = _x;
		if (isNull (assignedCommander _vehicle)) then {
			_unit enableAI "MOVE";
			_unit assignAsCommander _vehicle;
			[_unit] orderGetin true;
		};
	} foreach units group _caller;
	_freeCargo = _vehicle emptyPositions "Cargo";
	{
		private _unit = _x;
		if (_freeCargo != 0) then {
			_freeCargo = _freeCargo - 1;
			_unit enableAI "MOVE";
			_unit assignAsCargo _vehicle;
			[_unit] orderGetin true;
		};
	} foreach units group _caller;
};

