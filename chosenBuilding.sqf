/////  execVM "chosenBuilding.sqf" /////
h = [] spawn {
	
	_worldRadius = worldSize / 2;
	titleText [format ["%1",_worldRadius],"plain down"];
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
	} forEach ( [ _worldRadius, _worldRadius, 0 ] nearObjects [ "Land_i_House_Small_03_V1_F", _worldRadius * 1.4142 ] );
	
	//Force open users map
	openMap[ true, true ];
  
	//Display user instruction
	hint "Double left click a marker to select base location";
	
	//Make sure map is open, before...
	waitUntil{ !isNull findDisplay 12 };
	
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
	
	//Remove hint
	hint "";
	
	//Close map
	openMap[ false, false ];
	
//	player setPos getMarkerPos _marker;
};

