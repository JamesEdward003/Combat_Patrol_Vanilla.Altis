///////////////////////////////////////////////////////////////
// 008\HaloGroup.sqf
// hint 'Close the map and don''t forget to open your chute!';
///////////////////////////////////////////////////////////////
private ["_mrkrcolor", "_mrkr", "_currTask"];

enableRadio false;
enableSentences false;
{_x disableConversation true} forEach units group player;

_currTask = currentTask (leader (group player));

_mrkrcolor 	= [];

switch (playerSide) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};
MOVE_TASK = {
	if (!isNil "taskID") then {["taskID"] call BIS_fnc_deleteTask};
	private _title = "Halo Jump";
	private _description = "Halo Jump at marked LZ";
	private _waypoint = "LZ_Halo";
	private _myTask = [group player, "taskID", [_description, _title, _waypoint], LZ_Halo, true] call BIS_fnc_taskCreate;
	private _myTask = ["taskID", group player, ["Halo Jump at marked LZ","Halo Jump","LZ_Halo"], [LZ_Halo,false], "ASSIGNED", 7, true, true, "Defend", true] call BIS_fnc_setTask;
	"taskID" call BIS_fnc_taskSetCurrent;
	//["taskID", "defend"] call BIS_fnc_taskSetType;	
	//["taskID", [(_this select 0), true]] call BIS_fnc_taskSetDestination;
	//["taskID", true] call BIS_fnc_taskSetAlwaysVisible;
	//["taskID", "ASSIGNED"] call BIS_fnc_taskSetState;
	//["taskID", "ASSIGNED"] call BIS_fnc_taskHint;
};

if (isServer) then {

uisleep 0.25;
location = false;
openmap [true,false];
titleText["Map location", "PLAIN DOWN"];

uisleep 0.25;

hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick your HALO position</t>"];
//PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["Mapclick your HALO position, %1, mark your new destination on the map.",name player];

onMapSingleClick "onMapSingleClick ''; mappos = _pos; location = true";		
waitUntil {uisleep 1; (!visiblemap OR location OR !alive player)};
	if (!location OR !alive player) exitWith {
	mappos = nil;
	titletext ["","plain"];
	PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat "HALO location canceled";
	hintSilent parseText format ["<t size='1.25' color='#ff0000'>HALO location canceled</t>"];
	};
	
	_mrkr = createMarkerLocal ["LZ_Halo", mappos];
	_mrkr setMarkerShapeLocal "ELLIPSE";
	_mrkr setMarkerTextLocal "LZ_Halo";
	_mrkr setMarkerSizeLocal [200,200];
	_mrkr setMarkerBrushLocal "DiagGrid";
	_mrkr setMarkerAlpha .5;
	_mrkr setMarkerColorLocal _mrkrcolor;

	LZ_Halo = "Land_JumpTarget_F" createVehicle getMarkerPos "LZ_Halo";

	titletext ["","plain"];
	hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
	uisleep 2;
	hintSilent "";
	leader group player allowDamage false;
	if (vehicle player == player) then {
		unassignVehicle leader group player;
		leader group player action ["EJECT", vehicle player];
	};
	uisleep 0.03;
	titleCut ["Pull the ripcord before height 300 meters!\nPress 'V' twice in rapid succession!", "BLACK FADED", 999];
	player setPos mappos;
	leader group player setPos getMarkerPos "LZ_Halo";
	[leader group player,3000] call BIS_fnc_halo;
	//[_x,2000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
	leader group player doMove (getMarkerPos "LZ_Halo");
	[LZ_Halo] spawn MOVE_TASK;
	uisleep 1;
openmap [false,false];
uisleep 1;
titleCut ["Pull the ripcord before height 300 meters!\nPress 'V' twice in rapid succession!","BLACK IN",4];
//PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["Pull the ripcord, %1, before height 300 meters!", name player];

{if (_x != leader group player ) then {
	unassignVehicle _x;
	_x action ["EJECT", vehicle player];
	uisleep 0.03;
	_x allowDamage false;
	_x setPos [(getPos leader group player select 0)-10*sin(random 359),(getPos leader group player select 1)-10*cos(random 359)];
	_x setDir direction leader group player;
	[_x,2850] call BIS_fnc_halo;
	//[_x,2000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
	_x doMove (getMarkerPos "LZ_Halo");
	_x doFollow (leader group player);	
}} forEach units group player;

{if (isPlayer _x) then {[_x] execVM "paramsplus\altimeter.sqf"}} forEach units group player;

waitUntil {((getPos player) select 2) < 1 || !alive player};

enableRadio true;
enableSentences true;
{_x disableConversation false} forEach units group player;

uisleep 20; 

{_x allowDamage true} forEach units group player;

deleteMarker "LZ_Halo";

(group player) setFormation "WEDGE";

uisleep 30;

["taskID", "SUCCEEDED"] call BIS_fnc_taskSetState;

deleteVehicle LZ_Halo;

(leader (group player)) setCurrentTask _currTask;

};

