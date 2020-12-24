//////////////////////////////////////////////////////////////////
/***********************************************************************************************
Zorilya's Units

-- Anyone for random units ???		
  -- Wouldn't that be nice ?
    -- Random uniforms ?
      -- Random loadouts ?

Setup:
for trigger
  -- if trigger and you do not want to broadcast the message to everyone 
    	-- add to trigger Condition: 
		"player in thislist" replacing "this"
		and to On Activation:
		_zorilya = [[player,[("<t color=""#00FFFF"">" + ("Zorilyas Units") + "</t>"),{[player,(screenToWorld [0.5,0.5])] execVM "zorilyas_random_loadout\zorilyas_units.sqf"},[],0,false,true, "",'_this ==_target']],"addAction",true,true,false] call BIS_fnc_MP;
		
for action
  -- add to initPlayerLocal
	_zorilya = [[player,[("<t color=""#00FFFF"">" + ("Zorilyas Units") + "</t>"),{[player,(screenToWorld [0.5,0.5])] execVM "zorilyas_random_loadout\zorilyas_units.sqf"},[],0,false,true, "",'_this ==_target']],"addAction",true,true,false] call BIS_fnc_MP;
	
for CfgCommunicationMenu
  -- add below to description
class CfgCommunicationMenu
{
	class ZorilyasUnits
	{
		text = "Zorilyas Units";
		submenu = "";
		expression = "_this execVM 'zorilyas_random_loadout\zorilyas_units.sqf'"; // [caller, pos, target, is3D, id]
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";
		cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa";
		enable = "1";
		removeAfterExpressionCall = 0;
//		[player,"ZorilyasUnits"] call BIS_fnc_addCommMenuItem;
	};
};
  and to trigger On Activation or initPlayerLocal:
    [player,"ZorilyasUnits"] call BIS_fnc_addCommMenuItem;
***********************************************************************************************************************/
params ["_caller","_position","_target","_is3D","_id"];
_caller 		= _this select 0;
_position 	= _this select 1;
//_target 		= _this select 2;
//_is3D		= _this select 3;
//_id			= _this select 4;

//hint format ["%1,%2",_caller,_position];

if (_position isEqualTo []) then {
	
	_position = [(getPosATL player select 0) + 10,(getPosATL player select 1) + 10,0];
	
} else {
	
	_position = _position;
};

[_position,6,3,west] execVM "zorilyas_random_loadout\fnc_spawn_unit.sqf";
		
if ( isNil{_caller getVariable "zorilya"} ) then
{		
	_caller addEventHandler
	[
		"Respawn",
		{
		  _zorilya = [[_caller,[("<t color=""#00FFFF"">" + ("Zorilyas Units") + "</t>"),{[(_this select 0),(screenToWorld [0.5,0.5])] execVM "zorilyas_random_loadout\zorilyas_units.sqf"},[],0,false,true, "",'_this ==_target']],"addAction",true,true,false] call BIS_fnc_MP;
		}
	];
	_caller setVariable ["zorilya", true];
	_zorilya = [[_caller,[("<t color=""#00FFFF"">" + ("Zorilyas Units") + "</t>"),{[(_this select 0),(screenToWorld [0.5,0.5])] execVM "zorilyas_random_loadout\zorilyas_units.sqf"},[],0,false,true, "",'_this ==_target']],"addAction",true,true,false] call BIS_fnc_MP;
};
            
