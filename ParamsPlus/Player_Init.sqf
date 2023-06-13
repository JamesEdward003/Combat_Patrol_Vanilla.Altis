///////////////  "Player_Init.sqf"  ////////////////
player addEventHandler ["GetInMan", {
	clearWeaponCargo (vehicle player);                 
	clearMagazineCargo (vehicle player);
	(vehicle player) addMagazineCargo ["SmokeShell",10];
	(vehicle player) addMagazineCargo ["HandGrenade",10];
	(vehicle player)addMagazineCargo ["SatchelCharge_Remote_Mag",10];
	_nul = (vehicle player) spawn { while {alive _this} do { _this setFuel 1; sleep 600 } };
	(vehicle player) flyInHeight 80;
	(vehicle player) allowdamage false;
	{_x allowdamage false} foreach crew (vehicle player);
	(vehicle player) addeventhandler ["Fired", {(_this select 0) setvehicleammo 1}];
	(vehicle player) addEventHandler ["GetIn",{(_this select 0) setDamage 0;(_this select 2) setDamage 0;(_this select 2) allowDamage false;detach (_this select 0)}];
	(vehicle player) addEventHandler ["GetOut",{_this spawn {sleep 6;(_this select 2) allowDamage true}}];
	(vehicle player) addAction ["<t color='#00FFFF'>Transport</t>","movement\vehicleToWypt.sqf",[FREEDOM_H_5],1.5,true,false,"","true",50,false,"",""];
	(vehicle player) addAction ["<t color='#00FFFF'>Spawn Crew</t>", {createVehicleCrew (_this select 0);{addSwitchableUnit _x} forEach (crew (_this select 0));},[],1.5,true,false,"","true",50,false,"",""];
	//(vehicle player) addEventHandler ["GetIn",{if (isPlayer (_this select 2)) then {PAPABEAR=[playerSide,'HQ'];PAPABEAR SideChat format ['Transport action available, %1', name (_this select 2)]; detach (_this select 0)}}];
	(vehicle player) setGroupID ["FREEDOM_AirLift"];
	_veh = [(vehicle player), 30, 500, 0, FALSE, FALSE, TRUE] execVM "misc\vehicle_respawn.sqf";
	player addEventHandler ["InventoryOpened", {
	 	player removeAllEventHandlers "InventoryOpened";
	 	_box = "Box_NATO_Ammo_F" createVehicle [0,0,0];
	 	_box setPos (player modelToWorld [0,3,0.25]);
		player action ["Gear", _box];
		true;
	}];
}];

