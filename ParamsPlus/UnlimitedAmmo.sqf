// "ParamsPlus\UnlimitedAmmo.sqf" //
_PUA = "PUA" call BIS_fnc_getParamValue;
if (_PUA isEqualTo 1) exitWith {};
_player = _this select 0;
//if (isPlayer _player isEqualTo false) exitWith {};

_player addEventHandler ["Reloaded",{  
	params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
  	_unit = _this select 0;  
  	_mag = _this select 4 select 0; 
  	_magCount = {_x == currentMagazine _unit} count (magazines _unit);
  	if (_magCount < 6) then    
  	{
	  	_unit addMagazine _mag;
	};
 }]; 
_player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
  	_unit = _this select 0;  
  	_weapon = _this select 1;
  	_magazine = _this select 5;
//  	_magCount = {_x isEqualTo currentMagazine _unit} count (magazines _unit);
	_magcount = {_x == _magazine} count magazines _unit;
	if ((_weapon isEqualTo "THROW") and (_magCount < 4)) then
	{
		_unit addMagazine _magazine;
	};
//  hint format ["%1,%2,%3,%4,%5,%6,%7,%8,%9", name _unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_gunner,_magCount];
//	copyToClipboard format ["%1,%2,%3,%4,%5,%6,%7,%8,%9", name _unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_gunner,_magCount];
}];

_player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
}];

if (isPlayer _player) then {

[playerSide, "HQ"] commandChat format ["%1, Unlimited Ammo Installed!",name _player];

};