waitUntil {!isNil {player}};
waitUntil {player == player};
if (!isNil {player getVariable "Briefing"}) exitWith {};

player setVariable ["Briefing",true];

switch (side player) do 
{
	case WEST: // BLUFOR briefing goes here
	{
	player createDiaryRecord ["Diary", ["Rules Of Play","All players have to be in the same group or Combat Patrol will not start. At game start if the civilians have guns, they are your enemies. In the multiplayer lobby you can select east or resistance enemies and civilians with weapons."]];
	player createDiaryRecord ["Diary", ["Rules Of Engagement","Captain Pettka's  10 Rules Of Engagement<br/><br/>Rule #1 - Don't get shot.<br/>Rule #2 - Short, controlled bursts.<br/>Rule #3 - Be proud you are a soldier.<br/>Rule #4 - Watch your bullet drop.<br/>Rule #5 - Patch your wounds.<br/>Rule #6 - Keep a full mag.<br/>Rule #7 - If in doubt, fall back.<br/>Rule #8 - Keep the enemy suppressed.<br/>Rule #9 - Follow orders.<br/>Rule #10 - Beware of confined spaces."]];
	player createDiaryRecord ["Diary", ["Opposition","Enemies are east soldiers or resistance guerillas, and civilians.<br/>If the civilians have obtained weapons, covertly infiltrate and ask questions.<br/>Will be worthwhile to get them on your side. Can be done a number of ways.<br/>Adjust stealth in the lobby parameters and/or steal civilian clothing to be covert.<br/>Or... interrogate any/all civilians until he/they join your side.<br/><br/>Combat patrol objectives are present."]];
	player createDiaryRecord ["Diary", ["Help", "Hints from Captain Pettka:<br/>
	- Press 'NUMPAD /' to toggle scope/open sight.<br/>
	- Press '[ or ]' for L and R Panel GPS, radar and miniMap.<br/>
	- Press 'V' twice in rapid succession to Open Parachute!"]];
	};

	case EAST: // OPFOR briefing goes here
	{ 
	player createDiaryRecord ["Diary", ["Rules Of Play","All players have to be in the same group or Combat Patrol will not start. At game start if the civilians have guns, they are your enemies. In the multiplayer lobby you can select resistance enemies and civilians with weapons."]];
	player createDiaryRecord ["Diary", ["Rules Of Engagement","Colonel Namdar's 10 Rules Of Engagement]]<br/><br/>Rule #1 - Don't get shot.<br/>Rule #2 - Short, controlled bursts.<br/>Rule #3 - Be proud you are a soldier.<br/>Rule #4 - Watch your bullet drop.<br/>Rule #5 - Patch your wounds.<br/>Rule #6 - Keep a full mag.<br/>Rule #7 - If in doubt, fall back.<br/>Rule #8 - Keep the enemy suppressed.<br/>Rule #9 - Follow orders.<br/>Rule #10 - Beware of confined spaces."]];
	player createDiaryRecord ["Diary", ["Opposition","Enemies are west soldiers or resistance guerillas, and civilians.<br/>If the civilians have obtained weapons, covertly infiltrate and ask questions.<br/>Will be worthwhile to get them on your side. Can be done a number of ways.<br/>Adjust stealth in the lobby parameters and/or steal civilian clothing to be covert.<br/>Or... interrogate any/all civilians until he/they join your side.<br/><br/>Combat patrol objectives are present."]];
	player createDiaryRecord ["Diary", ["Help", "Hints from Colonel Namdar:<br/>
	- Press 'NUMPAD /' to toggle scope/open sight.<br/>
	- Press '[ or ]' for L and R Panel GPS, radar and miniMap.<br/>
	- Press 'V' twice in rapid succession to Open Parachute!"]];
	};

	case RESISTANCE: // RESISTANCE/INDEPENDENT briefing goes here
	{ 
	player createDiaryRecord ["Diary", ["Rules Of Play","All players have to be in the same group or Combat Patrol will not start. At game start if the civilians have guns, they are your enemies. In the multiplayer lobby you can select east enemies and civilians with weapons."]];
	player createDiaryRecord ["Diary", ["Rules Of Engagement","Colonel Akhanteros' 10 Rules Of Engagement]]<br/><br/>Rule #1 - Don't get shot.<br/>Rule #2 - Short, controlled bursts.<br/>Rule #3 - Be proud you are a soldier.<br/>Rule #4 - Watch your bullet drop.<br/>Rule #5 - Patch your wounds.<br/>Rule #6 - Keep a full mag.<br/>Rule #7 - If in doubt, fall back.<br/>Rule #8 - Keep the enemy suppressed.<br/>Rule #9 - Follow orders.<br/>Rule #10 - Beware of confined spaces."]];
	player createDiaryRecord ["Diary", ["Opposition","Enemies are west soldiers or resistance guerillas, and civilians.<br/>If the civilians have obtained weapons, covertly infiltrate and ask questions.<br/>Will be worthwhile to get them on your side. Can be done a number of ways.<br/>Adjust stealth in the lobby parameters and/or steal civilian clothing to be covert.<br/>Or... interrogate any/all civilians until he/they join your side.<br/><br/>Combat patrol objectives are present."]];
	player createDiaryRecord ["Diary", ["Help", "Hints from Colonel Akhanteros:<br/>
	- Press 'NUMPAD /' to toggle scope/open sight.<br/>
	- Press '[ or ]' for L and R Panel GPS, radar and miniMap.<br/>
	- Press 'V' twice in rapid succession to Open Parachute!"]];
	};

	case CIVILIAN: // CIVILIAN briefing goes here
	{ 
	player createDiaryRecord ["Diary", ["Rules Of Play","All players have to be in the same group or Combat Patrol will not start. If as a civilian you have guns, determine your enemies. In the multiplayer lobby you can select east or resistance enemies and civilians with weapons."]];
	player createDiaryRecord ["Diary", ["Rules Of Engagement","Colonel Mylonaki's 10 Rules Of Engagement]]<br/><br/>Rule #1 - Don't get shot.<br/>Rule #2 - Short, controlled bursts.<br/>Rule #3 - Be proud you are a civilian.<br/>Rule #4 - Watch your bullet drop.<br/>Rule #5 - Patch your wounds.<br/>Rule #6 - Keep a full mag.<br/>Rule #7 - If in doubt, fall back.<br/>Rule #8 - Keep the enemy suppressed.<br/>Rule #9 - Follow orders.<br/>Rule #10 - Beware of confined spaces."]];
	player createDiaryRecord ["Diary", ["Opposition","Civilians either have weapons or they don't. Adjust accordingly. Enemies can be west, east, or resistance. Beware of infiltration by enemies in civilian clothing. You will either help or hinder objectives if you have allowed infiltration by enemy. You may interrogate any/all civilians until he/they are neutral to enemy side.<br/><br/>Combat patrol objectives are present."]];
	player createDiaryRecord ["Diary", ["Help", "Hints from Colonel Mylonaki:<br/>
	- Press 'NUMPAD /' to toggle scope/open sight.<br/>
	- Press '[ or ]' for L and R Panel GPS, radar and miniMap.<br/>
	- Press 'V' twice in rapid succession to Open Parachute!"]];
	};
};
waitUntil { (isServer || !isNull player) };

[playerSide, "HQ"] commandChat "Briefing Done!";

player addEventHandler ["Killed", {
	private ["_unit","_killer"];
	_unit = _this select 0;
	_killer = _this select 1;
	[] spawn {
		waitUntil {alive player};
		waitUntil {!isNil {player getVariable "Briefing"}};
		tskInsertLZpv = missionNamespace getVariable "tskInsertLZpv";
		tskClearVillagepv = missionNamespace getVariable "tskClearVillagepv";
		tskElimHVTpv = missionNamespace getVariable "tskElimHVTpv";
		tskExvillLZpv = missionNamespace getVariable "tskExvillLZpv";
		tskRTBpv = missionNamespace getVariable "tskRTBpv";
		tskDGCpv = missionNamespace getVariable "tskDGCpv";

		switch (tskInsertLZpv) do {
			case 1:	{tskInsertLZ setTaskState "NONE"};
			case 2:	{tskInsertLZ setTaskState "CREATED"};
			case 3:	{tskInsertLZ setTaskState "ASSIGNED"};
			case 4:	{tskInsertLZ setTaskState "SUCCEEDED"};
			case 5:	{tskInsertLZ setTaskState "FAILED"};
			case 6:	{tskInsertLZ setTaskState "CANCELED"};
			default {tskInsertLZ setTaskState "CREATED"};
		};
		switch (tskClearVillagepv) do {
			case 1:	{tskClearVillage setTaskState "NONE"};
			case 2:	{tskClearVillage setTaskState "CREATED"};
			case 3:	{tskClearVillage setTaskState "ASSIGNED"};
			case 4:	{tskClearVillage setTaskState "SUCCEEDED"};
			case 5:	{tskClearVillage setTaskState "FAILED"};
			case 6:	{tskClearVillage setTaskState "CANCELED"};
			default {tskClearVillage setTaskState "CREATED"};
		};
		switch (tskElimHVTpv) do {
			case 1:	{tskElimHVT setTaskState "NONE"};
			case 2:	{tskElimHVT setTaskState "CREATED"};
			case 3:	{tskElimHVT setTaskState "ASSIGNED"};
			case 4:	{tskElimHVT setTaskState "SUCCEEDED"};
			case 5:	{tskElimHVT setTaskState "FAILED"};
			case 6:	{tskElimHVT setTaskState "CANCELED"};
			default {tskElimHVT setTaskState "CREATED"};
		};
		switch (tskExvillLZpv) do {
			case 1:	{tskExvillLZ setTaskState "NONE"};
			case 2:	{tskExvillLZ setTaskState "CREATED"};
			case 3:	{tskExvillLZ setTaskState "ASSIGNED"};
			case 4:	{tskExvillLZ setTaskState "SUCCEEDED"};
			case 5:	{tskExvillLZ setTaskState "FAILED"};
			case 6:	{tskExvillLZ setTaskState "CANCELED"};
			default {tskExvillLZ setTaskState "CREATED"};
		};
		switch (tskRTBpv) do {
			case 1:	{tskRTB setTaskState "NONE"};
			case 2:	{tskRTB setTaskState "CREATED"};
			case 3:	{tskRTB setTaskState "ASSIGNED"};
			case 4:	{tskRTB setTaskState "SUCCEEDED"};
			case 5:	{tskRTB setTaskState "FAILED"};
			case 6:	{tskRTB setTaskState "CANCELED"};
			default {tskRTB setTaskState "CREATED"};
		};
		switch (tskDGCpv) do {
			case 1:	{tskDGC setTaskState "NONE"};
			case 2:	{tskDGC setTaskState "CREATED"};
			case 3:	{tskDGC setTaskState "ASSIGNED"};
			case 4:	{tskDGC setTaskState "SUCCEEDED"};
			case 5:	{tskDGC setTaskState "FAILED"};
			case 6:	{tskDGC setTaskState "CANCELED"};
			default {tskDGC setTaskState "NONE"};
		};
	};
}];
















	