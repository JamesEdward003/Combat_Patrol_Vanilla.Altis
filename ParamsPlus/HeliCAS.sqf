////////   _null = [player] execVM "heliAttack.sqf";    ///////////
private ["_caller","_position","_target","_is3D","_id","_unit", "_sideUnit", "_pos", "_location", "_mrkr"];
params ["_caller","_position","_target","_is3D","_id"];
_unit = _this select 0;
_position = _this select 1;
_searchRadius = 300;
_friendlySide = side _unit;
_neutralSide = CIVILIAN;
_enemyAntiAir = if (_friendlySide isEqualTo "WEST") then { ["O_T_APC_Tracked_02_AA_ghex_F","O_APC_Tracked_02_AA_F","O_static_AA_F","O_Soldier_AA_F","O_soldierU_AA_F","O_T_Soldier_AA_F","O_A_soldier_AA_F"] } else { ["B_T_APC_Tracked_01_AA_F","B_APC_Tracked_01_AA_F","B_static_AA_F","B_T_Static_AA_F","B_soldier_AA_F","B_T_Soldier_AA_F","B_W_Soldier_AA_F"] };
_sideUnit 			= 	side _unit;
_sourcePoint 		= 	_unit;
_randDir 			= 	getDir vehicle _sourcePoint - 180;
_randDist 			= 	(random 100) + 1000;
_airStart 			=	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 100];
_randDir2 			= 	getDir vehicle _sourcePoint;
_airEnd 			=	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir2)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir2)), 60];
_airType = [];

switch (_sideUnit) do 
{
	case west: 		{_airType = "B_Heli_Attack_01_F"}; // B_Heli_Attack_01_dynamicLoadout_F // B_Heli_Attack_01_F
	case east: 		{_airType = "O_Heli_Light_02_F"}; // O_Heli_Light_02_v2_F // O_Heli_Attack_02_F // 	O_Heli_Attack_02_black_F // O_Heli_Attack_02_dynamicLoadout_F // O_Heli_Attack_02_dynamicLoadout_black_F
	case resistance: 	{_airType = "O_Heli_Attack_02_v2_F"}; 
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
  
	if ((getMarkerPos "target") isEqualTo [0,0,0]) then {deleteMarker "target"};
	if !((getMarkerPos "target") isEqualTo [0,0,0]) then {deleteMarker "target"};

	//_location = [mappos, 20, 80, 3, 0, 20, 0] call BIS_fnc_findSafePos;

	_mrkr = createMarker ["target",mappos];
	_mrkr setMarkerType "selector_selectedMission";
	_mrkr setMarkerShapeLocal "Icon";
	_mrkr setMarkerTextLocal "target";
	_mrkr setMarkerSizeLocal [1,1];
	_mrkr setMarkerColorLocal _mrkrcolor;
	
titletext ["","plain",0.2];
hint parseText format["<t size='1.25' color='#208000'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];

	_enemyArray = (getMarkerPos  "target") nearEntities [["AllVehicles"], _searchRadius];

	{
		if ((side _x == _friendlySide) || (side _x == _neutralSide)) then {
		
			_enemyArray = _enemyArray - [_x];
		};
	} count _enemyArray;

		if ((count _enemyArray) > 0) then {

			for "_i" from 0 to (count _enemyAntiAir) - 1 do { 

				_enemyItem = _enemyAntiAir select _i;

				if (_enemyItem in _enemyArray) exitWith {
				
					hint parseText format ["<t size = '1.5' color = '#FF0000'>Attack Not Available!</t><br/><br/>Enemy anti-air are too close! 300m)<br/><br/>Secure the area before requesting Attack!"];

					deleteMarker "target";

					_friendlySide reveal [_enemyItem, 1.5]
				};
			};
		};
	
	_flightPath = _airStart getDir _airEnd;		

	_ch = [_airStart, _flightPath, _airType, _sideUnit] call BIS_fnc_spawnVehicle;
	AttackHelo = _ch select 0;
	
	(_ch select 0) setVehicleVarname "AttackHelo";
	
	[AttackHelo] execVM "vehicleMarker.sqf";
	
	AttackHelo addEventHandler ["GetIn", { (_this select 0) allowDamage false; (_this select 2) allowDamage false; } ]; 
	AttackHelo addEventHandler ["GetOut", { (_this select 0) allowDamage true; (_this select 2) allowDamage true; } ];	
			
	{_x addEventHandler ["HandleDamage", {false}]} forEach crew (AttackHelo) + [AttackHelo];
	
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["AttackHelo to your position %1", name _unit];
				
	gunner AttackHelo setBehaviour "COMBAT";
	
	wp0 = (_ch select 2) addwaypoint [(getMarkerPos "target"), 0];
	wp0 setwaypointtype "MOVE";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "RED";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true",""];

	wp1 = (_ch select 2) addwaypoint [_airEnd, 0];
	wp1 setwaypointtype "CYCLE";	
	wp1 setWaypointBehaviour "AWARE";
	wp1 setWaypointCombatMode "RED";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true",""];

	scopeName "main";
	while {alive AttackHelo isEqualTo true} do {
		
		scopeName "loop1";
		
		_enemyArray = (getMarkerPos  "target") nearEntities [["AllVehicles"], _searchRadius];

	{
		if ((side _x == _friendlySide) || (side _x == _neutralSide)) then {
		
			_enemyArray = _enemyArray - [_x];
		};
	} count _enemyArray;

		if ((count _enemyArray) < 4) then {
	
		while {(count (waypoints (_ch select 2))) > 0} do {
			scopeName "loop2";
			deleteWaypoint ((waypoints (_ch select 2)) select 0);
			sleep 0.01;
			};
			if (alive AttackHelo) then {breakTo "main"};
		};
		
		uisleep 10;
	};
	
	wp2 = (_ch select 2) addwaypoint [_airStart, 0];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "AWARE";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "NORMAL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);"];

	waitUntil {AttackHelo distance2d _airStart < 100};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["AttackHelo ready for reassignment!"];
 			
	deleteMarker "target";
				
//PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Moving to your location, %1!", name _unit];

