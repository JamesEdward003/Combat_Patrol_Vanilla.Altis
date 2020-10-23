//  [player] execVM "Heal_Player.sqf";  //
_unit = _this select 0;
_side = side _unit;
_teamleader = leader _unit;
_grp =  group _unit;
_dist = 100;
_type = "B_medic_F";

_nearestUnits = nearestObjects [_unit,["Man"],_dist];

_injuredGrp = [];

{if ((lifeState _x == "INJURED") || (lifeState _x == "INCAPACITATED")) then {    
	_injuredGrp = _injuredGrp + [_x];
}} forEach _nearestUnits;

for "_i" from 0 to count _injuredGrp - 1 do {
	
	_injured = _injuredGrp select _i;
	
	if (lifeState _injured == "HEALTHY") then {[format ["Just visiting %1? Are you good to go?", vehicleVarname _injured]] remoteExec ["hint"];};

	if (lifeState _injured == "INJURED") then {
		_injured setDamage 0;
		[format ["Combat Life Saver not needed %1. You're good to go!", vehicleVarname _injured]] remoteExec ["hint"];
	};	
};

uisleep 10;
hint "";

