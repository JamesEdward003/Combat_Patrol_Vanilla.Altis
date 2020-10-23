// initPlayerLocal.sqf //
waitUntil {!isNull player && alive player}; 

[playerSide, "HQ"] commandChat format ["%1, Executing initPlayer!",name player];

if !isMultiplayer then { execVM "paramsplus\respawn.sqf"; };

[player] execVM "paramsplus\playerSettings.sqf";

//call compile preprocessFileLineNumbers "zorilyas_random_loadout\fnc_randomWeapon.sqf";

onTeamSwitch { [_from, _to] execVM "OnTeamSwitch.sqf"; };

[playerSide, "HQ"] commandChat "Team Switch Enabled!";

call compile preprocessFileLineNumbers "arsenalTriggerAction.sqf";

call compile preprocessFileLineNumbers "garageTriggerAction.sqf";

_storeGear = getUnitLoadOut player;
missionNameSpace setVariable ["StoredUnitLoadOut", _storeGear];

call compile preprocessFileLineNumbers "SafeWeapon.sqf";

//call compile preprocessFileLineNumbers "drawIcons.sqf";

if ( isNil{player getVariable "CommAirLift"} ) then
{	
    [player,"AirLift"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommAirLift", true];	
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
if ( isNil{player getVariable "CommZorilya"} ) then
{	
	[player,"ZorilyasUnits"] call BIS_fnc_addCommMenuItem;
	 player setVariable ["CommZorilya", true];	
};
if ( isNil{player getVariable "CommGroupManager"} ) then
{	
	execVM "Group_Manager.sqf";
	player setVariable ["CommGroupManager", true];	
};

player addEventHandler ["Reloaded",{  
	params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
  	_unit = _this select 0;  
  	_mag = _this select 4 select 0; 
  	_magCount = {_x == currentMagazine _unit} count (magazines _unit);
  	if (_magCount < 6) then    
  	{
	  	_unit addMagazine _mag;
	};
 }]; 
player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
  	_unit = _this select 0;  
  	_weapon = _this select 1;
  	_magazine = _this select 5;
  	hint format ["%1,%2,%3,%4,%5,%6,%7,%8", name _unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_gunner];
  	_magCount = {_x == currentMagazine _unit} count (magazines _unit);
	if ((_weapon == "THROW") and (_magCount < 4)) then
	{
		_unit addMagazine _magazine;
	};
}];

