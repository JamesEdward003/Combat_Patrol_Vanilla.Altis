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

	execVM 'VG_Vehicle.sqf';
},
	    [],
	    1, 
	    true, 
	    false, 
	    '',
	    ''
	];", ""];

//BIS_fnc_garage_data = ( _this select 3 ) select ( side player call BIS_fnc_sideID );

//_pos = [ player, 20, getDir player ] call BIS_fnc_relPos;
//_vehicle = createVehicle [ 'Land_HelipadEmpty_F', _pos, [], 0, 'CAN_COLLIDE' ];

//[ 'Open', [ true, _vehicle ] ] call BIS_fnc_garage;
//createVehicleCrew _vehicle;

_trg4 = createTrigger ["EmptyDetector", [0,0,0]];
_trg4 setTriggerActivation ["Delta", "PRESENT", true];
_trg4 setTriggerText "Marshall APC";
_trg4 setTriggerStatements ["this", "

player addAction [ '<t color=''#00FFFF''>MARSHALL APC</t>',{
	_unit 	= _this select 0;
	_caller 	= _this select 1;
	_id 		= _this select 2;
	_unit removeAction _id;

_pos = [ player, 20, getDir player ] call BIS_fnc_relPos;
_apc = createVehicle [ 'B_APC_Wheeled_01_cannon_F', _pos, [], 0, 'CAN_COLLIDE' ];
_apc addEventHandler ['Fired',{(_this select 0) setvehicleammo 1}];
_apc execVM 'paramsplus\vehicleMarker.sqf';

},
	    ['B_APC_Wheeled_01_cannon_F'],
	    1, 
	    true, 
	    false, 
	    '',
	    ''
	];", ""];

_trg5 = createTrigger ["EmptyDetector", [0,0,0]];
_trg5 setTriggerActivation ["Echo", "PRESENT", true];
_trg5 setTriggerText "MH-9 HELI";
_trg5 setTriggerStatements ["this", "

player addAction [ '<t color=''#00FFFF''>MH-9</t>',{
	_unit 	= _this select 0;
	_caller 	= _this select 1;
	_id 		= _this select 2;
	_unit removeAction _id;

_pos = [ player, 20, getDir player ] call BIS_fnc_relPos;
_apc = createVehicle [ 'B_Heli_Light_01_F', _pos, [], 0, 'CAN_COLLIDE' ];
_apc addEventHandler ['Fired',{(_this select 0) setvehicleammo 1}];
_apc execVM 'paramsplus\vehicleMarker.sqf';

},
	    ['B_Heli_Light_01_F'],
	    1, 
	    true, 
	    false, 
	    '',
	    ''
	];", ""];
	
_trg6 = createTrigger ["EmptyDetector", [0,0,0]];
_trg6 setTriggerActivation ["Foxtrot", "PRESENT", true];
_trg6 setTriggerText "AH-9 HELI";
_trg6 setTriggerStatements ["this", "

player addAction [ '<t color=''#00FFFF''>AH-9</t>',{
	_unit 	= _this select 0;
	_caller 	= _this select 1;
	_id 		= _this select 2;
	_unit removeAction _id;

_pos = [ player, 20, getDir player ] call BIS_fnc_relPos;
_apc = createVehicle [ 'B_Heli_Light_01_dynamicLoadout_F', _pos, [], 0, 'CAN_COLLIDE' ];
_apc addEventHandler ['Fired',{(_this select 0) setvehicleammo 1}];
_apc execVM 'paramsplus\vehicleMarker.sqf';

},
	    ['B_Heli_Light_01_dynamicLoadout_F'],
	    1, 
	    true, 
	    false, 
	    '',
	    ''
	];", ""];
	
_trg7 = createTrigger ["EmptyDetector", [0,0,0]];
_trg7 setTriggerActivation ["Golf", "PRESENT", true];
_trg7 setTriggerText "DISABLE RADIO";
_trg7 setTriggerStatements ["this", "
enableRadio false;
enableSentences false;
{_x disableConversation true} forEach units group player;
hint parseText format['<t size=''1.25'' color=''#ff6161''>Radio Transmissions Disabled!</t>'];
", ""];

_trg8 = createTrigger ["EmptyDetector", [0,0,0]];
_trg8 setTriggerActivation ["Hotel", "PRESENT", true];
_trg8 setTriggerText "ENABLE RADIO";
_trg8 setTriggerStatements ["this", "
enableRadio true;
enableSentences true;
{_x disableConversation false} forEach units group player;
hint parseText format['<t size=''1.25'' color=''#44ff00''>Radio Transmissions Enabled!</t>'];
", ""];

_trg9 = createTrigger ["EmptyDetector", [0,0,0]];
_trg9 setTriggerActivation ["India", "PRESENT", true];
_trg9 setTriggerText "LOAD GAME";
_trg9 setTriggerStatements ["this", "if (isMultiPlayer) then {hint parseText format['<t size=''1.25'' color=''#44ff00''>Game Will Load Save On Restart!</t>']} else {LoadGame;};", ""];

_trg10 = createTrigger ["EmptyDetector", [0,0,0]];
_trg10 setTriggerActivation ["Juliet", "PRESENT", true];
_trg10 setTriggerText "SAVE GAME";
_trg10 setTriggerStatements ["this", "enableSaving true; SaveGame; if (isMultiPlayer) then {hint parseText format['<t size=''1.25'' color=''#44ff00''>Game Will Load Save On Restart!</t>']} else {hint parseText format['<t size=''1.25'' color=''#44ff00''>Game Will Load Last Game Save!</t>'];};", ""];

