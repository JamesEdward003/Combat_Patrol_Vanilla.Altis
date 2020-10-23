////////// execVM "garage.sqf" //////////
_allowCiv = false;

_vehicleData = [
//OPFOR
[
	[],	//CARS
	[],	//ARMOUR
	[],	//HELIS
	[],	//PLANES
	[],	//NAVAL
	[]	//STATICS
],
//BLUFOR
[	
	[],	//CARS
	["B_MBT_01_TUSK_F"],	//ARMOUR
	[],	//HELIS
	[],	//PLANES
	[],	//NAVAL
	[]	//STATICS
],
//INDEPENDENT
[	
	[],	//CARS
	[],	//ARMOUR
	[],	//HELIS
	[],	//PLANES
	[],	//NAVAL
	[]	//STATICS
],
//CIVILIAN
[	
	[],	//CARS
	[],	//ARMOUR
	[],	//HELIS
	[],	//PLANES
	[],	//NAVAL
	[]	//STATICS
]
];


_vehicleDataTypes_enum = [
[ "car", "carx" ],
[ "tank", "tankx" ],
[ "helicopter", "helicopterx", "helicopterrtd" ],
[ "airplane", "airplanex" ],
[ "ship", "shipx", "sumbarinex" ]
];

_fnc_getVehicleDataTypeIndex = {
_type = toLower _this;
_return = -1;
{
	if ( _type in _x ) exitWith {
		_return = _forEachIndex;
	};
}forEach _vehicleDataTypes_enum;

_return
};

_defaultCrew = gettext (configfile >> "cfgvehicles" >> "all" >> "crew");
"
_cfgPath = _x;
_simulType = getText ( _cfgPath >> 'simulation' );
_simulIndex = _simulType call _fnc_getVehicleDataTypeIndex;
if ( ( tolower ( getText ( _cfgPath >> 'vehicleClass' ) ) isEqualTo 'static' ) ) then {
	_simulIndex = 5;
};

if ( getnumber (_cfgPath >> 'scope') == 2 && {gettext (_cfgPath >> 'crew') != _defaultCrew} && { _simulIndex >= 0 }  ) then {

	_side = getNumber ( _cfgPath >> 'side' );
	_model = getText ( _cfgPath >> 'model' );

	_sides = [ _side ];
	if ( _allowCiv && { _side isEqualTo 3 }  ) then {
		_sides = _sides + [ 0, 1, 2 ];
	};

	{

		_tmpSide = _vehicleData select _x;
		_tmpTypes = _tmpSide select _simulIndex;

		_index = ( _tmpTypes find _model );
		if ( _index >= 0 ) then {
			_index = _index + 1;
			( _tmpTypes select _index ) pushback _cfgPath;
		}else{
			_tmpTypes pushback _model;
			_tmpTypes pushback [ _cfgPath ];
		};
	}foreach _sides;

};

"configClasses ( configFile >> "CfgVehicles" );

player addAction [ "<t color='#00FFFF'>Custom Garage</t>",{
	_unit 	= _this select 0;
	_caller 	= _this select 1;
	_id 		= _this select 2;
//	_caller removeAction _id;
	
BIS_fnc_garage_data = ( _this select 3 ) select ( side player call BIS_fnc_sideID );

_pos = [ player, 30, getDir player ] call BIS_fnc_relPos;
_spawnPos = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ];

[ "Open", [ true, _spawnPos ] ] call BIS_fnc_garage;

},
	    [_vehicleData],
	    1, 
	    true, 
	    false, 
	    "",
	    ""
	];
	
	
hint format ]"%1", _vehicleData];