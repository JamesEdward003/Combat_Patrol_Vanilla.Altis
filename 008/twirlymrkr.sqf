//////////////////////////////////////////////////////////////////
private ["_unit","_type","_marker","_mrkrcolor"];
_unit = _this select 0;
_type = typeOf _unit;

_mrkrcolor 	= [];

switch (side _unit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:	{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorOrange"};
};

if (isMultiplayer) then {	
	_unit addEventHandler ["Respawn",{_this execVM "008\twirlyMrkr.sqf"}];
};

While {alive _unit} do {
	_marker = createMarkerLocal [_type, position _unit];
	_marker setMarkerTypeLocal "select";
	_marker setMarkerShapeLocal "Icon";  
	_marker setMarkerTextLocal _type;
	_marker setMarkerSizeLocal [0.75,0.75];
	_marker setMarkerColorLocal _mrkrcolor;	
	sleep 2;
	deleteMarkerLocal _marker;
};
sleep 2;
deleteMarkerLocal _type;
