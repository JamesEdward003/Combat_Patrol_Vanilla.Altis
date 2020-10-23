//////     player execVM "Holster_Weapon.sqf";    ///////
if (!isPlayer _this) exitWith {};

_Holster_Weapon = _this getVariable "Holster_Weapon";

if (!isNil "_Holster_Weapon") then
{
    _this removeAction _Holster_Weapon;
};
	
_actions = actionIDs _this;
_array = [];

for 	[{_i= (count _actions)-1},{_i>-1},{_i=_i-1}]
do 	{
	_params = _this actionParams (_actions select _i);
	_array = _array + [(_params select 0)];
	};

if !(("<t color='#00FFFF'>Holster_Weapon</t>") in _array) then {
	
waitUntil { currentWeapon _this != "" };

_Holster_Weapon = _this addAction ["<t color='#00FFFF'>Holster_Weapon</t>", {
_unit = _this select 1;
_unit call {
 	_unit action ["SwitchWeapon", _unit, _unit, 100];
 	_unit switchCamera cameraView;
	}},
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

		