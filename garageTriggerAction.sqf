//////// execVM "garageTriggerAction.sqf" ////////
_trg3 = createTrigger ["EmptyDetector", [0,0,0]];
_trg3 setTriggerActivation ["Charlie", "PRESENT", true];
_trg3 setTriggerText "Garage Action";
_trg3 setTriggerStatements ["this", "

player addAction [ '<t color=''#00FFFF''>Garage Action</t>',{
	_unit 	= _this select 0;
	_caller 	= _this select 1;
	_id 		= _this select 2;
	_unit removeAction _id;
	
BIS_fnc_garage_data = ( _this select 3 ) select ( side player call BIS_fnc_sideID );

_pos = [ player, 20, getDir player ] call BIS_fnc_relPos;
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

_trg4 = createTrigger ["EmptyDetector", [0,0,0]];
_trg4 setTriggerActivation ["Delta", "PRESENT", true];
_trg4 setTriggerText "Artillery";
_trg4 setTriggerStatements ["this", "

player addAction [ '<t color=''#00FFFF''>Artillery</t>',{
	_unit 	= _this select 0;
	_caller 	= _this select 1;
	_id 		= _this select 2;
	_vehicle = _this select 3;

	_unit removeAction _id;

	_spawnPos = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],_caller,objNull,true,1,"VIEW","FIRE"];

	hint parseText format["<t size='1.25' color='#208000'>Created armored personnel carrier!</t>"];

	if (count _spawnPos == 0) then {_spawnPos = [(getPos _caller), 400] call BIS_fnc_nearestRoad; hint parseText format["<t size='1.25' color='#208000'>Created armored personnel carrier on the nearest road!</t>"];};

},
	    ['B_APC_Wheeled_01_cannon_F'],
	    1, 
	    true, 
	    false, 
	    '',
	    ''
	];", ""];

