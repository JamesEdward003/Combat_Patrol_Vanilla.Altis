//  execVM "bis_fnc_garage.sqf";  //

	private _fnc_scriptNameParent = if (isNil '_fnc_scriptName') then {'BIS_fnc_garage'} else {_fnc_scriptName};
	private _fnc_scriptName = 'BIS_fnc_garage';
	scriptName _fnc_scriptName;

#line 1 "A3\functions_f_mark\Vehicles\fn_garage.sqf [BIS_fnc_garage]";
if (is3DEN && {_fnc_scriptName == "bis_fnc_garage"}) exitwith {_this call bis_fnc_garage3DEN;};























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































disableserialization;

_mode = [_this,0,"Open",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;
_fullVersion = missionnamespace getvariable ["BIS_fnc_arsenal_fullGarage",false];






































private _fnc_compareTextures = 
{
params ["_vehtex", "_cfgtex"];
if (_cfgtex isEqualTo "") exitWith { true }; 
if (_vehtex find "\" != 0) then {_vehtex = "\" + _vehtex};
if (_cfgtex find "\" != 0) then {_cfgtex = "\" + _cfgtex};
_vehtex == _cfgtex
};

private _checkboxTextures = 
[
tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked"),
tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")
];

switch _mode do {


case "Open": {
if !(isnull (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull])) exitwith {"Garage Viewer is already running" call bis_fnc_logFormat;};
missionnamespace setvariable ["BIS_fnc_arsenal_fullGarage",[_this,0,false,[false]] call bis_fnc_param];

with missionnamespace do {
BIS_fnc_garage_center = [_this,1,missionnamespace getvariable ["BIS_fnc_garage_center",player],[objnull]] call bis_fnc_param;
};
with uinamespace do {
_displayMission = [] call (uinamespace getvariable "bis_fnc_displayMission");
_displayClass = "RscDisplayGarage";
if !(isnull finddisplay 312) then {_displayMission = finddisplay 312;};
if (is3DEN) then {_displayMission = finddisplay 313; _displayClass = "RscDisplayGarage3DEN";};
_displayMission createdisplay _displayClass;
};
};


case "Init": {
["BIS_fnc_arsenal"] call bis_fnc_startloadingscreen;
_display = _this select 0;
_toggleSpace = uinamespace getvariable ["BIS_fnc_arsenal_toggleSpace",false];
BIS_fnc_arsenal_type = 1; 
BIS_fnc_arsenal_toggleSpace = nil;
BIS_fnc_garage_turretPaths = [];
if (isnil "BIS_fnc_garage_centerType") then {BIS_fnc_garage_centerType = "";};
setstatvalue ["MarkVirtualVehicleInspection",1];

with missionnamespace do {
BIS_fnc_arsenal_group = creategroup side group player;
BIS_fnc_arsenal_center = missionnamespace getvariable ["BIS_fnc_garage_center",player];
};


_classDefault = uinamespace getvariable ["bis_fnc_garage_defaultClass",""];
if (isclass (configfile >> "cfgvehicles" >> _classDefault)) then {
_vehModel = gettext (configfile >> "cfgvehicles" >> _classDefault >> "model");
if (getnumber (configfile >> "cfgvehicles" >> _classDefault >> "forceInGarage") > 0) then {_vehModel = _vehModel + ":" + _classDefault;};
bis_fnc_garage_centerType = _vehModel;
};
uinamespace setvariable ["bis_fnc_garage_defaultClass",nil];


if (isnil {uinamespace getvariable "BIS_fnc_garage_stats"}) then {
_defaultCrew = gettext (configfile >> "cfgvehicles" >> "all" >> "crew");
uinamespace setvariable [
"BIS_fnc_garage_stats",
[

("isclass _x && {getnumber (_x >> 'scope') == 2} && {gettext (_x >> 'crew') != _defaultCrew}" configclasses (configfile >> "cfgvehicles")),
	["maxspeed","armor","fuelcapacity","threat"],	[false,true,false,false]
] call bis_fnc_configExtremes
];
};

			_types = [];			_types set [			0,["carx"]];			_types set [			1,["tankx"]];			_types set [			2,["helicopterx"]];			_types set [			3,["airplanex"]];			_types set [			4,["shipx","sumbarinex"]];			_types set [			5,[""]];
["InitGUI",[_display,"bis_fnc_garage"]] call bis_fnc_arsenal;
["Preload"] call BIS_fnc_garage;
["ListAdd",[_display]] call BIS_fnc_garage;

if (BIS_fnc_garage_centerType == "") then {["buttonRandom",[_display]] call BIS_fnc_garage;};
["MouseZChanged",[controlnull,0]] call BIS_fnc_arsenal; 
{
_ctrl = _display displayctrl _x;
_ctrl ctrlsetfade 0;
} foreach [		1804];

_ctrl = _display displayctrl 			1803;
_ctrl ctrlshow false;

with missionnamespace do {
[missionnamespace,"garageOpened",[_display,_toggleSpace]] call bis_fnc_callscriptedeventhandler;
};
["BIS_fnc_arsenal"] call bis_fnc_endloadingscreen;
};


case "Exit": {
with missionnamespace do {
BIS_fnc_garage_center = BIS_fnc_arsenal_center;







};
BIS_fnc_garage_turretPaths = nil;

with missionnamespace do {
[missionnamespace,"garageClosed",[displaynull,uinamespace getvariable ["BIS_fnc_arsenal_toggleSpace",false]]] call bis_fnc_callscriptedeventhandler;
};
"Exit" call bis_fnc_arsenal;
};


case "Preload": {
if (is3DEN) then {


["bis_fnc_garage_preload"] call bis_fnc_startloadingscreen;
private ["_data"];
_data = [];
_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
_centerFaction = faction _center;
{
_items = [];
{
_configName = configname _x;
_displayName = gettext (_x >> "displayName");
_factions = getarray (_x >> "factions");
if (count _factions == 0) then {_factions = [_centerFaction];};
if (
_displayName != ""
&&
{getnumber (_x >> "scope") > 1 || !isnumber (_x >> "scope")}
&&
{{_x == _centerFaction} count _factions > 0}
) then {
_items pushback [_x,_displayName];
};
} foreach (configproperties [_x,"isclass _x",true]);
_data pushback _items;
} foreach [
configfile >> "cfgvehicles" >> typeof _center >> "animationSources",
configfile >> "cfgvehicles" >> typeof _center >> "textureSources"
];

missionnamespace setvariable ["bis_fnc_garage_data",_data];
["bis_fnc_garage_preload"] call bis_fnc_endloadingscreen;
BIS_fnc_garage_centerType = typeof _center;
true
} else {


if (isnil "_data" || cheatsenabled) then {
["bis_fnc_garage_preload"] call bis_fnc_startloadingscreen;

_data = [];
{
_data set [_x,[]];
} foreach [					0,					1,					2,					3,					4,					5];
_defaultCrew = gettext (configfile >> "cfgvehicles" >> "all" >> "crew");

{
_simulation = gettext (_x >> "simulation");
_items = switch tolower _simulation do {
case "car";
case "carx": {
_data select 			0;
};
case "tank";
case "tankx": {
if (getnumber (_x >> "maxspeed") > 0) then {
_data select 			1;
} else {
_data select 			5;
};
};
case "helicopter";
case "helicopterx";
case "helicopterrtd": {
_data select 			2;
};
case "airplane";
case "airplanex": {
_data select 			3;
};
case "ship";
case "shipx";
case "submarinex": {
_data select 			4;
};
default {[]};
};


_model = tolower gettext (_x >> "model");
if (getnumber (_x >> "forceInGarage") > 0) then {_model = _model + ":" + configname _x;}; 
_modelID = _items find _model;
if (_modelID < 0) then {
_modelID = count _items;
_items pushback _model;
_items pushback [];
};
_modelData = _items select (_modelID + 1);
_modelData pushback _x;

} foreach ("isclass _x && {getnumber (_x >> 'scope') == 2} && {gettext (_x >> 'crew') != _defaultCrew}" configclasses (configfile >> "cfgvehicles"));

missionnamespace setvariable ["bis_fnc_garage_data",_data];
["bis_fnc_garage_preload"] call bis_fnc_endloadingscreen;
true
} else {
false
};
};
};


case "ListAdd": {
_display =