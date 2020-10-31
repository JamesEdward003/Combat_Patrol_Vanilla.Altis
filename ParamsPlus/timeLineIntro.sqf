// "ParamsPlus/timeLineIntro.sqf" //
// Timeline of events
private _timeline =
[
	[0.0, { hint "Start of the Timeline" }],
	[1.0, { hint "Event 1" }],
	[3.0, { hint "End of the timeline" }]
];


// Start the Animated Opening at index 0
// also start the "LeadTrack03_F_Tacops" audio track and sync the timeline to it
[_timeline, 0, "LeadTrack03_F_Tacops"] spawn BIS_fnc_animatedOpening;


// Wait until timeline is over
waitUntil { !(missionNamespace getVariable "BIS_fnc_eventTimeline_playing"); };


// End Intro and start mission
endMission "END1";

