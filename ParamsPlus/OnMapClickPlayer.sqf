//////////////////////////////////////////////////////////////////
//Get mouse clicks "OnMapClickPlayer.sqf";
_unit = _this select 0;
uisleep 1;
openMap true;
uisleep 1;
titleText ["Indicate destination on map-click","PLAIN DOWN"];
deleteMarker "dest";
dt=true;
onMapSingleClick "dest = _pos;dt=false";
waitUntil {!dt};	
onMapSingleClick "";

	_mrkrcolor 	= [];
	switch (side _unit) do {

	         case west:		{_mrkrcolor = "ColorBlue"};
	         case east:		{_mrkrcolor = "ColorRed"};
	         case resistance:	{_mrkrcolor = "ColorGreen"};
	         case civilian:	{_mrkrcolor = "ColorYellow"};
	};
	_mrkr = createMarkerLocal ["dest", dest];
	_mrkr setMarkerShape "ICON";
	_mrkr setMarkerColor _mrkrcolor;
	_mrkr setMarkerSize [.75,.75];
	_mrkr setMarkerType "mil_objective";
	_mrkr setMarkerText "destination";

	uisleep 2;
	openMap false;
	uisleep 2;	
	
_unit setPos getMarkerPos "dest";
		
