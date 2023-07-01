/*
assignGetinGunner
	((units group this) select 3) action ["moveToTurret", vehicle this, [0]];
Execute with  _null = [vehicleName,group] execVM "008\assignGetinGunner.sqf";
*/

if (!isServer) exitWith {};
_vehicle = _this select 0;
_group = _this select 1;
_driver = driver _vehicle;
//_driver leaveVehicle _vehicle;
_driver  assignasgunner _vehicle;

_freeDriver = _vehicle emptyPositions "Driver";
_freeCommander = _vehicle emptyPositions "Commander";
_freeGunner = _vehicle emptyPositions "Gunner";
_freeCargo = _vehicle emptyPositions "Cargo";
_commPos = _freeCommander;

if (_commPos != 0 AND (leader _group) in _vehicle) then {
	waitUntil {(_vehicle emptyPositions "Commander") == 0};
	(leader _group) action ["moveToCommander", _vehicle];
};
