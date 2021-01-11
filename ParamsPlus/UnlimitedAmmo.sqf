// "ParamsPlus\UnlimitedAmmo.sqf" //
_PUA = "PUA" call BIS_fnc_getParamValue;
if (_PUA isEqualTo 1) exitWith {};
_player = _this;

_player addEventHandler ["Reloaded", {
	params ["_unit", "_weapon", "_muzzle", ["_newMagazine", []], ["_oldMagazine", []]];
	private _magClass = _oldMagazine param [0, ""];
		if (_magClass == "") then {
			_magClass = _newMagazine param [0, ""];
		};
		_unit addMagazine _magClass;
}];

_player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
}];

if (isPlayer _player) then {

[playerSide, "HQ"] commandChat format ["%1, Unlimited Ammo Installed!",name _player];

};

