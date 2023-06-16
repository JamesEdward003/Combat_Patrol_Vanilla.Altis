/////--"ParamsPlus\RallyTent.sqf--/////
_PRallyTent = "PRallyTent" call BIS_fnc_getParamValue;
if (_PRallyTent isEqualTo 1) exitWith {};
//(_this select 0) addEventHandler ["Respawn",{(_this select 0) execVM "ParamsPlus\RallyTent.sqf"}];
_unit = _this;
_actions = actionIDs _unit;
_array = [];

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\RallyTent.sqf";
}];

_unit addEventHandler ["WeaponAssembled", { (_this select 1) setCaptive true;(_this select 1) allowDamage false }];

for [{_i= (count _actions)-1},{_i>-1},{_i=_i-1}] do {
	_params = _unit actionParams (_actions select _i);
	_array = _array + [(_params select 0)];
	};

if !(("<t color='#00FFFF'>Deploy Rally Tent</t>") in _array) then {

Rally_Tent = _unit addAction ["<t color='#00FFFF'>Deploy Rally Tent</t>", {(_this select 0) call
{

	_height = ((getPosASLW _this) select 2);
//	_height = ((getPosATLVisual _this) select 2);

	_mrkrColor = switch (side _this) do 
		{
			case west: 			{"ColorBLUFOR"};
			case east: 			{"ColorOPFOR"};
			case resistance: 	{"ColorIndependent"};
			case civilian: 		{"ColorCivilian"};
		};
	_rallyvar = switch (side _this) do 
		{
			case WEST: 			{"RallyTent_West"};
			case EAST: 			{"RallyTent_East"};
			case RESISTANCE: 	{"RallyTent_Guer"};
			case CIVILIAN: 		{"RallyTent_Civ"};
		};
	_bpclass = switch (side _this) do // 	B_Bergen_mcamo_F  Respawn_Sleeping_bag_F  Respawn_Sleeping_bag_brown_F  Respawn_Sleeping_bag_blue_F
		{
			case WEST: 			{"Respawn_Sleeping_bag_F"};
			case EAST: 			{"Respawn_Sleeping_bag_brown_F"};
			case RESISTANCE: 	{"Respawn_Sleeping_bag_brown_F"};
			case CIVILIAN: 		{"Respawn_Sleeping_bag_blue_F"};
		};
	_tentclass = switch (side _this) do  //		Land_TentA_F  Land_TentDome_F  Respawn_TentDome_F  Patrol_Respawn_bag_F
		{
			case WEST: 			{"Respawn_TentDome_F"};
			case EAST: 			{"Respawn_TentA_F"};
			case RESISTANCE: 	{"Patrol_Respawn_bag_F"};
			case CIVILIAN: 		{"Respawn_TentA_F"};
		};
	_tentmrkr = switch (side _this) do 
		{
			case WEST: 			{"b_uav"};
			case EAST: 			{"o_uav"};
			case RESISTANCE: 	{"n_uav"};
			case CIVILIAN: 		{"loc_Box"};
		};
	_respmrkr = switch (side _this) do 
		{
			case WEST: 			{"respawn_west"};
			case EAST: 			{"respawn_east"};
			case RESISTANCE: 	{"respawn_guer"};
			case CIVILIAN: 		{"respawn_civilian"};
		};
	switch (side _this) do {		
		case WEST: {
		 	_pos = _this modelToWorld [0,3,_height];
		 	_posy = _this modelToWorld [4,2,_height];
		 	_posz = _this modelToWorld [6,2,_height];
		 	if (!isNil {missionNamespace getVariable _rallyvar}) then 
		 	{
		 		deleteVehicle respawn_west_helipad;
				deleteVehicle respawn_west;
				deleteMarker "respawn_west";
				_tentid = missionNamespace getVariable _rallyvar;
				_tentobj = _tentid call BIS_fnc_objectFromNetId;
		 		deleteVehicle _tentobj;
		 		deleteMarker (str _tentid);
	 		};  
			_logicGroup = createGroup (side _this);
        	respawn_west = _logicGroup createUnit ["ModuleRespawnPosition_F",_posy, [], 0, "FORM"];
        	respawn_west_helipad = "Land_HelipadEmpty_F" createVehicle _posz;        
        	createMarkerLocal ["respawn_west", position respawn_west];
        	"respawn_west" setMarkerTypeLocal "respawn_inf";
        	"respawn_west" setMarkerShapeLocal "Icon";
        	"respawn_west" setMarkerTextLocal " respawn_west";
        	"respawn_west" setMarkerSizeLocal [1,1];
        	"respawn_west" setMarkerColorLocal _mrkrColor; 
	        	
	        systemChat "Your rally has been teleported.";
	            
	        gridPos = mapGridPosition getPos respawn_west;
	        publicVariable "gridPos";
	        parseText format ["<t size='1.2' align='center' color='#00FFFF'>Rally moved to grid %1", gridPos] remoteExec ["hintSilent"];
		};
		case EAST: {
		 	_pos = _this modelToWorld [0,3,_height];
		 	_posy = _this modelToWorld [4,2,_height];
		 	_posz = _this modelToWorld [6,2,_height];
		 	if (!isNil {missionNamespace getVariable _rallyvar}) then 
		 	{
		 		deleteVehicle respawn_east_helipad;
				deleteVehicle respawn_east;
				deleteMarker "respawn_east";
				_tentid = missionNamespace getVariable _rallyvar;
				_tentobj = _tentid call BIS_fnc_objectFromNetId;
		 		deleteVehicle _tentobj;
		 		deleteMarker (str _tentid);
	 		};
			_logicGroup = createGroup (side _this);
        	respawn_east = _logicGroup createUnit ["ModuleRespawnPosition_F",_posy, [], 0, "FORM"];
        	respawn_east_helipad = "Land_HelipadEmpty_F" createVehicle _posz;         
        	createMarkerLocal ["respawn_east", position respawn_east];
        	"respawn_east" setMarkerTypeLocal "respawn_inf";
        	"respawn_east" setMarkerShapeLocal "Icon";
        	"respawn_east" setMarkerTextLocal " respawn_east";
        	"respawn_east" setMarkerSizeLocal [1,1];
        	"respawn_east" setMarkerColorLocal _mrkrColor; 
	        	
	        systemChat "Your rally has been teleported.";
	            
	        gridPos = mapGridPosition getPos respawn_east;
	        publicVariable "gridPos";
	        parseText format ["<t size='1.2' align='center' color='#00FFFF'>Rally moved to grid %1", gridPos] remoteExec ["hintSilent"];
		};
		case RESISTANCE: {
		 	_pos = _this modelToWorld [0,3,_height];
		 	_posy = _this modelToWorld [4,2,_height];
		 	_posz = _this modelToWorld [6,2,_height];
		 	if (!isNil {missionNamespace getVariable _rallyvar}) then 
		 	{
		 		deleteVehicle respawn_guer_helipad;
				deleteVehicle respawn_guer;
				deleteMarker "respawn_guer";
				_tentid = missionNamespace getVariable _rallyvar;
				_tentobj = _tentid call BIS_fnc_objectFromNetId;
		 		deleteVehicle _tentobj;
		 		deleteMarker (str _tentid);
	 		};
			_logicGroup = createGroup (side _this);
        	respawn_guer = _logicGroup createUnit ["ModuleRespawnPosition_F",_posy, [], 0, "FORM"];
        	respawn_guer_helipad = "Land_HelipadEmpty_F" createVehicle _posz;         
        	createMarkerLocal ["respawn_guer", position respawn_guer];
        	"respawn_guer" setMarkerTypeLocal "respawn_inf";
        	"respawn_guer" setMarkerShapeLocal "Icon";
        	"respawn_guer" setMarkerTextLocal " respawn_guer";
        	"respawn_guer" setMarkerSizeLocal [1,1];
        	"respawn_guer" setMarkerColorLocal _mrkrColor; 
	        	
	        systemChat "Your rally has been teleported.";
	            
	        gridPos = mapGridPosition getPos respawn_guer;
	        publicVariable "gridPos";
	        parseText format ["<t size='1.2' align='center' color='#00FFFF'>Rally moved to grid %1", gridPos] remoteExec ["hintSilent"];
		};	
		case CIVILIAN: {
		 	_pos = _this modelToWorld [0,3,_height];
		 	_posy = _this modelToWorld [4,2,_height];
		 	_posz = _this modelToWorld [6,2,_height];
		 	if (!isNil {missionNamespace getVariable _rallyvar}) then 
		 	{
		 		deleteVehicle respawn_civilian_helipad;
				deleteVehicle respawn_civilian;
				deleteMarker "respawn_civilian";
				_tentid = missionNamespace getVariable _rallyvar;
				_tentobj = _tentid call BIS_fnc_objectFromNetId;
		 		deleteVehicle _tentobj;
		 		deleteMarker (str _tentid);
	 		};
			_logicGroup = createGroup (side _this);
        	respawn_civilian = _logicGroup createUnit ["ModuleRespawnPosition_F",_posy, [], 0, "FORM"];
        	respawn_civilian_helipad = "Land_HelipadEmpty_F" createVehicle _posz;         
        	createMarkerLocal ["respawn_civilian", position respawn_civilian];
        	"respawn_civilian" setMarkerTypeLocal "respawn_inf";
        	"respawn_civilian" setMarkerShapeLocal "Icon";
        	"respawn_civilian" setMarkerTextLocal " respawn_civilian";
        	"respawn_civilian" setMarkerSizeLocal [1,1];
        	"respawn_civilian" setMarkerColorLocal _mrkrColor; 
	        	
	        systemChat "Your rally has been teleported.";
	            
	        gridPos = mapGridPosition getPos respawn_civilian;
	        publicVariable "gridPos";
	        parseText format ["<t size='1.2' align='center' color='#00FFFF'>Rally moved to grid %1", gridPos] remoteExec ["hintSilent"];
		};
	};

	_location = _this modelToWorld [0,2,_height];
	_this playMove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon_Putdown";
	uisleep 0.5;
	_tentname = _tentclass createVehicle _location;
	_tentid = _tentname call BIS_fnc_netId;
	missionNamespace setVariable [_rallyvar,_tentid];
	_tentname setVehiclePosition [_this modelToWorld [0,2,_height], [], 0, "CAN_COLLIDE"];
	_tentname enableSimulation false;

	[_this,_tentname] spawn {
		private ["_unit","_tentname","_Damage_EH"];
		params ["_unit","_tentname"];
		_Damage_EH = { 
		private ["_unit","_tentname","_Damage_EH"];
		params ["_unit","_tentname"];
		_unit = _this select 0;
		_tentname = _this select 1;
		scopeName "main";
	 	while {alive _tentname} do {
	      	scopeName "loop1";
	      	getDammage _tentname;
	      	while {((getDammage _tentname) > .1)} do {
	         	scopeName "loop2";
				hintSilent parsetext format ["<t size='0.85' align='left'>Owner: </t><t size='0.85' color='#00bbff' align='left'>%3</t><br/><t size='0.85' align='left'>Type: </t><t size='0.85' color='#00bbff' align='left'> %1</t><br/><t size='0.85' align='left'>Damage: </t><t size='0.85' color='#00bbff' align='left'> %2</t>", typeOf _tentname, damage _tentname,name _unit];
	          	if ((getDammage _tentname) > .99) then {breakTo "main"}; // Breaks all scopes and return to "main"
	          	if ((getDammage _tentname) < .1) then {breakOut  "loop2"}; // Breaks scope named "loop2"
	      	sleep  1; };
	  	sleep  1; }; 
		};
		[_unit,_tentname] call _Damage_EH;
	};

//	_this action ['AddBag', (nearestObject [_this, 'GroundWeaponHolder']), typeOf firstBackpack (nearestObject [_this, 'GroundWeaponHolder'])];

//	_this addAction ["<t color='#00FFFF'>"AddBag"</t>", {(_this select 0) action ["AddBag", (nearestObject [_this, "GroundWeaponHolder"]), typeOf firstBackpack (nearestObject [_this, "WeaponHolder"])];,"",10,false,true,"","_this distance _target<10"];

//	_this addAction ["<t color='#FF0000'>Put on Pack</t>","params ['_target','_caller']; _target action ['AddBag', (nearestObject [_target, 'WeaponHolder']), typeOf firstBackpack (nearestObject [_target, 'WeaponHolder'])];","",10,true,true,"",""];

//	_this addAction ["<t color='#40e0d0'>Take Pack</t>","params ['_target','_caller']; 

	_tentname addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		{deleteVehicle _x} forEach nearestObjects [_unit, ["logic","HeliH"], 10];
		{deleteMarker _x} forEach allMapMarkers select {(getMarkerType _x == "respawn_inf") inArea [getPos _unit, 10, 10, 0, false, 100];}; 
		{deleteMarker _x} forEach allMapMarkers select {(getMarkerType _x == _tentmrkr) inArea [getPos _unit, 10, 10, 0, false, 100];}; 
		_killer addRating 100;
	}];

	_marker = createMarkerLocal [(str _tentid),position _tentname]; 
	_marker setMarkerShapeLocal "ICON"; 
	_marker setMarkerTypeLocal _tentmrkr;

	_tentname addAction ["<t color='#40e0d0'>Recruit Units</t>","bon_recruit_units\open_dialog.sqf",[],10,false,true,"","_this distance _target<10"];

	_terminalclass = switch (side _this) do 
		{
			case WEST: 			{"B_UavTerminal"};
			case EAST: 			{"O_UavTerminal"};
			case RESISTANCE: 	{"I_UavTerminal"};
			case CIVILIAN: 		{"C_UavTerminal"};
		};

	if(!(_terminalclass in assignedItems _this)) then 
		{
			_this unassignitem "ItemGPS";
			_this removeItem "ItemGPS";

			_this addWeapon _terminalclass;
			_this assignItem _terminalclass;
			_this addItem _terminalclass;
		};

	switch true do 
		{
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) != -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>RallyTent set with group members closer than 25m and no enemies closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) != -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} != -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>RallyTent set with group members closer than 25m and enemies closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) == -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>RallyTent set with no members closer than 25m and no enemies closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) == -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} != -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>RallyTent set with no members closer than 25m and enemies closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		};	

	};
	},
  	[],
  	9,
  	false,
  	true,
  	"",
  	"isNull objectParent _this",
  	-1,
  	true,
  	"",
  	""];
};

if (isPlayer _unit) then {

	[playerSide, "HQ"] commandChat "RallyTent Adjustments Done!";

};

















	
/*
vehicles inAreaArray myTrigger;

allUnits inAreaArray "myMarker";

allPlayers inAreaArray myLocation;

allDead inAreaArray [[100, 100, 0], 20, 30, 45, false, 10];


position inArea [center, a, b, angle, isRectangle, c];

position: Object or Array in format Position2D or Position3D
center: Array or Object - center of the area in format Position2D, Position3D, Object or Group
a: Number - x axis (x / 2)
b: Number - y axis (y / 2)
angle: Number - rotation angle
isRectangle: Boolean - true if rectangle, false if ellipse
since 
25.2px
1.60
c: Number - (Optional, default -1 (unlimited)) z axis (z / 2)

_myPosition inArea [[100, 100, 0], 20, 30, 45, false];

//allMapMarkers select {(getMarkerType _x) inArea _TriggerArea};
*/

