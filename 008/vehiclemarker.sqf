//////////////////////////////////////////////////////////////////
// [] execVM "vehicleMarker.sqf";
//////////////////////////////////////////////////////////////////
private ["_unit","_name","_type","_mrkrcolor","_marker"];
_unit = _this;
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
	_unit addEventHandler ["Respawn",{_this execVM "008\vehicleMarker.sqf"}];
};

	_marker = createMarkerLocal [_type, position _unit];
	_marker setMarkerTypeLocal "b_air";
	_marker setMarkerColorLocal _mrkrcolor;
	_marker setMarkerTextLocal _type;
	_marker setMarkerSizeLocal [0.75,0.75];

While {alive _unit} do {

	_marker setMarkerPos getPos _unit;
	sleep 1;
	
};

deleteMarkerLocal _marker;
