//////     [player] execVM "paramsplus\rallyPoint.sqf";    ///////
//(_this select 0) addEventHandler ["Respawn",{(_this select 0) execVM "paramsplus\rallyPoint.sqf"}];
_unit = _this;
_actions = actionIDs _unit;
_array = [];

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\rallyPoint.sqf";
}];

_unit addEventHandler ["WeaponAssembled", { (_this select 1) setCaptive true;(_this select 1) allowDamage false }];

for [{_i= (count _actions)-1},{_i>-1},{_i=_i-1}] do {
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
	case RESISTANCE: {"respawn_guer" setMarkerPos (_this modeltoworld [0,3,_height]);	
	 respawn_guer setPos (_this modeltoworld [0,3,_height]);};	
	case CIVILIAN: {"respawn_civilian" setMarkerPos (_this modeltoworld [0,3,_height]);	
	 respawn_civilian setPos (_this modeltoworld [0,3,_height]);}; 
	};
	
	_uavbpclass = [];
	switch (side _this) do {
	case WEST: {_uavbpclass = "B_UAV_01_backpack_F";};
	case EAST: {_uavbpclass = "O_UAV_01_backpack_F";};
	case RESISTANCE: {_uavbpclass = "I_UAV_01_backpack_F";};
	case CIVILIAN: {_uavbpclass = "C_IDAP_UAV_01_backpack_F";};
	};

	_nos = nearestObjects [_this, ["GroundWeaponHolder_Scripted"], 10];
	uisleep 0.1;
			
	if (count _nos > 0) then {
	{clearBackpackCargoGlobal _x; deleteVehicle _x;} forEach _nos;
	if (getMarkerType "uav" == "n_uav") then {deleteMarker "uav"};
};
	uisleep 0.1;
	_location = _this modelToWorld [0,2,_height];
	_this playMove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon_Putdown";
	uisleep 0.5;
	uavbp = "GroundWeaponHolder_Scripted" createVehicle _location;
	uavbp setVehiclePosition [_this modelToWorld [0,2,_height], [], 0, "CAN_COLLIDE"];
	uisleep 0.1;
	uavbp addBackpackCargoGlobal [_uavbpclass, 1];
	uisleep 0.1;
//	_this action ['AddBag', (nearestObject [_this, 'GroundWeaponHolder']), typeOf firstBackpack (nearestObject [_this, 'GroundWeaponHolder'])];

//	_this addAction ["<t color='#40e0d0'>Take Pack</t>","params ['_target','_caller']; _target action ['AddBag', (nearestObject [_target, 'GroundWeaponHolder']), typeOf firstBackpack (nearestObject [_target, 'WeaponHolder'])];","",10,false,true,"","_this distance _target<10"];
	
	uisleep 0.1;
	[uavbp] execVM "ParamsPlus\terminal.sqf";
	uisleep 0.1;
	uavbp addAction ["<t color='#40e0d0'>Recruit Units</t>","bon_recruit_units\open_dialog.sqf",[],10,false,true,"","_this distance _target<10"];
	
		switch true do 
		{
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) != -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>RallyPoint set with group members closer than 25m and no enemies closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) != -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} != -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>RallyPoint set with group members closer than 25m and enemies closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) == -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>RallyPoint set with no members closer than 25m and no enemies closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) == -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} != -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>RallyPoint set with no members closer than 25m and enemies closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		};
	/*
	switch true do 
		{
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) > -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>Rallypoint set with group members farther than 25m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) > -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} > -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>Rallypoint set with enemy closer than 50m, </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		case (_this == leader group _this && {((units group _this) findIf {_x distance _this < 25}) > -1} && { allUnits findIf {side _x getFriend side _this <0.6 && _x distance _this < 50} == -1}): {hintSilent parsetext format ["<t size='0.85' color='#00bbff' align='left'>Rallypoint placed for: </t><t size='0.85' color='#00bbff' align='left'> %1</t>", name _this];};
		};	
	*/
	};
	},
  	[],
  	10,
  	false,
  	true,
  	"",
  	"isNull objectParent _this",
  	-1,
  	true,
  	"",
  	""];
};

if (isPlayer _unit) then {

	[playerSide, "HQ"] commandChat "RallyPoint Adjustments Done!";

};
	
			