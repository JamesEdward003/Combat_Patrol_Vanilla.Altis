//////////////////////////////////////////////////////////////////
private ["_caller","_position","_target","_is3D","_id"];
params ["_caller","_position","_target","_is3D","_id"];
_caller = _this select 0;
_position = _this select 1;
_activationDistance = 1000;                  
_types = ["B_MBT_01_arty_F","O_MBT_02_arty_F","I_Truck_02_MRL_F","I_Truck_02_MRL_F"];

_vehicle = [];

switch (side _caller) do {

         case west:			{_vehicle = (_types select 0)};
         case east:			{_vehicle = (_types select 1)};
         case resistance:	{_vehicle = (_types select 2)};
         case civilian:		{_vehicle = (_types select 3)};
};

_mrkrcolor = [];

switch (side _caller) do {

         case west:			{_mrkrcolor = "ColorBLUFOR"};
         case east:			{_mrkrcolor = "ColorOPFOR"};
         case resistance:	{_mrkrcolor = "ColorGUER"};
         case civilian:		{_mrkrcolor = "ColorCIV"};
};

if (!isNil {missionNamespace getVariable "ArtilleryInProgress"}) exitWith {
	hint parseText format["<t size='1.25' color='#ff6161'>Artillery Mission Currently In Progress!</t>"];
};

if (_position isEqualTo []) then { 

	objective = false;
	sleep 0.25;
	openmap [true,false];
	sleep 0.25;

	titleText["Map target", "PLAIN"];
	onMapSingleClick "onMapSingleClick ''; mappos = _pos; objective = true";		
	waitUntil {sleep 1; (!visiblemap OR objective OR !alive _caller)};
		if (!objective OR !alive _caller) exitWith {
		mappos = nil;
		hint parseText format["<t size='1.25' color='#ff6161'>Map target canceled</t>"];
		titletext ["","plain"];
		};
		  
	_hLand = createMarkerLocal ["Artillery", mappos];
	_hLand setMarkerTypeLocal "mil_objective";
	_hLand setMarkerShapeLocal "Icon";
	_hLand setMarkerTextLocal " Artillery";
	_hLand setMarkerSizeLocal [.5,.5];
	_hLand setMarkerAlphaLocal .5;
	_hLand setMarkerColorLocal _mrkrcolor;
	
	titletext ["","plain",0.2];
	hint parseText format["<t size='1.25' color='#44ff00'>Map target successful</t>"];
	
	_position = getMarkerPos "Artillery";
		
	uisleep 1;
	openmap [false,false];

} else {
		  
	_hLand = createMarkerLocal ["Artillery", _position];
	_hLand setMarkerTypeLocal "mil_objective";
	_hLand setMarkerShapeLocal "Icon";
	_hLand setMarkerTextLocal " Artillery";
	_hLand setMarkerSizeLocal [.5,.5];
	_hLand setMarkerAlphaLocal .5;
	_hLand setMarkerColorLocal _mrkrcolor;
	
	hint parseText format["<t size='1.25' color='#44ff00'>Mark target successful</t>"];
	
	_position = _position;
};
uisleep 4;

_artillery = [];
{
	_arty = createVehicle [ _vehicle, getPos _x, [], 0, "NONE" ];
	_arty setVehiclePosition [_x modelToWorld [0,-1,((getPosASLW _x) select 2)], [], 0, "CAN_COLLIDE"];
	createVehicleCrew _arty;
	_artillery pushBack _arty;
	uisleep 1;
} forEach [spawnpt1,spawnpt2,spawnpt3];

missionNamespace setVariable ["ArtilleryInProgress",true];

if (_artillery isEqualTo []) exitWith {deleteMarker "Artillery";missionNamespace setVariable ["ArtilleryInProgress",nil];_caller sidechat "Artillery Malfunction!"};

if (!(allPlayers findIf{ _p = _x; _artillery findIf{ _p distance _x < _activationDistance } > -1 } > -1)) exitWith
	{hint parseText format["<t size='1.25' color='#ff6161'>Distance caller to target must be less than 1000 meters!</t>"];
	deleteMarker "Artillery";

	for "_i" from 0 to count _artillery do {
	{(_artillery select _i) deleteVehicleCrew _x} forEach crew (_artillery select _i);
	deleteVehicle (_artillery select _i); 
	};
	missionNamespace setVariable ["ArtilleryInProgress",nil];	
};

if (_position inRangeOfArtillery [[(_artillery select 0)], currentMagazine (_artillery select 0)]) then {
	_caller sidechat format ["Target In Range: %1", _position inRangeOfArtillery [[(_artillery select 0)], currentMagazine (_artillery select 0)]];
	uisleep 4;
	{
		_x setVehicleAmmo 1;
		_amount = _x ammo (currentWeapon _x);
		_shotsFired = floor (random _amount);
		if (_shotsFired < 3) then {_shotsFired = 3};
		_ammo = (getArtilleryAmmo [_x] select 0);
		_smokePos = [_position select 0, _position select 1, ((_position select 2) + 10)];
		_redSmoke = createVehicle ["SmokeShellRed", _smokePos, [], 10, "NONE"];
		_x commandArtilleryFire [_position, _ammo, _shotsFired];
	} forEach _artillery;
	(_artillery select 0) call KS_fnc_vehicleRespawnNotification;
	uisleep 2;
	_caller sidechat "Artillery Rounds Firing!"; 
	uisleep 6;
	_caller sidechat format ["Artillery Ammo: %1", (getArtilleryAmmo [_artillery select 0] select 0)];
	uisleep 2;
	_caller sidechat format ["Artillery ETA Target: %1", (_artillery select 0) getArtilleryETA [_position, getArtilleryAmmo [(_artillery select 0)] select 0]];
	uisleep 16;
	_caller sidechat "Artillery Rounds Fired!"; 
	uisleep 16;

	deleteMarker "Artillery";

	for "_i" from 0 to count _artillery do {
	{(_artillery select _i) deleteVehicleCrew _x} forEach crew (_artillery select _i);
	deleteVehicle (_artillery select _i); 
	};
	missionNamespace setVariable ["ArtilleryInProgress",nil];

	_caller sidechat "Artillery Ready For ReAssignment!";

} else {
	_caller sidechat format ["Target In Range: %1", _position inRangeOfArtillery [[(_artillery select 0)], currentMagazine (_artillery select 0)]];

		deleteMarker "Artillery";

		for "_i" from 0 to count _artillery do {
		{(_artillery select _i) deleteVehicleCrew _x} forEach crew (_artillery select _i);
		deleteVehicle (_artillery select _i); 
		};
		missionNamespace setVariable ["ArtilleryInProgress",nil];

		_caller sidechat "Artillery Ready For ReAssignment!";
};

