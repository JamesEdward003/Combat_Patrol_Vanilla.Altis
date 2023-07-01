//////////////////////////////////////////////////////////////////
_target = _this select 0;  
_caller = _this select 1;

if (_caller == vehicle _caller) then {

	_target = cursorTarget;

	_caller playMove "AinvPknlMstpSlayWrflDnon_medic";

	sleep 4;

	_target setvehiclelock "unlocked";

	_caller commandChat format["%1 unlocked by %2", typeOf _target, name _caller];

} else {

	_target = vehicle _caller;

	_target setvehiclelock "unlocked";

	_caller commandChat format["%1 unlocked by %2", typeOf _target, name _caller];
};
