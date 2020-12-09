// execVM "mortarBag.sqf"; //
KK_playerAddMortarBag = {
	if ((faction player) isEqualTo "CIV_F") exitWith {hint parseText format["<t size='1.25' color='#ff6161'>Mortar Bag Not Available To Civilians!</t>"];};
    removeBackpack player;
    KK_mortarBag = toString [
        (toArray faction player) select 0
    ] + "_Mortar_01_weapon_F";
    player addBackpack KK_mortarBag;
    player addAction [
        format [
            localize "STR_ACTION_ASSEMBLE",
            localize "str_a3_cfgvehicles_mortar_01_base0"
        ],
        {
            player action ["Assemble", unitBackpack player];
            removeBackpack player;
            player removeAction (_this select 2);
            KK_mortar = toString [
        	   (toArray faction player) select 0] + "_Mortar_01_F";        
            KK_mortar createVehicle (player modelToWorld [0,1,0]);
        },
        [],
        0,
        false,
        true,
        "User1",
        "
            !isNull unitBackpack player && 
            {backpack player == KK_mortarBag} && 
            {player == vehicle player}
         "
    ];            
    KK_mortarAssembled_EH = player addEventHandler ["WeaponAssembled", {
	    params ["_unit", "_staticWeapon"];
        if ((_this select 1) isKindOf "StaticMortar") then {

		player removeEventHandler ["WeaponAssembled", KK_mortarAssembled_EH];
       	}
    }];
	KK_mortarDisassembled_EH = player addEventHandler ["WeaponDisassembled", {
		params ["_unit", "_backpack1", "_backpack2"];
		_unit = _this select 0;
		
		_KK_mortarAssemBagsNearO = _unit nearObjects ["GroundWeaponHolder", 10];
				
		if (count _KK_mortarAssemBagsNearO > 0) then {
		{deleteVehicle _x;} forEach _KK_mortarAssemBagsNearO;};

      	call KK_playerAddMortarBag;
       	player removeEventHandler ["WeaponDisassembled", KK_mortarDisassembled_EH];
       
  	}];
};
//To call the function:
//call KK_playerAddMortarBag;

//		_unit = _this select 0;
//		_backpack1 = _this select 1;
//		_backpack2 = _this select 2;
//		[_unit, _backpack1, _backpack2] spawn { 
//		_unit = _this select 0;
//		_backpack1 = _this select 1;
//		_backpack2 = _this select 2;
//		deleteVehicle _backpack1;
//		deleteVehicle _backpack2;
//		if ((typeOf _backpack1 isEqualTo "B_Mortar_01_weapon_F")) then {deleteVehicle _backpack1};
//		if ((typeOf _backpack2 isEqualTo "B_Mortar_01_weapon_F")) then {deleteVehicle _backpack2};
//		if ((typeOf _backpack1 isEqualTo "B_Mortar_01_support_F")) then {deleteVehicle _backpack1};
//		if ((typeOf _backpack2 isEqualTo "B_Mortar_01_support_F")) then {deleteVehicle _backpack2};
//		if ((_backpack1 isKindOf "GroundWeaponHolder")) then {deleteVehicle _backpack1};
//		if ((_backpack2 isKindOf "GroundWeaponHolder")) then {deleteVehicle _backpack2};
		
//		_KK_mortarAssemBagsNearO = _unit nearObjects ["GroundWeaponHolder", 10];

//	hint format ["NearO = %1",typeOf (_KK_mortarAssemBagsNearO select 0)];
				
//		if (count _KK_mortarAssemBagsNearO > 0) then {
//		{deleteVehicle _x;} forEach _KK_mortarAssemBagsNearO;};

//		_KK_mortarAssemBagsNearestO = nearestObjects [_unit, ["GroundWeaponHolder"], 10];

//	hint format ["NearestO = %1",typeOf (_KK_mortarAssemBagsNearestO select 0)];
				
//		if (count _KK_mortarAssemBagsNearestO > 0) then {
//		{deleteVehicle _x;} forEach _KK_mortarAssemBagsNearestO;};
		
//      	call KK_playerAddMortarBag;
//       	player removeEventHandler ["WeaponDisassembled", KK_mortarDisassembled_EH];
//       };

