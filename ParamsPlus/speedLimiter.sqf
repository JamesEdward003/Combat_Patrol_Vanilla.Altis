//////    _null = [_vehicle,_speedLimit,_flyHeight] "speedLimiter.sqf";   //////
_vehicle = _this select 0;
_speedLimit = _this select 1;
_flyHeight = _this select 2;

_vehicle flyInHeight _flyHeight;

["speedLimiter","onEachFrame",{
	if (speed _vehicle > _speedLimit) then {
		_VM = velocityModelSpace _vehicle;
		_vehicle setVelocityModelSpace [(_VM select 0),((_VM select 1) - 0.2),(_VM select 2)];
	};
}] call bis_fnc_addStackedEventHandler;

