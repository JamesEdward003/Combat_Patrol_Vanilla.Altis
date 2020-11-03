// "ParamsPlus/Intro.sqf" //
_PIntro = "PIntro" call BIS_fnc_getParamValue;
if (_PIntro isEqualTo 1) exitWith {};
/*
	Author: kylania

	Description:
	Fade in from black intro, with a quote and Arma 3 style SitRep Date/Time/Mission credits.  
	Run via execVM from playerInitLocal.sqf

	Parameter(s):
	0: STRING - Name of the mission.  SemiBold font under date during sitrep typing effect. Default: "An Arma 3 mission"
	1: STRING - Author of the mission.  Displayed under the mission name in medium font. Use a " " for nothing. Default: "by a Community Author"
	2: STRING - Version of the mission.  Displayed under the mission author in a medium font. Use a " " for nothing. Default: "Version 1.0"
	3: STRING - Quote for center screen display on black screen.  Default: "Not so long ago, not so far away...\n\n-A quote"
	4: NUMBER - Duration of quote display.  Default: 9
	
	
	Returns:
	Nothing.
	
	Examples:
	["Jungle Trek", "By Rip", "Version 1", '"A cat is a lion in a jungle of small bushes."\n\n-Indian proverb'] execVM "missionIntro.sqf";
	["A Mission", " ", " ", "", 0] execVM "missionIntro.sqf";
*/

// Start with a silent black screen.
titleCut ["", "BLACK FADED", 999];
0 fadeSound 0;

// Spawn text effects.
_this spawn {

	
	params[
		["_missionName", "An Arma 3 mission"],
		["_missionAuthor", "by a Community Author"],
		["_missionVersion", "Version 1.0"],
		["_quote", "Not so long ago, not so far away...\n\n-A quote"],
		["_duration", 9]
	];

	// Starting quote as volume fades in.
	titleText [_quote,"PLAIN"];
	titleFadeOut _duration;
	_duration fadeSound 1;
	sleep (_duration - 2);

	// New "sitrep style" text in bottom right corner, typed out over time.
	[ 
		[_missionName,"font = 'PuristaSemiBold'"],
		["","<br/>"],
		[_missionAuthor,"font = 'PuristaMedium'"],
		["","<br/>"],
		[_missionVersion,"font = 'PuristaLight'"]
	]  execVM "\a3\missions_f_bootcamp\Campaign\Functions\GUI\fn_SITREP.sqf";

	// Fade from black, to blur, to clear as text types.
	sleep 3;
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;  
	titleCut ["", "BLACK IN", 5];
};

[] execVM "a3\missions_f_epa\Campaign_shared\Functions\Timeline\fn_camp_showOSD.sqf";

//[
//    [
//      player call BIS_fnc_locationDescription
//    ]
//] spawn BIS_fnc_EXP_camp_SITREP;


