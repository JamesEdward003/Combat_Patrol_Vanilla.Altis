///////// execVM "arsenal.sqf" /////////

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
		}forEach ( [ _caller ] + ( units group _caller - [ _caller ] ));

		[missionNamespace, "arsenalClosed", {
			_caller setVariable ["ready",true,true];
		}] remoteExecCall ["BIS_fnc_addScriptedEventHandler",[0,-2] select isDedicated];

	},
	    [],
	    1, 
	    true, 
	    true, 
	    "",
	    ""
	];

//[missionNamespace, "arsenalClosed", { 
// player setVariable ["ready",true,true]; 
//}] remoteExecCall ["BIS_fnc_addScriptedEventHandler",[0,-2] select isDedicated]; 
//waitUntil {{_x getVariable ["ready",false]} count allPlayers >= (playersNumber west +playersNumber east +playersNumber civilian +playersNumber independent)}; 
//systemChat "DONE";