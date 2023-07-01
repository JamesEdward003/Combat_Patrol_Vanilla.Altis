//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by:  DieHard - Function file for ArmA 2: Operation Arrowhead
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: kylania (modified by onmas)
//////////////////////////////////////////////////////////////////
//  From trigger:
//  nul = [player] execVM "airStrike.sqf";
/////////////////////////////////////////////////////
// Wait till the Functions module is ready.
waituntil {!isnil "bis_fnc_init"};

// Paramaters.
_unit = _this select 0;
_sideUnit = side _unit;
_sourcePoint = _unit;
_vehicle = [];

switch (_sideUnit) do 
{
	case west: 		{_vehicle = "F35B"};
	case east: 		{_vehicle = "Su34"};
	case resistance: 	{_vehicle = "Su25_Ins"};
	case civilian: 	{_vehicle = "An2_1_TK_CIV_EP1"};
};
_mrkrcolor 	= [];

switch (_sideUnit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

//_vehicle = "rksl_efa_fgr4_raf_9";
//_vehicle = "An2_1_TK_CIV_EP1";
//_vehicle = "An2_2_TK_CIV_EP1";
//_vehicle = "An2_TK_EP1";
//_vehicle = "A10";
//_vehicle = "A10_US_EP1";
//_vehicle = "AV8B";
//_vehicle = "AV8B2";
//_vehicle = "Chukar_EP1";
//_vehicle = "F35B";
//_vehicle = "L39_TK_EP1";
//_vehicle = "MQ9PredatorB";
//_vehicle = "MQ9PredatorB_US_EP1";
//_vehicle = "Pchela1T";
//_vehicle = "Su25_CDF";
//_vehicle = "Su25_Ins";
//_vehicle = "Su25_TK_EP1";
//_vehicle = "Su34";
//_vehicle = "Su39";
//_vehicle = "C130J";
//_vehicle = "C130J_US_EP1";

_airType = _vehicle;  // Type of transport.

// Get mouse clicks.
sleep 0.25;
openMap true;
sleep 0.25;

// message letting them know it's coming.
PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FastAir to your position, %1, mark your target on the map.", name _unit];
	
dt=true;
onMapSingleClick "airTarget = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

sleep 1;
openMap false;

// targeting.
_obj = "Sign_sphere10cm_EP1" createVehicle airTarget;
_fastAirObjects = nearestObjects [_obj, ["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
deleteVehicle _obj;
		
_fastAirAliveObjects = [];
{ if (alive _x) then { _fastAirAliveObjects = _fastAirAliveObjects+[_x] }; } forEach _fastAirObjects;
_unit sidechat format["TARGET that ""%1""", typeOf (_fastAirAliveObjects select 0)];
if(count _fastAirAliveObjects > 0) then
{
	titleText ["Fast air is on the way!!!","PLAIN DOWN"];
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Fast air is on the way!!!"];
	_fastAirTarget = _fastAirAliveObjects select 0;
	smoke = "SmokeShellYellow" createVehicle getPos _fastAirTarget;
	[_fastAirTarget] execVM "008\snapShot3.sqf";
	[_fastAirTarget] execVM "008\twirlyMrkr.sqf";

	_randDir = getDir vehicle _sourcePoint - 10;
	_randDir = _randDir + random(20);
	_randDist = (random 100) + 2000;
	_spawnLoc =	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 0];

	_marker = createMarkerLocal ["airStart", _spawnLoc];
	_marker setMarkerTypeLocal "select";
	_marker setMarkerShapeLocal "Icon";  
	_marker setMarkerTextLocal "airStart";
	_marker setMarkerSizeLocal [0.75,0.75];
	_marker setMarkerColorLocal _mrkrcolor;	

	_start = getMarkerPos "airStart";  // location of start/spawn/delete location.

	/////////////// SERVER ///////////////////
	if (isServer) then {
		// Create a little shiney ball we can use to get the direction from start to target.
		_blinky = "Sign_sphere10cm_EP1" createVehicle _start;
		_flightPath = [_blinky, _unit] call BIS_fnc_relativeDirTo;	
		
		// Spawn the air, facing the user, in the air at the start location.
		_air = [[_start select 0, _start select 1, 250], _flightPath, _airType, side _unit] call BIS_fnc_spawnVehicle;
		
		// Name the air globally so that waypoint orders will work.
		fastAir = _air select 0;
		_airGroup = _air select 2; // group of air so waypoints work.
		_airGroup setCombatMode "BLUE"; // Make sure they don't get distracted.
		// fastAir setCaptive true; // uncomment this to make airstrike safe.

		// message letting them know it's coming.
		_airDist = fastAir distance airTarget;
		fastAir sidechat format["Roger that, we are %1km from your TARGET", round(_airDist)/1000.0];
		
		// These lines might be needed in MP. :)  Didn't test it yet.
		_air select 0 setVehicleInit "fastAir = this; this setVehicleVarName ""fastAir"";
		this addEventHandler ['Killed', {[_this select 0, _this select 1, ['airStart']] execVM '008\onKilled.sqf'}];";
		processInitCommands;
		
		// Delete the cute little light that let us spawn facing the right direction
		deleteVehicle _blinky;
		
		// WP 1 - en route to TARGET
		fastAir setCombatMode "BLUE";
		fastAir doMove getPos _fastAirTarget;
		fastAir flyInHeight 75;

		waitUntil {fastAir distance _fastAirTarget < 1200};
		titleText ["Fast air is hot!!!","PLAIN DOWN"];
		PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Fast air is hot!!!"];

		// WP 2 - approach to TARGET
		fastAir doMove getPos _fastAirTarget;

		sleep 10; 
		fastAir flyInHeight 1000;
		bomb = "Bo_GBU12_LGB" createVehicle getPos _fastAirTarget;  
		_fastAirTarget setDamage 1.0;
		{_x setdamage 1.0} foreach nearestObjects [_fastAirTarget, [], 25];
		titleText ["Fast air is RTB","PLAIN DOWN"];

		// WP 3 - return to start/spawn point
		wp3 = _airGroup addWaypoint [_start, 20];
		wp3 setWaypointType "MOVE";
		wp3 setWaypointCombatMode "BLUE";
		wp3 setWaypointSpeed "FULL";
		wp3 setWaypointStatements ["true","titleText [""Fast air is now available"",""PLAIN DOWN""]; {deleteVehicle _x} forEach crew fastAir; deletevehicle fastAir; deleteMarkerLocal 'airStart';"];
	};
}
else
{
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["No TARGETs identified..."];
};
 
