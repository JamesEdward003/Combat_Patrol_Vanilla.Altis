/////////////////////////////////////////////////////////////////////////////////////////////
// [position,radius,how-many,height,start dir,arc,vehicle,_vhome] //////////////////////////
// [getMarkerPos _vehicleVarName,300,360,80,60,360,_vehicle,_vhome] execvm "movement\fly_circle_H.sqf"; //
/////////////////////////////////////////////////////////////////////////////////////////////
_centrepos = _this select 0;
_rad       = _this select 1;
_many      = _this select 2;
_height    = _this select 3;
_ang       = _this select 4;
_inc       = (_this select 5)/_many;
_vehicle   = _this select 6;
_vhome     = _this select 7;
_vVarName  = vehicleVarName _vehicle;
hint format ["Center: %1, Radius: %2, Amount: %3, FlyInHeight: %4, Angle: %5, Inc: %6, Vehicle: %7, Home: %8, Varname: %9",_centrepos,_rad,_many,_height,_ang,_inc,_vehicle,_vhome,_vVarname];
copyToClipboard format ["Center: %1, Radius: %2, Amount: %3, FlyInHeight: %4, Angle: %5, Inc: %6, Vehicle: %7, Home: %8, Varname: %9",_centrepos,_rad,_many,_height,_ang,_inc,_vehicle,_vhome,_vVarname];

while {(count (waypoints (group _vehicle))) > 0} do {
	deleteWaypoint ((waypoints (group _vehicle)) select 0);
	sleep 0.01;
	};
			
for "_x" from 1 to _many do { deletemarker str _x; };


_target_pos = _centrepos;
	
_wppos = [];

for "_x" from 0 to _many-1 do 
{
	_a = (_target_pos select 0)+(sin(_ang)*_rad);
	_b = (_target_pos select 1)+(cos(_ang)*_rad);

	_pos = [_a,_b,(_target_pos select 2)+_height];
	_ang = _ang + _inc;
	_wppos = _wppos + [_pos];
	
	_marker  =  createMarker [str _x,_pos];
	_marker setMarkerType "hd_dot";
	_marker setMarkerSize [.2, .2];
	_marker setMarkerColor "COLORRED";
};

   {	_x setSkill 1;
	_x setSkill ["aimingAccuracy", 1.0];
	_x setSkill ["spotTime", 1.0];
	_x setSkill ["spotDistance", 1.0];
} forEach units (group _vehicle);
																		
_wp0 = (group _vehicle) addWaypoint [ (_wppos select 0), 0];	
_wp0 setWaypointType "MOVE";
_wp0 setWaypointStatements ["true", "_null = [(vehicle this),50,80] execVM 'paramsplus\speedLimiter.sqf';"];
_wp0 setWaypointSpeed "FULL";

_wp1 = (group _vehicle) addWaypoint [ (_wppos select 60), 0];	
_wp1 setWaypointType "MOVE";
_wp1 setWaypointStatements ["true", ""];
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "AWARE";
_wp1 setWaypointCombatMode "YELLOW";

_wp2 = (group _vehicle) addWaypoint [ (_wppos select 120), 0];	
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", ""];
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointBehaviour "AWARE";
_wp2 setWaypointCombatMode "YELLOW";

_wp3 = (group _vehicle) addWaypoint [ (_wppos select 180), 0];	
_wp3 setWaypointType "MOVE";
_wp3 setWaypointStatements ["true", ""];
_wp3 setWaypointSpeed "LIMITED";
_wp3 setWaypointBehaviour "AWARE";
_wp3 setWaypointCombatMode "YELLOW";

_wp4 = (group _vehicle) addWaypoint [ (_wppos select 240), 0];	
_wp4 setWaypointType "MOVE";
_wp4 setWaypointStatements ["true", ""];
_wp4 setWaypointSpeed "LIMITED";
_wp4 setWaypointBehaviour "AWARE";
_wp4 setWaypointCombatMode "YELLOW";

_wp5 = (group _vehicle) addWaypoint [ (_wppos select 300), 0];	
_wp5 setWaypointType "CYCLE";
_wp5 setWaypointStatements ["true", ""];
_wp5 setWaypointSpeed "LIMITED";
_wp5 setWaypointBehaviour "AWARE";
_wp5 setWaypointCombatMode "YELLOW";

_ent = nearestObjects [_target_pos, ["Man"], _rad];

uisleep .3;

_portals = [];

if (count _ent == 0) exitwith {
	hintSilent "Entities: 0";
	(driver _vehicle) SideChat "Returning to base";
	for "_x" from 0 to _many-1 do { deletemarker str _x }; 
	deleteMarker _vVarName;
while {(count (waypoints (group _vehicle))) > 0} do {
	deleteWaypoint ((waypoints (group _vehicle)) select 0);
	sleep 0.01;
	};
	[_vehicle,200,80] execVM "paramsplus\speedLimiter.sqf";
	(driver _vehicle) setBehaviour "AWARE";
	_wp = (group _vehicle) addWaypoint [ position _vhome, 0];	
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];
};
if (east countSide _ent < 1) exitwith {
	hintSilent "Enemy Targets: 0";
	(driver _vehicle) SideChat "Returning to base";
	for "_x" from 0 to _many-1 do { deletemarker str _x }; 
	deleteMarker _vVarName;
while {(count (waypoints (group _vehicle))) > 0} do {
	deleteWaypoint ((waypoints (group _vehicle)) select 0);
	sleep 0.01;
	};
	[_vehicle,200,80] execVM "paramsplus\speedLimiter.sqf";
	(driver _vehicle) setBehaviour "AWARE";
	_wp = (group _vehicle) addWaypoint [ position _vhome, 0];	
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];
};	
if (east countSide _ent > 0) then {  
	for "_x" from 0 to (east countSide _ent) do { _portals = _portals + [_x] }; 
};

hintSilent format ["Enemy Units: %1", (count _portals)];

(driver _vehicle) SideChat "Moving to map location";

while {(count _portals) > 0} do { 
	_portals = [];
	_target_pos = getMarkerPos _vVarName;
	_rad = 300;
	_nos = nearestObjects [_target_pos, ["Man"], _rad];
	uisleep .3;
	for "_x" from 0 to (east countSide _nos) do { _portals = _portals + [_x] };
	uisleep 60;
}:

waitUntil {(count _portals) isEqualTo 0};

(driver _vehicle) SideChat "Returning to base";
			
for "_x" from 1 to _many do { deletemarker str _x };
deleteMarker _vVarName;
while {(count (waypoints (group _vehicle))) > 0} do {
	deleteWaypoint ((waypoints (group _vehicle)) select 0);
	sleep 0.01;
	};
//[_vehicle,200,80] execVM "speedLimiter.sqf";
(driver _vehicle) setBehaviour "AWARE";
_wp = (group _vehicle) addWaypoint [position _vhome, 0];	
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointStatements ["true", "{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];

