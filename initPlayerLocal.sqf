// initPlayerLocal.sqf //
waitUntil {!isNull player && alive player}; 

[playerSide, "HQ"] commandChat "Initiating InitPlayer!";

if !isMultiplayer then { execVM "ParamsPlus\respawn.sqf"; };

//call compile preprocessFileLineNumbers "zorilyas_random_loadout\fnc_randomWeapon.sqf";

onTeamSwitch { [_from, _to] execVM "OnTeamSwitch.sqf"; };

[playerSide, "HQ"] commandChat "Team Switch Enabled!";

call compile preprocessFileLineNumbers "arsenalTriggerAction.sqf";

call compile preprocessFileLineNumbers "garageTriggerAction.sqf";

call compile preprocessFileLineNumbers "SafeWeapon.sqf";

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
//if ( isNil{player getVariable "CommMortar"} ) then
//{	
//	[player,"SpawnMortar"] call BIS_fnc_addCommMenuItem;
//	 player setVariable ["CommMortar", true];	
//};
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

//[ "supportCalled", "onEachFrame",
//{
//	if ((player getVariable "BIS_SUPP_request") select 0 != "" && count ((player getVariable "BIS_SUPP_request") select 1) == 3 && (player getVariable "BIS_SUPP_selectedProvider") getVariable "BIS_SUPP_supporting") then {
//		hint "support called";
//	};
//}
//] call BIS_fnc_addStackedEventHandler;

[ "supportCalled", "onEachFrame", {
	if ( ( player getVariable "BIS_SUPP_request" ) select 0 == "Artillery" && ( player getVariable "bis_supp_selectedmodule" ) == arty_one && ( player getVariable "BIS_SUPP_selectedProvider" ) getVariable[ "BIS_SUPP_supporting", false ] ) then {
		//do what ever here
		hint "Arty_One is providing support";
	};
}] call BIS_fnc_addStackedEventHandler;


