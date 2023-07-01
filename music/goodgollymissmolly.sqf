//////////////////////////////////////////////////////////
private ["_target", "_caller", "_actionId", "_arguments"];
_target = _this select 0;
_caller = _this select 1;
_actionID = if (count _this >2) then {_this select 2};

if (count _this >2) then {_caller removeAction _actionID};
	
5 fadeMusic 1;
playMusic "GoodGollyMissMolly";