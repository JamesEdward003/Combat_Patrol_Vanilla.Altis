// initPlayerLocal.sqf //
waitUntil {!isNull player && alive player}; 

[playerSide, "HQ"] commandChat "Initiating InitPlayer!";

if !isMultiplayer then { execVM "ParamsPlus\respawn.sqf"; };

call compile preprocessFileLineNumbers "briefing.sqf";
        	
call compile preprocessFileLineNumbers "bon_recruit_units\init.sqf";

call compile preprocessFileLineNumbers "ParamsPlus\mortarBag.sqf";

//call compile preprocessFileLineNumbers "cos\cosInit.sqf";

//call compile preprocessFileLineNumbers "zorilyas_random_loadout\fnc_randomWeapon.sqf";

player execVM "ParamsPlus\HolsterWeapon.sqf";

player execVM "ParamsPlus\SafeWeapon.sqf";

onTeamSwitch { [_from, _to] execVM "OnTeamSwitch.sqf"; };

[playerSide, "HQ"] commandChat "Team Switch Enabled!";

call compile preprocessFileLineNumbers "arsenalTriggerAction.sqf";

call compile preprocessFileLineNumbers "garageTriggerAction.sqf";

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
if ( isNil{player getVariable "CommHalo"} ) then
{	
	[player,"HaloJump"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommHalo", true];	
};
//if ( isNil{player getVariable "CommCargo"} ) then
//{	
//	[player,"SpawnCargoDrop"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommCargo", true];	
//};
//if ( isNil{player getVariable "CommMortar"} ) then
//{	
//	[player,"SpawnMortar"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommMortar", true];	
//};
//if ( isNil{player getVariable "CommMortarBag"} ) then
//{	
//	[player,"SpawnMortarBag"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommMortarBag", true];	
//};
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
//if ( isNil{player getVariable "CommZorilya"} ) then
//{	
//	[player,"ZorilyasUnits"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommZorilya", true];	
//};
if ( isNil{player getVariable "CommGroupManager"} ) then
{	
	execVM "Group_Manager.sqf";
	player setVariable ["CommGroupManager", true];	
};


action_interrogate = player addAction["Interrogate", { 
	0 = cursorTarget spawn interrogate
}, nil, 1.5, false, true, "", " 
	(alive cursorTarget && side cursorTarget == civilian && {player distance cursorTarget < 3})
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
	if (random 100 > 5) exitWith {systemChat "I don't feel like talking..."};

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

///*

//if !(player getVariable ["bluSuitPowers_eh",false]) then
//{
//	[
//		"checkEquippedUniform",
//		"onEachFrame",
//		{
//			params ["_unit"];
//			if (uniform _unit isEqualTo "U_B_Soldier_VR") then 
//			{
//				if ( !(_unit getVariable ["powers", false]) ) then 
//				{ 
//					
//					[ [], "fnc_bluSuitPowers", _unit ] call BIS_fnc_MP; 
//				};
//                                _unit setVariable ["powers", true];
//			} 
//                        else 
//			{
//				 
//					_skillA = player getVariable ["skillA",-1];
//					_skillB = player getVariable ["skillB",-1];
//					_skillC = player getVariable ["skillC",-1];
//					_skillD = player getVariable ["skillD",-1];
//					player removeAction _skillA;
//					player removeAction _skillB;
//					player removeAction _skillC;
//					player removeAction _skillD;
//						
//                    _unit setVariable ["powers", false];
//			};
//		},
//		[player]
//	] call BIS_fnc_addStackedEventHandler;
//	player setVariable ["bluSuitPowers_eh",true];
//};

//fnc_bluSuitPowers = {
//_skillA = [
///* 0 object */				player,
///* 1 action title */			"Blink",
///* 2 idle icon */				"images\blinkicon.paa",
///* 3 progress icon */			"images\blinkicon.paa",
///* 4 condition to show */		"true",
///* 5 condition for action */		"true",
///* 6 code executed on start */		{["Suit", "Preparing Blink"] call BIS_fnc_showSubtitle},
///* 7 code executed per tick */		{hint "Blink Charging"},
///* 8 code executed on completion */	{execVM "blinkJump.sqf"},
///* 9 code executed on interruption */	{hint ""},
///* 10 arguments */			["Blink"],
///* 11 action duration */		3,
///* 12 priority */			0,
///* 13 remove on completion */		false,
///* 14 show unconscious */		false
//] call bis_fnc_holdActionAdd;
//_skillB = [
///* 0 object */				player,
///* 1 action title */			"Sprint 1",
///* 2 idle icon */				"images\sprinticonA.paa",
///* 3 progress icon */			"images\sprinticonA.paa",
///* 4 condition to show */		"true",
///* 5 condition for action */		"true",
///* 6 code executed on start */		{player setAnimSpeedCoef 1.50},
///* 7 code executed per tick */		{player setAnimSpeedCoef 2},
///* 8 code executed on completion */	{player setAnimSpeedCoef 1},
///* 9 code executed on interruption */	{player setAnimSpeedCoef 1},
///* 10 arguments */			["Sprint"],
///* 11 action duration */		6,
///* 12 priority */			0,
///* 13 remove on completion */		false,
///* 14 show unconscious */		false
//] call bis_fnc_holdActionAdd;
//_skillC = [
///* 0 object */				player,
///* 1 action title */			"Sprint 2",
///* 2 idle icon */				"images\sprinticonB.paa",
///* 3 progress icon */			"images\sprinticonB.paa",
///* 4 condition to show */		"true",
///* 5 condition for action */		"true",
///* 6 code executed on start */		{player setAnimSpeedCoef 1.50},
///* 7 code executed per tick */		{player setAnimSpeedCoef 4},
///* 8 code executed on completion */	{player setAnimSpeedCoef 1},
///* 9 code executed on interruption */	{player setAnimSpeedCoef 1},
///* 10 arguments */			["Sprint"],
///* 11 action duration */		6,
///* 12 priority */			0,
///* 13 remove on completion */		false,
///* 14 show unconscious */		false
//] call bis_fnc_holdActionAdd;
//_skillD = [
///* 0 object */				player,
///* 1 action title */			"Lightning",
///* 2 idle icon */				"images\blinkicon.paa",
///* 3 progress icon */			"images\blinkicon.paa",
///* 4 condition to show */		"true",
///* 5 condition for action */		"true",
///* 6 code executed on start */		{["Suit", "Preparing Lightning"] call BIS_fnc_showSubtitle},
///* 7 code executed per tick */		{hint "Lightning Charging"},
///* 8 code executed on completion */	{execVM "strikeLight.sqf"},
///* 9 code executed on interruption */	{hint ""},
///* 10 arguments */			["Lightning"],
///* 11 action duration */		3,
///* 12 priority */			0,
///* 13 remove on completion */		false,
///* 14 show unconscious */		false
//] call bis_fnc_holdActionAdd;
// player setVariable ["skillA", _skillA];
// player setVariable ["skillB", _skillB];
// player setVariable ["skillC", _skillC];
// player setVariable ["skillD", _skillD];
//};

//*/
