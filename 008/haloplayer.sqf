///////////////////////////////////////////////////////////////
// 008\HaloPlayer.sqf
// hint 'Close the map and don''t forget to open your chute!';
///////////////////////////////////////////////////////////////
private ["_mrkrcolor", "_mrkr"];

_mrkrcolor 	= [];

switch (playerSide) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

MOVE_TASK = {
	if (!isNil "A_MOVE_TASK") then {player removeSimpleTask A_MOVE_TASK};
	_task = _this select 0;
	_task_dest = _this select 1;
	_task_pos = [(getMarkerPos _task_dest) select 0,(getMarkerPos _task_dest) select 1,0];
	A_MOVE_TASK = player createSimpleTask [_task];
	A_MOVE_TASK setSimpleTaskDestination _task_pos;
	A_MOVE_TASK setSimpleTaskDescription [
	_task,
	_task,
	_task
	];
	A_MOVE_TASK setTaskState "CREATED";
	taskHint ["LZ4", [1, 1, .5, 1], "taskNew"];
	//[objNull, objNull, A_MOVE_TASK, "CREATED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	uisleep 4;

	A_MOVE_TASK setTaskState "ASSIGNED";
	taskHint ["LZ4", [0, 1, 0, 1], "taskCurrent"];
	//[objNull, objNull, A_MOVE_TASK, "ASSIGNED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
	player setCurrentTask A_MOVE_TASK;
	uisleep 10; 

	PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat "The task marker shown will be removed in 60 seconds";
	uisleep 60; 
	player removeSimpleTask A_MOVE_TASK;
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
	_mrkr setMarkerSizeLocal [100,100];
	_mrkr setMarkerBrushLocal "DiagGrid";
	_mrkr setMarkerAlpha .5;
	_mrkr setMarkerColorLocal _mrkrcolor;

titletext ["","plain"];
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
player allowDamage false;
if (vehicle player == player) then {
	unassignVehicle leader group player;
	leader group player action ["EJECT", vehicle player];
};
uisleep 0.03;
player disableConversation true;
enableRadio false;
titleCut ["Pull the ripcord before height 300 meters!", "BLACK FADED", 999];
player setPos mappos;
[player, 2000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
[player] execVM "008\altimeter.sqf";
["LZ_Halo","LZ_Halo"] spawn MOVE_TASK;
uisleep 0.5;
openmap [false,false];

titlecut ["","BLACK IN",5];

PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["Pull the ripcord, %1, before height 300 meters!", name player];
	
waitUntil {((getPos player) select 2) < 1 || !alive player};

player disableConversation false;
enableRadio true;

uisleep 6; 

player allowDamage true;
	
enableRadio true;

deleteMarker "LZ_Halo";

};
