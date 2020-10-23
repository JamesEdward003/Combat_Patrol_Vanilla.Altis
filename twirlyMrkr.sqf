//////////////////////////////////////////////////////////////////
private ["_unit","_unitname","_marker","_mrkrcolor"];

_unit = _this select 0;
//_varName = name _unit;
_varName = vehicleVarName _unit;
_type = typeOf _unit;

_mrkrcolor 	= [];

switch (side _unit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:		{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

if (isMultiPlayer) then
{
	if ( isNil{_unit getVariable "twirlyMrkrMP"} ) then 
	{	
		_unit addEventHandler ["Respawn",{_this execVM "twirlyMrkr.sqf"}];
		_unit setVariable ["twirlyMrkrMP", true];
	};
};

While {alive _unit} do {
	_marker = createMarkerLocal [_varName, position _unit];
	_marker setMarkerTypeLocal "mil_start";
	_marker setMarkerShapeLocal "Icon";  
//	_marker setMarkerTextLocal _varName;
	_marker setMarkerSizeLocal [0.5,0.5];
	_marker setMarkerColorLocal _mrkrcolor;
	_marker setMarkerDir getDir _unit;
	if !(isNull objectParent _unit) then {_marker setMarkerAlphaLocal 0} else {_marker setMarkerAlphaLocal 1};	
	sleep 2;
	deleteMarkerLocal _marker;
};
