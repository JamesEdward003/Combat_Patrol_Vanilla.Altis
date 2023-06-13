/////////////  "initServer.sqf"  ////////////
/*
_Base = [playerSide, "PAPA_BEAR"] commandChat "Initiating InitServer!";
 _CROSSROAD = [playerSide, "HQ"] commandChat "Initiating InitServer!";
_Base = [playerSide, "Base"] commandChat "Initiating InitServer!";
_Base = [playerSide, "AirBase"] commandChat "Initiating InitServer!";
_Broadway = [playerSide, "BLU"] commandChat "Initiating InitServer!";
_Griffin = [playerSide, "OPF"] commandChat "Initiating InitServer!";
_Phalanx = [playerSide, "IND"] commandChat "Initiating InitServer!";
_Slingshot = [playerSide, "IND"] commandChat "Initiating InitServer!";

Headquarters Entity module
 BIS_hqWest, BIS_hqEast, BIS_hqGuer
*/

_CROSSROAD = [playerSide, "HQ"] commandChat "Initiating InitServer!";

{if (!( isPlayer _x ) and !(_x in (units group player))) then  {deleteVehicle _x}} forEach (if ismultiplayer then {playableunits} else {switchableunits});

{if (!( isPlayer _x ) and (_x in (units group player))) then  {_x addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],-100,false,true,""];}} forEach (if ismultiplayer then {playableunits} else {switchableunits});

/*

_PCivilians = "PCivilians" call BIS_fnc_getParamValue;

if (_PCivilians isEqualTo 2) then {
	
switch (playerSide) do {
	
	case west: {
		
//		Civilian setFriend [Civilian, 0];
		
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
	_CROSSROAD = [playerSide, "HQ"] commandChat "Initiated Sides!";
	
	player addAction ["<t color='#40e0d0'>Take Pack</t>","params ['_target','_caller']; _caller action ['AddBag', (nearestObject [_caller, 'GroundWeaponHolder']), typeOf firstBackpack (nearestObject [_caller, 'GroundWeaponHolder'])];","",10,false,true,"","_this distance _target<10"];
//	player addAction ["<t color='#40e0d0'>Take Pack</t>","params ['_target','_caller']; _caller action ['AddBag', (nearestObject [_caller, 'GroundWeaponHolder']), typeOf firstBackpack (nearestObject [_caller, 'GroundWeaponHolder'])];","",10,false,true,"","_this distance _target<10"];
};

*/
	
_BI_CP_startLocation = "BI_CP_startLocation" call BIS_fnc_getParamValue;	

if (_BI_CP_startLocation isEqualTo 2) then {
	
	_pos = getPos leader player;
	
	_tLoading = 0;
	waitUntil {!isNil "BIS_CP_initDone"};
	waitUntil {time > _tLoading};
	
	waitUntil { (player distance2d BIS_CP_targetLocationPos) < 1500 };
	{
	if ( _x != leader player) then {
		_relDis = _x distance leader player;
		_relDir = [leader player, _x] call BIS_fnc_relativeDirTo;
		_x setPos ([_pos, _relDis, _relDir] call BIS_fnc_relPos);
	}; 
	} forEach units group player;
	leader player setPos _pos;
	BIS_CP_exfilPos = _pos;
	["BIS_CP_taskExfil", position player] call BIS_fnc_taskSetDestination;

};	
