///////////////////////////////
// "paramsplus\markers".sqf; //
_PMarkers = "PMarkers" call BIS_fnc_getParamValue;
if (_PMarkers isEqualTo 1) exitWith {};
private ["_unit","_varname","_group","_grp","_mrkrCnt","_mrkr","_text","_PMarkers"];
_unit		= _this;
//_unitname 	= name _unit;
_varname 	= vehicleVarName _unit;
_classname 	= format ["%1", typeOf _unit];
_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");
_group		= group _unit;	
_mrkrtxt		= _varname;
_mrkrCnt 	= 0;

_text = toArray(str _group);
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_grp = toString(_text);
		
if (!(isNil { _unit getVariable "markerGroup"})) then
		{
		_mrkrCnt = _unit getVariable "markerGroup";
		_mrkrCnt = _mrkrCnt + 1;
		_unit setVariable ["markerGroup", _mrkrCnt, true];
}  else 	{		
			_mrkrCnt = 1;
			_unit setVariable ["markerGroup", _mrkrCnt, true];
			_unit addEventHandler ["Respawn", {
				params ["_unit", "_corpse"];
				_unit execVM "ParamsPlus\markers.sqf";
			}];
};

_mrkrcolor 	= [];

switch (side _unit) do {

         case west:			{_mrkrcolor = "ColorBlue"};
         case east:			{_mrkrcolor = "ColorRed"};
         case resistance:		{_mrkrcolor = "ColorGreen"};
         case civilian:		{_mrkrcolor = "ColorYellow"};
};

//Default	[0,0,0,1]
//ColorBlack	[0,0,0,1]
//ColorGrey	[0.5,0.5,0.5,1]
//ColorRed	[0.9,0,0,1]
//ColorBrown	[0.5,0.25,0,1]
//ColorOrange	[0.85,0.4,0,1]
//ColorYellow	[0.85,0.85,0,1]
//ColorKhaki	[0.5,0.6,0.4,1]
//ColorGreen	[0,0.8,0,1]
//ColorBlue	[0,0,1,1]
//ColorPink	[1,0.3,0.4,1]
//ColorWhite	[1,1,1,1]
//ColorWEST	[0,0.3,0.6,1]
//ColorEAST	[0.5,0,0,1]
//ColorGUER	[0,0.5,0,1]
//ColorCIV	[0.4,0,0.5,1]
//ColorUNKNOWN	[0.7,0.6,0,1]
//colorBLUFOR	[0,0.3,0.6,1]
//colorOPFOR	[0.5,0,0,1]
//colorIndependent	[0,0.5,0,1]
//colorCivilian	[0.4,0,0.5,1]
//Color1_FD_F	[0.694118,0.2,0.223529,1]
//Color2_FD_F	[0.678431,0.74902,0.513726,1]
//Color3_FD_F	[0.941176,0.509804,0.192157,1]
//Color4_FD_F	[0.403922,0.545098,0.607843,1]
//Color5_FD_F	[0.690196,0.25098,0.654902,1]

	_mrkrCnt = _unit getVariable "markerGroup";	
	_mrkrname = format ["%1_%2",_varname,_mrkrCnt];
	_mrkr = createMarkerLocal [_mrkrname, position _unit];
	_mrkr setMarkerTypeLocal "mil_start";
	_mrkr setMarkerShapeLocal "ICON";
	_mrkr setMarkerTextLocal _mrkrtxt;
	_mrkr setMarkerSizeLocal [.5,.5];
	_mrkr setMarkerColorLocal _mrkrcolor;


	if (_grp isEqualTo "Rambo") then {
		_mrkr setMarkerColor "Color4_FD_F";
	};
	if (_grp isEqualTo "Jester") then {
		_mrkr setMarkerColor "ColorKhaki";
	};
//	if (_grp isEqualTo "Revolution") then {
//		_mrkr setMarkerColor "ColorGreen";
//	}; 
//	if (_grp isEqualTo "Namdar") then {
//		_mrkr setMarkerColor "ColorRed";
//	};
//	if (_grp isEqualTo "GreyWolf") then {
//		_mrkr setMarkerColor "ColorGrey";
//	};
//	if (_grp isEqualTo "Nomad") then {
//		_mrkr setMarkerColor "ColorWhite";
//	};

scopeName "main";
while {(getDammage _unit) < .3} do {
	scopeName "loop1";
	_mrkr setMarkerType "mil_start";
	_mrkr setMarkerDir getDir _unit;
	_mrkr setMarkerPos getPos _unit;
	if !(isNull objectParent _unit) then {_mrkr setMarkerAlphaLocal 0} else {_mrkr setMarkerAlphaLocal 1};
	while {(getDammage _unit) >= .3} do {
		scopeName "loop2";
		_mrkr setMarkerType "mil_flag";
		_mrkr setMarkerDir getDir _unit;
		_mrkr setMarkerPos getPos _unit;
		if !(isNull objectParent _unit) then {_mrkr setMarkerAlphaLocal 0} else {_mrkr setMarkerAlphaLocal 1};
		if (!alive _unit) then {breakTo "main"}; // Breaks all scopes and return to "main"
		if ((getDammage _unit) < .3) then {breakOut "loop2"}; // Breaks scope named "loop2"
		sleep 1;
	};
	sleep 1;
};
	
//while {alive _unit} do {
//	if ((getDammage _unit) < .3) then {
//	_mrkr setMarkerType "mil_start";
//	_mrkr setMarkerDir getDir _unit;
//	_mrkr setMarkerPos getPos _unit;
//	if !(isNull objectParent _unit) then {_mrkr setMarkerAlphaLocal 0} else {_mrkr setMarkerAlphaLocal 1};
//	} else {
//		if ((getDammage _unit) >= .3) then {
//		_mrkr setMarkerType "mil_flag";
//		_mrkr setMarkerDir getDir _unit;
//		_mrkr setMarkerPos getPos _unit;
//		if !(isNull objectParent _unit) then {_mrkr setMarkerAlphaLocal 0} else {_mrkr setMarkerAlphaLocal 1};
//	      };
//		sleep 0.5;
//	};
//};
_mrkr setMarkerTypeLocal "hd_objective";
_mrkr setMarkerTextLocal _mrkr;
_mrkr setMarkerAlphaLocal 0.25;

