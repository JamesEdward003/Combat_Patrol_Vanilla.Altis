/////////	 execVM "HolsterAction.sqf";		///////////
private ["_params","_array","_actions","_weaponActionText","_weaponTextAction"];
if isMultiplayer then 
{
	player addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		execVM "ParamsPlus\HolsterAction.sqf";
	}];	
};	
while {alive player} do {
	
	waitUntil {primaryWeapon player != "" or handgunWeapon player != ""};
  
	_actions = actionIDs player;
	_array = [];

for 	[{_i= (count _actions)-1},{_i>-1},{_i=_i-1}]
do 	{
	_params = player actionParams (_actions select _i);
	_array = _array + [(_params select 0)];
	};

if !(("<t color='#00FFFF'>No Weapon In Hand</t>") in _array) then {  

weaponAction = player addAction ["<t color='#00FFFF'>No Weapon In Hand</t>",{

player action ["SWITCHWEAPON",player,player,-1];
	},
  	[],
  	-10,
  	false,
  	true,
  	"",
  	"currentWeapon _this != ''",
  	-1,
  	true,
  	"",
  	""];   
};

if !isMultiplayer then 
{
	waitUntil {currentWeapon player == "" or {primaryWeapon player == "" && handgunWeapon player == ""}};
	  
		if (primaryWeapon player == "" && handgunWeapon player == "") exitWith {
			player removeAction weaponAction;
		};
	  	player removeAction weaponAction;
	  	_weaponActionText = "Weapon " + getText (configfile >> "CfgWeapons" >> primaryWeapon player >> "displayName");
	   	_weaponTextAction = player addAction [_weaponActionText,{
	     player action ["SWITCHWEAPON",player,player,0];
	     },nil,-10,false,true];
	   	waitUntil {currentWeapon player != "" or primaryWeapon player == ""};
	   	player removeAction _weaponTextAction;
	};
};

