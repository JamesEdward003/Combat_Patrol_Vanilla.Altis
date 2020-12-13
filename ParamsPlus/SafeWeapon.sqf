/////	execVM "SafeWeapon.sqf";	 /////
////////////////////////////////
player action ["WEAPONONBACK", player];

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	execVM "ParamsPlus\SafeWeapon.sqf";
}];

