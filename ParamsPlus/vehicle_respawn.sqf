/*  
==================================================================================================================
  Simple Vehicle Respawn Script v1.81 for Arma 3
  by Tophe of Östgöta Ops [OOPS]
  
  Put this in the vehicles init line:
  _veh = [this, 30, 500, 0, FALSE, FALSE, TRUE] execVM "misc\vehicle_respawn.sqf";
  
  Options:
  There are some optional settings. The format for these are:
  veh = [object, Delay, Deserted timer, Respawns, Effect, Dynamic] execVM "vehicle_respawn.sqf"
  
  Default respawn delay is 30 seconds, to set a custom respawn delay time, put that in the init as well. 
  Like this:
  veh = [this, 15] execVM "vehicle_respawn.sqf"

  Default respawn time when vehicle is deserted, but not destroyed is 120 seconds. To set a custom timer for this 
  first set respawn delay, then the deserted vehicle timer. (0 = disabled) 
  Like this:  
  veh = [this, 15, 10] execVM "vehicle_respawn.sqf"

  By default the number of respawns is infinite. To set a limit first set preceding values then the number of respawns you want (0 = infinite).
  Like this:
  veh = [this, 15, 10, 5] execVM "vehicle_respawn.sqf"

  Set this value to TRUE to add a special explosion effect to the wreck when respawning.
  Default value is FALSE, which will simply have the wreck disappear.
  Like this:
  veh = [this, 15, 10, 5, TRUE] execVM "vehicle_respawn.sqf"
  
  By default the vehicle will respawn to the point where it first was when the mission started (static). 
  This can be changed to dynamic. Then the vehicle will respawn to the position where it was destroyed. 
  First set all preceding values then set TRUE for dynamic or FALSE for static.
  Like this:
  veh = [this, 15, 10, 5, TRUE, TRUE] execVM "vehicle_respawn.sqf"
  
  If you you want to set the INIT field of the respawned vehicle, first set all other values, then set init commands. 
  Those must be inside quotations.
  Like this:
  veh = [this, 15, 10, 5, TRUE, FALSE, "this setDammage 0.5"] execVM "vehicle_respawn.sqf"
  Or:
  veh = [this, 15, 10, 5, TRUE, FALSE, TRUE] execVM "vehicle_respawn.sqf"
  
  Default values of all settings are:
  veh = [this, 30, 120, 0, FALSE, FALSE] execVM "vehicle_respawn.sqf"
  
	
Contact & Bugreport: cwadensten@gmail.com
================================================================================================================== */

if (!isServer) exitWith {};

// Define variables
_unit = _this select 0;
_delay = if (count _this > 1) then {_this select 1} else {30};
_deserted = if (count _this > 2) then {_this select 2} else {120};
_respawns = if (count _this > 3) then {_this select 3} else {0};
_explode = if (count _this > 4) then {_this select 4} else {false};
_dynamic = if (count _this > 5) then {_this select 5} else {false};
_unitinit = if (count _this > 6) then {_this select 6} else {};
_hasinit = if (count _this > 6) then {true} else {false};

_hasname = false;
_unitname = vehicleVarName _unit;
if (isNil _unitname) then {_hasname = false;} else {_hasname = true;};
_hasnocrew = false; 
_hascrew = fullCrew _unit;
if (_hascrew isEqualTo []) then {_hasnocrew = true;} else {_hasnocrew = false;};
_grpUnit = group _unit;
_side = side _unit;
_noend = true;
_run = true;
_rounds = 0;
  
if (_delay < 0) then {_delay = 0};
if (_deserted < 0) then {_deserted = 0};
if (_respawns <= 0) then {_respawns= 0; _noend = true;};
if (_respawns > 0) then {_noend = false};

_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;
_dead = false;
_nodelay = false;

_init = {
_unit = _this;
_unit spawn { while {alive _this} do { uisleep 600; _this setFuel 1; } };
_unit addeventhandler ["Fired", {(_this select 0) setvehicleammo 1}];
_unit addEventHandler ["GetIn",{(_this select 0) setDamage 0;(_this select 0) allowDamage false;(_this select 2) setDamage 0;(_this select 2) allowDamage false;detach (_this select 0);}];
_unit addEventHandler ["GetIn",{if (isPlayer (_this select 2)) then {PAPABEAR=[playerSide,'HQ']; PAPABEAR SideChat format ['Transport action available, %1', name (_this select 2)];detach (_this select 0);}}];
_unit addEventHandler ["GetOut",{if (isPlayer (_this select 2)) then {(_this select 0) spawn {waitUntil {((getPosATL _this) distance2d (getPosATL player)) > 10};player allowDamage true}}}];
_unit addEventHandler ["GetOut",{if ((!isPlayer (_this select 2)) and ((_this select 2) in (units group player) isEqualTo false)) then {deleteVehicle (_this select 2);deleteVehicle (_this select 0);}}];
_unit addAction ["<t color='#00FFFF'>Transport</t>","movement\vehicleToWypt.sqf",[_position],1.5,true,false,"","true",5,false,"",""];
[_unit] execVM "paramsplus\vehicleMarker.sqf";
};
// Call init function
if (_hasinit) then {
	_unit call _init;
};
// Function to notify respawn
fnc_vehicleRespawnNotification =
{
	params [ ["_vehicle", objNull, [objNull]] ];
	
	if ( isNull _vehicle ) exitWith {};
	
	private _vehicleSide = [_vehicle, true] call bis_fnc_objectSide;
	private _cfgVeh = configfile >> "cfgvehicles" >> typeOf _vehicle;
	private _displayName = gettext (_cfgVeh >> "displayName");
	private _picture = (gettext (_cfgVeh >> "picture")) call bis_fnc_textureVehicleIcon;
	private _respawnName = format [localize "str_a3_bis_fnc_respawnmenuposition_grid",mapgridposition (position _vehicle)];
	
	[["RespawnVehicle",[_displayName, _respawnName, _picture]], "BIS_fnc_showNotification", _vehicleSide] call bis_fnc_mp;
};
// Start monitoring the vehicle
while {_run} do 
{    
    uisleep (2 + random 10);
	if (getDammage _unit > 0.8) then {_dead = true};	  
    // Check if the vehicle is deserted.
    if (_deserted > 0) then
    {
        if ((getPosASL _unit distance _position > _deserted) and ({alive _x} count crew _unit == 0)) then 
        {
            _timeout = time + _delay;
            waitUntil {_timeout < time or !alive _unit or {alive _x} count crew _unit > 0};
            if ({alive _x} count crew _unit > 0) then {_dead = false}; 
            if ({alive _x} count crew _unit == 0) then {_dead = true;_nodelay = true;};
            if !(alive _unit) then {_dead = true;_nodelay = false;};
        };
    };
    // Respawn vehicle
      if (_dead) then 
    {    
        if (_nodelay) then {_nodelay = false;} else {uisleep _delay;};
        if (_dynamic) then {_position = getPosASL _unit; _dir = getDir _unit;};
        if (_explode) then {_effect = "M_AT" createVehicle getPosASL _unit; _effect setPosASL getPosASL _unit;};
		{deleteVehicle _x} forEach (units _grpUnit);
		deleteVehicle _unit;
//        _unit = createVehicle [_type, _position, [], 0, "CAN_COLLIDE"];
      	_unit = _type createVehicle _position;
        	_unit setVariable ["BIS_enableRandomization", false];
        	_unit setPosASL _position;
        	_unit setDir _dir;
        	_unit call fnc_vehicleRespawnNotification;
        	if (_hasinit) then {
			_unit call _init;
        	};
		if (_hasname) then {
			_unit setVehicleVarName _unitname;
			//_unit call compile format ["%1 = _this; publicVariable ""%1""",_unitname];
		};
		if (_unit isKindOf "boat_f") then {
			_unitname = vehicleVarname _unit;
			_unitEnableCargo = call compile format ["%1_Berth enableVehicleCargo true", _unitname];
			_unitSetCargo = call compile format ["%1_Berth setVehicleCargo %1", _unitname];
			_unit setPos getPos _unit;
		};
		if (_unit isKindOf "B_UAV_05_F") then {
			[player,SentinelStrike] call BIS_fnc_removeCommMenuItem;
		};
		if (_hasnocrew) then {
			_unit setDamage 0;
        	} else {
          	createVehicleCrew _unit;
          	(group _unit) setGroupID [format ["%1",_unitname]];
	   	};		
        // End of code modified by naong
        _dead = false;       
        // Check respawn amount
        if !(_noend) then {_rounds = _rounds + 1};
        if ((_rounds == _respawns) and !(_noend)) then {_run = false;};
    };
};

//		if (["O_UGV", _type] call BIS_fnc_inString) then { createVehicleCrew _unit; };
//		this addEventHandler ["Respawn",{_this execVM "Reberth.sqf"}];

