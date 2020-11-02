// "ParamsPlus/timeLineFile_2.sqf" //
private _timeline = [
	[
		60,
		{
			[[[markerSize]] "BIS_SF_zoom0", markerPos "BIS_SF_zoom0", 0, nil, true] spawn BIS_fnc_zoomOnArea;
			[(getMissionLayerEntities "g_showAtEnd") select 1, 0, true] spawn BIS_fnc_showMarkerArray;

			sleep 0.5;

			[[[markerSize]] "BIS_SF_zoom1", markerPos "BIS_SF_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;
		}
	],
	[
		10,
		{
			["to_c02_m01_003_br_sf_briefing_c_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			["BIS_SF_specialArea", 2] spawn BIS_fnc_showMarker;
		}
	],
	[
		50,
		{
			["to_c02_m01_003_br_sf_briefing_c_GUARDIAN_1", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

			_arrayTemp = ["BIS_SF_question_"] call BIS_fnc_getMarkers;
			[_arrayTemp, 8, false] spawn BIS_fnc_showMarkerArray;
		}
	],
	[ 12, {}]
];


