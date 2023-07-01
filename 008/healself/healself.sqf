//////////////////////////////////////////////////////////////////
private ["_target"];
_target = _this select 0;

if (isNil {_target getVariable "HealOneSelf"}) then {

	_target setVariable ["HealOneSelf",true];

	if (isMultiplayer) then {
		_target addEventHandler ["Respawn", {
			private ["_unit","_dead"];
			_unit = (_this select 0);
			_dead = (_this select 1);
			_unit addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","((_target == _this) and (getDammage _target) > 0.1)"];
		}
	]};
};

_target playMove "AinvPknlMstpSlayWrflDnon_medic";

uisleep 6;
		
_target setDamage 0;

uisleep 1;

//hintSilent parseText format["<t>You healed %1</t>", _target];

_target commandChat format["Unit %1 healed himself", name _target];



//player addAction ["<t color='#00FFFF'>Heal Self</t>","008\healSelf\healSelf.sqf",[],-99,false,false,"","((_target == _this) and (getDammage _target) > 0.1)"];
