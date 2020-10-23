////// [_object,_mindis,_radius] execVM "primePos"; //////
_spawnpos = nil;
_object  = _this select 0;
_mindis  = _this select 1;
_radius  = _this select 2;
_objectPos  = getPos _object;

if(_object in allMapMarkers) then {
	_objectPos = getMarkerPos _object;
}else{
	if (typeName _object == "ARRAY") then{
		_objectPos = _object;
	}else{
		_objectPos = getPos _object;
	};
};

while {true} do {
scopeName "SpawnPosGen";
_randir = floor(random 360);
_randis = _mindis + floor(random _radius);
_spawnpos = [(_objectPos select 0) + ((sin _randir) * _randis), (_objectPos select 1) + ((cos _randir) * _randis), 0.1];
_houses = nearestObjects [_spawnpos, ["house","wall"], 50];
_vehicles = nearestObjects [_spawnpos, ["LandVehicle", "Land_BagBunker_01_Large_green_F", "Land_TTowerBig_2_F"], 20];
_isFlat = _spawnpos isFlatEmpty [10, -1, 0.5, 10, 0, false, _object ]; 
_danger = false;
{ if (floor(_spawnpos distance getPos _x) < 20) then { _danger=true; }; } forEach _houses;
{ if (floor(_spawnpos distance getPos _x) < 10) then { _danger=true; }; } forEach _vehicles;
if (surfaceIsWater _spawnpos) then { _danger=true; };
if (count _isFlat < 1 ) then { _danger=true; };
if (!_danger) then { breakOut "SpawnPosGen" };
};
	
if (!(isNil {missionNameSpace getVariable "PrimePos"})) then
{
	missionNameSpace setVariable ["PrimePos",nil,true];
	deleteMarker "PrimePos";
	
} else {	

	missionNameSpace setVariable ["PrimePos",true,true];
	_marker = createMarkerLocal ["PrimePos", _spawnpos];
	_marker setMarkerTypeLocal "hd_flag";
	_marker setMarkerShapeLocal "Icon";  
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTextLocal "respawn";
	_marker setMarkerSizeLocal [0.5,0.5];
	hint format ["Spawn position: %1", _spawnpos];
};
	
waitUntil { !isNil "PrimePos" };

		