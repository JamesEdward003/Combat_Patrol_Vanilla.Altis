//////////////////////////////////////////////////////
//  From trigger:
//  nul = [player] execVM "onMapClick.sqf";
//////////////////////////////////////////////////////
private ["_pos","_baseball"];
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

	_baseball = createVehicle ["Baseball", mappos, [], 0, "NONE"];
	_baseball setVehicleVarName "Bazeball";

titletext ["","plain",0.2];
hint parseText format["<t size='1.25' color='#00FFFF'>Mapclick location successful</t>"];
uisleep 2;
hintSilent "";
openmap [false,false];
