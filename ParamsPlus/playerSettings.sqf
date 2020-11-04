//////	[player] execVM "ParamsPlus\playerSettings.sqf";	//////
private ["_player","_puavhacker","_pengineer","_pexplspec","_pmedic","_precoil","_psway","_ploadcoef","_paudiblecoef","_pcamocoef","_psettings"];
_player = _this select 0;
//[1,1,1,1,0,20,0,1,-1,1,0,0,0,3,3,1,2,1,2,1,2,2,2,3,1,1,2,1,1,1,2,1,1,4,4,4,2]
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

if (isNil "puavhacker") then
{	
	switch (_puavhacker) do
	{
		case 1: {puavhacker = false};
		case 2: {puavhacker = true};
	};
	_player setUnitTrait ["UAVHacker",puavhacker];
	publicvariable "puavhacker";
};
if (isNil "pengineer") then
{	
	switch (_pengineer) do
	{
		case 1: {pengineer = false};
		case 2: {pengineer = true};
	};
	_player setUnitTrait ["Engineer",pengineer];
	publicvariable "pengineer";
};
if (isNil "pexplspec") then
{	
	switch (_pexplspec) do
	{
		case 1: {pexplspec = false};
		case 2: {pexplspec = true};
	};
	_player setUnitTrait ["ExplosiveSpecialist",pexplspec];
	publicvariable "pexplspec";
};
if (isNil "pmedic") then
{	
	switch (_pmedic) do
	{
		case 1: {pmedic = false};
		case 2: {pmedic = true};
	};
	_player setUnitTrait ["Medic",pmedic];
	publicvariable "pmedic";
};
if (isNil "precoil") then
{	
	switch (_precoil) do
	{
		case 1: {precoil = 0.10};
		case 2: {precoil = 0.40};
		case 3: {precoil = 0.70};
		case 4: {precoil =    1};
	};	 
	_player setUnitRecoilCoefficient precoil;
	publicvariable "precoil";
};
if (isNil "psway") then
{	
	switch (_psway) do
	{
		case 1: {psway = 0.10};
		case 2: {psway = 0.40};
		case 3: {psway = 0.70};
		case 4: {psway =    1};
	};	 
	_player setCustomAimCoef psway;
	publicvariable "psway";
};
if (isNil "ploadcoef") then
{	
	switch (_ploadcoef) do
	{
		case 1: {ploadcoef = 0.10};
		case 2: {ploadcoef = 0.40};
		case 3: {ploadcoef = 0.70};
		case 4: {ploadcoef =    1};
	};	 
	_player setUnitTrait ["loadCoef",ploadcoef];
	publicvariable "ploadcoef";
};
if (isNil "Paudiblecoef") then
{	
	switch (_paudible) do
	{
		case 1: {paudiblecoef = 0.10};
		case 2: {paudiblecoef = 0.40};
		case 3: {paudiblecoef = 0.70};
		case 4: {paudiblecoef =    1};
	};	 
	_player setUnitTrait ["audibleCoef",paudiblecoef];
	publicvariable "paudiblecoef";
};
if (isNil "pcamocoef") then
{	
	switch (_pcamocoef) do
	{
		case 1: {pcamocoef = 0.10};
		case 2: {pcamocoef = 0.40};
		case 3: {pcamocoef = 0.70};
		case 4: {pcamocoef =    1};
	};	 
	_player setUnitTrait ["camouflageCoef",pcamocoef];
	publicvariable "pcamocoef";
};

if (!isDedicated) then
{
	waitUntil {!isNil "puavhacker"};
	waitUntil {!isNil "pengineer"};
	waitUntil {!isNil "pexplspec"};
	waitUntil {!isNil "pmedic"};
	waitUntil {!isNil "precoil"};
	waitUntil {!isNil "psway"};
	waitUntil {!isNil "ploadcoef"};
	waitUntil {!isNil "paudiblecoef"};
	waitUntil {!isNil "pcamocoef"};
};

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

//_player addEventHandler ["Respawn", {
//	params ["_unit", "_corpse"];

//	_puavhacker	= paramsArray select 27;
//	_pengineer	= paramsArray select 28;
//	_pexplspec	= paramsArray select 29;
//	_pmedic		= paramsArray select 30;	
//	_precoil 	= paramsArray select 31;
//	_psway   	= paramsArray select 32;
//	_ploadcoef	= paramsArray select 33;
//	_paudible	= paramsArray select 34;
//	_pcamocoef	= paramsArray select 35;

//	_unit setUnitTrait ["UAVHacker",puavhacker];
//	_unit setUnitTrait ["Engineer",pengineer];
//	_unit setUnitTrait ["ExplosiveSpecialist",pexplspec];
//	_unit setUnitTrait ["Medic",pmedic];
//	_unit setUnitRecoilCoefficient precoil;
//	_unit setCustomAimCoef psway;
//	_unit setUnitTrait ["loadCoef",ploadcoef];
//	_unit setUnitTrait ["audibleCoef",paudible];
//	_unit setUnitTrait ["camouflageCoef",pcamocoef];

//	if (isPlayer _unit) then {

//	[playerSide, "HQ"] commandChat format ["%1, Player Settings installed!",name _unit];

//	};

//}];

if (isPlayer _player) then {

[playerSide, "HQ"] commandChat format ["%1, Player Settings Installed!",name _player];

};
