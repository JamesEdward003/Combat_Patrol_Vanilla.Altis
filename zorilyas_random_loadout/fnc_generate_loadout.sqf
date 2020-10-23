// "fnc_generate_loadout.sqf" //
_unit = _this select 0;
_level = _this select 1;
_maxTech = _level * 2;
_capacity = 0;

_cfgVehicles = configfile >> "cfgVehicles";
_cfgWeapons = configfile >> "cfgWeapons";
_cfgMagazines = configFile >> "cfgMagazines";

_sniperRifles = ["srifle_GM6_F","srifle_LRR_F"];
_sniperScopes = ["optic_Nightstalker","optic_tws","optic_tws_mg","optic_SOS"];

if (isnil("fnc_get_techLevel")) then 
{
	fnc_get_techLevel = compile loadfile "zorilyas_random_loadout\fnc_get_techLevel.sqf";
};

if (isNil ("bFinishedInventory")) then
{
	bFinishedInventory = false;
	nul = [] execVM "zorilyas_random_loadout\fnc_seperate_inv.sqf";
};

waitUntil {bFinishedInventory};

_bHat = if ((random 100) <= (30 * _level)) then {true} else {false};
_bBackpack = if ((random 100) <= (15 * _level)) then {true} else {false};
_bVest = if ((random 100) <= (20 * _level)) then {true} else {false};

_primaryMod = if (_level > 1) then {33} else {15};
_bPrimary = if ((random 100) <= (_primaryMod * _level)) then {true} else {false};

_secondaryMod = if (_bPrimary && (_level < 2)) then {20} else {33};
_bSecondary = if ((random 100) <= (_secondaryMod * _level)) then {true} else {false};

_launcherMod = if (_level > 1) then {7.5} else {3};
_bLauncher = if ((random 100) <= (_launcherMod * _level)) then {true} else {false};

_grenadeMod = if (_level > 1) then {30} else {10};
_bGrenade = if ((random 100) <= (_grenadeMod * _level)) then {true} else {false};

_explosiveMod = if (_level > 1) then {5} else {2};
_bExplosive = if ((random 100) <= (_explosiveMod * _level)) then {true} else {false};

_medKitMod = if (_level > 1) then {20} else {5}; // used when adding the gear down below;
_bMedic = if ((random 100) <= 25) then {true} else {false};

if (!(_bPrimary && _bSecondary)) then {_bSecondary = true};

// removing all gear and weapons

removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
_unit unassignItem "NVGoggles";
_unit unassignItem "NVGoggles_INDEP";
_unit unassignItem "NVGoggles_OPFOR";
removeGoggles _unit;

//_weaponsToDitch = weapons _unit;

//{
//	_unit removeWeapon _x;
//} foreach _weaponsToDitch;

//_ammoToDitch = magazines _unit;

//{
//	_unit removeMagazine _x;
//} foreach _ammoToDitch;


//gear selection;
_uniform = uniforms select (round (random ((count uniforms) - 1)));
//_uniMass = getNumber (_cfgWeapons >> _uniform >> "itemInfo" >> "mass");
_uniClass = getText (_cfgWeapons >> _uniform >> "itemInfo" >> "uniformClass");
_camo = getnumber (configfile >> "cfgVehicles" >> _uniClass >> "camouflage"); if (isNil ("_camo")) then {_camo = 1.2};
if (_level != 3) then 
{
	if (_level == 1) then
	{
		while {(_camo != 1.2) or (_camo == 0)} do 
		{
			_uniform = uniforms select (round (random ((count uniforms) - 1)));
			//_uniMass = getNumber (_cfgWeapons >> _uniform >> "itemInfo" >> "mass");
			_uniClass = getText (_cfgWeapons >> _uniform >> "itemInfo" >> "uniformClass");
			_camo = getnumber (configfile >> "cfgVehicles" >> _uniClass >> "camouflage"); if (isNil ("_camo")) then {_camo = 1.2};
		};
	}
	else
	{
		while {(_camo < 1) or (_camo == 0)} do 
		{
			_uniform = uniforms select (round (random ((count uniforms) - 1)));
			//_uniMass = getNumber (_cfgWeapons >> _uniform >> "itemInfo" >> "mass");
			_uniClass = getText (_cfgWeapons >> _uniform >> "itemInfo" >> "uniformClass");
			_camo = getnumber (configfile >> "cfgVehicles" >> _uniClass >> "camouflage"); if (isNil ("_camo")) then {_camo = 1.2};
		};
	};
}
else
{
	while {(_camo == 1.2) or (_camo == 0)} do 
	{
		_uniform = uniforms select (round (random ((count uniforms) - 1)));
		//_uniMass = getNumber (_cfgWeapons >> _uniform >> "itemInfo" >> "mass");
		_uniClass = getText (_cfgWeapons >> _uniform >> "itemInfo" >> "uniformClass");
		_camo = getnumber (configfile >> "cfgVehicles" >> _uniClass >> "camouflage"); if (isNil ("_camo")) then {_camo = 1.2};
	};
};


_hat = hats select (round (random ((count hats) - 1)));
_hatMass = getNumber (_cfgWeapons >> _hat >> "itemInfo" >> "mass");
_hatClass = getArray (_cfgWeapons >> _hat >> "itemInfo" >> "allowedSlots");
if (_level != 3) then 
{
	while {(count _hatClass) < 3} do 
	{
		_hat = hats select (round (random ((count hats) - 1)));
		_hatMass = getNumber (_cfgWeapons >> _hat >> "itemInfo" >> "mass");
		_hatClass = getArray (_cfgWeapons >> _hat >> "itemInfo" >> "allowedSlots");
	};
};

_vest = vests select (round (random ((count vests) - 1)));
_backpack = backpacks select (round (random ((count backpacks) - 1)));


_unit addUniform _uniform;
_cargoName = getText (_cfgWeapons >> _uniform >> "itemInfo" >> "containerClass");
_cargoSpace = getNumber (_cfgVehicles >> _cargoName >> "maximumLoad");
_capacity = _capacity + _cargoSpace;

if (_bVest) then 
{
	_unit addVest _vest;
	_cargoName = getText (_cfgWeapons >> _vest >> "itemInfo" >> "containerClass");
	_cargoSpace = getNumber (_cfgVehicles >> _cargoName >> "maximumLoad");
	_capacity = _capacity + _cargoSpace;
};

if (_bHat) then 
{
	_unit addHeadGear _hat;
};

if (_bBackpack) then 
{
	_unit addBackpack _backpack;
	_cargoSpace = getNumber (_cfgVehicles >> _backpack >> "maximumLoad");
	_capacity = _capacity + _cargoSpace;
};

_emptyCapacity = _capacity;


// removeing stock ammo from backpacks and other things
//_ammoToDitch = magazines _unit;
//_itemsToDitch = items _unit;

//{
//	_unit removeitem _x;
//} foreach _itemsToDitch;
//{
//	_unit removeMagazine _x;
//} foreach _ammoToDitch;

// weapon selection;
_primary = "";
_pTechLevel = 10;
while {_pTechLevel > _maxTech} do
{
	_primary = weaponsPrimary select (round (random ((count weaponsPrimary) - 1)));
	_clip = (getArray (_cfgWeapons >>_primary >> "magazines")) select 0;
	_ammo = getText (_cfgMagazines >> _clip >> "ammo");
	_pTechLevel = [_ammo] call fnc_get_techLevel;
};

_secondary = "";
_sTechLevel = 10;
while {_sTechLevel > _maxTech} do
{
	_secondary = weaponsSecondary select (round (random ((count weaponsSecondary) - 1)));
	_clip = (getArray (_cfgWeapons >>_secondary >> "magazines")) select 0;
	_ammo = getText (_cfgMagazines >> _clip >> "ammo");
	_sTechLevel = [_ammo] call fnc_get_techLevel;
};

_launcher = weaponsLaunchers select (round (random ((count weaponsLaunchers) - 1)));

if (_bPrimary) then 
{
	_unit addWeapon _primary;
	_techLeft = _maxTech - _pTechlevel;
	
	_accNum = round (random _techLeft);
	if (_level == 3) then {_accNum = _techLeft};
	if (_accNum <= 0) exitwith {};
	
	_cfgAccSlots = _cfgWeapons >> _primary >> "WeaponSlotsInfo";
	_possibleSlots = ["CowsSlot","MuzzleSlot","PointerSlot"];
	
	_rand = round (random 100);
	_chance = _level * 20;
	if (_chance > _rand) then
	{
		_possibleSlots = ["CowsSlot","PointerSlot"];
	};

	_accSlots = [];
	_accSlotNum = 0;
	
	for "_i" from 0 to ((count _possibleSlots) - 1) do
	{
		_sel = _possibleSlots select _i;
		if (isClass (_cfgAccSlots >> _sel)) then 
		{
			_accSlotNum = _accSlotNum + 1;
			_accSlots set [(count _accSlots),_sel]
		};
	};
	
	if (_accSlotNum <= 0) exitwith {};
	if (_accSlotNum < _accNum) then {_accNum = _accSlotNum};

	for "_i" from 1 to _accNum do
	{
		_bCanAttach = false;
		_slotAccessories = [];
		_cnt = 0;
		while {!(_bCanAttach or _cnt > 20)} do
		{
			_randomSlot = _accSlots select (round (random ((count _accSlots) - 1)));
			_slotAccessories = getArray (_cfgAccSlots >> _randomSlot >> "compatibleItems");
			if (_randomSlot == "CowsSlot") then
			{
				if (_primary in _sniperRifles) then
				{
					_slotAccessories = _sniperScopes;
				};
			};
			_bCanAttach = if ((count _slotAccessories) > 0) then {true} else {false};
			_cnt = _cnt + 1;
		};
		
		if ((count _slotAccessories) > 0) then
		{
			_randomAcc = _slotAccessories select (round (random ((count _slotAccessories) - 1)));
			_unit addPrimaryWeaponItem _randomAcc;
		};
	};
};

if (_bSecondary) then 
{
	_unit addWeapon _secondary;
	_techLeft = _maxTech - _sTechlevel;
	
	_accNum = round (random _techLeft);
	if (_accNum <= 0) exitwith {};
	
	_cfgAccSlots = _cfgWeapons >> _secondary >> "WeaponSlotsInfo";
	_possibleSlots = ["CowsSlot","MuzzleSlot","PointerSlot"];
	
	_rand = round (random 100);
	_chance = _level * 20;
	
	if (_chance > _rand) then
	{
		_possibleSlots = ["CowsSlot","PointerSlot"];
	};
	
	_accSlots = [];
	_accSlotNum = 0;
	
	for "_i" from 0 to ((count _possibleSlots) - 1) do
	{
		_sel = _possibleSlots select _i;
		if (isClass (_cfgAccSlots >> _sel)) then 
		{
			_accSlotNum = _accSlotNum + 1;
			_accSlots set [(count _accSlots),_sel]
		};
	};

	if (_accSlotNum <= 0) exitwith {};
	if (_accSlotNum < _accNum) then {_accNum = _accSlotNum};
	
	for "_i" from 1 to _accNum do
	{
		_bCanAttach = false;
		_slotAccessories = [];
		_cnt = 0;
		while {!(_bCanAttach or _cnt > 20)} do
		{
			_randomSlot = _accSlots select (round (random ((count _accSlots) - 1)));
			_slotAccessories = getArray (_cfgAccSlots >> _randomSlot >> "compatibleItems");
			_bCanAttach = if ((count _slotAccessories) > 0) then {true} else {false};
			_cnt = _cnt + 1;
		};
		
		if ((count _slotAccessories) > 0) then
		{
			_randomAcc = _slotAccessories select (round (random ((count _slotAccessories) - 1)));
			_unit addHandgunItem _randomAcc;
		};
	};
};

//hint (str([_capacity,_emptyCapacity]));

if (_bLauncher) then 
{
	_unit addWeapon _launcher;
};

_weapons = weapons _unit;
_requiredMagazines = [];
_requiredItems = [];

for "_i" from 0 to ((count _weapons) - 1) do
{
	_weapon = (_weapons select _i);
	_sel = _cfgWeapons >> _weapon;
	_mags = getArray (_sel >> "magazines");
	_mag = _mags select (round (random ((count _mags) - 1)));
	_magMass = getNumber (_cfgMagazines >> _mag >> "Mass");
	
	_rNumber = round(((random 1) + 1) * _level);
	
	if (_weapon == _launcher) then
	{
		_rNumber = ceil (_rNumber / 2);
	};
	
	_requiredMagazines set [(count _requiredMagazines),[_mag,_rNumber]];
};

if (_bMedic) then
{
	if ((random 100) < (_level * _medKitMod)) then 
	{
		_requiredItems set [(count _requiredItems),["MediKit",1]];
	};
	
	_medKitNo = (round (random _level)) + 1;
	_requiredItems set [(count _requiredItems),["FirstAidKit",_medKitNo]];  // DESIGN THIS TO COLLECT THE ITEMS AND ASSIGN THEM SPREAD OUT, PERHAPS CALCULATE MASS REQUIREMENTS FIRST AND CUT BACK BASED ON THAT;

}
else
{
	if (_level == 3) then
	{
		_requiredItems set [(count _requiredItems),["FirstAidKit",1]];
	};
};

if (_bExplosive) then
{
	if ((random 100) > 50) then
	{
		_requiredItems set [(count _requiredItems),["ToolKit",1]];
	};
	
	_explosiveNo = ((ceil (_level / 2)) + (round(random _level)));

	_requiredMagazines set [(count _requiredMagazines),["Explosive",_explosiveNo]];

};

if (_bGrenade) then
{
	_grenadeNo = ((ceil (_level / 2)) + (round(random _level)));

	_requiredMagazines set [(count _requiredMagazines),["Grenade",_grenadeNo]];
};

_explosive = weaponsExplosives select (round (random ((count weaponsExplosives) - 1)));
_grenade = weaponsGrenade select (round (random ((count weaponsGrenade) - 1)));
/*
player globalChat (str(_requiredMagazines));
player globalChat (str(_requiredItems));
*/
while {((count _requiredMagazines) + (count _requiredItems)) > 0} do
{
	_magsOrItems = round (random 1);
	
	if (_magsOrItems == 1) then
	{
		_magsNumber = (count (magazines _unit));
		_weaponsNumber = 0; if ((primaryWeapon _unit) != "") then {_weaponsNumber = _weaponsNumber + 1}; if ((handgunWeapon _unit) != "") then {_weaponsNumber = _weaponsNumber + 1};
		if (((count _requiredMagazines) > 0) && (_weaponsNumber > 0)) then
		{
			_rNumber = round (random ((count _requiredMagazines) - 1));
			if (_magsNumber < _weaponsNumber)then {_rNumber = _magsNumber};
			player globalChat (str(_requiredMagazines));
			player globalChat (str(_weaponsNumber));
			_array = _requiredMagazines select _rNumber;
			_name = _array select 0;
			_number = _array select 1;
			
			if (_number > 0) then
			{		
				if ((_name == "Explosive") or (_name == "Grenade")) then
				{
					if (_name == "Explosive") then
					{
						_name = weaponsExplosives select (round (random ((count weaponsExplosives) - 1)));
					}
					else
					{
						_name = weaponsGrenade select (round (random ((count weaponsGrenade) - 1)));
					};
				};
				
				_magMass = getNumber (_cfgMagazines >> _name >> "Mass");
				
				_array set [1,(_number - 1)];
				_requiredMagazines set [_rNumber,_array];
				
				if (_capacity < _magMass) exitWith {};
				_unit addMagazine _name;
				_capacity = _capacity - _magMass;
			}
			else
			{
				_requiredMagazines set [_rNumber,0];
				_requiredMagazines = _requiredMagazines - [0];
			};
		};
	}
	else
	{
		if ((count _requiredItems) > 0) then
		{
			_rNumber = round ((count _requiredItems) - 1);
			_array = _requiredItems select _rNumber;
			_name = _array select 0;
			_number = _array select 1;
			
			if (_number > 0) then
			{		
				if ((_name == "Explosive") or (_name == "Grenade")) then
				{
					if (_name == "Explosive") then
					{
						_name = weaponsExplosives select (round (random ((count weaponsExplosives) - 1)));
					}
					else
					{
						_name = weaponsGrenade select (round (random ((count weaponsGrenade) - 1)));
					};
				};
				
				_magMass = getNumber (_cfgMagazines >> _name >> "Mass");
				
				_array set [1,(_number - 1)];
				_requiredItems set [_rNumber,_array];
				
				if (_capacity < _magMass) exitWith {};
				_unit addItem _name;
				_capacity = _capacity - _magMass;
			}
			else
			{
				_requiredItems set [_rNumber,0];
				_requiredItems = _requiredItems - [0];
			};
		};
	};
};


_magazines = magazines _unit;

if ((count _magazines) <= 0) then // restart if it's not going so well.... mags wise.
{
	_null = [_unit,_level] execVM "zorilyas_random_loadout\fnc_generate_loadout.sqf";
};

/*
_weapon = currentWeapon _unit;
_unit action ["loadmagazine",_unit, _unit, 0, 1 ,_weapon, _weapon];
*/
reload _unit;


