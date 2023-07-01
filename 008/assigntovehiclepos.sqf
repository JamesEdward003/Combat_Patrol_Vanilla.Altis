/*
assignToVehiclePos.sqf

Execute with  _null = [vehicleName,group] execVM "008\assignToVehiclePos.sqf";
*/
private ["_vehicle","_group"];
_vehicle = _this select 0;
_group = _this select 1;

{_x enableAI "MOVE"} forEach units _group;

(leader _group) action ["getInDriver", _vehicle];

//(leader _group) moveInDriver _vehicle;

{_x action ["getInTurret",_vehicle, [_forEachIndex]];_x setBehaviour "AWARE";} forEach units _group - [(leader _group)];
