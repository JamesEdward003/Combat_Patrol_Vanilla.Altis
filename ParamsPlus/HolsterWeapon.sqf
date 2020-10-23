///////		player execVM "paramsplus\HolsterWeapon.sqf";	 ///////
if (!isPlayer _this) exitWith {};

_HolsterWeapon = _this getVariable "HolsterWeapon";
if (!isNil "_HolsterWeapon") then
{
    _this removeAction _HolsterWeapon;
};

waitUntil { currentWeapon _this != "" };

_HolsterWeapon = _this addAction ["Holster Weapon",
{
    _unit = _this select 1;
    _unit action ["SwitchWeapon", _unit, _unit, 100];
    _HolsterWeapon = _unit getVariable "HolsterWeapon";
    _unit setVariable ["HolsterWeapon", nil];
    _unit removeAction _HolsterWeapon;

    if (primaryWeapon _unit == "" && secondaryWeapon _unit == "") exitWith
    {
        uisleep 1;
        _unit execVM "paramsplus\HolsterWeapon.sqf";
    };

    _unit spawn
    {
        _selectPrimaryWeaponAction = nil;
        if (primaryWeapon _this != "") then
        {
            _selectPrimaryWeaponActionName = "Weapon ";
            _weaponName = getText (configFile >> "CfgWeapons" >> (primaryWeapon _this) >> "displayName");
            _selectPrimaryWeaponActionName = _selectPrimaryWeaponActionName + _weaponName;
            _selectPrimaryWeaponAction = _this addAction [_selectPrimaryWeaponActionName, { _unit = _this select 0; _unit selectWeapon primaryWeapon _unit },"",0,false,true];
        };

        while { currentWeapon _this == "" } do
        {
            uisleep 0.1;
        };

        _this removeAction _selectPrimaryWeaponAction;
        uisleep 1;
        _this execVM "paramsplus\HolsterWeapon.sqf";;
    };
},
[],
2.5,
false,
true,
"",
"",
-1,
true,
"",
""];

_this setVariable ["HolsterWeapon", _HolsterWeapon];
