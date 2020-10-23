////////// execVM "openGarage.sqf" //////////

	player addAction [ "<t color='#000FFF'>Custom Garage</t>",{

	BIS_fnc_garage_data = ( _this select 3 ) select ( side player call BIS_fnc_sideID );

	_pos = [ player, 30, getDir player ] call BIS_fnc_relPos;
	_spawnPos = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ];


	[ "Open", [ true, _spawnPos ] ] call BIS_fnc_garage;

	}, _vehicleData ];

