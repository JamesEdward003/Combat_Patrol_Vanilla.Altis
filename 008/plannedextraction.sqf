//////////////////////////////////////////////////////
//  From trigger:
//  nul = [player] execVM "plannedExtraction.sqf";
/////////////////////////////////////////////////////
private ["_unit","_sideUnit","_unitPos","_sourcePoint","_pos","_blinky","_vehicle","_landPos","_endPos","_end","_mrkrcolor","_marker","_mrkr","_randDir","_randDist","_spawnLoc","_flightPath","_flightPath2","_ch","_chGroup"];
waituntil {!isnil "bis_fnc_init"};

_unit = _this select 0;
_sideUnit = side _unit;
_unitPos = getPos _unit;
_sourcePoint = vehicle _unit;

_vehicle = [];

switch (_sideUnit) do 
{
	case west: 		{_vehicle = "CH_47F_EP1"};      //"UH1Y"};
	case east: 		{_vehicle = "Mi17_rockets_RU"};
	case resistance: 	{_vehicle = "UH1H_TK_GUE_EP1"};
	case civilian: 	{_vehicle = "Mi17_Civilian"};
};

_mrkrcolor 	= [];

switch (_sideUnit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

//_vehicle = "CH_47F_EP1";
//_vehicle = "fza_ah64d_b2e_nr";
//_vehicle = "OFrP_Caracal";
//_vehicle = "OFrP_Caracal_DAOS";
//_vehicle = "OFrP_Caracal_RESCO";
//_vehicle = "OFrP_Puma_CE_Pirate";
//_vehicle = "OFrP_Tiger_HAD_CE";
//_vehicle = "MAF_AS555_EALAT";
//_vehicle = "Ka60_PMC";
//_vehicle = "Ka60_GL_PMC";
//_vehicle = "Ka137_PMC";
//_vehicle = "Ka137_MG_PMC";
//_vehicle = "MAF_AS555_EALAT";
//_vehicle = "MAF_AS555_EALAT";

MOVE_TASK = {
	if (!isNil "A_MOVE_TASK") then {player removeSimpleTask A_MOVE_TASK};
	_task = _this select 0;
	_task_dest = _this select 1;
	_task_pos = getPosATL _task_dest;
	A_MOVE_TASK = player createSimpleTask [_task];
	A_MOVE_TASK setSimpleTaskDestination _task_pos;
	A_MOVE_TASK setSimpleTaskDescription [
	_task,
	_task,
	_task
	];
	A_MOVE_TASK setTaskState "CREATED";
	taskHint ["LZ", [1, 1, .5, 1], "taskNew"];
	//[objNull, objNull, A_MOVE_TASK, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	uisleep 4;

	A_MOVE_TASK setTaskState "ASSIGNED";
	taskHint ["LZ", [0, 1, 0, 1], "taskCurrent"];
	//[objNull, objNull, A_MOVE_TASK, "ASSIGNED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	player setCurrentTask A_MOVE_TASK;
	uisleep 10; 

	PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat "The task marker shown will be removed in 60 seconds";
	uisleep 60; 
	player removeSimpleTask A_MOVE_TASK;
};

_randDir = getDir vehicle _sourcePoint - 10;
_randDir = _randDir + random(20);
_randDist = (random 100) + 2000;
_spawnLoc =	[(getPos vehicle _sourcePoint select 0) + (_randDist * sin(_randDir)), (getPos vehicle _sourcePoint select 1) + (_randDist * cos(_randDir)), 0];

_marker = createMarkerLocal ["Start", _spawnLoc];
_marker setMarkerTypeLocal "mil_start";
_marker setMarkerShapeLocal "Icon";  
_marker setMarkerTextLocal "Start";
_marker setMarkerSizeLocal [0.75,0.75];
_marker setMarkerDirLocal 0;
_marker setMarkerColorLocal _mrkrcolor;	

if (isServer) then {

uisleep 0.25;
location = false;
openmap [true,false];
//titleText["Map location", "PLAIN DOWN"];
_null=["<t color='#2cb88e' size='.8'>Map Location</t>",-1,1,4,1,0,789] spawn BIS_fnc_dynamicText;
PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat "On mapclick set a location";

onMapSingleClick "onMapSingleClick ''; mappos = _pos; location = true";		
waitUntil {uisleep 1; (!visiblemap OR location OR !alive _unit)};
	if (!location OR !alive _unit) exitWith {
	mappos = nil;
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat "Map location canceled";
	hintSilent parseText format ["<t size='1.25' color='#ff0000'>(crew _vehicle) canceled</t>"];
	titletext ["","plain"];
	};

	_mrkr = createMarkerLocal ["LZ", mappos];
	_mrkr setMarkerTypeLocal "mil_end";
	_mrkr setMarkerShapeLocal "Icon";
	_mrkr setMarkerTextLocal "LZ";
	_mrkr setMarkerSizeLocal [1,1];
	_mrkr setMarkerDirLocal 0;
	_mrkr setMarkerColorLocal _mrkrcolor;

titletext ["","plain",0.2];
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];

	_landPos = [_unit, 20, getdir _unit] call BIS_fnc_relPos;
	_end = getMarkerPos "LZ";
	_endPos = [_end select 0, _end select 1, 0];

	// Create a little shiney ball we can use to get the direction from start to caller with
	_blinky = "Sign_sphere10cm_EP1" createVehicle _spawnLoc;
	_flightPath = [_blinky, _unit] call BIS_fnc_relativeDirTo;		
	_marker setMarkerDirLocal _flightPath;
	
	// Spawn the helo, facing the user, in the air at the start location.
	_ch = [[_spawnLoc select 0, _spawnLoc select 1, 70], _flightPath, _vehicle, _sideUnit] call BIS_fnc_spawnVehicle;
	
	// Name the helo globally so that waypoint orders will work.
	transporthelo = _ch select 0;
	
	// group of helo so waypoints work.
	_chGroup = _ch select 2; 
	
	// Make sure they don't get distracted.
	//leader _chGroup setBehaviour "CARELESS";
	
	// uncomment this to make your ride safe. 
	//transporthelo setCaptive true; 
	
	// These lines might be needed in MP. :)  Didn't test it yet.
	_ch select 0 setVehicleInit "TransportHelo = this; this setVehicleVarName 'TransportHelo'; TransportHeloGroup=group this; this setGroupID ['TransportHeloGroup', 'GroupColor4'];  
	this flyInHeight 100;
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
	[this] execVM '008\SeatAction\seat_action.sqf';
	[this] execVM '008\heliDoors.sqf';
	this addAction ['Alternate Landing Zone','008\altLZ.sqf',[],1,false,true,'','(alive _target)'];
	this addEventHandler ['Fired',{[_this select 0,getNumber (configFile/'CfgAmmo'/(_this select 4)/'explosive')] spawn {if (_this select 1==1) then {uisleep 0.5};_this select 0 setVehicleAmmo 1}}];
	this addEventHandler ['Killed', {[_this select 0,_this select 1,'Start',lzPickup,lzDropOff] execVM '008\onKilled.sqf'}];
	{[_x] execVM '008\adfalse.sqf'} forEach crew this;
	this addeventhandler ['Getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];
	this addeventhandler ['Getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];
	this addAction ['Get Equipment Preset','bon_loadoutpresets\bon_loadout_presets.sqf',[],-99,false,true,'','_this in _target'];
	this addAction ['Save Loadout','OnRespawnLoadout.sqf',[],-99,false,true,'','_this in _target'];
	this addAction ['Service','x_reload.sqf',[],-99,false,true,'','_this in _target'];
	this addAction ['Get In Cargo','GetInCargo.sqf',[],-99,false,true,'',''];
	this addEventHandler ['GetIn','(_this select 2) setBehaviour ''CARELESS'';(_this select 2) allowDamage FALSE'];
	this addEventHandler ['GetOut','(_this select 2) setBehaviour ''COMBAT'';(_this select 2) allowDamage FALSE;[(_this select 0),(_this select 2)] spawn {waitUntil {((_this select 1) distance (_this select 0)) > 20;}; (_this select 1) allowDamage TRUE;}'];";

	processInitCommands;

	uisleep 0.25;   

	_airDist = _unit distance TransportHelo;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["TransportHelo is %1 meters from %2.", round(_airDist)/1.0, name _unit];

	//PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["TransportHelo to your position!",name _unit];
		
	// Delete the cute little light that let us spawn facing the right direction
	// and create landing pads for pickup and dropoff.
	deleteVehicle _blinky;
	lzPickup = "HeliHEmpty" createvehicle _landPos;
	_flightPath2 = [lzPickup, _endPos] call BIS_fnc_relativeDirTo;		
	_mrkr setMarkerDirLocal (_flightPath2 + 180);

	["LZ",lzPickup] spawn MOVE_TASK;

	_markr = createMarkerLocal ["LZ", _landPos];
	_markr setMarkerTypeLocal "mil_pickup";
	_markr setMarkerShapeLocal "Icon";  
	_markr setMarkerTextLocal "LZ";
	_markr setMarkerSizeLocal [0.75,0.75];
	_markr setMarkerDirLocal 0;
	_markr setMarkerColorLocal _mrkrcolor;	

	driver TransportHelo setBehaviour "CARELESS";
	
	// Give the helo a waypoint to where the player is and make it land, engines on.
	wp0 = _chGroup addwaypoint [_landPos, 20];
	wp0 setwaypointtype "LOAD";	
	wp0 setWaypointBehaviour "AWARE";
	wp0 setWaypointCombatMode "BLUE";
	wp0 setWaypointSpeed "NORMAL";
	wp0 setWaypointStatements ["true","(vehicle this) land 'GET IN';"];

	// Wait till the player's group is in the helo.
	waitUntil{{_x in transporthelo} count units group _unit == count units group _unit};

	if ((getMarkerColor "Pickup") != "") then {deleteMarker "Pickup"};
	if (!isNull lzPickup) then {deleteVehicle lzPickup};

	lzDropOff = "HeliHEmpty" createvehicle _endPos;
	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["TransportHelo to your LZ %1!",name _unit];

	["LZ",lzDropOff] spawn MOVE_TASK;

	// Once they are, off we go by setting a TRANSPORT UNLOAD waypoint.  
	// It'll auto boot the leader once there, but he'll have to tell the others to get out.
	wp1 = _chGroup addwaypoint [_endPos, 20];
	wp1 setwaypointtype "TR UNLOAD";	
	wp1 setWaypointBehaviour "CARELESS";
	wp1 setWaypointCombatMode "BLUE";
	wp1 setWaypointSpeed "NORMAL";
	wp1 setWaypointStatements ["true","(vehicle this) land 'GET OUT';"];

	// Wait till the player's group is out of the helo.
	waitUntil { {_x in Transporthelo} count units group _unit == 0 };

	if ((getMarkerColor "LZ") != "") then {deleteMarker "LZ"};
	if (!isNull lzDropOff) then {deleteVehicle lzDropOff};

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat "TransportHelo to reassignment!";

	// Once they are out, set a waypoint back to the start and clean up by deleting the helo and landing pads and markers.
	wp2 = _chGroup addwaypoint [_spawnLoc, 20];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointBehaviour "CARELESS";
	wp2 setWaypointCombatMode "BLUE";
	wp2 setWaypointSpeed "NORMAL";
	wp2 setWaypointStatements ["true","{deletevehicle _x} foreach (crew vehicle this + [vehicle this]);
	PAPABEAR=[(side (vehicle this)),'HQ']; PAPABEAR SideChat 'Transporthelo ready for reassignment!';
	deleteMarker 'Start';"];
};
/*
this addAction ['Get Equipment Preset','bon_loadoutpresets\bon_loadout_presets.sqf',[],-99,false,true,'','_this in _target'];
this addAction ['Save Loadout','OnRespawnLoadout.sqf',[],-99,false,true,'','_this in _target'];
this addAction ['Service','x_reload.sqf',[],-99,false,true,'','_this in _target'];
this addAction ['Get In Cargo','GetInCargo.sqf',[],-99,false,true,'',''];
this addEventHandler ['GetIn','(_this select 2) setBehaviour ''CARELESS'';(_this select 2) allowDamage FALSE'];
this addEventHandler ['GetOut','(_this select 2) setBehaviour ''COMBAT'';(_this select 2) allowDamage FALSE;[(_this select 0),(_this select 2)] spawn {waitUntil {((_this select 1) distance (_this select 0)) > 20;}; (_this select 1) allowDamage TRUE;}'];
*/
