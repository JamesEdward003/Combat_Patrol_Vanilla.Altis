//________________	Author : GEORGE FLOROS [GR]	___________	20.06.19	_____________ 


/*
________________ GF VSpawner Script - Mod	________________



Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


/*
To use the script add this code to the init field of an object :
	nul = this spawn {waitUntil {!isNil "GF_VSpawner"}; call GF_VSpawner;};
*/


//________________ Settings ________________
//________________ Set true or false  ________________

GF_VSpawner_Systemchat_info				= true;		
GF_VSpawner_Hintsilent_info				= true;
GF_VSpawner_diag_log_info				= true;
GF_VSpawner_Max_distance				= 100;



if(GF_VSpawner_Systemchat_info)then{
	systemchat "GF VSpawner Script initializing";			
};	

if(GF_VSpawner_diag_log_info)then{
	diag_log "//________________ GF VSpawner Script initializing ________________";
};




GF_VSpawner_Closed = {

	_nearestObjects = BIS_fnc_garage_center nearEntities [["Car","Tank","Ship","Air"], 1];
	if(!isNil "_nearestObjects")then{
		_Object = selectrandom _nearestObjects;
		_veh = typeOf _Object;
		_textures = getObjectTextures _Object;
		_animationNames = animationNames _Object;
		{deletevehicle _x}forEach _nearestObjects;
		_position = GF_VSpawner_pos findEmptyPosition [10,GF_VSpawner_Max_distance,_veh];
		_createVehicle = createVehicle [_veh, _position, [], 0, "None"];
	
		if(count _textures > 0)then{
			_count = 0;
			{
				_createVehicle setObjectTextureglobal[_count,_x];
				_count = _count + 1;
			}forEach _textures;
		};
		
		if(count _animationNames > 0)then{
			_animationPhase = [];
			for '_i' from 0 to count _animationNames -1 do{
				_animationPhase pushBack[_animationNames select _i,_Object animationPhase(_animationNames select _i)];
				{_createVehicle animate _x}forEach _animationPhase;
			};
		};
	};
};


[missionNamespace, "garageClosed",{
	[]call GF_VSpawner_Closed;
}]call BIS_fnc_addScriptedEventHandler;


GF_VSpawner	= {

	[_this,[
		"<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Open Spawner",
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
	  GF_VSpawner_pos = [getPos _target, 1, GF_VSpawner_Max_distance, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	  BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", GF_VSpawner_pos, [], 0, "CAN_COLLIDE"];
	  ["Open",true] call BIS_fnc_garage; createVehicleCrew 
		},[], 1.5,true,true,"","true",8,false,"",""
	]]remoteExec["addAction"];
};


if(GF_VSpawner_Systemchat_info)then{
	systemchat "GF VSpawner Script initialized";			
};	

if(GF_VSpawner_diag_log_info)then{
	diag_log "//________________ GF VSpawner Script initialized ________________";
};

player call GF_VSpawner;


