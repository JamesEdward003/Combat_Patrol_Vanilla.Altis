//////     [player] execVM "paramsplus\rallyPoint.sqf";    ///////
//(_this select 0) addEventHandler ["Respawn",{(_this select 0) execVM "paramsplus\rallyPoint.sqf"}];
_unit = _this select 0;
_actions = actionIDs _unit;
_array = [];

_unit addEventHandler ["Respawn",{_this execVM "paramsplus\rallyPoint.sqf"}];

_unit addEventHandler ["WeaponAssembled", { (_this select 1) allowDamage false }];

for 	[{_i= (count _actions)-1},{_i>-1},{_i=_i-1}]
do 	{
	_params = _unit actionParams (_actions select _i);
	_array = _array + [(_params select 0)];
	};

if !(("<t color='#00FFFF'>Deploy Rally Point</t>") in _array) then {

Rally_Point = _unit addAction ["<t color='#00FFFF'>Deploy Rally Point</t>", {(_this select 0) call
{

//	_height = ((getPosASLW _this) select 2);
	_height = ((getPosATLVisual _this) select 2);

	switch (side _this) do {		
	case WEST: {"respawn_west" setMarkerPos (_this modeltoworld [0,3,_height]);	
	 respawn_west setPos (_this modeltoworld [0,3,_height]);};
	case EAST: {"respawn_east" setMarkerPos (_this modeltoworld [0,3,_height]);	
	 respawn_east setPos (_this modeltoworld [0,3,_height]);};	 
	case INDEPENDENT: {"respawn_guerrila" setMarkerPos (_this modeltoworld [0,3,_height]);	
	 respawn_guerrila setPos (_this modeltoworld [0,3,_height]);};	
	case CIVILIAN: {"respawn_civilian" setMarkerPos (_this modeltoworld [0,3,_height]);	
	 respawn_civilian setPos (_this modeltoworld [0,3,_height]);}; 
	};
	
	_uavbpclass = [];
	switch (side _this) do {
	case WEST: {_uavbpclass = "B_UAV_01_backpack_F";};
	case EAST: {_uavbpclass = "O_UAV_01_backpack_F";};
	case INDEPENDENT: {_uavbpclass = "I_UAV_01_backpack_F";};
	};

	_nos = nearestObjects [_this, ["GroundWeaponHolder_Scripted"], 10];
	uisleep 0.1;
//	hint format ["%1",count _nos];
			
	if (count _nos > 0) then {
	{clearBackpackCargoGlobal _x; deleteVehicle _x;} forEach _nos;
	if (getMarkerType "uav" == "n_uav") then {deleteMarker "uav"};
};
	uisleep 0.1;
	_location = _this modelToWorld [0,1.25,_height];
	_this playMove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon_Putdown";
	uisleep 0.3;
	uavbp = "GroundWeaponHolder_Scripted" createVehicle _location;
//	uavbp = createVehicle ["GroundWeaponHolder_Scripted", _location, [], 0, "CAN_COLLIDE"];
	uavbp setVehiclePosition [_this modelToWorld [0,1.25,_height], [], 0, "CAN_COLLIDE"];

	uisleep 0.1;
	uavbp addBackpackCargoGlobal [_uavbpclass, 1];
	uisleep 0.1;
	[uavbp] execVM "ParamsPlus\terminal.sqf";
	uavbp addAction ["<t color='#40e0d0'>Recruit Units</t>","bon_recruit_units\open_dialog.sqf",[],10,false,true,"","_this distance _target<10"];
	
	switch true do 
		{
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) > -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>Rallypoint set with group members farther than 25m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) > -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} > -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>Rallypoint set with enemy closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) > -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>Rallypoint placed for: </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		};	
	};
	},
  	[],
  	-10,
  	false,
  	true,
  	"",
  	"isNull objectParent _this",
  	-1,
  	true,
  	"",
  	""];
};
  
//private _future = time + 20;
//waitUntil { time >= _future };

// hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>Rallypoint placement available for: </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];
// _this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) > -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}    
//_location = _this modelToWorld [0,1.25,_height];
//_this playMove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon_Putdown";
//uisleep 0.3;
//uavbp = "GroundWeaponHolder_Scripted" createVehicle _location;
//uavbp setVehiclePosition [_this modelToWorld [0,1.25,_height], [], 0, "CAN_COLLIDE"];
//uavbp setPosWorld getPosWorld uavbp;
//uisleep 0.1;
//uavbp addBackpackCargoGlobal [_uavbpclass, 1];
//uisleep 0.1;
//[uavbp] execVM "terminal.sqf";
//uavbp addAction ["<t color='#40e0d0'>Recruit Units</t>","bon_recruit_units\open_dialog.sqf",[],99,false,true,"","_this distance _target<10"];	
//hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>Rallypoint placed for: </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];











//	switch (side _this) do {		
//	case WEST: {"respawn_west" setMarkerPos (_this modeltoworld [0,3,_height]);	
//	 respawn_west setPos (_this modeltoworld [0,3,_height]);};
//	case EAST: {"respawn_east" setMarkerPos (_this modeltoworld [0,3,_height]);	
//	 respawn_east setPos (_this modeltoworld [0,3,_height]);};
//	case INDEPENDENT: {"respawn_guer" setMarkerPos (_this modeltoworld [0,3,_height]);	
//	 respawn_guer setPos (_this modeltoworld [0,3,_height]);};	 
//	};
	
	
	
	
	
	
	
	
	
	
			