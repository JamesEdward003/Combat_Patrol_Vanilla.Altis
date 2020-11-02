// "Intro.sqf" //
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
		["_missionAuthor", "Arma 3 Community"],
		["_missionVersion", "Vanilla Version"],
		["_quote", "Why Today When Tommorrow?"],
		["_duration", 9]
	];

	// Starting quote as volume fades in.
	sleep _duration;
	titleText [_quote,"PLAIN"];
	titleFadeOut _duration;
	_duration fadeSound 1;
	sleep (_duration - 2);

	// New "sitrep style" text in bottom right corner, typed out over time.
	[ 
		[_missionName,"font = 'PuristaSemiBold'"],
		["","<br/>"],
		[_missionAuthor,"font = 'PuristaSemiBold'"],
		["","<br/>"],
		[_missionVersion,"font = 'PuristaSemiBold'"]
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

_nil = [] execVM "a3\missions_f_epa\Campaign_shared\Functions\Timeline\fn_camp_showOSD.sqf";

[
    [
      player call BIS_fnc_locationDescription
    ]
] spawn BIS_fnc_EXP_camp_SITREP;

h = [] spawn {
	comment "showOSD - original script Jiri Wainar, modified by HallyG";
	MAPS = ["stratis", "altis", "tanoa"];
	MAPSIZES = [[1302, 230, 6825, 7810], [1785, 4639, 28624, 26008], [330, 130, 15084, 15360]];

	if (missionNamespace getVariable ["BIS_showOSD_running", false]) exitWith {};
	BIS_showOSD_running = true;

	private _fn_getSector = {
		params ["_posX", "_posY"];
		private _map = toLower worldName;
		private _width = worldSize/2;
		private _height = worldSize/2;
		private _centre = [_width, _height];
			
		if (_map in MAPS) then {
			(MAPSIZES select (MAPS find _map)) params ["_bottomLX", "_bottomLY", "_topRX", "_topRY"];
			_width =  (_topRx - _bottomLX)/2;
			_height = (_topRY - _bottomLY)/2;
			_centre = [(_topRx + _bottomLX)/2, (_topRY + _bottomLY)/2];
		};
			
		if !([_posX, _posY] inArea [_centre, _width, _height, 0, true]) exitWith {0};
		
		private _gridX = floor (_posX /(_width * 0.666));
		private _gridY = floor (_posY /(_height * 0.666));

		((_gridY * 3) + _gridX + 1)
	};

	params [
		["_position", getPos player, [[]]],
		["_date", date, [[]], [5]]
	];

	private _sector = _position call _fn_getSector;
	private _tIntel = "";

	_date = (_date call BIS_fnc_fixDate) apply {format [["%1", "0%1"] select (_x < 10), _x]};
	{
		_tIntel = [_tIntel, _x] joinString ([["-", " "] select (_forEachIndex == 3), ":"] select (_forEachIndex > 3));
	} forEach _date;
			
	private _output = [
		[_tIntel select [1, 10], ""],
		[" " + (_tIntel select [12]), "font='PuristaMedium'"], ["", "<br/>"]
	];
			
	if (_sector > 0) then {
		private _locations = (nearestLocations [_position, ["NameCity", "NameCityCapital", "NameLocal", "NameMarine", "NameVillage"], 500]) select {!((text _x) isEqualTo "")};

		if !(_locations isEqualTo []) then {
			private _loc = _locations select 0;
					
			_output append [
				[toUpper ([format [localize "STR_A3_NearLocation", text _loc], text _loc] select ((getPos player) in _loc)), ""],
				["", "<br/>"]
			];
		};
	};
			
	_template = [format ["Near %1", worldName], localize "STR_A3_SectorSouthWest", localize "STR_A3_SectorSouth", localize "STR_A3_SectorSouthEast", localize "STR_A3_SectorWest", localize "STR_A3_SectorCentral", localize "STR_A3_SectorEast", localize "STR_A3_SectorNorthWest", localize "STR_A3_SectorNorth", localize "STR_A3_SectorNorthEast"] select _sector;

	_output append [
		[format [_template, getText (configfile >> "cfgWorlds" >> worldname >> "description")], ""],
		["", "<br/>"]
	];		

	private _handle = [_output, safezoneX - 0.01, safeZoneY + (1 - 0.125) * safeZoneH, true, "<t align='right' size='1.0' font='PuristaLight'>%1</t>"] spawn BIS_fnc_typeText2;
	waitUntil {scriptDone _handle;};

	BIS_showOSD_running = false;
};


