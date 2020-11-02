// "ParamsPlus/timeLineIntro.sqf" //
_PIntro = "PIntro" call BIS_fnc_getParamValue;
if (_PIntro isEqualTo 1) exitWith {};
#include "timeLineFile_2.sqf";
// timeline of events
_timeline =
[
	[0.0,	{ hint "Start of the Timeline" }	],
	[10.0,	{ hint "Event 1" }					],
	[120.0,	{ hint "End of the timeline" }		]
];

// get markers to be shown at end by using the layer's name
private _showMarkers = (getMissionLayerEntities "showAtEnd") select 1;

// start the Animated Briefing at index 0
// hide all markers and show the markers from the "showAtEnd" layer after the briefing is done
// zoom on marker_rect_1 at the end of the briefing
[_timeline, 0, nil, allMapMarkers, _showMarkers, "marker_rect_1"] spawn BIS_fnc_animatedBriefing;

// Wait until timeline is over
waitUntil { !(missionNamespace getVariable "BIS_fnc_eventTimeline_playing"); };

