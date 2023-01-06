//////////////////////////////////////////////////////////////////
private ["_caller","_position","_target","_is3D","_id"];
params ["_caller","_position","_target","_is3D","_id"];
_caller = _this select 0;
_position = _this select 1;
_types = ["B_MBT_01_arty_F","O_MBT_02_arty_F","I_Truck_02_MRL_F"];

_vehicle = [];

switch (side _caller) do {

         case west:		{_vehicle = (_types select 0)};
         case east:		{_vehicle = (_types select 1)};
         case resistance:	{_vehicle = (_types select 2)};
         case civilian:	{_vehicle = (_types select 2)};
};

_mrkrcolor = [];

switch (side _caller) do {

         case west:		{_mrkrcolor = "ColorBLUFOR"};
         case east:		{_mrkrcolor = "ColorOPFOR"};
         case resistance:	{_mrkrcolor = "ColorGUER"};
         case civilian:	{_mrkrcolor = "ColorCIV"};
};

_spawnPoint = [];

switch (side _caller) do {

         case west:		{_spawnPoint = respawn_vehicle_west};
         case east:		{_spawnPoint = respawn_vehicle_east};
         case resistance:	{_spawnPoint = respawn_vehicle_guer};
         case civilian:	{_spawnPoint = respawn_vehicle_civ};
};
				
if (_position isEqualTo []) then { 

	objective = false;
	sleep 0.25;
	openMap true;
	sleep 0.25;

	titleText["Map target", "PLAIN"];
	onMapSingleClick "onMapSingleClick ''; mappos = _pos; objective = true";		
	waitUntil {sleep 1; (!visiblemap OR objective OR !alive _caller)};
		if (!objective OR !alive _caller) exitWith {
		mappos = nil;
		hint parseText format["<t size='1.25' color='#ff6161'>Map target canceled</t>"];
		titletext ["","plain"];
		};

	if ((getMarkerPos "Artillery") isEqualTo [0,0,0]) then {deleteMarker "Artillery"};
	if (!((getMarkerPos "Artillery") isEqualTo [0,0,0])) then {deleteMarker "Artillery"};
		  
	_hLand = createMarkerLocal ["Artillery", mappos];
	_hLand setMarkerTypeLocal "mil_objective";
	_hLand setMarkerShapeLocal "Icon";
	_hLand setMarkerTextLocal " Artillery";
	_hLand setMarkerSizeLocal [1,1];
	_hLand setMarkerColorLocal _mrkrcolor;
	
	titletext ["","plain",0.2];
	hint parseText format["<t size='1.25' color='#44ff00'>Map target successful</t>"];
	
	_position = _position;
		
	uisleep 1;
	openmap false;

} else {

	if ((getMarkerPos "Artillery") isEqualTo [0,0,0]) then {deleteMarker "Artillery"};
	if (!((getMarkerPos "Artillery") isEqualTo [0,0,0])) then {deleteMarker "Artillery"};
		  
	_hLand = createMarkerLocal ["Artillery", _position];
	_hLand setMarkerTypeLocal "mil_objective";
	_hLand setMarkerShapeLocal "Icon";
	_hLand setMarkerTextLocal " Artillery";
	_hLand setMarkerSizeLocal [1,1];
	_hLand setMarkerColorLocal _mrkrcolor;
	
	hint parseText format["<t size='1.25' color='#44ff00'>Map objective successful</t>"];
	
	_position = _position;
};

if (!alive Arty_One isEqualTo true) then {
_spawnPos = getPos _spawnPoint;
_virtualProvider = [_spawnPos, 0, _vehicle, side group player] call BIS_fnc_spawnVehicle;
Arty_One = _virtualProvider select 0;
(_virtualProvider select 0) setVehicleVarname "Arty_One";
(_virtualProvider select 0) setvehicleammo 1;
Arty_One_Group = _virtualProvider select 2;
uisleep 1;

hint format ["%1",currentMagazine Arty_One]; //(_virtualProvider select 0)
uisleep 1;

Arty_One commandArtilleryFire [[_position], "32Rnd_155mm_Mo_shells", 8];
uisleep 1;

if (_position inRangeOfArtillery [[Arty_One], currentMagazine Arty_One]) then {

["[SUPPORTS] Spawned %1", typeOf Arty_One] call BIS_fnc_logFormat;
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit = leader Arty_One_Group;
private _future = time + 2;
waitUntil { time >= _future };
_caller sidechat format["%1, %2",Arty_One,Arty_One_Group];
private _future = time + 2;
waitUntil { time >= _future };
_caller sidechat format ["Target In Range: %1", _position inRangeOfArtillery [[Arty_One], currentMagazine Arty_One]];
private _future = time + 2;
waitUntil { time >= _future };
_caller sidechat format ["Artillery ETA Target: %1", Arty_One getArtilleryETA [_position, getArtilleryAmmo [Arty_One] select 0]];
private _future = time + 2;
waitUntil { time >= _future };
_caller sidechat format ["Artillery Ammo: %1", getArtilleryAmmo [Arty_One] select 0];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit kbAddTopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_request", ["Artillery", _position]];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_selectedProviderVeh", Arty_One];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_supporting",true,true];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_requester",_caller,true];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_supportRunCoords", _position, true];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_ammoType", 0];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_burst", 12];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_supportType","Artillery",true];
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit execFSM "A3\modules_f\supports\fsms\artillery.fsm";
private _future = time + 2;
waitUntil { time >= _future };
_virtualProviderUnit setVariable ["BIS_SUPP_virtual", true];
private _future = time + 2;
waitUntil { time >= _future };

_caller setVariable ["BIS_SUPP_selectedProvider", _virtualProviderUnit];
private _future = time + 2;
waitUntil { time >= _future };
deleteMarker "Artillery";

_deleteVirtual = true;

} else {
	_caller sidechat "Artillery Target is out of range!"; 
	
	deleteMarker "Artillery";
	
	_deleteVirtual = true;
	_near_artillery = [];
	_near_artillery = nearestObjects [player, ["B_MBT_01_arty_F","O_MBT_02_arty_F"], 500];

	if (!(_near_artillery isEqualTo [])) then {
		for "_i" from 0 to count _near_artillery do {
		{(_near_artillery select _i) deleteVehicleCrew _x} forEach crew (_near_artillery select _i);
		deleteVehicle (_near_artillery select _i); 
		};
	};
};

//[(_virtualProvider select 0),_position,"32Rnd_155mm_Mo_shells",100,24,10] spawn BIS_fnc_fireSupport;

//[[_position, "32Rnd_155mm_Mo_shells", 100, 24, 10] spawn BIS_fnc_fireSupportVirtual;

//[_position,"AT_Mine_155mm_AMOS_range",300,6400,10,nil, 32,4900, 150] spawn BIS_fnc_fireSupportVirtual;

