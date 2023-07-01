//////////////////////////////////////////////////////////////////
// Function file for ArmA 2: Operation Arrowhead
// Created by: RALPH BELL AMI
//////////////////////////////////////////////////////////////////
_mrkr = [];

switch (playerSide) do 
{
	case west: 		{_mrkr = "target_west"};
	case east: 		{_mrkr = "target_east"};
	case resistance: 	{_mrkr = "target_guerrila"};
	case civilian: 	{_mrkr = "target_civilian"};
};

deleteMarker _mrkr;

_mrkrColor = [];

switch (playerSide) do 
{
	case west: 		{_mrkrColor = "ColorBlue"};
	case east: 		{_mrkrColor = "ColorRed"};
	case resistance: 	{_mrkrColor = "ColorGreen"};
	case civilian: 	{_mrkrColor = "ColorYellow"};
};

_laze = [];

switch (playerSide) do 
{
	case west: 		{_laze = laze_west};
	case east: 		{_laze = laze_east};
	case resistance: 	{_laze = laze_guerrila};
	case civilian: 	{_laze = laze_civilian};
};

if (!(isNil "_laze")) then {detach _laze};
if (!(isNil "_laze")) then {deleteVehicle _laze};

PAPABEAR=[West,"HQ"]; PAPABEAR SideChat format ["%1, click on the map.", name player];

sleep 1;
openMap true;
 	
dt=true;
onMapSingleClick "spwnPt = _pos;dt=false";
waitUntil {!dt};
onMapSingleClick "";

	_obj = "Sign_sphere10cm_EP1" createVehicle spwnPt;

sleep 1;	
openMap false;	

_targets = nearestObjects [_obj, ["Man","Car","Air","Tank","Truck","Ship","Static","House","Office","Barracks","Hanger"], 75];

_target = _targets select 0;

_target execvm "camera.sqf";

_height = (_target call BIS_fnc_boundingBoxDimensions) select 2;

_laze = "LaserTargetW" createVehicle getPos _target;

_laze attachTo [_target,[0,0,_height/2]];

deleteVehicle _obj;

createMarkerLocal [_mrkr, getPos _obj];
_mrkr setMarkerTypeLocal "select";
_mrkr setMarkerShapeLocal "Icon";
_mrkr setMarkerTextLocal "";
_mrkr setMarkerSizeLocal [1,1];
_mrkr setMarkerColorLocal _mrkrColor;

titleText [format ["Press Numpad-0 To Return"],"plain down"];

_laze spawn {

    t = time;

    waituntil {isnull _this};

    copyToClipboard format ["time started\n%1\n\ntime stopped\n%2\n\ntotal time\n%3",str t,str time,str (time - t)];
};

	//_obj = "Sign_sphere10cm_EP1" createVehicle spwnPt;
	//_smoke = "SmokeShellRed" createVehicle spwnPt;
	//_smoke setPosATL (_smoke modelToWorld [0,0,50]);
	//_smoke = "SmokeShellRed" createVehicle (_obj modelToWorld [0,0,50]);
/*
while {alive player} do {hintsilent format ["%1",cursorTarget call BIS_fnc_boundingBoxDimensions];uisleep 5;};
*/	