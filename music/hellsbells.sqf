//////////////////////////////////////////////////////////
private ["_target", "_caller", "_actionId", "_arguments"];
_target = if (count _this >0) then {_this select 0};
_caller = if (count _this >1) then {_this select 1};
_actionID = if (count _this >2) then {_this select 2};

if (count _this >2) then {_caller removeAction _actionID};
	
5 fadeMusic 0; playmusic "";

5 fadeMusic 1;

playMusic "HellsBells";