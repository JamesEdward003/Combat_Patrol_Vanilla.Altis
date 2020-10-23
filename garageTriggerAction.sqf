//////// execVM "garageTriggerAction.sqf" ////////
_trg3 = createTrigger ["EmptyDetector", [0,0,0]];
_trg3 setTriggerActivation ["Charlie", "PRESENT", true];
_trg3 setTriggerText "Garage Action";
_trg3 setTriggerStatements ["this", "

player addAction [ '<t color=''#00FFFF''>Custom Garage</t>',{
	_unit 	= _this select 0;
	_caller 	= _this select 1;
	_id 		= _this select 2;
	_unit removeAction _id;
	
BIS_fnc_garage_data = ( _this select 3 ) select ( side player call BIS_fnc_sideID );

_pos = [ player, 30, getDir player ] call BIS_fnc_relPos;
_spawnPos = createVehicle [ 'Land_HelipadEmpty_F', _pos, [], 0, 'CAN_COLLIDE' ];

[ 'Open', [ true, _spawnPos ] ] call BIS_fnc_garage;

},
	    [_vehicleData],
	    1, 
	    true, 
	    false, 
	    '',
	    ''
	];", ""];

