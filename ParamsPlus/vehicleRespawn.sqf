//  [this] execVM "misc\vehicleRespawn.sqf";  //
//  [this, [[["Medikit","Toolkit"], [1, 2]],[["SmokeShell","HandGrenade","SatchelCharge_Remote_Mag","20Rnd_762x51_Mag"], [10,10,10,20]],[["srifle_EBR_F"], [2]],[["B_AssaultPack_cbr"], [2]]]] call fnc_vehicleLoadout;
//  [this, 15, {}, 3, false, false, false] call fnc_vehicleRespawn;
if (!isServer) exitWith {};

fnc_vehicleLoadout = {
	private ["_itemArray", "_magazineArray", "_weaponArray", "_backpackArray"];
	params [
		["_vehicle", objNull, [objNull]],
		["_inventoryArray", [], [[]]]
	];

	clearItemCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;

	_itemArray = _inventoryArray select 0;
	{
		uisleep 0.1;
		_vehicle addItemCargoGlobal [_x, ((_itemArray select 1) select ((_itemArray select 0) find _x))];
	} count (_itemArray select 0);

	_magazineArray = _inventoryArray select 1;
	{
		uisleep 0.1;
		_vehicle addMagazineCargoGlobal [_x, ((_magazineArray select 1) select ((_magazineArray select 0) find _x))];
	} count (_magazineArray select 0);

	_weaponArray = _inventoryArray select 2;
	{
		uisleep 0.1;
		_vehicle addWeaponCargoGlobal [_x, ((_weaponArray select 1) select ((_weaponArray select 0) find _x))];
	} count (_weaponArray select 0);

	_backpackArray = _inventoryArray select 3;
	{
		uisleep 0.1;
		_vehicle addBackpackCargoGlobal [_x, ((_backpackArray select 1) select ((_backpackArray select 0) find _x))];
	} count (_backpackArray select 0);
};

fnc_vehicleMonitor = {
waitUntil {uisleep 0.5; count TotalVRArray > 0};

while {true} do {
	{
		if !(alive (_x select 0)) then {
			_x spawn {
				private ["_newVehicle"];
				params [
					["_vehicle", objNull, [objNull]],
					["_vehicleData", [], [[]]]
				];
				_vehicleData params [
					"_delay",
					"_init",
					"_loadout",
					"_name",
					"_position",
					"_direction",
					"_type",
					"_inventory",
					"_savePaint",
					"_paint",
					"_parts",
					"_deleteWreck",
					"_limitEnabled"
				];
				
				_respawnCount = _vehicle getVariable ["VRRespawnCount", 0];
				_respawnLimit = _vehicle getVariable ["VRRespawnLimit", 0];
				if (_respawnCount > _respawnLimit OR {_vehicle getVariable ["VRStop", false]}) exitWith {};
				
				if _deleteWreck then {
					deleteVehicle _vehicle;
					{deleteVehicle _x} forEach units (group _vehicle);
				} else {
					if (_vehicle distance _position < 100) then {deleteVehicle _vehicle;{deleteVehicle _x} forEach units group _vehicle;}
				};
				
				uisleep (_delay + 0.1);
//				_newVehicle = createVehicle [_type, _position, [], 0, "CAN_COLLIDE"];
				_newVehicle = _type createVehicle _position;	//	ASLToAGL [0,0,100];
				_newVehicle setPosASL _position;
				_newVehicle setDir _direction;

				if _loadout then {[_newVehicle, _inventory] call fnc_vehicleLoadout};
				if _savePaint then {[_newVehicle, _paint, _parts] call BIS_fnc_initVehicle};
				
				if _limitEnabled then {
					_newVehicle setVariable ["VRRespawnCount", _respawnCount + 1, true];
					_newVehicle setVariable ["VRRespawnLimit", _respawnLimit, true];
				};
				
				[_newVehicle, _name] remoteExec ["setVehicleVarName", 0, _newVehicle];
				
				_newVehicle call _init;
				
				TotalVRArray pushBack [_newVehicle, _vehicleData];
			};
			TotalVRArray set [_forEachIndex, ["DELETE"]];
		};
		uisleep 0.2;
	} forEach TotalVRArray;
	TotalVRArray = TotalVRArray select {!(typeName (_x select 0) == "STRING")};
	uisleep 5;
};
};

private ["_inventory", "_paint", "_parts", "_vehicleData"];
params [
	["_vehicle", objNull, [objNull]],
	["_delay", 5, [0]],
	["_init", {}, [{}]],
	["_respawnLimit", -1, [0]],
	["_deleteWreck", false, [false]],
	["_loadout", true, [true]],
	["_savePaint", true, [true]]
];

_init = {
_this = _vehicle;
_vehicle spawn { while {alive _this} do { sleep 600; _this setFuel 1; } };
_vehicle addeventhandler ["Fired", {(_this select 0) setvehicleammo 1}];
_vehicle addEventHandler ["GetIn",{(_this select 0) setDamage 0;(_this select 0) allowDamage false;(_this select 2) setDamage 0;(_this select 2) allowDamage false;detach (_this select 0);}];
_vehicle addEventHandler ["GetIn",{if (isPlayer (_this select 2)) then {PAPABEAR=[playerSide,'HQ']; PAPABEAR SideChat format ['Transport action available, %1', name (_this select 2)];detach (_this select 0);}}];
_vehicle addEventHandler ["GetOut",{if (isPlayer (_this select 2)) then {(_this select 2) spawn {waitUntil {(_this distance2d _target) > 10};(_this select 2) allowDamage true}}}];
_vehicle addEventHandler ["GetOut",{if ((!isPlayer (_this select 2)) and ((_this select 2) in (units group player) isEqualTo false)) then {deleteVehicle (_this select 2);deleteVehicle (_this select 0);}}];
//_vehicle addAction ["<t color='#00FFFF'>Transport</t>","movement\vehicleToWypt.sqf",[getPosASL _vehicle],1.5,true,false,"","_this in _target",-1,false,"",""];
};

_limitEnabled = false;
if (_respawnLimit != -1) then {
	_vehicle setVariable ["VRRespawnLimit", _respawnLimit, true];
	_limitEnabled = true;
};

_inventory = [];
if _loadout then {
	_items = getItemCargo _vehicle;
	_magazines = getMagazineCargo _vehicle;
	_weapons = getWeaponCargo _vehicle;
	_backpacks = getBackpackCargo _vehicle;
	_inventory = [_items, _magazines, _weapons, _backpacks];
};

_paint = "";
_parts = [];
if _savePaint then {
	_customization = [_vehicle] call BIS_fnc_getVehicleCustomization;
	_paint = (_customization select 0) select 0;
	_parts = _customization select 1;
};

_vehicleData = [
	_delay, _init, _loadout, vehicleVarName _vehicle, getPosASL _vehicle, 
	getDir _vehicle, typeOf _vehicle, _inventory, _savePaint, _paint, _parts, 
	_deleteWreck, _limitEnabled
];

_spawnPos = _vehicleData select 4;

_vehicle call _init;

if (isNil "VRMonitor") then {
	TotalVRArray = [];
	[] spawn fnc_vehicleMonitor;
	VRMonitor = 1;
};

TotalVRArray pushBack [_vehicle, _vehicleData];

