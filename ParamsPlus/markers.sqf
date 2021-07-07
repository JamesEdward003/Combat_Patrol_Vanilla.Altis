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

//switch (group _unit) do {

//         case Rambo:		{_mrkrcolor = "Color4_FD_F"};
//         case Nazari:		{_mrkrcolor = "Color1_FD_F"};
//         case Rosi:			{_mrkrcolor = "Color5_FD_F"};
//         case Revolution:	{_mrkrcolor = "Color6_FD_F"};
//};

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

//ColorWEST	[0,0.3,0.6,1]-Light Blue
//ColorEAST	[0.5,0,0,1]-Red
//ColorGUER	[0,0.5,0,1]-Green
//ColorCIV	[0.4,0,0.5,1]-Dark Pink
//ColorUNKNOWN	[0.7,0.6,0,1]-Light Orange

//colorBLUFOR	[0,0.3,0.6,1]-Blue
//colorOPFOR	[0.5,0,0,1]-Red
//colorIndependent	[0,0.5,0,1]-Green
//colorCivilian	[0.4,0,0.5,1]-Yellow

//Color1_FD_F	[0.694118,0.2,0.223529,1]-Red
//Color2_FD_F	[0.678431,0.74902,0.513726,1]-Light Green
//Color3_FD_F	[0.941176,0.509804,0.192157,1]-Orange
//Color4_FD_F	[0.403922,0.545098,0.607843,1]-Light Blue
//Color5_FD_F	[0.690196,0.25098,0.654902,1]-Pink
//Color6_FD_F	[0.352941,0.34902,0.352941,1]-Grey
//Color8_FD_F	[1,1,1,1]-White

	_mrkrCnt = _unit getVariable "markerGroup";	
	_mrkrname = format ["%1_%2",_varname,_mrkrCnt];
	_mrkr = createMarkerLocal [_mrkrname, position _unit];
	_mrkr setMarkerTypeLocal "mil_start";
	_mrkr setMarkerShapeLocal "ICON";
	_mrkr setMarkerTextLocal _mrkrtxt;
	_mrkr setMarkerSizeLocal [.5,.5];
	_mrkr setMarkerColorLocal _mrkrcolor;


	if ((group _unit == Rambo) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color4_FD_F";
	};
	if ((group _unit == Snake) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color4_FD_F";
	};
	if ((group _unit == Viper) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color4_FD_F";
	};
	
	if ((group _unit == Nazari) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color1_FD_F";
	};
	if ((group _unit == Namdar) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color1_FD_F";
	};
	if ((group _unit == Attar) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color1_FD_F";
	};
	
	if ((group _unit == Rosi) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color2_FD_F";
	};
	if ((group _unit == Griffin) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color2_FD_F";
	};
	if ((group _unit == Hladik) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color2_FD_F";
	};		
	if ((group _unit == Revolution) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color5_FD_F";
	}; 
	if ((group _unit == Jester) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color5_FD_F";
	};
	if ((group _unit == Cosmos) isEqualTo true) then {
		_mrkr setMarkerColorLocal "Color5_FD_F";
	};
	
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

