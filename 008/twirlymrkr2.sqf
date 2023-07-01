// [_this] execVM "008/twirlyMrkr2.sqf" ////////////////////////////////////////
private ["_unit","_varName","_mrkrName","_mrkrcolor"];
_unit 	 = _this select 0;
_varName = vehicleVarname _unit;
_mrkrName = _varName;

if (isMultiplayer) then {	
	_unit addEventHandler ["Respawn",{_this execVM "008\twirlyMrkr2.sqf"}];
};

While {alive _unit} do {
	_mrkrName setMarkerPos position _unit;
	_mrkrName setMarkerDir getDir _unit;
	sleep 2;
};
sleep 2;
_mrkrName setMarkerColorLocal "ColorBlack";
