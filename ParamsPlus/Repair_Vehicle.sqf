//  [] execVM "Repair_Vehicle.sqf";  //
_vehicle = _this select 0;
_side = side _vehicle;
_grp =  group _vehicle;
_leaderGrp = leader _grp;
_dist = 100;
_type = "B_engineer_F";

_nearestVehicles = nearestObjects [_vehicle,["AllVehicles"],_dist];

_injuredGrp = [];

{if ((lifeState _x == "INJURED") || (lifeState _x == "INCAPACITATED")) then {    
	_injuredGrp = _injuredGrp + [_x];
}} forEach _nearestVehicles;

for "_i" from 0 to count _injuredGrp - 1 do {
	
	_injured = _injuredGrp select _i;
	
	if (lifeState _injured == "HEALTHY") then {[format ["Just visiting %1? Are you good to go?", vehicleVarname _injured]] remoteExec ["hint"];};

	if (lifeState _injured == "INJURED") then {
		_injured setDamage 0;
		[format ["Combat Life Saver not needed %1. Just a scratch, you are good to go!", vehicleVarname _injured]] remoteExec ["hint"];
	};	
};


