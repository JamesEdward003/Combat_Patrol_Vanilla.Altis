///////// _this execVM "misc\cargoDrop.sqf"; //////////
private ["_caller","_position","_target","_is3D","_id"];
params ["_caller","_position","_target","_is3D","_id"];
_caller = _this select 0;
_position = _this select 1;
_mrkrcolor 	= [];

switch (side _caller) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:		{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

_position = [_position select 0, _position select 1, 140];
//hint format ["%1",_position];
if (_position isEqualTo []) then { 

	objective = false;
	sleep 0.25;
	openMap true;
	sleep 0.25;

	titleText["Map position", "PLAIN"];
	onMapSingleClick "onMapSingleClick ''; mappos = _pos; objective = true";		
	waitUntil {sleep 1; (!visiblemap OR objective OR !alive _caller)};
		if (!objective OR !alive _caller) exitWith {
		mappos = nil;
		hint parseText format["<t size='1.25' color='#ff6161'>Map position cancelled</t>"];
		titletext ["","plain"];
		};

	if ((getMarkerPos "Cargo") isEqualTo [0,0,0]) then {deleteMarker "Cargo"};
	if (!((getMarkerPos "Cargo") isEqualTo [0,0,0])) then {deleteMarker "Cargo"};
		  
	_hLand = createMarkerLocal ["Cargo", mappos];
	_hLand setMarkerTypeLocal "mil_objective";
	_hLand setMarkerShapeLocal "Icon";
	_hLand setMarkerTextLocal " Supplies";
	_hLand setMarkerSizeLocal [1,1];
	_hLand setMarkerColorLocal _mrkrcolor;
	
	titletext ["","plain",0.2];
	hint parseText format["<t size='1.25' color='#44ff00'>Map position successful</t>"];
	
	_position = getMarkerPos "Cargo";
		
	uisleep 1;
	openmap false;

} else {

	if ((getMarkerPos "Cargo") isEqualTo [0,0,0]) then {deleteMarker "Cargo"};
	if (!((getMarkerPos "Cargo") isEqualTo [0,0,0])) then {deleteMarker "Cargo"};
		  
	_hLand = createMarkerLocal ["Cargo", _position];
	_hLand setMarkerTypeLocal "mil_objective";
	_hLand setMarkerShapeLocal "Icon";
	_hLand setMarkerTextLocal " Supplies";
	_hLand setMarkerSizeLocal [1,1];
	_hLand setMarkerColorLocal _mrkrcolor;
	
	hint parseText format["<t size='1.25' color='#44ff00'>Map position successful</t>"];
	
	_position = _position;
};
//hint format ["%1",_position];

_randDir 			= 	getDir _caller - 180;
_randDist 			= 	2000;  // (random 100) + 2000;
_airStart 			=	[(_position select 0) + (_randDist * sin(_randDir)), (_position select 1) + (_randDist * cos(_randDir)), 140];
_randDir2 			= 	getDir _caller;
_airEnd 				=	[(_position select 0) + (_randDist * sin(_randDir2)), (_position select 1) + (_randDist * cos(_randDir2)), 140];
//_airTypes 			= 	B_T_VTOL_01_infantry_F // B_Heli_Light_01_F // B_Heli_Light_01_stripped_F // B_Heli_Transport_01_F // B_Heli_Transport_01_camo_F ////DLC > B_Heli_Transport_03_F // B_Heli_Transport_03_unarmed_F
//_airTypes			=	O_T_VTOL_02_infantry_dynamicLoadout_F // O_Heli_Light_02_F // O_Heli_Light_02_unarmed_F // O_Heli_Light_02_v2_F ////DLC > O_Heli_Transport_04_F 
_airType = [];

switch (side _caller) do 
{
	case west: 		{_airType = "B_T_VTOL_01_infantry_F"};
	case east: 		{_airType = "O_T_VTOL_02_infantry_dynamicLoadout_F"};
	case resistance: 	{_airType = "I_C_Plane_Civil_01_F"};
	case civilian: 	{_airType = "C_Plane_Civil_01_F"};
};

[_airStart, _airEnd, 140, "FULL", _airType, west] call BIS_fnc_ambientFlyby;

_airGrp = nearestObject [_airStart,_airType];

waitUntil {(_airGrp distance2d _position) < 200};

_cargo = createVehicle ["I_E_CargoNet_01_ammo_F", position _airGrp, [], 0, "FLY"];

_cargo disableCollisionWith _airGrp;

publicVariable "_cargo";  
    
[objnull, _cargo] call BIS_fnc_curatorobjectedited;  
 
waitUntil {sleep 1; !isNil "_cargo"};  
  
["AmmoboxInit", [_cargo, true, {true}]] spawn BIS_fnc_arsenal; 

waitUntil {((getPos _cargo) select 2) < 1};

"SmokeShellgreen" createVehicle getPos _cargo;

"F_40mm_White" createVehicle [getPos _cargo select 0,getPos _cargo select 1,+150];

"Cargo" setMarkerPos getPos _cargo;

