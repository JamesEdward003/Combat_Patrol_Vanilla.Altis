bFinishedInventory = false;
_cfgWeapons = configfile >> "CfgWeapons";
_cfgVehicles = configfile >> "CfgVehicles";
_cfgMagazines = configfile >> "CfgMagazines";
_cfgAmmo = configfile >> "CfgAmmo";

_thingsNotToBe = ["","Rifle","$STR_DN_RIFLE","",""];
_underwear = ["Underwear","Underwear 1","Underwear 2","Underwear 3","Underwear 4","Underwear 5"];

hats = [];
uniforms = [];
vests = [];
backpacks = [];

for "_i" from 1 to ((count _cfgWeapons) - 1) do
{
	_sel = _cfgWeapons select _i;
	_type = getNumber(_sel >> "iteminfo" >> "type");
	_scope = getNumber (_sel >> "scope");
	_bDNVoid = if ((getText (_sel >> "displayName")) in _thingsNotToBe) then {true} else {false};
	
	if (!((_scope == 0) or _bDNVoid)) then
	{
		_name = configName _sel;
		
		if (_type == 605) then
		{
			hats set [(count hats),_name];
		};
		
		if (_type == 801) then
		{
			_displayName = getText (_sel >> "displayName");
			if (!(_displayName in _underwear)) then
			{
				uniforms set [(count uniforms),_name];
			};
		};
		
		if (_type == 701) then
		{
			vests set [(count vests),_name];
		};
	};
};

for "_i" from 1 to ((count _cfgVehicles) - 1) do
{
	_sel = _cfgVehicles select _i;
	_name = configName _sel;
	
	if (_name iskindof "Bag_Base") then
	{
		_scope = getNumber (_sel >> "scope");
		_bDNVoid = if ((getText (_sel >> "displayName")) in _thingsNotToBe) then {true} else {false};
		
		if (!((_scope == 0) or _bDNVoid)) then
		{
			backpacks set [(count backpacks),_name];
		};	
	};	
};


weaponsPrimary = [];
weaponsSecondary = [];
weaponsLaunchers = [];

for "_i" from 1 to ((count _cfgWeapons) - 1) do
{
	_sel = _cfgWeapons select _i;
	_type = getNumber(_sel  >> "type");
	_scope = getNumber (_sel >> "scope");
	_bAccessories = if (isClass (_sel >> "LinkedItems")) then {true} else {false};
	_bDNVoid = if ((getText (_sel >> "displayName")) in _thingsNotToBe) then {true} else {false};
	
	if (!((_scope == 0) or _bDNVoid or _bAccessories)) then
	{
		_name = configName _sel;
		if (_type == 1) then
		{
			weaponsPrimary set [(count weaponsPrimary),_name];
		};

		if (_type == 2) then
		{
			weaponsSecondary set [(count weaponsSecondary),_name];
		};

		if (_type == 4) then
		{
			weaponsLaunchers set [(count weaponsLaunchers),_name];
		};
	};	
};

weaponsExplosives = [];
weaponsGrenade = [];

_get_Magazine = 
{
	private ["_bFound","_sel","_ammo","_i"];

	_name = _this select 0;
	_bFound = false;
	_i = 1;
	while {!(_bFound)} do
	{
		if (_i > ((count _cfgMagazines) - 1)) exitWith {};
		_sel = _cfgMagazines select _i;
		_ammo = getText (_sel >> "ammo");
		
		if (_ammo == _name) then
		{
			_name = configName _sel;
			_bFound = true;
		};
		_i = _i + 1;
	};
	
	_bFound
};

for "_i" from 1 to ((count _cfgAmmo) - 1) do
{
	_sel = _cfgAmmo select _i;
	_model = getText (_sel  >> "model");
	_bDNVoid = if (_model == "") then {true} else {false};
	
	if (!(_bDNVoid)) then
	{
		_selName = configName _sel;
		_name = _selName;
		_bFound = false;
		
		while {_name != "Default"} do 
		{	
			if (_name == "TimeBombCore") exitWith
			{
				_bMatched = [_selName] call _get_Magazine;
				player globalChat (str([_bMatched,_name]));
				if (_bMatched) then
				{
					weaponsExplosives set [(count weaponsExplosives),_name];
				};
			};
			
			if (_name == "GrenadeHand") exitWith
			{
				_bMatched = [_selName] call _get_Magazine;
				player globalChat (str([_bMatched,_name]));
				if (_bMatched) then
				{
					weaponsGrenade set [(count weaponsGrenade),_name];
				};
			};
			
			_sel = inheritsfrom _sel;
			_name = configName _sel;
		};
	};
};

//copyToClipboard (str(weaponsGrenade));

bFinishedInventory = true;

