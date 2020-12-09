//////////////////////////////////////////////////////////////////
private ["_caller","_position","_target","_is3D","_id"];
params ["_caller","_position","_target","_is3D","_id"];
_caller = _this select 0;
_position = _this select 1;
_types = ["B_Mortar_01_F","O_Mortar_01_F","I_Mortar_01_F"];  //"mortar_82mm","mortar_155mm_AMOS"];

_mortar = [];

switch (side _caller) do {

         case west:		{_mortar = (_types select 0)};
         case east:		{_mortar = (_types select 1)};
         case resistance:	{_mortar = (_types select 2)};
         case civilian:	{_mortar = (_types select 0)};
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
		hint parseText format["<t size='1.25' color='#ff6161'>Map target cancelled</t>"];
		titletext ["","plain"];
		};

	if ((getMarkerPos "target") isEqualTo [0,0,0]) then {deleteMarker "target"};
	if (!((getMarkerPos "target") isEqualTo [0,0,0])) then {deleteMarker "target"};
		  
	_hLand = createMarkerLocal ["target", mappos];
	_hLand setMarkerTypeLocal "mil_objective";
	_hLand setMarkerShapeLocal "Icon";
	_hLand setMarkerTextLocal " target";
	_hLand setMarkerSizeLocal [1,1];
	_hLand setMarkerColorLocal _mrkrcolor;
	
	titletext ["","plain",0.2];
	hint parseText format["<t size='1.25' color='#44ff00'>Map objective successful</t>"];
	
	_position = getMarkerPos "target";
		
	uisleep 1;
	openmap false;

} else {

	if ((getMarkerPos "target") isEqualTo [0,0,0]) then {deleteMarker "target"};
	if (!((getMarkerPos "target") isEqualTo [0,0,0])) then {deleteMarker "target"};
		  
	_hLand = createMarkerLocal ["target", _position];
	_hLand setMarkerTypeLocal "mil_objective";
	_hLand setMarkerShapeLocal "Icon";
	_hLand setMarkerTextLocal " target";
	_hLand setMarkerSizeLocal [1,1];
	_hLand setMarkerColorLocal _mrkrcolor;
	
	hint parseText format["<t size='1.25' color='#44ff00'>Map objective successful</t>"];
	
	_position = _position;
};

_spawnPos = (position player) findEmptyPosition [20, 50, _mortar];

if (count _spawnPos == 0) then {_spawnPos = [player, 20, random 360] call BIS_fnc_relPos};

if (count _spawnPos == 0) then {_spawnPos = [getPosATL player, 400] call BIS_fnc_nearestRoad};

_virtualProvider = _mortar createVehicle _spawnPos;
				 
createVehicleCrew _virtualProvider;

_virtualProvider setVehicleAmmo 1;

if (getMarkerPos "target" inRangeOfArtillery [[_virtualProvider], currentMagazine _virtualProvider]) then {

	_caller sidechat format["%1, %2",_virtualProvider,group _virtualProvider];

	_caller sidechat format ["Target In Range: %1", getMarkerPos "target" inRangeOfArtillery [[_virtualProvider], currentMagazine _virtualProvider]];

	_caller sidechat format ["Mortar ETA Target: %1", _virtualProvider getArtilleryETA [getMarkerPos "target", getArtilleryAmmo [_virtualProvider] select 0]];

	_caller sidechat format ["Mortar Ammo: %1", getArtilleryAmmo [_virtualProvider] select 0];

//	_ammo = ["32Rnd_155mm_Mo_shells","8Rnd_82mm_Mo_shells"];
	
	_virtualProvider call KS_fnc_vehicleRespawnNotification;
	
	for "_i" from 1 to 6 do {
		_virtualProvider doArtilleryFire [getmarkerpos "target", "8Rnd_82mm_Mo_shells", 1];
//		_virtualProvider commandArtilleryFire [getmarkerpos "target", "8Rnd_82mm_Mo_shells", 1];
//		mortar1 commandArtilleryFire [getposatl (thislist select 0), "8Rnd_82mm_Mo_shells", 4];
		sleep 5;
	};
	
	_caller sidechat "Mortar is ready for another mission!";

	deleteMarker "target";
	
	_near_mortar = [];
	_near_mortar = nearestObjects [player, ["B_Mortar_01_F","B_G_Mortar_01_F","B_T_Mortar_01_F"], 500];

	if (!(_near_mortar isEqualTo [])) then {
		for "_i" from 0 to count _near_mortar do {
		{(_near_mortar select _i) deleteVehicleCrew _x} forEach crew (_near_mortar select _i);
		deleteVehicle (_near_mortar select _i); 
		};
	};

} else {
	
	_caller sidechat "Mortar Target is out of range!"; 
	
	deleteMarker "target";
	
	_near_mortar = [];
	_near_mortar = nearestObjects [player, ["B_Mortar_01_F","B_G_Mortar_01_F","B_T_Mortar_01_F"], 500];

	if (!(_near_mortar isEqualTo [])) then {
		for "_i" from 0 to count _near_mortar do {
		{(_near_mortar select _i) deleteVehicleCrew _x} forEach crew (_near_mortar select _i);
		deleteVehicle (_near_mortar select _i); 
		};
	};
};

//[(_virtualProvider select 0),getMarkerPos "target","32Rnd_155mm_Mo_shells",100,24,10] spawn BIS_fnc_fireSupport;

//[[getMarkerPos "target", "32Rnd_155mm_Mo_shells", 100, 24, 10] spawn BIS_fnc_fireSupportVirtual;

//[getMarkerPos "target","AT_Mine_155mm_AMOS_range",300,6400,10,nil, 32,4900, 150] spawn BIS_fnc_fireSupportVirtual;

//_virtualProvider addMagazineTurret ["8Rnd_82mm_Mo_shells", [0,8]]; 
//_virtualProvider commandArtilleryFire [getposatl (thislist select 0), "8Rnd_82mm_Mo_shells", 4];
//_virtualProvider setVehicleAmmo 1;

//	_ammo = [
//	"8Rnd_82mm_Mo_shells",
//	"8Rnd_82mm_Mo_Flare_white",
//	"8Rnd_82mm_Mo_Smoke_white",
//	"8Rnd_82mm_Mo_guided",
//	"8Rnd_82mm_Mo_LG"
//	];

//	_ammo = [
//	"32Rnd_155mm_Mo_shells",
//	"32Rnd_155mm_Mo_shells_O",
//	"6Rnd_155mm_Mo_smoke",
//	"6Rnd_155mm_Mo_smoke_O",
//	"2Rnd_155mm_Mo_guided",
//	"2Rnd_155mm_Mo_guided_O",
//	"4Rnd_155mm_Mo_guided",
//	"4Rnd_155mm_Mo_guided_O",
//	"2Rnd_155mm_Mo_LG",
//	"4Rnd_155mm_Mo_LG",
//	"4Rnd_155mm_Mo_LG_O",
//	"6Rnd_155mm_Mo_mine",
//	"6Rnd_155mm_Mo_mine_O",
//	"6Rnd_155mm_Mo_AT_mine",
//	"6Rnd_155mm_Mo_AT_mine_O",
//	"2Rnd_155mm_Mo_Cluster",
//	"2Rnd_155mm_Mo_Cluster_O"
//	];

