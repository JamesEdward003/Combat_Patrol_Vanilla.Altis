//////	[player] execVM "ParamsPlus\playerSettings.sqf";	//////
private ["_player","_pskill","_prespawnloadout","_pdiverequip","_ploadout","_pua","_pnightvision","_psilencers","_pmarkers","_pregenhealth","_paimedic","_pgigoeh","_prallypoint","_puavhacker","_pengineer","_pexplspec","_pmedic","_precoil","_psway","_ploadcoef","_paudiblecoef","_pcamocoef","_psettings"];
_player = _this select 0;

_puavhacker	= paramsArray select 27;
_pengineer	= paramsArray select 28;
_pexplspec	= paramsArray select 29;
_pmedic		= paramsArray select 30;
_precoil 	= paramsArray select 31;
_psway   	= paramsArray select 32;
_ploadcoef	= paramsArray select 33;
_paudible	= paramsArray select 34;
_pcamocoef	= paramsArray select 35;
_psettings	= paramsarray select 36;

_PSkill = _player execVM "ParamsArray\GF_AiSkill.sqf";

PUAVHacker = "PUAVHacker" call BIS_fnc_getParamValue;
	switch (PUAVHacker) do
	{
		case 1: {_puavhacker = false};
		case 2: {_puavhacker = true};
	};
	_player setUnitTrait ["UAVHacker",_puavhacker];

PEngineer = "PEngineer" call BIS_fnc_getParamValue;
	switch (PEngineer) do
	{
		case 1: {pengineer = false};
		case 2: {pengineer = true};
	};
	_player setUnitTrait ["Engineer",pengineer];

	switch (_pexplspec) do
	{
		case 1: {pexplspec = false};
		case 2: {pexplspec = true};
	};
	_player setUnitTrait ["ExplosiveSpecialist",pexplspec];

	switch (_pmedic) do
	{
		case 1: {pmedic = false};
		case 2: {pmedic = true};
	};
	_player setUnitTrait ["Medic",pmedic];
	
	switch (_precoil) do
	{
		case 1: {precoil = 0.10};
		case 2: {precoil = 0.40};
		case 3: {precoil = 0.70};
		case 4: {precoil =    1};
	};	 
	_player setUnitRecoilCoefficient precoil;

	switch (_psway) do
	{
		case 1: {psway = 0.10};
		case 2: {psway = 0.40};
		case 3: {psway = 0.70};
		case 4: {psway =    1};
	};	 
	_player setCustomAimCoef psway;

	switch (_ploadcoef) do
	{
		case 1: {ploadcoef = 0.10};
		case 2: {ploadcoef = 0.40};
		case 3: {ploadcoef = 0.70};
		case 4: {ploadcoef =    1};
	};	 
	_player setUnitTrait ["loadCoef",ploadcoef];

	switch (_paudible) do
	{
		case 1: {paudiblecoef = 0.10};
		case 2: {paudiblecoef = 0.40};
		case 3: {paudiblecoef = 0.70};
		case 4: {paudiblecoef =    1};
	};	 
	_player setUnitTrait ["audibleCoef",paudiblecoef];
	
	switch (_pcamocoef) do
	{
		case 1: {pcamocoef = 0.10};
		case 2: {pcamocoef = 0.40};
		case 3: {pcamocoef = 0.70};
		case 4: {pcamocoef =    1};
	};	 
	_player setUnitTrait ["camouflageCoef",pcamocoef];


private _future = time + 5;
waitUntil { time >= _future };

_player setUnitTrait ["UAVHacker",puavhacker];
_player setUnitTrait ["Engineer",pengineer];
_player setUnitTrait ["ExplosiveSpecialist",pexplspec];
_player setUnitTrait ["Medic",pmedic];
_player setUnitRecoilCoefficient precoil;
_player setCustomAimCoef psway;
_player setUnitTrait ["loadCoef",ploadcoef];
_player setUnitTrait ["audibleCoef",paudiblecoef];
_player setUnitTrait ["camouflageCoef",pcamocoef];

_player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

	[_unit] execVM "ParamsPlus\playerSettings.sqf";

}];

if (isPlayer _player) then {

[playerSide, "HQ"] commandChat format ["%1, Player Settings Installed!",name _player];

};

