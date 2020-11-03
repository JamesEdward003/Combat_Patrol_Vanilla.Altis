////////   _null = [player] execVM "heliAttack.sqf";    ///////////
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
//_airTypes 		= 	B_Heli_Light_01_F // B_Heli_Light_01_stripped_F // B_Heli_Attack_01_F // B_Heli_Attack_01_camo_F ////DLC > B_Heli_Attack_03_F // B_Heli_Attack_03_unarmed_F
//_airTypes			=	O_Heli_Light_02_F // O_Heli_Light_02_unarmed_F // O_Heli_Light_02_v2_F ////DLC > O_Heli_Attack_04_F 
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
  
	if ((getMarkerPos " TARGET") isEqualTo [0,0,0]) then {deleteMarker " TARGET"};

	//_location = [mappos, 20, 80, 3, 0, 20, 0] call BIS_fnc_findSafePos;

	_mrkr = createMarker [" TARGET",mappos];
	_mrkr setMarkerTypeLocal "mil_end";
	_mrkr setMarkerShapeLocal "Icon";
	_mrkr setMarkerTextLocal " TARGET";
	_mrkr setMarkerSizeLocal [1,1];
	_mrkr setMarkerColorLocal _mrkrcolor;
	
titletext ["","plain",0.2];
hint parseText format["<t size='1.25' color='#208000'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];

	_enemyArray = (getMarkerPos  " TARGET") nearEntities [["AllVehicles"], _searchRadius];

	{
		if ((side _x == _friendlySide) || (side _x == _neutralSide)) then {
		
			_enemyArray = _enemyArray - [_x];
		};
	} count _enemyArray;

		if ((count _enemyArray) > 0) exitWith {
		
			hint parseText format ["<t size = '1.5' color = '#FF0000'>Attack Not Available!</t><br/><br/>Enemies are too close! (300m)<br/><br/>Secure the area before requesting Attack!"];

			deleteMarker " TARGET";
		};
	
	_flightPath = _airStart getDir _airEnd;		

	_ch = [_airStart, _flightPath, _airType, _sideUnit] call BIS_fnc_spawnVehicle;
	AttackHelo = _ch select 0;
	
	(_ch select 0) setVehicleVarname "AttackHelo";
	
	[AttackHelo] execVM "vehicleMarker.sqf";
	
	AttackHelo addEventHandler ["GetIn", { if (_this select 1 == "cargo") then { (_this select 2) allowDamage false; } } ]; 
	AttackHelo addEventHandler ["GetOut", { if (_this select 1 == "cargo") then { (_this select 2) allowDamage true; } } ];	
			
	{_x addEventHandler ["HandleDamage", {false}]} forEach crew (AttackHelo) + [AttackHelo];
	
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["AttackHelo to your position %1", name _unit];
				
	driver AttackHelo setBehaviour "CARELESS";
	
	wp0 = (_ch select 2) addwaypoint [(getMarkerPos " TARGET"), 0];
	wp0 setwaypointtype "MOVE";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "RED";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true",""];

	wp1 = (_ch select 2) addwaypoint [(getMarkerPos " TARGET"), 0];
	wp1 setwaypointtype "MOVE";	
	wp1 setWaypointBehaviour "AWARE";
	wp1 setWaypointCombatMode "YELLOW";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true",""];

	wp2 = (_ch select 2) addwaypoint [_airStart, 0];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "AWARE";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "NORMAL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];

	waitUntil {AttackHelo distance2d _airStart < 100};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["AttackHelo ready for reassignment!"];
 			
	deleteMarker " TARGET";
				
//PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Moving to your location, %1!", name _unit];

