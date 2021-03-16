/*
Add Script to individual units spawned by COS.
_unit = unit. Refer to Unit as _unit.
{_x execVM "cos\addscript_Unit.sqf";} forEach ((units group this) - player);
0=[[_text1,1,4,1],[_text2,1,4,1]] spawn BIS_fnc_EXP_camp_SITREP;
*/

_unit =_this;
//_unit execVM "ParamsPlus\loadouts_c_weapons.sqf";

_PCivilians = "PCivilians" call BIS_fnc_getParamValue;

if (_PCivilians isEqualTo 2) exitWith {};
	
if ((_PCivilians isEqualTo 3) or (_PCivilians isEqualTo 4)) then {

_unit addAction ["Hello", {
_message = selectRandom [ 
"I would kill for a Nobel Peace Prize.", 
"Just because I don't care doesn't mean I don't understand.", 
"I like you. You remind me of when I was young and stupid.", 
"Have you been vaccinated?", 
"Don't take life too seriously, you won't get out alive.", 
"Honesty is the best policy but insanity is the best defense.", 
"I never admit or deny anything, it makes things more interesting.", 
"I didn't say it was your fault, I said I was blaming you.", 
"If I promise to miss you, will you go away?", 
"I'm smiling. This should scare you.", 
"It takes patience to listen... it takes skill to pretend you're listening.", 
"No deja vu please...I don't want to go through THAT again", 
"Oh... I didn't tell you... Then it must be none of your business...",
"Think I'm sarcastic? Watch me pretend to care!"
];
[_this select 0,_message] remoteExec ["globalChat",0];
}];
};

if (_PCivilians isEqualTo 3) exitWith {};
	
if (_PCivilians isEqualTo 4) then {

_unit execVM "ParamsPlus\loadouts_c_weapons.sqf";

};
/*
player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if !(isPlayer _unit) exitWith {];
	_texts = missionNamespace getVariable "StoryLines"; 
	_txts = _texts select 0;                                  
	[[(_txts select 0),1,4,.1],[(_txts select 1),1,4,.1],[(_txts select 2),1,4,.1],[(_txts select 3),1,4,.1]] spawn BIS_fnc_EXP_camp_SITREP;
}];

player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if !(isPlayer _unit) exitWith {];
	_texts = missionNamespace getVariable "StoryLines"; 
	_txts = _texts select 0;
	_texts = _texts - [_txts]; 
	missionNamespace setVariable ["StoryLines",_texts];	
}];
*/


