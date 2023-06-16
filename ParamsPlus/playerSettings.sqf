//////	_player execVM "ParamsPlus\playerSettings.sqf";	//////
private ["_player","_pskill","_puavhacker","_pengineer","_pexplspec","_pmedic","_precoil","_psway","_pstamina","_pload","_paudible","_pcamo","_psettings"];
_player = _this;

waitUntil { !(isNil {_player getVariable "LoadoutDone"}) };

private _future = time + 1;
waitUntil { time >= _future };

_puavhacker	= paramsArray select 34;
_pengineer	= paramsArray select 35;
_pexplspec	= paramsArray select 36;
_pmedic		= paramsArray select 37;
_precoil 	= paramsArray select 38;
_psway   	= paramsArray select 39;
_pstamina	= paramsArray select 40;
_pload		= paramsArray select 41;
_paudible	= paramsArray select 42;
_pcamo		= paramsArray select 43;

	switch (_puavhacker) do
	{
		case 1: {_puavhacker = false};
		case 2: {_puavhacker = true};
	};
	_player setUnitTrait ["UAVHacker",_puavhacker];

	switch (_pengineer) do
	{
		case 1: {_pengineer = false};
		case 2: {_pengineer = true};
	};
	_player setUnitTrait ["Engineer",_pengineer];

	switch (_pexplspec) do
	{
		case 1: {_pexplspec = false};
		case 2: {_pexplspec = true};
	};
	_player setUnitTrait ["ExplosiveSpecialist",_pexplspec];

	switch (_pmedic) do
	{
		case 1: {_pmedic = false};
		case 2: {_pmedic = true};
	};
	_player setUnitTrait ["Medic",_pmedic];
	
	switch (_precoil) do
	{
		case 1: {_precoil = 0.10};
		case 2: {_precoil = 0.40};
		case 3: {_precoil = 0.70};
		case 4: {_precoil =    1};
	};	 
	_player setUnitRecoilCoefficient _precoil;

	switch (_psway) do
	{
		case 1: {_psway = 0.10};
		case 2: {_psway = 0.40};
		case 3: {_psway = 0.70};
		case 4: {_psway =    1};
	};	 
	_player setCustomAimCoef _psway;

	switch (_pstamina) do
	{
		case 1: {_pstamina = false};
		case 2: {_pstamina = true};
	};
	_player enableStamina  _pstamina;
	
	switch (_pload) do
	{
		case 1: {_pload = 0.10};
		case 2: {_pload = 0.40};
		case 3: {_pload = 0.70};
		case 4: {_pload =    1};
	};	 
	_player setUnitTrait ["loadCoef",_pload];

	switch (_paudible) do
	{
		case 1: {_paudible = 0.10};
		case 2: {_paudible = 0.40};
		case 3: {_paudible = 0.70};
		case 4: {_paudible =    1};
	};	 
	_player setUnitTrait ["audibleCoef",_paudible];
	
	switch (_pcamo) do
	{
		case 1: {_pcamo = 0.10};
		case 2: {_pcamo = 0.40};
		case 3: {_pcamo = 0.70};
		case 4: {_pcamo =    1};
	};	 
	_player setUnitTrait ["camouflageCoef",_pcamo];
	
_player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

	_unit execVM "ParamsPlus\playerSettings.sqf";

}];

if (isPlayer _player) then {

[playerSide, "HQ"] commandChat format ["%1, Player Settings Installed!",name _player];

};

//waitUntil {(!isNull _player) and (alive _player)};

//while {true} do 
//{
//_player enableFatigue false;
//uiSleep 1;
//};


