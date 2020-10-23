//////////////////////////////////////////////////////////////////
//_VLS1 = _this;
uisleep 10;

0 = FREEDOM_Starboard_VLS spawn {
    _vls = _this;
    {  
	_vls addEventHandler ["Reloaded",{
		params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
		_unit = _this select 0 ;
		_mag = _this select 4 select 0;
		_unit addMagazine _mag ;
		hint format ["%1, %2, %3, %4, %5",_unit, _weapon, _muzzle, _newMagazine, _oldMagazine];
	}] ;
};

0 = LIBERTY_Forward_VLS spawn {
    _vls = _this;
    {  
	_vls addEventHandler ["Reloaded",{
		params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
		_unit = _this select 0 ;
		_mag = _this select 4 select 0;
		_unit addMagazine _mag ;
		hint format ["%1, %2, %3, %4, %5",_unit, _weapon, _muzzle, _newMagazine, _oldMagazine];
	}] ;
};

uisleep 10;

0 = FREEDOM_Starboard_VLS spawn {
    _vls = _this;
    {  
        west reportRemoteTarget [_x, 3600];  
        _x confirmSensorTarget [west, true];
        _vls setWeaponReloadingTime [gunner _vls, currentMuzzle gunner _vls, 0];
        _vls fireAtTarget [_x, "weapon_vls_01"];
        uiSleep 2;  
    } forEach [assignedTarget FREEDOM_Starboard_VLS];  
};

0 = LIBERTY_Forward_VLS spawn {
    _vls = _this;
    {  
        west reportRemoteTarget [_x, 3600];  
        _x confirmSensorTarget [west, true];
        _vls setWeaponReloadingTime [gunner _vls, currentMuzzle gunner _vls, 0];
        _vls fireAtTarget [_x, "weapon_vls_01"];
        uiSleep 2;  
    } forEach [assignedTarget LIBERTY_Forward_VLS];  
};


