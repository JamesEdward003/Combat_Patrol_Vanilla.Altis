//////////////////////////////////////////////////////////////////
// 		[PWNR_Taxi_B] execVM "paramsplus\vehicleMarker.sqf";
//////////////////////////////////////////////////////////////////
private ["_vehicle","_vehType","_marker","_mrkrName","_mrkrcolor","_markertype"];
_vehicle = _this select 0;

//_vehType = typeOf _vehicle;  //getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_classname 	= format ["%1", typeOf _vehicle];
_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");
_marker = objNull;
_mrkrName = format["mrkr_%1",random 100];

_mrkrcolor = switch (side player) do {

	case west: {"colorBLUFOR"};
	case east: {"colorOPFOR"};
	case resistance: {"colorIndependent"};
	default {"ColorCivilian"};
};
				
_markertype = switch (side player) do 
	{
	case west: {	
			switch true do 
			{
			case (_vehicle iskindof "camanbase"): {"b_inf"};
			case (_vehicle iskindof "car" || _vehicle iskindof "motorcycle"): {"b_mech_inf"};
			case (_vehicle iskindof "tank"|| _vehicle iskindof "wheeled_apc"): {"b_armor"};
			case (_vehicle iskindof "plane"): {"b_plane"};
			case (_vehicle isKindOf "helicopter"): {"b_air"};
			case (_vehicle iskindof "ship"): {"b_naval"};
			case (_vehicle iskindof "staticweapon"): {"b_inf"};
			case (_vehicle iskindof "slingload_base_f"): {"mil_dot"};
			case (_vehicle iskindof "reammobox_f"): {"mil_dot"};
			};
		};	
	case east: {		
			switch true do 
			{
			case (_vehicle iskindof "camanbase"): {"o_inf"};
			case (_vehicle iskindof "car" ||_vehicle iskindof "motorcycle"): {"o_mech_inf"};
			case (_vehicle iskindof "tank"|| _vehicle iskindof "wheeled_apc"): {"o_armor"};
			case (_vehicle iskindof "air"): {"o_plane"};
			case (_vehicle isKindOf "helicopter"): {"o_air"};
			case (_vehicle iskindof "ship"): {"o_naval"};
			case (_vehicle iskindof "staticweapon"): {"o_inf"};
			case (_vehicle iskindof "slingload_base_f"): {"mil_dot"};
			case (_vehicle iskindof "reammobox_f"): {"mil_dot"};
			};	
		};
	case resistance: {		
			switch true do 
			{
			case (_vehicle iskindof "camanbase"): {"n_inf"};
			case (_vehicle iskindof "car" || _vehicle iskindof "motorcycle"): {"n_mech_inf"};
			case (_vehicle iskindof "tank"|| _vehicle iskindof "wheeled_apc"): {"n_armor"};
			case (_vehicle iskindof "air"): {"n_plane"};
			case (_vehicle isKindOf "helicopter"): {"n_air"};
			case (_vehicle iskindof "ship"): {"n_naval"};
			case (_vehicle iskindof "staticweapon"): {"n_inf"};
			case (_vehicle iskindof "slingload_base_f"): {"mil_dot"};
			case (_vehicle iskindof "reammobox_f"): {"mil_dot"};
			};	
		};
	case civilian: {		
			switch true do 
			{
			case (_vehicle iskindof "camanbase"): {"n_inf"};
			case (_vehicle iskindof "car" || _vehicle iskindof "motorcycle"): {"n_mech_inf"};
			case (_vehicle iskindof "tank"|| _vehicle iskindof "wheeled_apc"): {"n_armor"};
			case (_vehicle iskindof "air"): {"n_plane"};
			case (_vehicle isKindOf "helicopter"): {"n_air"};
			case (_vehicle iskindof "ship"): {"n_naval"};
			case (_vehicle iskindof "staticweapon"): {"n_inf"};
			case (_vehicle iskindof "slingload_base_f"): {"mil_dot"};
			case (_vehicle iskindof "reammobox_f"): {"mil_dot"};
			};	
		};
}; 	
	
if (isMultiPlayer) then {	
	_vehicle addEventHandler ["Respawn",{_this execVM "paramsplus\vehicleMarker.sqf"}];
};

_array = ["slingload_base_f", "reammobox_f"];

if ((typeOf _vehicle) isKindOf "slingload_base_f" or (typeOf _vehicle) isKindOf "reammobox_f") then {
	_marker = createMarkerLocal [_mrkrName, position _vehicle];
	_marker setMarkerTypeLocal _markertype;
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTextLocal _displayname;
	_marker setMarkerSizeLocal [0.75,0.75];
	hint parseText format["<t size='1' color='#44ff00'>AmmoBox on the map marker!</t>"];
} else {
	While {alive _vehicle} do {
		_marker = createMarkerLocal [_mrkrName, position _vehicle];
		_marker setMarkerTypeLocal _markertype;
		_marker setMarkerColorLocal _mrkrcolor;
		_marker setMarkerTextLocal _displayname;
		_marker setMarkerSizeLocal [0.75,0.75];
		sleep 2;
		deleteMarkerLocal _marker;
	};
};























