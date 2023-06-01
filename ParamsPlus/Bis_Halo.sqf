//////////////////////////////////////////////////////////////////
waitUntil { isServer || !isNull player };
private ["_veh", "_unit", "_group", "_sideUnit", "_pos", "_m"];
_veh = vehicle player;
_unit = player;
_group = group player;
_leader = leader _group;
_sideUnit = side player;

if (!isFormationLeader _veh) exitWith {};

uisleep 0.25;
objective = false;
openmap [true,false];

deleteMarker "mrkrx";

titleText["Map halo area", "PLAIN"];
PAPABEAR=[(side _unit),"HQ"]; PAPABEAR SideChat format ["On mapclick, %1, set a location", name _unit];
onMapSingleClick "onMapSingleClick ''; mappos = _pos; objective = true";		
waitUntil {sleep 1; ((visiblemap isEqualTo false) OR (objective isEqualTo true) OR ((alive _unit) isEqualTo false))};

	if ((objective isEqualTo false) OR ((alive _unit) isEqualTo false)) exitWith {
	mappos = nil;
	PAPABEAR=[(side _unit),"HQ"]; PAPABEAR SideChat "Mapclick location canceled";
	hint parseText format["<t size='1.25' color='#ff6161'>Map location canceled</t>"];
	titletext ["","plain"];
	};
	
	_m = createMarker ["mrkrx",mappos];
	_m setMarkerShape "ELLIPSE";
	_m setMarkerSize [200,200];
	_m setMarkerBrush "DiagGrid";
	_m setMarkerAlpha 1;
	_m setMarkerColor "ColorGreen";
	
titletext ["","plain",0.25];
hint parseText format["<t size='1.25' color='#44ff00'>Mapclick location successful</t>"];
uisleep 0.25;
hintSilent "";
openmap [false,false];

[_unit] execVM "ParamsPlus\altimeter.sqf";

PAPABEAR=[side _unit,"HQ"]; PAPABEAR SideChat format ["Pull the ripcord, %1, before height 300 meters!", name _unit];

unassignVehicle _leader;
_leader action ["EJECT", _veh];
uisleep 0.03;
_leader allowDamage false;
_leader setPos getMarkerPos "mrkrx";
[_leader,3000] call BIS_fnc_halo;
//[_x,2000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
_leader spawn {waitUntil {getPosATL _this select 2 < 300}; _this action ["openParachute",_this];};
_leader move (getMarkerPos "mrkrx");

{if (_x != _leader ) then {
	_dir = random 359;
	_leadDir = direction _leader;
	unassignVehicle _x;
	_x action ["EJECT", _veh];
	uisleep 0.03;
	_x allowDamage false;
	_x setPos [(getPos _leader select 0)-10*sin(_dir),(getPos _leader select 1)-10*cos(_dir)];
	_x setDir _leadDir;
	[_x,3000] call BIS_fnc_halo;
	_x addBackpack "B_Parachute"; 
	_x spawn {waitUntil {getPosATL _this select 2 < 200}; _x action ["openParachute",_x];};
	_x move (getMarkerPos "mrkrx");	
}} forEach units _group;

{if (isPlayer _x) then {[_x] execVM "ParamsPlus\altimeter.sqf";}} forEach units _group;

	enableRadio false;

	PAPABEAR=[_sideUnit,"HQ"]; PAPABEAR SideChat format ["Pull the ripcord, %1, before height 300 meters!", name _unit];
	
waitUntil {((getPos player) select 2) < 1 || !alive player};

uisleep 6; 

{
	_x allowDamage true;
	
} forEach units _group;

enableRadio true;

deleteMarker "mrkrx";
