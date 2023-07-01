//////////////////////////////////////////////////////////////////
// joinGroupPlayer.sqf
//////////////////////////////////////////////////////////////////
private ["_target", "_caller"];
_target = _this select 0;
_caller = _this select 1;
	
if (_target iskindof "MAN") then {
		
		_target setCaptive false; 
		
		_target enableAI "Anim";
		
		_target enableAI "MOVE";
		
		_target setUnitPos "AUTO";
		
		_target joinAsSilent [group _caller, 1];
		
		[_target] execVM "008\twirlyMrkr2.sqf";
		 
};

uisleep 0.25;
player commandChat format["%1 joined forces with %2", vehiclevarname _target, vehiclevarname _caller];	 
