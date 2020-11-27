/////  execVM "chosenHeadquarters.sqf" /////
//h = [] spawn {
	_exister = _this select 0;
	_radius = _this select 1;

	availableBuildings = [];
	
	//Create building markers
	{
		_markerName = format[ "marker_%1", _forEachIndex ];
		_marker = createMarkerLocal[ _markerName, position _x ];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTextLocal "";
		_marker setMarkerTypeLocal "loc_Tourism";
		_marker setMarkerSizeLocal[ 0.85, 0.85 ];
		_marker setMarkerColorLocal "ColorOrange";
	
		//Store building along with its marker
		private _nul = availableBuildings pushBack [ _x, _marker ];
//	} forEach ( [getPos _exister select 0, getPos _exister select 1, 0] nearObjects [ "House", _radius] );
	} forEach ( nearestObjects [_exister, [ "Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_01_b_white_F","Land_i_House_Small_01_b_yellow_F","Land_i_House_Small_01_b_brown_F"], _radius] );
	
	//Force open users map
	openMap[ true, false ];
  
	//Display user instruction
	hint "Double left click a marker to select headquarters";
	
	//Make sure map is open, before...
//	waitUntil{ !isNull findDisplay 12 };
	titleText["Map headquarters selection", "PLAIN"];
	waitUntil {uisleep 1; (!visiblemap OR (!isNull findDisplay 12))};
		if (isNull findDisplay 12) exitWith {
		missionNamespace setVariable[ "choosenBuilding", nil];
		hint parseText format["<t size='1.25' color='#ff6161'>Map headquarters selection canceled</t>"];
		};
			
	//Add event to map ctrl for when DblClicked
	CEH_MBDC = findDisplay 12 displayCtrl 51 ctrlAddEventHandler [ "MouseButtonDblClick", {
		params[ "_map", "_button", "_mouseX", "_mouseY" ];
		
		//If left mouse button
		if ( _button isEqualTo 0 ) then {
			
			//Get a copy of availableBuildings
			_buildings = +( missionNamespace getVariable "availableBuildings" );
			
			//Change each array item to [ distance, building, marker ]
			//Where distance is from mouse click
			_buildings = _buildings apply{
				_x params[ "_building", "_marker" ];
				
				[
					_building distanceSqr ( _map ctrlMapScreenToWorld[ _mouseX, _mouseY ] ),
					_building,
					_marker
				]
			};
			
			//Re-order to nearest first
			_buildings sort true;
			
			//Get nearest buildings vars
			_buildings select 0 params[ "_dist", "_building", "_marker" ];
			
			//Set choosen as [ building, marker ]
			missionNamespace setVariable[ "choosenBuilding", [ _building, _marker ] ];
			
			//Set selected buildings marker as Green
			_marker setMarkerColorLocal "ColorGreen";
			
			playSound "BIS_WL_Selected_WEST";
						
			//Delete all other markers
			{
				_x params[ "", "", "_marker" ];
				deleteMarkerLocal _marker;
			} forEach ( _buildings select[ 1, count _buildings ] );
			
			//Remove this event
			_map ctrlRemoveEventHandler[ "MouseButtonDblClick", CEH_MBDC ];
		};
	}];
	
	//Wait for selection
	waitUntil { !isNil "choosenBuilding" };
	openMap[ false, false ];
	hint parseText format["<t size='1.25' color='#44ff00'>Map headquarters selection successful</t>"];
	uisleep 5;	
	//Remove hint
	hint "";
	
	//Close map
//	openMap[ false, false ];
//	_chosenBuilding = missionNamespace getVariable "choosenBuilding";
//	_building = _chosenBuilding select 0;
//	_marker = _chosenBuilding select 1;
//	
//	player setPos getMarkerPos _marker;
//	hint format ["%1,%2",_building,_marker];
//};

