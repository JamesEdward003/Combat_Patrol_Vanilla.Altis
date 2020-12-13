/////////////  "initServer.sqf"  ////////////
// _Base = [playerSide, "PAPA_BEAR"] commandChat "Initiating InitServer!";
 _CROSSROAD = [playerSide, "HQ"] commandChat "Initiating InitServer!";
// _Base = [playerSide, "Base"] commandChat "Initiating InitServer!";
// _Base = [playerSide, "AirBase"] commandChat "Initiating InitServer!";
// _Broadway = [playerSide, "BLU"] commandChat "Initiating InitServer!";
// _Griffin = [playerSide, "OPF"] commandChat "Initiating InitServer!";
// _Phalanx = [playerSide, "IND"] commandChat "Initiating InitServer!";
// _Slingshot = [playerSide, "IND"] commandChat "Initiating InitServer!";

// Headquarters Entity module
//  BIS_hqWest, BIS_hqEast, BIS_hqGuer

//{if (!( isPlayer _x ) and !(_x in (units group player))) then  {deleteVehicle _x}} forEach (if ismultiplayer then {playableunits} else {switchableunits});

{if (!( isPlayer _x ) and (_x in (units group player))) then  {_x addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],-100,false,true,""];}} forEach (if ismultiplayer then {playableunits} else {switchableunits});

switch (playerSide) do {
	
	case west: {
		
		Civilian setFriend [East, 1];
		East setFriend [Civilian, 1];
		Civilian setFriend [West, 0];
		West setFriend [Civilian, 0];
		Civilian setFriend [Resistance, 1];
		Resistance setFriend [Civilian, 1];
		West setFriend [East, 0];
		East setFriend [West, 0];
		West setFriend [Resistance, 0];
		Resistance setFriend [West, 0];
	};
	case east: {
		
		Civilian setFriend [East, 0];
		East setFriend [Civilian, 0];
		Civilian setFriend [West, 1];
		West setFriend [Civilian, 1];
		Civilian setFriend [Resistance, 1];
		Resistance setFriend [Civilian, 1];
		West setFriend [East, 0];
		East setFriend [West, 0];
		West setFriend [Resistance, 0];
		Resistance setFriend [West, 0];
	};
	case resistance: {
		
		Civilian setFriend [East, 1];
		East setFriend [Civilian, 1];
		Civilian setFriend [West, 1];
		West setFriend [Civilian, 1];
		Civilian setFriend [Resistance, 0];
		Resistance setFriend [Civilian, 0];
		West setFriend [East, 0];
		East setFriend [West, 0];
		West setFriend [Resistance, 0];
		Resistance setFriend [West, 0];
	};
	case civilian: {
		
		Civilian setFriend [East, 0];
		East setFriend [Civilian, 0];
		Civilian setFriend [West, 0];
		West setFriend [Civilian, 0];
		Civilian setFriend [Resistance, 0];
		Resistance setFriend [Civilian, 0];
		West setFriend [East, 0];
		East setFriend [West, 0];
		West setFriend [Resistance, 0];
		Resistance setFriend [West, 0];
	};
};

waitUntil {!isNil "BIS_CP_initDone"};

waitUntil {!isNil "BIS_CP_targetLocationID"};

waitUntil {BIS_CP_targetLocationID >= 0};

BIS_CP_exfilPos = position player;

_startpos = [BIS_CP_targetLocationPos, 300, (0 + random 90)] call BIS_fnc_relPos;

_civilianBuildingStart = nearestBuilding _startpos;

_grp = createGroup civilian;

placetwoSpots = 
{
_startpos = getpos _this;

_m1 = _grp createUnit ["ModuleCivilianPresenceSafeSpot_F", _startpos, [], 0, "NONE"];
_m1 setVariable ["#capacity",5];
_m1 setVariable ["#usebuilding",true];
_m1 setVariable ["#terminal",false];
_m1 setVariable ["#type",5];

_m2 = _grp createUnit ["ModuleCivilianPresenceUnit_F", _startpos, [], 0, "NONE"];

_endpos = [BIS_CP_targetLocationPos, 300, (180 + random 90)] call BIS_fnc_relPos;

_civilianBuildingEnd = nearestBuilding _endpos;

_m3 = _grp createUnit ["ModuleCivilianPresenceSafeSpot_F", _endpos, [], 0, "NONE"];
_m3 setVariable ["#capacity",5];
_m3 setVariable ["#usebuilding",true];
_m3 setVariable ["#terminal",false];
_m3 setVariable ["#type",5];
};

_civilianBuildingStart call placetwoSpots;

_cen = getpos _civilianBuildingStart;

_m = _grp createUnit ["ModuleCivilianPresence_F", [0,0,0], [], 0, "NONE"];
//_m setVariable ["#init",_this execVM "ParamsPlus\Civilian_Presense.sqf"];
[_m, "_this execVM 'ParamsPlus\Civilian_Presense.sqf'"] remoteExec ["setVehicleInit", groupOwner _grp];
remoteExecCall ["processInitCommands"];

_m setVariable ["#area",[_cen,1000,1000,0,true,-1]];  // Fixed! this gets passed to https://community.bistudio.com/wiki/inAreaArray 

_m setVariable ["#debug",false]; // Debug mode on

_m setVariable ["#useagents",true];
_m setVariable ["#usepanicmode",false];

_m setVariable ["#unitcount",10];

//Adjust MARTA MILITARY ICONS distance to be seen from stock distance	
//[] spawn {
//	while {true} do {
//		sleep 2;
//		player setVariable [ "MARTA_REVEAL", allGroups select {side _x != playerSide && leader _x distance2D player < 300}];
//		player setVariable [ "MARTA_HIDE", allGroups select {side _x == playerSide or side _x == civilian or (leader _x distance2D player >= 300)}];
//	}
//};

["Preload"] call BIS_fnc_arsenal;

_Slingshot = [playerSide, "IND"] commandChat "Initiated Sides!";


