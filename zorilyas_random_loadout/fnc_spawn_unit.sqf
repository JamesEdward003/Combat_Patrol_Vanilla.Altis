_pos = _this select 0;
_number = _this select 1;
_level = _this select 2; // 1 is civi, 2 is militia, 3 is military
_side = if ((_this select 3) == East) then {East} else {West};

_unitRef = "B_Soldier_F"; if (_side == East) then {_unitRef = "O_Soldier_F"};

_abilityMod = _level/10;

if (isNil ("bFinishedInventory")) then
{
	bFinishedInventory = false;
	nul = [] execVM "zorilyas_random_loadout\fnc_seperate_inv.sqf";
};

if (isNil ("fnc_generate_loadout")) then
{
	fnc_generate_loadout = compile preProcessFileLineNumbers "zorilyas_random_loadout\fnc_generate_loadout.sqf";
};

waituntil {bFinishedInventory && (!(isNil ("fnc_generate_loadout")))};

_group = createGroup _side;
_initLine = (format ["[this,%1] call fnc_generate_loadout",_level]);

for "_i" from 0 to (_number - 1) do
{
	_dude = _unitRef createUnit [_pos,_group,_initLine,1];
};

_group