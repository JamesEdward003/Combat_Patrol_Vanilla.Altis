////////		"paramsplus\terminal.sqf"		////////
private ["_terminalclass", "_marker", "_object"];

_object = _this select 0;
_marker = createMarkerLocal ["uav",position _object]; 
_marker setMarkerShapeLocal "ICON"; 
_marker setMarkerTypeLocal "n_uav";

_terminalclass = [];

switch (side player) do {
case WEST: {_terminalclass = "B_UavTerminal";};
case EAST: {_terminalclass = "O_UavTerminal";};
case INDEPENDENT: {_terminalclass = "I_UavTerminal";};
};
if("ItemGPS" in assignedItems player OR "ItemGPS" in items player) then 
{
player unassignitem "ItemGPS";
player removeItem "ItemGPS";
};
if(!(_terminalclass in assignedItems player)) then 
{
player addWeapon _terminalclass;
player assignItem _terminalclass;
player addItem _terminalclass;
};

//WaitUntil {!isNull uavbp};
//if (_terminalclass in assignedItems player) then 
//{
//player action ["UAVTerminalOpen", player];
//};

WaitUntil {(player distance (getMarkerPos _marker) > 10) || (!alive player)};
if (_terminalclass in assignedItems player) then 
{
player unassignitem _terminalclass;
player removeItem _terminalclass;
player removeWeapon _terminalclass;
deleteMarker "uav";
deleteVehicle uavbp;
};
if (!("ItemGPS" in assignedItems player) OR !("ItemGPS" in items player)) then 
{
player addWeapon "ItemGPS";
player addItem "ItemGPS";
player assignItem "ItemGPS";
};
