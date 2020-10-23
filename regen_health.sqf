//////////////////////////////////////////////////////////////////
// [_x,0.15,.01] execVM "regen_health.sqf";
private ["_unit","_armor","_recovery","_newDamage","_t"];
_unit = _this select 0;
_armor = _this select 1;
_recovery = _this select 2;

//hintSilent format ["Regen Script Started for %1",name _unit];

if (isMultiPlayer) then
{
	if ( isNil {_unit getVariable "regenHealth"} ) then 
	{	
		_unit addEventHandler ["Respawn",{[_unit,_armor,_recovery] execVM "regen_health.sqf"}];
		_unit setVariable ["regenHealth", true];
	};
};

while {alive _unit} do 
{
	_t = time;
	waitUntil {time - _t > _recovery};
	if (damage _unit > 0) then 
		{
		_newDamage = (damage _unit) - _armor;
		_unit setdamage _newDamage;
		 //hintSilent format["Current Damage %1, %2",_newdamage,name _unit];
		};
	uisleep _recovery;
};

if (!isMultiPlayer) then
{
	waitUntil {alive _unit};
	uisleep 0.5;
	[_unit,_armor,_recovery] execVM "regen_health.sqf";
};
