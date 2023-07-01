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

	execVM 'Vehicle.sqf';
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
	_vType 		= _this select 3 select 0;
	_unit removeAction _id;

_pos = [ player, 20, getDir player ] call BIS_fnc_relPos;
_apc = createVehicle [ _vType, _pos, [], 0, 'CAN_COLLIDE' ];
createVehicleCrew _apc;
{_x setCaptive true} forEach crew _apc;
_apc addEventHandler ['Fired',{(_this select 0) setvehicleammo 1}];
{ _apc deleteVehicleCrew _x } forEach crew _apc;
_apc call KS_fnc_vehicleRespawnNotification;_apc call Vehicle_Module_Mgmt;
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
	_vType 		= _this select 3 select 0;
	_unit removeAction _id;

_pos = [ player, 20, getDir player ] call BIS_fnc_relPos;
_apc = createVehicle [ _vType, _pos, [], 0, 'CAN_COLLIDE' ];
createVehicleCrew _apc;
{_x setCaptive true} forEach crew _apc;
_apc addEventHandler ['Fired',{(_this select 0) setvehicleammo 1}];
{ _apc deleteVehicleCrew _x } forEach crew _apc;
_apc call KS_fnc_vehicleRespawnNotification;_apc call Vehicle_Module_Mgmt;
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
	_vType 		= _this select 3 select 0;
	_unit removeAction _id;

_pos = [ player, 20, getDir player ] call BIS_fnc_relPos;
_apc = createVehicle [ _vType, _pos, [], 0, 'CAN_COLLIDE' ];
createVehicleCrew _apc;
{_x setCaptive true} forEach crew _apc;
_apc addEventHandler ['Fired',{(_this select 0) setvehicleammo 1}];
{ _apc deleteVehicleCrew _x } forEach crew _apc;
_apc call KS_fnc_vehicleRespawnNotification;_apc call Vehicle_Module_Mgmt;
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

//_this call KS_fnc_vehicleRespawnNotification;_this execVM "008\vehicleMarker.sqf";_this execVM "008\SeatAction\seat_action.sqf";_this addAction ["<t color='#00FFFF'>Player Group GetIn</t>","008\getIn\groupGetIn.sqf",[],100,false,true,"","((_target distance _this) < 30)"];_this addEventHandler ["GetIn","(_this select 2) setBehaviour ""CARELESS"";(_this select 2) allowDamage FALSE"];_this addEventHandler ["GetOut","(_this select 2) setBehaviour ""COMBAT"";(_this select 2) allowDamage FALSE;[(_this select 0),(_this select 2)] spawn {waitUntil {((_this select 1) distance (_this select 0)) > 20;}; (_this select 1) allowDamage TRUE;}"];_this addAction ["<t color='#00FFFF'>Player Get In Cargo</t>","008\getIn\GetInCargo.sqf",[],100,false,true,"",""];_this addeventhandler ["Getin", {_nul=[_this select 2] execVM "008\adfalse.sqf"}];_this addeventhandler ["Getout", {_nul=[_this select 2] execVM "008\adtrue.sqf"}];{deleteVehicle _x} forEach crew _this - [driver _this];{addSwitchableUnit _x} forEach crew _this;{[_x] execVM "008\adfalse.sqf"} forEach crew _this;_this setvehiclelock "unlocked";_this addAction ["Alternate Landing Zone","008\altLZ.sqf",[],100,false,true,"","(alive _target)"];
//_this call KS_fnc_vehicleRespawnNotification;_this call Vehicle_Module_Mgmt;
//_this spawn { waitUntil {getPosATL _this select 2 < 3};  ["AmmoboxInit", [_this, true, {true}]] spawn BIS_fnc_arsenal;[_this] execVM "paramsplus\vehicleMarker.sqf";};

Vehicle_Module_Mgmt = {
	private ["_this"];
	[_this] execvm "GarageVehicleEH.sqf";
	[_this] execVM "paramsplus\vehicleMarker.sqf";
	{deleteVehicle _x} forEach crew _this - [driver _this];
	{addSwitchableUnit _x} forEach crew _this;
	{[_x] execVM "008\adfalse.sqf"} forEach crew _this;
	_this setvehiclelock "unlocked";
	_this execVM "008\SeatAction\seat_action.sqf";
	_this addEventHandler ["GetIn","(_this select 2) setBehaviour 'CARELESS';(_this select 2) allowDamage FALSE"];
	_this addEventHandler ["GetOut","(_this select 2) setBehaviour 'COMBAT';(_this select 2) allowDamage FALSE;[(_this select 0),(_this select 2)] spawn {waitUntil {((_this select 1) distance (_this select 0)) > 20;}; (_this select 1) allowDamage TRUE;}"];
	_this addAction ["<t color='#00FFFF'>Player Group GetIn</t>","008\getIn\groupGetIn.sqf",[],100,false,true,"","((_target distance _this) < 30)"];
	_this addAction ["<t color='#00FFFF'>Player Get In Cargo</t>","008\getIn\GetInCargo.sqf",[],100,false,true,"","((_target distance _this) < 30)"];
	_this addAction ["Alternate Landing Zone","008\altLZ.sqf",[],100,false,true,"","(alive _target)"];
};
//_apc call KS_fnc_vehicleRespawnNotification;_apc execVM '008\vehicleMarker.sqf';_apc execVM '008\SeatAction\seat_action.sqf';_apc addAction ['<t color=''#00FFFF''>Player Group GetIn</t>','008\getIn\groupGetIn.sqf',[],100,false,true,'','((_target distance _this) < 30)'];_apc addEventHandler ['GetIn','(_this select 2) setBehaviour ''CARELESS'';(_this select 2) allowDamage FALSE'];_apc addEventHandler ['GetOut','(_this select 2) setBehaviour ''COMBAT'';(_this select 2) allowDamage FALSE;[(_this select 0),(_this select 2)] spawn {waitUntil {((_this select 1) distance (_this select 0)) > 20;}; (_this select 1) allowDamage TRUE;}'];_apc addAction ['<t color=''#00FFFF''>Player Get In Cargo</t>','008\getIn\GetInCargo.sqf',[],100,false,true,'',''];_apc addeventhandler ['Getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];_apc addeventhandler ['Getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];{deleteVehicle _x} forEach crew _apc - [driver _apc];{addSwitchableUnit _x} forEach crew _apc;{[_x] execVM '008\adfalse.sqf'} forEach crew _apc;_apc setvehiclelock 'unlocked';_apc addAction ['Alternate Landing Zone','008\altLZ.sqf',[],100,false,true,'','(alive _target)'];
//_apc call KS_fnc_vehicleRespawnNotification;[_apc] execVM '008\vehicleMarker.sqf';_apc execVM '008\SeatAction\seat_action.sqf';_apc addAction ['<t color=''#00FFFF''>Player Group GetIn</t>','008\getIn\groupGetIn.sqf',[],100,false,true,'','((_target distance _this) < 30)'];_apc addEventHandler ['GetIn','(_this select 2) setBehaviour ''CARELESS'';(_this select 2) allowDamage FALSE'];_apc addEventHandler ['GetOut','(_this select 2) setBehaviour ''COMBAT'';(_this select 2) allowDamage FALSE;[(_this select 0),(_this select 2)] spawn {waitUntil {((_this select 1) distance (_this select 0)) > 20;}; (_this select 1) allowDamage TRUE;}'];_apc addAction ['<t color=''#00FFFF''>Player Get In Cargo</t>','008\getIn\GetInCargo.sqf',[],100,false,true,'',''];_apc addeventhandler ['Getin', {_nul=[_this select 2] execVM '008\adfalse.sqf'}];_apc addeventhandler ['Getout', {_nul=[_this select 2] execVM '008\adtrue.sqf'}];{deleteVehicle _x} forEach crew _apc - [driver _apc];{addSwitchableUnit _x} forEach crew _apc;{[_x] execVM '008\adfalse.sqf'} forEach crew _apc;_apc setvehiclelock 'unlocked';_apc addAction ['Alternate Landing Zone','008\altLZ.sqf',[],100,false,true,'','(alive _target)'];
