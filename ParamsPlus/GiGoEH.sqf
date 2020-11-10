///////		[this] execVM GiGoEH.sqf"	  ////////
//	params ["_unit", "_role", "_vehicle", "_turret"];  //
_unit = _this;

switch (side _unit) do
{
	case WEST:	{

_unit addEventHandler ["GetInMan",{
	(_this select 0) setDamage 0; 
	(_this select 0) allowDamage false; 
	(_this select 2) setDamage 0; 
	(_this select 2) allowDamage false; 
	if ((_this select 0) isEqualTo (leader group (_this select 0))) then {
	ammobox1 hideObjectGlobal true;}}]; 
	
_unit addEventHandler ["GetOutMan",{
	(_this select 0) allowDamage true; 
	if ((_this select 0) isEqualTo (leader group (_this select 2))) then {
	_pos = [(_this select 0), 4, 50, 3, 0, 20, 1] call BIS_fnc_findSafePos; 
	"respawn_west" setMarkerPos _pos; 
	respawn_west setPos _pos; 
	ammobox1 setPos _pos; 
	ammobox1 hideObjectGlobal false;}}];
	
};

	case EAST:	{

_unit addEventHandler ["GetInMan",{
	(_this select 0) setDamage 0; 
	(_this select 0) allowDamage false; 
	(_this select 2) setDamage 0; 
	(_this select 2) allowDamage false; 
	if ((_this select 0) isEqualTo (leader group (_this select 0))) then {
	ammobox2 hideObjectGlobal true;}}]; 
	
_unit addEventHandler ["GetOutMan",{
	(_this select 0) allowDamage true; 
	if ((_this select 0) isEqualTo (leader group (_this select 2))) then {
	_pos = [(_this select 0), 4, 50, 3, 0, 20, 1] call BIS_fnc_findSafePos; 
	"respawn_east" setMarkerPos _pos; 
	respawn_east setPos _pos; 
	ammobox2 setPos _pos; 
	ammobox2 hideObjectGlobal false;}}];
	
};

	case RESISTANCE:	{

_unit addEventHandler ["GetInMan",{
	(_this select 0) setDamage 0; 
	(_this select 0) allowDamage false; 
	(_this select 2) setDamage 0; 
	(_this select 2) allowDamage false; 
	if ((_this select 0) isEqualTo (leader group (_this select 0))) then {
	ammobox3 hideObjectGlobal true;}}]; 
	
_unit addEventHandler ["GetOutMan",{
	(_this select 0) allowDamage true; 
	if ((_this select 0) isEqualTo (leader group (_this select 2))) then {
	_pos = [(_this select 0), 4, 50, 3, 0, 20, 1] call BIS_fnc_findSafePos; 
	"respawn_guer" setMarkerPos _pos; 
	respawn_guer setPos _pos; 
	ammobox3 setPos _pos; 
	ammobox3 hideObjectGlobal false;}}];
	
};

	case CIVILIAN:	{

_unit addEventHandler ["GetInMan",{
	(_this select 0) setDamage 0; 
	(_this select 0) allowDamage false; 
	(_this select 2) setDamage 0; 
	(_this select 2) allowDamage false; 
	if ((_this select 0) isEqualTo (leader group (_this select 0))) then {
	ammobox4 hideObjectGlobal true;}}]; 
	
_unit addEventHandler ["GetOutMan",{
	(_this select 0) allowDamage true; 
	if ((_this select 0) isEqualTo (leader group (_this select 2))) then {
	_pos = [(_this select 0), 4, 50, 3, 0, 20, 1] call BIS_fnc_findSafePos; 
	"respawn_civilian" setMarkerPos _pos; 
	respawn_civilian setPos _pos; 
	ammobox4 setPos _pos; 
	ammobox4 hideObjectGlobal false;}}];
	
};

};

_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\GiGoEH.sqf";
}];


