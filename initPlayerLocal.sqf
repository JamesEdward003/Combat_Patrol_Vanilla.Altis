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
/*
if ( isNil{player getVariable "CommWindSpeed"} ) then
{	
	[player,"WindSpeed"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommWindSpeed", true];	
};
*/
if ( isNil{player getVariable "Zorilya"} ) then
{	
	[player,"Zorilya"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["Zorilya", true];	
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
//if ( isNil{player getVariable "CommAirSupport"} ) then
//{	
//    [player,"AirSupport"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommAirSupport", true];	
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

