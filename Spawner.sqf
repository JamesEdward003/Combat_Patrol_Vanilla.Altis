// "Spawner.sqf" //

Spawner_Systemchat_info				= true;		
Spawner_Hintsilent_info				= true;
Spawner_diag_log_info				= true;
Spawner_Max_distance				= 100;



if(Spawner_Systemchat_info)then{
	systemchat "Spawner Script initializing";			
};	

if(Spawner_diag_log_info)then{
	diag_log "//________________ Spawner Script initializing ________________";
};




Spawner_Closed = {

	_nearestObjects = BIS_fnc_garage_center nearEntities [["Car","Tank","Ship","Air"], 1];
	if(!isNil "_nearestObjects")then{
		_Object = selectrandom _nearestObjects;
		_veh = typeOf _Object;
		_textures = getObjectTextures _Object;
		_animationNames = animationNames _Object;
		{deletevehicle _x}forEach _nearestObjects;
		_position = Spawner_pos findEmptyPosition [10,Spawner_Max_distance,_veh];
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
	[]call Spawner_Closed;
}]call BIS_fnc_addScriptedEventHandler;


Spawner	= {

	[_this,[
		"<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Open Spawner",
		{ 
			params ["_target", "_caller", "_actionId", "_arguments"];
	  Spawner_pos = [getPos _target, 1, Spawner_Max_distance, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	  BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", Spawner_pos, [], 0, "CAN_COLLIDE"];
	  ["Open",true] call BIS_fnc_garage; createVehicleCrew 
		},[], 1.5,true,true,"","true",8,false,"",""
	]]remoteExec["addAction"];
};


if(Spawner_Systemchat_info)then{
	systemchat "Spawner Script initialized";			
};	

if(Spawner_diag_log_info)then{
	diag_log "//________________ Spawner Script initialized ________________";
};

player call Spawner;


