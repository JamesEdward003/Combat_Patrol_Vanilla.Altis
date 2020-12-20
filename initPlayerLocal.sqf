// initPlayerLocal.sqf //
waitUntil {!isNull player && alive player}; 

[playerSide, "HQ"] commandChat "Initiating InitPlayer!";

if !isMultiplayer then { execVM "ParamsPlus\respawn.sqf"; };

if !isMultiplayer then { 
	onTeamSwitch { [_from, _to] execVM "OnTeamSwitch.sqf"; }; 
	[playerSide, "HQ"] commandChat "Team Switch Enabled!";
};
	
call compile preprocessFileLineNumbers "briefing.sqf";
        	
call compile preprocessFileLineNumbers "bon_recruit_units\init.sqf";

call compile preprocessFileLineNumbers "ParamsPlus\mortarBag.sqf";

player execVM "ParamsPlus\HolsterAction.sqf";

player execVM "ParamsPlus\SafeWeapon.sqf";

call compile preprocessFileLineNumbers "arsenalTriggerAction.sqf";

call compile preprocessFileLineNumbers "garageTriggerAction.sqf";

if ( isNil{player getVariable "CommHalo"} ) then
{	
	[player,"HaloJump"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommHalo", true];	
};
if ( isNil{player getVariable "CommMortar"} ) then
{	
	[player,"SpawnMortar"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommMortar", true];	
};
if ( isNil{player getVariable "CommParaDrop"} ) then
{	
	[player,"SpawnParaDrop"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommParaDrop", true];	
};
if ( isNil{player getVariable "CommReenforcements"} ) then
{	
	[player,"SpawnReenforcements"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommReenforcements", true];	
};
if ( isNil{player getVariable "CommWindSpeed"} ) then
{	
	[player,"WindSpeed"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommWindSpeed", true];	
};
if ( isNil{player getVariable "CommGroupManager"} ) then
{	
	execVM "Group_Manager.sqf";
	player setVariable ["CommGroupManager", true];	
};
//if ( isNil{player getVariable "CommAirLift"} ) then
//{	
//    [player,"AirLift"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommAirLift", true];	
//};
//if ( isNil{player getVariable "CommHeliCAS"} ) then
//{	
//    [player,"HeliSupport"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommHeliCAS", true];	
//};
//if ( isNil{player getVariable "CommArty"} ) then
//{	
//	[player,"Artillery"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommArty", true];	
//};
//if ( isNil{player getVariable "CommMortarBag"} ) then
//{	
//	[player,"SpawnMortarBag"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommMortarBag", true];	
//};
//if ( isNil{player getVariable "CommCargo"} ) then
//{	
//	[player,"SpawnCargoDrop"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommCargo", true];	
//};
//if ( isNil{player getVariable "CommZorilya"} ) then
//{	
//	[player,"ZorilyasUnits"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommZorilya", true];	
//};

action_interrogate = player addAction["Interrogate", { 
	0 = cursorTarget spawn interrogate
}, nil, 1.5, false, true, "", " 
	(alive cursorTarget && side cursorTarget == sideEnemy && {player distance cursorTarget < 3})
"];

directionText = {
    if ((_this > 22.5) && (_this <= 67.5)) exitWith {"NORTHEAST"};
    if ((_this > 67.5) && (_this <= 112.5)) exitWith {"EAST"};
    if ((_this > 112.5) && (_this <= 157.5)) exitWith {"SOUTHEAST"};
    if ((_this > 157.5) && (_this <= 202.5)) exitWith {"SOUTH"};
    if ((_this > 202.5) && (_this <= 247.5)) exitWith {"SOUTHWEST"};
    if ((_this > 247.5) && (_this <= 295.5)) exitWith {"WEST"};
    if ((_this > 295.5) && (_this <= 337.5)) exitWith {"NORTHWEST"};
    "NORTH"
};

interrogate = {
	if (random 100 > 1) exitWith {systemChat "I don't feel like talking..."};

    private "_enemy";
	_enemy = { if (side _x == east || side _x == independent) exitWith {_x}; objNull } forEach (_this nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"],1000] - [player]);
	if (isNull _enemy) exitWith {systemChat "I've seen no baddies recently"};

	systemChat format["There is a %1 group of enemies to the %2 of here",
		call {
            private "_n";
            _n = count units group _enemy;
            switch true do {
	            case (_n > 0): {"small"};
	            case (_n > 5): {"large"};
                case (_n > 8): {"massive"};              
                default "";
            }
        },
		([_this,_enemy] call BIS_fnc_dirTo) call directionText
	];
};

_PLightning = "PLightning" call BIS_fnc_getParamValue;

if (_PLightning isEqualTo 1) exitWith {};

tempctrlz = true;
LIGTNING_KEYDOWN_FNC = {
private["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt", "_handled"];
params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt", ["_handled", false, [false]]];
//params["_ctrl","_dikCode","_shift","_ctrlKey", "_alt", ["_handled",false], ["_display", displayNull, [displayNull]]];
    	
	switch (_dikCode) do {
	
			//Ctrl-Z
		case 44 : {
        
			if (_ctrl) then {
        
     			if (tempctrlz) then {
     				tempctrlz = false;    
					private ["_strikeTarget","_dummy"];
					_strikeTarget = cursorObject;
					_strikeLoc =  (getPos _strikeTarget);
						if (_strikeLoc isequalto [0,0,0]) then {	
							hint "!";
						}else{
							[_strikeTarget,nil,true] call BIS_fnc_moduleLightning;
							hint "";
						};	     
					};	     	     
			_handled = true;		
		};	
            	
	};
     
}; 
        
//==And the key EventHandler to execute the script...
waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call LIGTNING_KEYDOWN_FNC;false;"];

waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyUp", "tempctrlz = true;false;"];

//while {alive player} do {
//uisleep 20;
//private ["_strikeTarget","_dummy"];
//_strikeTarget = cursorObject;
//_strikeLoc =  (getPos _strikeTarget);
//if (_strikeLoc isequalto [0,0,0]) then {
//hint "!";
//}else{

//[_strikeTarget,nil,true] call BIS_fnc_moduleLightning;

//hint "";
//	};
//};

