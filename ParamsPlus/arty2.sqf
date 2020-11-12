//////////////////////////////////////////////////////////////////
private ["_caller","_position","_target","_is3D","_id"];
params ["_caller","_position","_target","_is3D","_id"];
_caller = _this select 0;
_position = _this select 1;
_types = ["B_MBT_01_arty_F","O_MBT_02_arty_F"];

_vehicle = [];

switch (side _caller) do {

         case west:		{_vehicle = (_types select 0)};
         case east:		{_vehicle = (_types select 1)};
         case resistance:	{_vehicle = (_types select 1)};
         case civilian:	{_vehicle = (_types select 1)};
};

_mrkrcolor 	= [];

switch (side _caller) do {

         case west:		{_mrkrcolor = "ColorBLUFOR"};
         case east:		{_mrkrcolor = "ColorOPFOR"};
         case resistance:	{_mrkrcolor = "ColorGUER"};
         case civilian:	{_mrkrcolor = "ColorCIV"};
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
	
	_position = getMarkerPos ["Artillery",true];
		
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

//player setVariable ['BIS_SUPP_request', ['Artillery', getpos player]];
//player setVariable ['BIS_SUPP_selectedProviderVeh', (player getVariable 'BIS_SUPP_providersPoolForPick') select 0];
//player setVariable ['BIS_SUPP_ammoType', 0];
//player setVariable ['BIS_SUPP_burst', 1];


_veh = _types select 0;

_spawnPos = getPos respawn_vehicle_west;

_virtualProvider = [_spawnPos, 0, _veh, side group player] call BIS_fnc_spawnVehicle;
uisleep 1;
enableEngineArtillery true; 
uisleep 1;
["[SUPPORTS] Spawned %1", typeOf (_virtualProvider select 0)] call BIS_fnc_logFormat;
uisleep 1;
//(_virtualProvider select 0) call (_module getVariable "BIS_SUPP_vehicleInit");
_virtualProviderUnit = leader (_virtualProvider select 2);
uisleep 1;
//group _virtualProviderUnit setFormDir direction _module;
_virtualProviderUnit commandArtilleryFire [_position, "32Rnd_155mm_Mo_shells", 8];
uisleep 1;

player sidechat format["Target %1",_virtualProvider];

_virtualProviderUnit kbAddTopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
uisleep 1;

_virtualProviderUnit setVariable ['BIS_SUPP_request', ['Artillery', _position]];
uisleep 1;
_virtualProviderUnit setVariable ['BIS_SUPP_selectedProviderVeh', _veh];
uisleep 1;
_virtualProviderUnit setVariable ["BIS_SUPP_supporting",true,true];
uisleep 1;
_virtualProviderUnit setVariable ["BIS_SUPP_requester",player,true];
uisleep 1;
_virtualProviderUnit setVariable ["BIS_SUPP_supportRunCoords", _position, true];
uisleep 1;
_virtualProviderUnit setVariable ['BIS_SUPP_ammoType', 0]; // diag_log format[">>> %1",getArtilleryAmmo [vehicle this]];
uisleep 1;
_virtualProviderUnit setVariable ['BIS_SUPP_burst', 2];
uisleep 1;
_virtualProviderUnit setVariable ["BIS_SUPP_supportType","Artillery",true];
uisleep 1;
_virtualProviderUnit execFSM "A3\modules_f\supports\fsms\artillery.fsm";
uisleep 1;
_virtualProviderUnit setVariable ["BIS_SUPP_virtual", TRUE];
uisleep 1;
player setVariable ["BIS_SUPP_selectedProvider", _virtualProviderUnit];
uisleep 1;

_deleteVirtual = TRUE;


