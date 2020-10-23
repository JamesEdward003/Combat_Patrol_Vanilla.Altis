//////// execVM "arsenalTriggerAction.sqf" ////////
_trg1 = createTrigger ["EmptyDetector", [0,0,0]];
_trg1 setTriggerActivation ["Alpha", "PRESENT", true];
_trg1 setTriggerText "Group Arsenal";
_trg1 setTriggerStatements ["this", "

player addAction ['<t color=''#FF00EE''>Group Arsenal</t>', {
_unit 	= _this select 0;
_caller 	= _this select 1;
_id 		= _this select 2;
_caller removeAction _id;
		
	[ missionNamespace, 'arsenalClosed', {
	    arsenalOpened = false;
	}] call BIS_fnc_addScriptedEventHandler;

	{
	    ['Open',[true,objNull,_x]] call BIS_fnc_arsenal;
	    arsenalOpened = true;
	    waitUntil{ !arsenalOpened };
	}forEach ( [ player ] + ( units group player - [ player ] ));

	[missionNamespace, 'arsenalClosed', {
		player setVariable ['ready',true,true];
	}] remoteExecCall ['BIS_fnc_addScriptedEventHandler',[0,-2] select isDedicated];

},
    [],
    1, 
    true, 
    true, 
    '',
    ''
]", ""];

_trg2 = createTrigger ["EmptyDetector", [0,0,0]];
_trg2 setTriggerActivation ["Bravo", "PRESENT", true];
_trg2 setTriggerText "Player Arsenal";
_trg2 setTriggerStatements ["this", "

player addAction ['<t color=''#CCFF00''>Player Arsenal</t>', {
_unit 	= _this select 0;
_caller 	= _this select 1;
_id 		= _this select 2;
_caller removeAction _id;
		
	[ missionNamespace, 'arsenalClosed', {
	    arsenalOpened = false;
	}] call BIS_fnc_addScriptedEventHandler;

	    ['Open',[true,objNull,player]] call BIS_fnc_arsenal;
	    arsenalOpened = true;
	    waitUntil{ !arsenalOpened };

	[missionNamespace, 'arsenalClosed', {
		player setVariable ['ready',true,true];
	}] remoteExecCall ['BIS_fnc_addScriptedEventHandler',[0,-2] select isDedicated];

},
    [],
    1, 
    true, 
    true, 
    '',
    ''
]", ""];
