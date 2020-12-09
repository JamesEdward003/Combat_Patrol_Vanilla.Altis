/*
Add Script to individual units spawned by COS.
_unit = unit. Refer to Unit as _unit.
{_x execVM "cos\addscript_Unit.sqf";} forEach ((units group this) - player);
0=[[_text1,1,4,1],[_text2,1,4,1]] spawn BIS_fnc_EXP_camp_SITREP;
*/

_unit =_this;
_unit addAction ["Hello", {
_message = selectRandom [ 
"Hello ?", 
"You kidding me, man?", 
"Think of a voice, any voice. Clint Eastwood...Sylvester Stallone...Jerry Lewis...Doris Day...fill in the blank...wing it.", 
"Have you been vaccinated?", 
"Remember Jackie Mason? Didn't he do voice acting? The aardvark I think...in The Ant and the Aardvark.", 
"Do yourself a favor...go to the end of the world and jump off.", 
"There's trouble EVERYWHERE...this place ain't no different.", 
"Remember the asteroid from space that's going to hit the earth and trigger the next ice age?", 
"Come on man, get with it!", 
"You notice there aren't any chicks in this movie? Probably made by a bunch of you-know-whats.", 
"Crawl under a rock and sleep for a year or two or twenty.", 
"Hello...again ?", 
"Goodbye !" 
];
[_this select 0,_message] remoteExec ["globalChat",0];
}];

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

