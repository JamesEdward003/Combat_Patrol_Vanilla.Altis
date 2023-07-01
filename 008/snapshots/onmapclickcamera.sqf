//////////////////////////////////////////////////////
//  From trigger:
//  nul = [player] execVM "onMapClickCamera.sqf";
//////////////////////////////////////////////////////
private ["_pos","_arrow"];
uisleep 0.25;
location = false;
openmap [true,false];
titleText["Map location", "PLAIN"];
PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat format ["On mapclick, %1, set a location", name player];

onMapSingleClick "onMapSingleClick ''; mappos = _pos; location = true";		
waitUntil {sleep 1; (!visiblemap OR location OR !alive player)};
	if (!location OR !alive player) exitWith {
	mappos = nil;
	PAPABEAR=[playerSide,"HQ"]; PAPABEAR SideChat "Map location canceled";
	hintSilent parseText format["<t size='1.25' color='#ff0000'>Map location canceled</t>"];
	titletext ["","plain"];
	};
   
	hintSilent parseText format["<t size='1.25' color='#00FFFF'>Stand By...</t>"];

	_arrow = createVehicle ["Sign_Arrow_Yellow_F", mappos, [], 0, "NONE"];

	_arrow setPos [(getPos _arrow) select 0, (getPos _arrow) select 1, 0];

	uisleep 2;

	_arrow exec "camera.sqs";

titletext ["","plain",0.2];
hintSilent parseText format["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];

uisleep 2;

[] spawn {
	
	while {(!(isNil "BIS_DEBUG_CAM"))} do {		

		systemChat "Press NumPad 0 To Return";

		systemChat "Press Left Mouse Button To Teleport Camera";

		systemChat "Press Ctrl + Left Mouse Button To Teleport Player";

		systemChat "Press WASD Keys To Move";

		systemChat "Press F To Lock On Object";

		systemChat "Press L To Remove CrossHair";

		systemChat "Check CopyToClipboard.txt";

		uisleep 20;
	};
	deleteVehicle _arrow;
};
