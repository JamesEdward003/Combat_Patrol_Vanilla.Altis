//////////////////////////////////////////////////////////////////
player addAction ["Open Arsenal",{
_unit 	= _this select 0;
_caller 	= _this select 1;
_id 		= _this select 2;
_caller removeAction _id;
		
	[ missionNamespace, "arsenalClosed", {
	    arsenalOpened = false;
	}] call BIS_fnc_addScriptedEventHandler;

	{
	    ["Open",[true,objNull,_x]] call BIS_fnc_arsenal;
	    arsenalOpened = true;
	    waitUntil{ !arsenalOpened };
	}forEach ( [ player ] + ( units group player - [ player ] ));

	[missionNamespace, "arsenalClosed", {
		player setVariable ["ready",true,true];
	}] remoteExecCall ["BIS_fnc_addScriptedEventHandler",[0,-2] select isDedicated];

},
    [],
    1, 
    true, 
    true, 
    "",
    ""
];

(findDisplay 46) displayAddEventHandler ["keyDown", "_this call functionName_keyDown"];

// function definition
functionName_keyDown = {
	params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
	private _handled = false;

	if (!_shift && !_ctrlKey && !_alt) then {
		if (_dikCode in (actionKeys "NetworkStats")) then {
			[] execVM "path\script.sqf";
			_handled = true;
		};
	};
	_handled;
};
