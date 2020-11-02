// "ParamsPlus/timeLineFile_1.sqf" //
private _timeline =
[
	[
		0,
		{
			[MODE_RESET, [true, true]] call BIS_fnc_animatedScreen;
			[MODE_BLACKIN, 0, false]   call BIS_fnc_animatedScreen;
		}
	],
	[
		11.5,
		{
			[MODE_BLACKOUT, 3, false] call BIS_fnc_animatedScreen;
		}
	],
	[
		18.2,
		{
			[MODE_RESET, [true, true]]  call BIS_fnc_animatedScreen;
			[MODE_BLACKOUT, 0.01, true] call BIS_fnc_animatedScreen;

			[MODE_LAYER_CREATE, C03_SLIDE1_ID_DUST,     C03_SLIDE1_IMG_DUST,     nil,         nil, 1.3] call BIS_fnc_animatedScreen;
			[MODE_LAYER_CREATE, C03_SLIDE1_ID_OBSTACLE, C03_SLIDE1_IMG_OBSTACLE, [0.46,0.45], nil, 1.2] call BIS_fnc_animatedScreen;
		}
	],
	[12, {}]
];

