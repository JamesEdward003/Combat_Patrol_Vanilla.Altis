// "cos\cosInit.sqf" //
// =======================================================================================
// SCRIPT INTENT: CIVILIANS WILL CONGREGATE AND MOVE AT SELECTED AREA
// =======================================================================================
//_PCivilians = "PCivilians" call BIS_fnc_getParamValue;
//if (_PCivilians isEqualTo 1) exitWith {};
//	
//if (_PCivilians isEqualTo 2) then {

//	waitUntil { !isNil "BIS_CP_initDone" };
//	private _future = time + 120; 
//	waitUntil { time >= _future };
	
	if ( isNil { missionNamespace getVariable "StoryLines" } ) then {
	_texts = [ 
	["One...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Two...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Three...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Four...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Five...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."],
	["Six...Ask and it shall be told.", "In the old days citizens felt relatively safe.", "The wives and children came outside and enjoyed life.", "Only hiding inside now days."],
	["Strife is everywhere.", "The men love to play with their weapons.", "They all have access to weapons.", "Staying alive becomes a challenge."]
	];
		missionNamespace setVariable ["StoryLines",_texts];
	};

	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType"];
		copyToClipboard format ["%1,%2,%3,%4,%5,%6,%7,%8,%9,%10,%11", _channel, _owner, _from, _text, _person, _name, _strID, _forcedDisplay, _isPlayerMessage, _sentenceType, _chatMessageType];
		if (_chatMessageType isEqualTo 0) then {
		_texts = missionNamespace getVariable "StoryLines"; 
		_txts = _texts select 0;                                  
		[[(_txts select 0),1,4,1],[(_txts select 1),1,4,1],[(_txts select 2),1,4,1],[(_txts select 3),1,4,1]] spawn BIS_fnc_EXP_camp_SITREP;
		_texts = _texts - [_txts]; 
		missionNamespace setVariable ["StoryLines",_texts];};
	}];
//};

if (isnil "SERVER") then {Hint "You must ADD a object named SERVER";Player Sidechat "You must ADD a object named SERVER";}else{
if (isServer) then {
if (!isnil ("COScomplete")) then {Hint "Check your call. COS was called twice!";}else{

COS_distance=500;//Set spawn distance
_aerielActivation=true;// Set if flying units can activate civilian Zones

blackListTowns = ["sagonisi"];// Remove towns from COS

whiteListMkrs=[];// Add Custom Markers for COS to populate 

DefaultSide = Civilian;// Set side of units spawned

_showMarker=false;// Show COS markers on map

showTownLabel = true;// Show town information when entering COS zones

debugCOS=false;// Show spawned units on the map

COSpedestrians=true; //Spawn pedestrians
COScars=true;// Spawn Cars
COSparked=true;// Spawn parked cars

// Types of units that will be spawned as civilians.
//COScivPool =["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F"];
COScivPool =["c_nikos","C_Orestes","C_man_p_fugitive_F","C_man_p_fugitive_F_euro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_p_beggar_F_afro","C_man_w_worker_F","C_man_polo_2_F","C_man_p_shorts_1_F"];	
COSmotPool =["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F"];

COSmaxGrps=72;//Set Maximum group limit for COS at any one time (If limit is hit then civilians will be placed into a single group for each town)

// Browse to line 81 to customise number of civilians that spawn.
private ["_sizeX","_sizeY","_name","_pos","_mSize","_rad","_civilians","_vehicles","_parked","_actCond"];
breakPatrol_FNC=compile preprocessFileLineNumbers "cos\patrolFnc.sqf";unitScript_FNC=compile preprocessFileLineNumbers "cos\addScript_Unit.sqf";vehScript_FNC=compile preprocessFileLineNumbers "cos\addScript_Vehicle.sqf";
COScomplete=false;publicvariable "COScomplete";publicvariable "COS_distance";populating_COS=false;
cosMkrArray=[];
server setvariable ["cosGrpCount",0];//Set global group count
_rad=50;// Radius increase increment for finding minimum spawn points
_slack=2;// Additional spawn points

{
// Organise towns and markers
	if (_x in whiteListMkrs)
	 then {
		_sizeX=getMarkerSize _x select 0;
		_sizeY=getMarkerSize _x select 1;
		_pos=markerpos _x;
		_name=markerText _x;// Get the markers description
			if (_name == "") then {_name= _x;};// If description is empty then use marker name
			deletemarker _x;// Delete user placed marker	
			
		}else{
	 _name = text _x;// Get name
	 _sizeX = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusA");
	 _sizeY = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusB");
	_pos=getpos _x;
			};
if (({_name==_x} count blackListTowns)>0 OR (_name == "")) then {}else{

			
// Scan for houses around the town area
	if (_sizeX < 50) then {_sizeX=300;};
	if (_sizeY < 50) then {_sizeY=300;};
	if (_sizeY>_sizeX) then {_mSize=_sizeY}else{_mSize=_sizeX};// Get the largest size
		_houses= count (nearestObjects [_pos, ["house"], _mSize]);// Count number of houses in town

		
// Customise population by number of houses
_randomisation=10;
	if (_houses <= 10) 
		then {
	_civilians=10+ round(random _randomisation);// Civilians spawned
	_vehicles=0;// Moving Vehicles Spawned
	_parked=1;// Parked Vehicles Spawned
			};		
 	if (_houses <= 30 and _houses > _randomisation) 
		then {
	_civilians=20+ round(random _randomisation);// Civilians spawned
	_vehicles=2;// Moving Vehicles Spawned
	_parked=2;// Parked Vehicles Spawned
			};
			
 	if (_houses <= 70 and _houses > 30) 
		then {
	_civilians=25+ round(random _randomisation);// Civilians spawned
	_vehicles=4;// Moving Vehicles Spawned
	_parked=2;// Parked Vehicles Spawned
			};
			
 	if (_houses <= 140 and _houses > 70) 
		then {
	_civilians=30+ round(random _randomisation);// Civilians spawned
	_vehicles=5;// Moving Vehicles Spawned
	_parked=3;// Parked Vehicles Spawned
			};
 	if (_houses > 140) 
		then {
	_civilians=40+ round(random _randomisation);// Civilians spawned
	_vehicles=5;// Moving Vehicles Spawned
	_parked=3;// Parked Vehicles Spawned
			};
			
 if (!COSpedestrians) then {_civilians=0;};	// If pedestrians disabled spawn 0
 if (!COScars) then {_vehicles=0;};// If cars disabled spawn 0
 if (!COSparked) then {_parked=0;};// If parked cars disabled spawn 0
 
 
// Create marker over town
	_markerID=format ["COSmkrID%1",_name];
		_foo = createmarker [_markerID, _pos];
		_foo setMarkerSize [_sizeX, _sizeY];
		_foo setMarkerShape "ELLIPSE";
		_foo setMarkerBrush "SOLID";
		_foo setMarkerColor "ColorGreen";
		_foo setMarkerText _name;
			cosMkrArray set [count cosMkrArray,_foo];
 if (!_showMarker) then {_foo setmarkerAlpha 0;}else{_foo setmarkerAlpha 0.5;};// Show or hide marker
	

// Get positions until we have enough for the population
 _roadlist = _pos nearRoads _mSize;
 _minPositions=(_civilians+_vehicles+_parked+_slack);
 if (count _roadlist < _minPositions) 
	then {
		while {count _roadlist < _minPositions} do 
			{
			_rad=_rad+_rad;
			_roadlist = _pos nearRoads (_mSize+_rad);
			sleep 0.1;
			};
		};
		
// Sort a position for each civilian
_roadPosArray = [];
_roadPosArray resize _minPositions;
_roadlist=_roadlist call BIS_fnc_arrayShuffle;

 for "_n" from 0 to _minPositions do
		{
     _roadPosArray set [_n, _roadlist select _n];
		};
	
// Save all information
	_information=[_civilians,_vehicles,_parked,_roadPosArray];
	_popVar=format["population%1",_foo];
	server setvariable [_popVar,_information];
		
// Create a trigger over town	
		_trigger = createTrigger ["EmptyDetector",_pos]; 
		_trigger setTriggerArea [(COS_distance+_sizeX),(COS_distance+_sizeY),0,FALSE]; 
		_trigger setTriggerActivation ["ANY","PRESENT",true];
		_trigger setTriggerTimeout [1, 1, 1, true];
			if _aerielActivation // Set whether units above 50m high will trigger
					then {
				_actCond="{vehicle _x in thisList && isplayer _x} count allunits > 0";
						}else{
					_actCond="{vehicle _x in thisList && isplayer _x && ((getPosATL _x) select 2) < 50} count allunits > 0";
						};
		_var=format["trig%1", _markerID];
		_trigAct=format ["null= [%1] execVM ""cos\cosCore.sqf"";server setvariable [%2,true];",str _foo,str _var];
		_trigDe=format ["server setvariable [%1,false];",str _var];
		_trigger setTriggerStatements [_actCond,_trigAct,_trigDe];
	};

}foreach (nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["NameCityCapital","NameCity","NameVillage","CityCenter"], 25000]) +whiteListMkrs;

// All towns have been saved into cos Marker Array.
SERVER setvariable ["COSmarkers",cosMkrArray,true];
COScomplete=true;publicvariable "COScomplete";
};

// LOCAL SCRIPTS
waituntil {COScomplete};
_mkrs=SERVER getvariable "COSmarkers";// Use this to get all town markers
null=[] execVM "COS\localScript.sqf";// This shows messages for players during multiplayer

};
};

_startpos = [BIS_CP_targetLocationPos, 300, (0 + random 90)] call BIS_fnc_relPos;

_civilianBuildingStart = nearestBuilding _startpos;

_grp = createGroup civilian;

placetwoSpots = 
{
_startpos = getpos _this;

_m1 = _grp createUnit ["ModuleCivilianPresenceSafeSpot_F", _startpos, [], 0, "NONE"];
_m1 setVariable ["#capacity",5];
_m1 setVariable ["#usebuilding",true];
_m1 setVariable ["#terminal",false];
_m1 setVariable ["#type",5];

_m2 = _grp createUnit ["ModuleCivilianPresenceUnit_F", _startpos, [], 0, "NONE"];

_endpos = [BIS_CP_targetLocationPos, 300, (180 + random 90)] call BIS_fnc_relPos;

_civilianBuildingEnd = nearestBuilding _endpos;

_m3 = _grp createUnit ["ModuleCivilianPresenceSafeSpot_F", _endpos, [], 0, "NONE"];
_m3 setVariable ["#capacity",5];
_m3 setVariable ["#usebuilding",true];
_m3 setVariable ["#terminal",false];
_m3 setVariable ["#type",5];
};

_civilianBuildingStart call placetwoSpots;

_cen = getpos _civilianBuildingStart;

_m = _grp createUnit ["ModuleCivilianPresence_F", [0,0,0], [], 0, "NONE"];

_m setVariable ["#area",[_cen,1000,1000,0,true,-1]];  // Fixed! this gets passed to https://community.bistudio.com/wiki/inAreaArray 

_m setVariable ["#debug",false]; // Debug mode on

_m setVariable ["#useagents",true];
_m setVariable ["#usepanicmode",false];

_m setVariable ["#unitcount",10];

action_interrogate = player addAction["Interrogate", { 
	0 = cursorTarget spawn interrogate
}, nil, 1.5, false, true, "", " 
	(alive cursorTarget && side cursorTarget == sideEnemy && {player distance cursorTarget < 3})
"];

directionText = {
    if ((_this > 22.5) && (_this <= 67.5)) exitWith {"NORTHEAST"};
    if ((_this > 67.5) && (_this <= 112.5)) exitWith {"EAST"};
    if ((_this > 112.5) && (_this <= 157.5)) exitWith {"SOUTHEAST"};
    if ((_this > 157.5) && (_this <= 202.5)) exitWith {"SOUTH"};
    if ((_this > 202.5) && (_this <= 247.5)) exitWith {"SOUTHWEST"};
    if ((_this > 247.5) && (_this <= 295.5)) exitWith {"WEST"};
    if ((_this > 295.5) && (_this <= 337.5)) exitWith {"NORTHWEST"};
    "NORTH"
};

interrogate = {
	if (random 100 > 1) exitWith {systemChat "I don't feel like talking..."};

    private "_enemy";
	_enemy = { if (side _x == east || side _x == independent) exitWith {_x}; objNull } forEach (_this nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"],1000] - [player]);
	if (isNull _enemy) exitWith {systemChat "I've seen no baddies recently"};

	systemChat format["There is a %1 group of enemies to the %2 of here",
		call {
            private "_n";
            _n = count units group _enemy;
            switch true do {
	            case (_n > 0): {"small"};
	            case (_n > 5): {"large"};
                case (_n > 8): {"massive"};              
                default "";
            }
        },
		([_this,_enemy] call BIS_fnc_dirTo) call directionText
	];
};

switch (side player) do 
{
	case WEST: // BLUFOR task notice goes here
		{
			0 = [] spawn {
			[player,["task1"],["Covert civilian interrogation","Covert civilian interrogation",""], BIS_CP_targetLocationPos ,1,2,true,"Infiltrate"] call BIS_fnc_taskCreate;
			["task1", "CREATED",true] spawn BIS_fnc_taskSetState;
			waitUntil{ ((missionNamespace getVariable "StoryLines") isEqualTo []) };
			["task1", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
//				Civilian setFriend [East, 1];
//				East setFriend [Civilian, 1];
//				Civilian setFriend [West, 1];
//				West setFriend [Civilian, 1];
//				Civilian setFriend [Resistance, 1];
//				Resistance setFriend [Civilian, 1];
			};

			waitUntil { sleep 1; (("task1" call BIS_fnc_taskState == "SUCCEEDED") isEqualTo true) };
							
			[player,["task2"],[format["Civil cooperation obtained by %1",name player],format["Civil cooperation obtained by %1",name player],""], BIS_CP_targetLocationPos,1,2,true,"Complete Objectives"] call BIS_fnc_taskCreate;
			["task2", "CREATED",true] spawn BIS_fnc_taskSetState;
			waitUntil{!(alive player)};
			["task2", "FAILED",true] spawn BIS_fnc_taskSetState;
		};
	case EAST: // OPFOR task notice goes here
		{ 
			0 = [] spawn {
			[player,["task1"],["Covert civilian interrogation","Covert civilian interrogation",""], BIS_CP_targetLocationPos ,1,2,true,"Infiltrate"] call BIS_fnc_taskCreate;
			["task1", "CREATED",true] spawn BIS_fnc_taskSetState;
			waitUntil{ ((missionNamespace getVariable "StoryLines") isEqualTo []) };
			["task1", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
//				Civilian setFriend [East, 1];
//				East setFriend [Civilian, 1];
//				Civilian setFriend [West, 1];
//				West setFriend [Civilian, 1];
//				Civilian setFriend [Resistance, 1];
//				Resistance setFriend [Civilian, 1];
			};

			waitUntil { sleep 1; (("task1" call BIS_fnc_taskState == "SUCCEEDED") isEqualTo true) };
							
			[player,["task2"],[format["Civil cooperation obtained by %1",name player],format["Civil cooperation obtained by %1",name player],""], BIS_CP_targetLocationPos,1,2,true,"Complete Objectives"] call BIS_fnc_taskCreate;
			["task2", "CREATED",true] spawn BIS_fnc_taskSetState;
			waitUntil{!(alive player)};
			["task2", "FAILED",true] spawn BIS_fnc_taskSetState;
		};
	case RESISTANCE: // RESISTANCE task notice goes here
		{ 
			0 = [] spawn {
			[player,["task1"],["Covert civilian interrogation","Covert civilian interrogation",""], BIS_CP_targetLocationPos ,1,2,true,"Infiltrate"] call BIS_fnc_taskCreate;
			["task1", "CREATED",true] spawn BIS_fnc_taskSetState;
			waitUntil{ ((missionNamespace getVariable "StoryLines") isEqualTo []) };
			["task1", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
//				Civilian setFriend [East, 1];
//				East setFriend [Civilian, 1];
//				Civilian setFriend [West, 1];
//				West setFriend [Civilian, 1];
//				Civilian setFriend [Resistance, 1];
//				Resistance setFriend [Civilian, 1];
			};

			waitUntil { sleep 1; (("task1" call BIS_fnc_taskState == "SUCCEEDED") isEqualTo true) };
							
			[player,["task2"],[format["Civil cooperation obtained by %1",name player],format["Civil cooperation obtained by %1",name player],""], BIS_CP_targetLocationPos,1,2,true,"Complete Objectives"] call BIS_fnc_taskCreate;
			["task2", "CREATED",true] spawn BIS_fnc_taskSetState;
			waitUntil{!(alive player)};
			["task2", "FAILED",true] spawn BIS_fnc_taskSetState;
		};
	case CIVILIAN: // CIVILIAN task notice goes here
		{ 
			0 = [] spawn {
			[player,["task1"],["Covert civilian spies!","Covert civilian spies!",""], BIS_CP_targetLocationPos ,1,2,true,"Caution!"] call BIS_fnc_taskCreate;
			["task1", "CREATED",true] spawn BIS_fnc_taskSetState;
			waitUntil{ ((missionNamespace getVariable "StoryLines") isEqualTo []) };
			["task1", "CANCELED",true] spawn BIS_fnc_taskSetState;
//				Civilian setFriend [East, 1];
//				East setFriend [Civilian, 1];
//				Civilian setFriend [West, 1];
//				West setFriend [Civilian, 1];
//				Civilian setFriend [Resistance, 1];
//				Resistance setFriend [Civilian, 1];
			};

			waitUntil { sleep 1; (("task1" call BIS_fnc_taskState == "CANCELED") isEqualTo true) };
					
			[player,["task2"],[format["Defend your location %1",name player],format["Defend your location %1",name player],""], BIS_CP_targetLocationPos,1,2,true,"Complete Objectives"] call BIS_fnc_taskCreate;
			["task2", "CREATED",true] spawn BIS_fnc_taskSetState;
			waitUntil{!(alive player)};
			["task2", "CANCELED",true] spawn BIS_fnc_taskSetState;
		};
};

_PCivilians = "PCivilians" call BIS_fnc_getParamValue;
	
if (_PCivilians isEqualTo 2) then {

	[playerSide, "HQ"] commandChat "Initiating Armed Civilians!";

	civilian_presence_module execVM "ParamsPlus\Civilian_Presense.sqf";

};





