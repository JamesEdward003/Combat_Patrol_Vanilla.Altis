//////////  player execVM "randomPrimaryWeapon.sqf";  ///////////
//Get all available primary weapons from config
allPrimaryWeapons = "
( getNumber ( _x >> 'scope' ) isEqualTo 2
&&
{ getText ( _x >> 'simulation' ) isEqualTo 'Weapon'
&&
{ getNumber ( _x >> 'type' ) isEqualTo 1 } } )
"configClasses ( configFile >> "cfgWeapons" );


fnc_randomWeapon = {
_unit = _this;

//Get a random weapon from the list
_rndWeapon = configName ( allPrimaryWeapons select (floor (random (count allPrimaryWeapons ))) );

//If new weapon is not the same as the current weapon
if !( _rndWeapon isEqualTo primaryWeapon _unit ) then {

	//Get current weapons magazine types
	_currentMagazine = getArray ( configFile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines" );

	//Remove all current weapon magazines
	{
		_unit removeMagazines _x;
	}forEach _currentMagazine;

	//Find new weapon default magazine type
	_magazine = ( getArray ( configFile >> "CfgWeapons" >> _rndWeapon >> "magazines" )) select 0 ;

	//Can the new mag type fit in the uniform ( large mg mags can not )
	if !( _unit canAddItemToUniform _magazine ) then {

		//If not
		//Move as many items as possible from vest to uniform
		//to make room for adding large magazines into vest

		//For evey item in the units vest
		{
			//If item can fit in uniform
			if ( _unit canAddItemToUniform _x ) then {
				//Remove the item
				_unit removeMagazineGlobal _x;
				//Add item to uniform
				_unit addItemToUniform _x;
			};
		}forEach vestItems _unit;

	};

   	//Add new mags before weapon so it get preloaded
	_unit addMagazines [ _magazine, 6 ];

   	//Add new weapon
	_unit addWeaponGlobal _rndWeapon;

	//If not a player
	if !( isPlayer _unit ) then {
		//Make unit swap back to their primary weapon
		_unit selectWeapon ( primaryWeapon _unit );
	};
};
};

player addAction [ "New Weapon", { player call fnc_randomWeapon } ];
