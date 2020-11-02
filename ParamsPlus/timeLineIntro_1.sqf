// "ParamsPlus\timeLineIntro_1.sqf" //
_PIntro = "PIntro" call BIS_fnc_getParamValue;
if (_PIntro isEqualTo 1) exitWith {};
#include "timeLineFile_1.sqf";
// Timeline of events
private _timeline =
[
	[0.0,	{ execVM "a3\missions_f_epa\Campaign_shared\Functions\Timeline\fn_camp_showOSD.sqf"; }	],
	[10.0, { hint "Event 1" }],
	[13.0, { hint "End of the timeline" }]
];


// Start the Animated Opening at index 0
// also start the "LeadTrack03_F_Tacops" audio track and sync the timeline to it
[_timeline, 0, "LeadTrack03_F_Tacops"] spawn BIS_fnc_animatedOpening;


// Wait until timeline is over
waitUntil { !(missionNamespace getVariable "BIS_fnc_eventTimeline_playing"); };


// End Intro and start mission
//endMission "END1";

