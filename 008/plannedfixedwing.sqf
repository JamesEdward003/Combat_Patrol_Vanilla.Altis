//////////////////////////////////////////////////////
//  From trigger:
//  _null = [player] execVM "plannedFixedWing.sqf";
//////////////////////////////////////////////////////
private ["_unit","_sideUnit","_unitPos","_sourcePoint","_pos","_blinky","_targets","_target","_type","_airDist","_smoke","_targetPos","_mrkr2color","_marker2","_vehicle","_mrkrcolor","_randDir","_randDist","_spawnLoc","_marker","_flightPath","_ch","_chGroup","_nul","_kv","_airDist2"];
waituntil {!isnil "bis_fnc_init"};

_unit = _this select 0;
_sideUnit = side _unit;
_unitPos = getPos _unit;
_sourcePoint = _unit;

_vehicle = [];

switch (playerSide) do 
{
	case west: 		{_vehicle = "AV8B"};
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

_randDir = getDir vehicle _sourcePoint - 10;
_randDir = _randDir + random(20);
_randDist = (random 100) + 2800;
_spawnLoc =	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 0];

_marker = createMarkerLocal ["FStart", _spawnLoc];
_marker setMarkerTypeLocal "select";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal "FStart";
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerColorLocal _mrkrcolor;	

if (isServer) then {
 
uisleep 0.25;
openMap true;
uisleep 0.25;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS ready, %1, mark your target on the map!", name _unit];
	
dt=true;
onMapSingleClick "FWTarget = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	_blinky = "Sign_sphere10cm_EP1" createVehicle FWTarget;	
	_targets = nearestObjects[_blinky,["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];
	_target = _targets select 0;
	uisleep .1;
	[_target] execVM "008\twirlyMrkr.sqf";
	_target addEventHandler ["Killed", {[_this select 0, _this select 1] execVM "008\onKilled.sqf"}];
	deleteVehicle _blinky;

	_smoke = "SmokeShellYellow" createVehicle (_target modelToWorld [0,0,30]);

uisleep 2;
openMap false;	

if (count _targets > 0) then

{		
	_type = typeOf _target;
	_airDist = [_unit,_target] call BIS_fnc_distance2D;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["%1 marked is %2 meters from %3.", typeOf _target, round(_airDist)/1.0, name _unit];

	_blinky = "Sign_sphere10cm_EP1" createVehicle _spawnLoc;
	_flightPath = [_blinky, _target] call BIS_fnc_relativeDirTo;	
	deleteVehicle _blinky;	
	
	_ch = [[_spawnLoc select 0, _spawnLoc select 1, 1060], _flightPath, _vehicle, side _unit] call BIS_fnc_spawnVehicle;
	
	FixedWingCAS = _ch select 0;
	
	_chGroup = _ch select 2; 
	
	addSwitchableUnit leader _chGroup;

	_ch select 0 setVehicleInit "FixedWingCAS = this; this setVehicleVarName 'FixedWingCAS'; FixedWingCASGroup=group this; this setGroupID ['FixedWingCASGroup', 'GroupColor4'];  
	this flyInHeight 500;
	this setvehiclelock 'unlocked'; 
	clearWeaponCargo this;
	this addWeaponCargo ['DMR',1]; 
	this addMagazineCargo ['20Rnd_762x51_DMR',8]; 
	this addWeaponCargo ['m240_scoped_EP1',1];
	this addMagazineCargo ['100Rnd_762x51_M240',4];
	this addWeaponCargo ['JAVELIN',1]; 
	this addMagazineCargo ['JAVELIN',4];
	[this] execVM '008\setIdentity.sqf';
	[this] execVM '008\loadoutAir.sqf';
	this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {uisleep 0.5};_this select 0 setVehicleAmmo 1}}];
	this addEventHandler ['Killed', {[_this select 0, _this select 1, 'FStart'] execVM '008\onKilled.sqf'}];
	{[_x] execVM '008\adfalse.sqf'} forEach crew this;
	this addeventhandler ['Getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];
	this addeventhandler ['Getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];";
	processInitCommands;

	//[_target,FixedWingCAS] execVM "008\snapShot2.sqf";
	//titleText [format ["Press Home To Return"],"plain down"];
	
	titleText [format ["Press Home To Return"],"plain down"];

	_targetPos = getPosATL _target;

	_airDist2 = [FixedWingCAS,_target] call BIS_fnc_distance2D;

	_height = getPosATL _smoke select 2;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS is %1 meters from %2.", round(_airDist2)/1.0, _type];

	_laze = "LaserTargetW" createVehicle (_target modelToWorld [0,0,_height]);

	_laze attachTo [_target,[0,0,_height]];

	_laze addEventHandler["Killed", {[_this select 0, _this select 1, [_laze]] execVM "008\laserTargetEH.sqf"}];

	{_x doWatch getPosATL _laze} forEach units _chGroup;

	{_x lookAt _laze} forEach units _chGroup;

	FixedWingCAS reveal [_laze, 4];

	FixedWingCAS doTarget _laze;

	_wp0 = _chGroup addwaypoint [_targetPos, 20];
	_wp0 setwaypointtype "MOVE";	
	_wp0 setWaypointBehaviour "AWARE";
	_wp0 setWaypointCombatMode "YELLOW";
	_wp0 setWaypointSpeed "NORMAL";
	_wp0 setWaypointStatements ["true",""];

	waitUntil {([FixedWingCAS,_laze] call BIS_fnc_distance2D) <= 800};

	[FixedWingCAS, _laze, FixedWingCAS modelToWorld [0,0,-2], "Bo_GBU12_LGB", 120, getPos MyGameLogic] execVM "008\MissileStrike\launchAirstrike.sqf";
	
	//waitUntil {([FixedWingCAS,_laze] call BIS_fnc_distance2D) <= 400};

	//{_x doFire _laze} forEach units _chGroup;

	//FixedWingCAS doFire _laze;

// Bo_GBU12_LGB Bo_Mk82 Bo_FAB_250 
// M_Ch29_AT M_AT2_AT M_AT6_AT M_AT9_AT M_Hellfire_AT M_Maverick_AT M_Vikhr_AT 

	waitUntil {([FixedWingCAS,_laze] call BIS_fnc_distance2D) <= 300};
	
	detach _laze;

	deleteVehicle _laze;
	
	_wp1 = _chGroup addwaypoint [_unitPos, 20];
	_wp1 setwaypointtype "MOVE";	
	_wp1 setWaypointBehaviour "AWARE";
	_wp1 setWaypointCombatMode "GREEN";
	_wp1 setWaypointSpeed "NORMAL";
	_wp1 setWaypointStatements ["true","driver (vehicle this) sideChat format ['FixedWingCAS returning to BASE!'];"];

	_wp2 = _chGroup addwaypoint [_spawnLoc, 20];
	_wp2 setwaypointtype "MOVE";
	_wp2 setWaypointBehaviour "CARELESS";
	_wp2 setWaypointCombatMode "BLUE";
	_wp2 setWaypointSpeed "FULL";
	_wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);deleteMarkerLocal 'FStart';"];
			
	waitUntil {!alive FixedWingCAS};
	
 	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["FixedWingCAS ready for reassignment!"];

} else {
		
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["No targets in that area, %1!", name _unit];
	uisleep 1;
	
 	deleteMarkerLocal _marker;
  };
};	
