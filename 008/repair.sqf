//////////////////////////////////////////////////////////////////
_vehicle = _this select 0;  
_caller = _this select 1;
if (_caller == vehicle _caller) then {_vehicle = cursorTarget} else {_vehicle = vehicle player};

_damage = getDammage _vehicle;

if (_damage > 0) then {

	_caller playMove "AinvPknlMstpSlayWrflDnon_medic";

	sleep 8;
	
	_vehicle setDamage 0;

	sleep 1;

	player commandChat format["%1 repaired by %2", typeOf _vehicle, name _caller];

} else {
	
	player commandChat format["%1 is not damaged", typeOf _vehicle];

};
