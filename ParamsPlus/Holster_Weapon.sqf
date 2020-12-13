////////     player execVM "Holster_Weapon.sqf";    ///////
// MulleDK19 © 2014
// Allows holstering of weapons on player units. Works in multiplayer.
// Usage: UNIT execVM "EnableWeaponHolstering.sqf";
// Eg. player execVM "EnableWeaponHolstering.sqf";

if (!isPlayer _this) exitWith
{
    // Action makes no sense on AI units.
};

_holsterAction = _this getVariable "HolsterAction";
if (!isNil "_holsterAction") then
{
    // Remove existing action.
    _this removeAction _holsterAction;
};

waitUntil { currentWeapon _this != "" };

_holsterAction = _this addAction ["Holster weapon",
{
    _unit = _this select 1;
    _unit action ["SwitchWeapon", _unit, _unit, 100];
    _holsterAction = _unit getVariable "HolsterAction";
    _unit setVariable ["HolsterAction", nil];
    _unit removeAction _holsterAction;
    
    if (primaryWeapon _unit == "" && secondaryWeapon _unit == "") exitWith
    {
        sleep 1;
        _unit execVM "EnableWeaponHolstering.sqf";
    };
    
    _unit spawn
    {
        // Primary weapon action doesn't show when weapons are holstered. Make a custom one to select the primary weapon.
        _selectPrimaryWeaponAction = nil;
        if (primaryWeapon _this != "") then
        {
            _selectPrimaryWeaponActionName = "Weapon ";
            _weaponName = getText (configFile >> "CfgWeapons" >> (primaryWeapon _this) >> "displayName");
            _selectPrimaryWeaponActionName = _selectPrimaryWeaponActionName + _weaponName;
            _selectPrimaryWeaponAction = _this addAction [_selectPrimaryWeaponActionName, { _unit = _this select 0; _unit selectWeapon primaryWeapon _unit }];
        };
        
        // Wait until a weapon is unholstered.
        while { currentWeapon _this == "" } do
        {
            sleep 0.1;
        };
        
        // Delete the action.
        _this removeAction _selectPrimaryWeaponAction;
        sleep 1;
        _this execVM "EnableWeaponHolstering.sqf";
    };
}];

_this setVariable ["HolsterAction", _holsterAction];

//if (!isPlayer _this) exitWith {};

//_Holster_Weapon = _this getVariable "Holster_Weapon";

//if (!isNil "_Holster_Weapon") then
//{
//    _this removeAction _Holster_Weapon;
//};
//	
//_actions = actionIDs _this;
//_array = [];

//for 	[{_i= (count _actions)-1},{_i>-1},{_i=_i-1}]
//do 	{
//	_params = _this actionParams (_actions select _i);
//	_array = _array + [(_params select 0)];
//	};

//if !(("<t color='#00FFFF'>Holster_Weapon</t>") in _array) then {
//	
//waitUntil { ((currentWeapon _this) == "") isEqualTo false };

//_Holster_Weapon = _this addAction ["<t color='#00FFFF'>Holster_Weapon</t>", {
//_unit = _this select 1;
//_unit call {
// 	_unit action ["SwitchWeapon", _unit, _unit, 100];
// 	_unit switchCamera cameraView;
//	}},
//  	[],
//  	-10,
//  	false,
//  	true,
//  	"",
//  	"currentWeapon _this != ''",
//  	-1,
//  	true,
//  	"",
//  	""];
//};

//		