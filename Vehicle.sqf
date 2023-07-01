// execVM "Vehicle.sqf";

map_click = {
	if (count _this > 1) then {
		(_this select 0) removeaction (_this select 2);
	};

	if ({_x in (items player + assignedItems player)}count ["ItemMap"] < 1) exitWith {hint "Missing Map Item!";true};

	if !(getMarkerColor GarageMkrName isEqualTo "") then {deleteMarkerLocal GarageMkrName};
	hint "";
	GetClick1 = true;
	openMap true;
	[] spawn {[format ["MapClick for %1 Positioning", GarageMkrName],0,.1,3,.005,.1] call bis_fnc_dynamictext;};
	["Garage_mapclick","onMapSingleClick", {

		private ["_nearestRoad","_roads","_marker","_dir"];
		if (isOnRoad _pos) then {
			_nearestRoad = objNull;
			_roads = _pos nearRoads 15;
			if (count _roads > 0) then {
				_nearestRoad = ([_roads,[],{_pos distance _x},"ASCEND"] call BIS_fnc_sortBy) select 0;
			};
		};

		_marker=createMarkerLocal [GarageMkrName, _pos];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerSizeLocal [1, 1];
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerColorLocal "Color3_FD_F";
		_marker setMarkerTextLocal GarageMkrName;
		if (!isNull _nearestRoad) then {
			_marker setMarkerDirLocal ([_pos, _nearestRoad] call BIS_fnc_dirTo);
		}else{
			_marker setMarkerDirLocal (direction (vehicle player));
		};

		GetClick1 = false;
	}] call BIS_fnc_addStackedEventHandler;

	waitUntil {!GetClick1 or !(visiblemap)};
	["Garage_mapclick", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

	if (!visibleMap) exitWith {};
	mapAnimAdd [0.5, 0.1, markerPos GarageMkrName];
	mapAnimCommit;
	sleep 1.2;
	openMap false;
	sleep 0.1;

	[] spawn {
		private _m = GarageMkrName;
		sleep 30;

		private _open = player getVariable ["open", true];
		if (_open) then {
			waitUntil {sleep 30; !(player getVariable "open")};
		};
		if !(getMarkerType _m isEqualTo "") then {deleteMarkerLocal _m};
	};

	if (GarageMkrName isEqualTo "Vehicle") exitWith {
		null =[(GarageMkrName)] call opec_fnc_garageNew
	};

	GarageMkrName
};

Prep_Aquisitions = {
	params ["_veh_list", "_textures", "_cc", "_veh"];
	private ["_mcMkr", "_wGrp", "_speed", "_height", "_grgMkrPos", "_desMkrPos", "_relDir", "_vehDir", "_vel", "_bellDir", "_mrkDis", "_midLength", "_midPos", "_pointC", "_wpArray", "_i", "_wp0", "_wp1", "_wp2", "_patrol", "_count"];

	{
		_count = 0;
		{
			_veh setObjectTextureGlobal [ _count, _x ];
			_count = _count + 1;
		} forEach _textures;

		if (_cc > 0) then {
			if (alive _veh) then {
				createVehicleCrew _veh; sleep 0.1;

				if (_veh isKindOf "StaticWeapon") then {
					if (GarageMkrName isEqualTo "Destination") then {deleteMarkerLocal GarageMkrName;};
					GarageMkrName = "Direction";
				} else {
					if (GarageMkrName isEqualTo "Direction") then {deleteMarkerLocal GarageMkrName;};
					GarageMkrName = "Destination";
				};

				private ["_mcMkr","_wGrp"];
				_mcMkr = [] call map_click;
				_wGrp = (group (crew _veh select 0));

				switch (true) do {
					case ((_veh isKindOf "Plane") || (_veh isKindOf "Helicopter")) : {
						private ["_speed","_height","_bellDir","_grgMkrPos","_desMkrPos","_mrkDis","_midLength","_relDir","_midPos","_pointC","_vel","_wpArray","_wp0","_wp1","_wp2"];
						driver _veh action ["engineOn", _veh];
						if (_veh isKindOf "Plane") then {
							_speed = 180;
							_height = 400;
						} else {
							_speed = 65;
							_height = 2000;
						};

						_grgMkrPos = getmarkerPos "Vehicle";
						_desMkrPos = getmarkerPos "Destination";
						_relDir = [ _grgMkrPos, _desMkrPos ] call BIS_fnc_dirTo;
						_vehDir = direction _veh;
						_vel = velocity _veh;

						_veh setpos [( position _veh select 0 ) + (sin (_relDir -180)), ( position _veh select 1 ) + (cos (_relDir -180)), _height];
						_veh setVelocity [(_vel select 0)+(sin _vehDir*_speed), (_vel select 1)+(cos _vehDir*_speed), _vel select 2];

						if (round(random(1)) isEqualTo 0) then {_bellDir = 90;}else{_bellDir = 270;};
						_mrkDis = _grgMkrPos distance _desMkrPos;
						_midLength = _mrkDis / 2;
						if (_mrkDis > 2200) then {_midLength = 2200};
						if (_mrkDis < 1200) then {_midLength = _midLength + 1200};
						_midPos = [ _grgMkrPos, _midLength, _relDir ] call BIS_fnc_relPos;
						_pointC = [ _midPos, _midLength - 1, (_relDir + _bellDir) ] call BIS_fnc_relPos;

						_veh sidechat "Aircraft Enroute";

						_wpArray = wayPoints _wGrp;
						for "_i" from 0 to (count _wpArray -1) do {
							deleteWaypoint [_wGrp, _i]
						};

						_wp0 = _wGrp addWaypoint [_grgMkrPos, 200];
						_wp0 setWaypointType "MOVE";
						_wp0 setWaypointBehaviour "AWARE";
						_wp0 setWaypointCombatMode "RED";
						_wp0 setWaypointStatements ["true", ""];

						_wp1 = _wGrp addWaypoint [_desMkrPos, 200];
						_wp1 setWaypointType "MOVE";
						_wp1 setWaypointBehaviour "AWARE";
						_wp1 setWaypointCombatMode "RED";
						_wp1 setWaypointStatements ["true", ""];

						_wp2 = _wGrp addWaypoint [_pointC, 200];
						_wp2 setWaypointType "Cycle";
						_wp2 setWaypointBehaviour "AWARE";
						_wp2 setWaypointCombatMode "RED";
						_wp2 setWaypointStatements ["true", ""];
					};

					case (_veh isKindOf "StaticWeapon")	: {
						private _relDir = [ ( getmarkerPos "Vehicle"), (getmarkerPos "Direction") ] call BIS_fnc_dirTo;
						_veh setDir _relDir;
						_wGrp setBehaviour "COMBAT";
						_wGrp setCombatMode "RED";
					};

					case (_veh isKindOf "Ship")	: {
						if (surfaceIsWater position _veh) then {
							private _patrol = [ _wGrp, (getMarkerPos _mcMkr), 75 ] call bis_fnc_taskPatrol;
							_veh sidechat "Ship Enroute";
						};
					};

					default {
						private _patrol = [ _wGrp, (getMarkerPos _mcMkr), 75 ] call bis_fnc_taskPatrol;
						_veh sidechat "Vehicle Enroute";
					};
				};
			};
		};

		if ((_cc isEqualTo 0) && (_veh isKindOf "StaticWeapon")) then {
			if (GarageMkrName isEqualTo "Destination") then {deleteMarkerLocal GarageMkrName};
			GarageMkrName = "Direction";
			private _mcMkr = [] call map_click;
			private _relDir = [ ( getmarkerPos "Vehicle"), (getmarkerPos _mcMkr) ] call BIS_fnc_dirTo;
			_veh setDir _relDir;
		} else {
			if ((!isOnRoad _veh) && _cc isEqualTo 0) then {
				_veh setDir (direction (vehicle player));
			};
		};
		
		_veh call KS_fnc_vehicleRespawnNotification;_veh call Vehicle_Module_Mgmt;
		
	} forEach _veh_list;
};

opec_fnc_garageNew = {
	private ["_fullVersion","_veh","_displayMission","_marker","_pad","_veh_list","_vehType","_textures","_crew","_cc","_veh","_vehDir","_count"];
	hintSilent format ["%1", (_this select 0)];
	disableSerialization;
	uiNamespace setVariable [ "current_garage", ( _this select 0 ) ];
	_fullVersion = missionNamespace getVariable [ "BIS_fnc_arsenal_fullGarage", false ];
	if !( isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] ) ) exitwith { "Garage Viewer is already running" call bis_fnc_logFormat; };
	player setVariable ["open", true];
	{ deleteVehicle _x; } forEach nearestObjects [ getMarkerPos ( _this select 0 ), [ "AllVehicles" ], 10 ];
	_veh = createVehicle [ "Land_HelipadEmpty_F", getMarkerPos ( _this select 0 ), [], 0, "CAN_COLLIDE" ];
	uiNamespace setVariable [ "garage_pad", _veh ];
	missionNamespace setVariable [ "BIS_fnc_arsenal_fullGarage", [ true, 0, false, [ false ] ] call bis_fnc_param ];
	with missionNamespace do { BIS_fnc_garage_center = [ true, 1, _veh, [ objNull ] ] call bis_fnc_param; };
	with uiNamespace do {
		_displayMission = [] call ( uiNamespace getVariable "bis_fnc_displayMission" );
		if !( isNull findDisplay 312 ) then { _displayMission = findDisplay 312; };
		_displayMission createDisplay "RscDisplayGarage";
		uiNamespace setVariable [ "running_garage", true ];
		waitUntil { sleep 0.25; isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] ) };
		_marker = uiNamespace getVariable "current_garage";
		_pad = uiNamespace getVariable "garage_pad";
		deleteVehicle _pad;
		_veh_list = ( getMarkerPos _marker ) nearEntities 5;
		{
			_vehType = typeOf _x;
			_textures = getObjectTextures _x;
			_crew = crew _x;
			_cc = count _crew;

			{
				_x spawn {
					_this action [ "Eject", vehicle _this ];
					sleep ( random 2 );
					_this setDamage 1;
					sleep ( random 5 );
					deleteVehicle _this;
				};
			} forEach _crew;
			deleteVehicle _x;
			sleep 0.5;

			_veh = createVehicle [ _vehType, getMarkerPos _marker, [], 0, "NONE" ]; sleep 0.1;
			if !(_veh isKindOf "Ship") then {
				_veh setPosATL [ ( position _veh select 0 ), ( position _veh select 1 ), 0.25 ];
			};
			_vehDir = markerDir _marker;
			_veh setDir _vehDir;
			player setVariable [ "open", false ];

			[_veh_list, _textures, _cc, _veh] spawn Prep_Aquisitions;

		} forEach _veh_list;
	};
};

(vehicle player) addaction ["<t color='#FFFF00'>Virtual Garage Mod</t>", {GarageMkrName = "Vehicle"; call map_click}];

