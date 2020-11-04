////////   _null = [player] execVM "heliTransport.sqf";    ///////////
private ["_caller","_position","_target","_is3D","_id","_unit", "_sideUnit", "_pos", "_location", "_mrkr"];
params ["_caller","_position","_target","_is3D","_id"];
_unit = _this select 0;
_position = _this select 1;
_searchRadius = 100;
_friendlySide = side _unit;
_neutralSide = CIVILIAN;
_sideUnit 			= 	side _unit;
_sourcePoint 		= 	_unit;
_randDir 			= 	getDir vehicle _sourcePoint - 180;
_randDist 			= 	(random 100) + 1000;
_airStart 			=	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 100];
_randDir2 			= 	getDir vehicle _sourcePoint;
_airEnd 			=	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir2)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir2)), 60];
//_airTypes 		= 	B_Heli_Light_01_F // B_Heli_Light_01_stripped_F // B_Heli_Transport_01_F // B_Heli_Transport_01_camo_F ////DLC > B_Heli_Transport_03_F // B_Heli_Transport_03_unarmed_F
//_airTypes			=	O_Heli_Light_02_F // O_Heli_Light_02_unarmed_F // O_Heli_Light_02_v2_F ////DLC > O_Heli_Transport_04_F 
_airType = [];

switch (_sideUnit) do 
{
	case west: 		{_airType = "B_Heli_Light_01_F"};
	case east: 		{_airType = "	O_Heli_Light_02_F"};
	case resistance: 	{_airType = "O_Heli_Light_02_v2_F"};
	case civilian: 	{_airType = "O_Heli_Light_02_unarmed_F"};
};

_mrkrcolor 	= [];

switch (_sideUnit) do {

         case west:		{_mrkrcolor = "ColorBlue"};
         case east:		{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:	{_mrkrcolor = "ColorYellow"};
};

_marker = createMarkerLocal ["hStart", _airStart];
_marker setMarkerTypeLocal "select";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal "hStart";
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerColorLocal _mrkrcolor;	

uisleep 0.25;
location = false;
openmap [true,false];
titleText["Map location", "PLAIN"];
PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["On mapclick, %1, set a location", name _unit];
onMapSingleClick "onMapSingleClick ''; mappos = _pos; location = true";		
waitUntil {sleep 1; (!visiblemap OR location OR !alive player)};
	if (!location OR !alive player) exitWith {
	mappos = nil;
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat "Map location canceled";
	hint parseText format["<t size='1.25' color='#ff0000'>Map location canceled</t>"];
	titletext ["","plain"];
	};
  
  	if ((getMarkerPos "pickup") isEqualTo [0,0,0]) then {deleteMarker "pickup"};
	if ((getMarkerPos "LZ") isEqualTo [0,0,0]) then {deleteMarker "LZ"};
	if ((alive lzPickup) isEqualTo true) then {deleteVehicle lzPickup};
	if ((alive lzDropoff) isEqualTo true) then {deleteVehicle lzDropoff};

	//_location = [mappos, 20, 80, 3, 0, 20, 0] call BIS_fnc_findSafePos;

	_mrkr = createMarker ["LZ",mappos];
	_mrkr setMarkerTypeLocal "mil_end";
	_mrkr setMarkerShapeLocal "Icon";
	_mrkr setMarkerTextLocal "LZ";
	_mrkr setMarkerSizeLocal [1,1];
	_mrkr setMarkerColorLocal _mrkrcolor;

	lzDropoff = "Land_HelipadEmpty_F" CreateVehicle (getMarkerPos "LZ");
	
titletext ["","plain",0.2];
hint parseText format["<t size='1.25' color='#208000'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];

	_enemyArray = (getPos lzDropoff) nearEntities [["AllVehicles"], _searchRadius];

	{
		if ((side _x == _friendlySide) || (side _x == _neutralSide)) then {
		
			_enemyArray = _enemyArray - [_x];
		};
	} count _enemyArray;

		if ((count _enemyArray) > 4) exitWith {
		
			hint parseText format ["<t size = '1.5' color = '#FF0000'>Transport Not Available!</t><br/><br/>Enemies are too close! (100m)<br/><br/>Secure the area before requesting transport!"];

			deleteMarker "LZ";
	    	deleteVehicle lzDropOff;
		};
	
	_flightPath = _airStart getDir _airEnd;		

	_ch = [_airStart, _flightPath, _airType, _sideUnit] call BIS_fnc_spawnVehicle;
	TransportHelo = _ch select 0;
	
	(_ch select 0) setVehicleVarname "TransportHelo";
	
	[TransportHelo] execVM "vehicleMarker.sqf";
	
	TransportHelo addEventHandler ["GetIn", { if (_this select 1 == "cargo") then { (_this select 2) allowDamage false; } } ]; 
	TransportHelo addEventHandler ["GetOut", { if (_this select 1 == "cargo") then { (_this select 2) allowDamage true; } } ];	
			
	{_x addEventHandler ["HandleDamage", {false}]} forEach crew (TransportHelo) + [TransportHelo];
	
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["TransportHelo to your position %1", name _unit];
	
	_hLand = [_unit, 10, getdir _unit] call BIS_fnc_relPos;

	_land = createMarkerLocal ["pickUp", _hLand];
	_land setMarkerTypeLocal "mil_pickup";
	_land setMarkerShapeLocal "Icon";
	_land setMarkerTextLocal "pickup";
	_land setMarkerSizeLocal [1,1];
	_land setMarkerColorLocal _mrkrcolor;
	
	lzPickup = "Land_HelipadEmpty_F" createvehicle _hLand;
			
	driver TransportHelo setBehaviour "CARELESS";
	
	wp0 = (_ch select 2) addwaypoint [_hLand, 0];
	wp0 setwaypointtype "LOAD";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "YELLOW";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true","(vehicle this) land 'GET IN'"];
	
	waitUntil {isTouchingGround TransportHelo};
	waitUntil {_unit in TransportHelo};
//	waitUntil{{_x in transporthelo} count units group _unit == count units group _unit};

	wp1 = (_ch select 2) addwaypoint [getPos lzDropOff, 0];
	wp1 setwaypointtype "UNLOAD";	
	wp1 setWaypointBehaviour "AWARE";
	wp1 setWaypointCombatMode "YELLOW";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true","(vehicle this) land 'GET OUT';"];
	
	waitUntil {isTouchingGround TransportHelo};
	waitUntil {(_unit in TransportHelo) isEqualTo false};
//	{unassignVehicle _x; doGetOut _x} foreach assignedCargo TransportHelo;
//	waitUntil{{_x in TransportHelo} count units group _unit == 0};

	wp2 = (_ch select 2) addwaypoint [_airStart, 0];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "CARELESS";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "NORMAL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];

	waitUntil {TransportHelo distance2d _airStart < 100};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["TransportHelo ready for reassignment!"];
 			
	deleteVehicle lzPickup;
	deleteVehicle lzDropOff;
	deleteMarker "pickUp";
	deleteMarker "LZ";
	deleteMarker "hStart";
				
//PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Moving to your location, %1!", name _unit];

