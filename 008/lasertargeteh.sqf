//_target addEventHandler["killed", {[_this select 0, _this select 1, [_laze,_smoke]] execVM "scripts\laserTargetEH.sqf"}];//
private ["_target","_killer","_lazes","_laze","_smoke","_cameras","_camera"];
_target 	= _this select 0;
_killer 	= _this select 1;
/*
_laze 		= if ((count _this >2) and (!isNull (_this select 2 select 0))) then {_this select 2 select 0} else {_laze=objNull};
_smoke      = if ((count _this >2) and (!isNull (_this select 2 select 1))) then {_this select 2 select 1} else {_smoke=objNull};

detach _laze;
deleteVehicle _laze;
deleteVehicle _smoke;
*/
_lazes = nearestObjects [_target, ["LaserTargetW"], 20];
_laze = _lazes select 0;

_cameras = nearestObjects [_target, ["camera"], 20];
//_camera = _camera select 0;

_smokes = nearestObjects [_target, ["SmokeShellYellow"], 20];
//_smoke = _smokes select 0;

while {(count _lazes) > 0} do
{
_laze = _lazes select 0;
detach _laze;
deleteVehicle _laze;
sleep 0.1; 
};

while {(count _cameras) > 0} do
{ 
camDestroy _cameras select 0;
sleep 0.1;  
}; 

while {(count _smokes) > 0} do
{ 
deleteVehicle _smokes select 0;
sleep 0.1;  
}; 

hintSilent parseText format["<t size='1' font='PuristaBold' color='#FFFF00'>Asset Destroyed, Victim: %2, NameOfVictim: %4, Killer: %1, NameOfKiller: %3</t>", typeOf _killer, typeOf _target, name _killer, name _target];
//hintSilent format["Asset Destroyed, Killer: %1, Victim: %2, NameOfKiller: %3, NameOfVictim: %4", _killer, _victim, name _killer, name _victim];
