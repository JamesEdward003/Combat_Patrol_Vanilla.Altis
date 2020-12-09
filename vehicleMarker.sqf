//////////////////////////////////////////////////////////////////
// [] execVM "vehicleMarker.sqf";
//////////////////////////////////////////////////////////////////
private ["_unit","_marker"];
_unit = _this select 0;
_name = typeOf _unit;
_type = typeOf _unit;

_mrkrcolor 	= [];

switch (playerSide) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:		{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

if (isMultiPlayer) then
{
	_unit addEventHandler ["Respawn",{_this execVM "vehicleMarker.sqf"}];
};
		
While {alive _unit} do {
	_marker = createMarkerLocal [_name, position _unit];
	_marker setMarkerTypeLocal "b_air";
	_marker setMarkerColorLocal _mrkrcolor;
	_marker setMarkerTextLocal _name;
	_marker setMarkerSizeLocal [0.75,0.75];
	sleep 2;
	deleteMarkerLocal _marker;
};
