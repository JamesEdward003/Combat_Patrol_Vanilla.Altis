// initPlayerLocal.sqf //
waitUntil {!isNull player && alive player}; 

[playerSide, "HQ"] commandChat "Initiating InitPlayer!";

if !isMultiplayer then { execVM "ParamsPlus\respawn.sqf"; };

call compile preprocessFileLineNumbers "briefing.sqf";
        	
call compile preprocessFileLineNumbers "bon_recruit_units\init.sqf";

call compile preprocessFileLineNumbers "ParamsPlus\mortarBag.sqf";

//call compile preprocessFileLineNumbers "cos\cosInit.sqf";

//call compile preprocessFileLineNumbers "zorilyas_random_loadout\fnc_randomWeapon.sqf";

execVM "ParamsPlus\HolsterAction.sqf";

execVM "ParamsPlus\SafeWeapon.sqf";

onTeamSwitch { [_from, _to] execVM "OnTeamSwitch.sqf"; };

[playerSide, "HQ"] commandChat "Team Switch Enabled!";

call compile preprocessFileLineNumbers "arsenalTriggerAction.sqf";

call compile preprocessFileLineNumbers "garageTriggerAction.sqf";

if ( isNil{player getVariable "CommAirLift"} ) then
{	
    [player,"AirLift"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommAirLift", true];	
};
if ( isNil{player getVariable "CommHeliCAS"} ) then
{	
    [player,"HeliSupport"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommHeliCAS", true];	
};
if ( isNil{player getVariable "CommArty"} ) then
{	
	[player,"Artillery"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommArty", true];	
};
if ( isNil{player getVariable "CommHalo"} ) then
{	
	[player,"HaloJump"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommHalo", true];	
};
if ( isNil{player getVariable "CommCargo"} ) then
{	
	[player,"SpawnCargoDrop"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommCargo", true];	
};
if ( isNil{player getVariable "CommMortar"} ) then
{	
	[player,"SpawnMortar"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommMortar", true];	
};
if ( isNil{player getVariable "CommMortarBag"} ) then
{	
	[player,"SpawnMortarBag"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommMortarBag", true];	
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

["BIS_CP_taskExfil", position player] call BIS_fnc_taskSetDestination;

