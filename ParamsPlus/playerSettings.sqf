//////	[player] execVM "playerSettings.sqf";	//////
private ["_player","_ploadout","_prespawnloadout","_pdiverequip","_pnightvision","_psilencers","_pmarkers","_pregenhealth","_paimedic","_precoil","_psway","_paudible","_pcamocoef","_ploadcoef","_pengineer","_pexplspec","_pmedic","_puavhacker","_pua","_pdiver","_pintro"];
_player = _this select 0;
//[1,1,1,1,0,20,0,-1,1,0,0,0,2,3,2,2,3,1,1,1,3,3,1,1,3,3,3,3,3,1,1,2,1,2,1,1]
_precoil 	= paramsArray select 24;
_psway   	= paramsArray select 25;
_paudible	= paramsArray select 26;
_pcamocoef	= paramsArray select 27;
_ploadcoef	= paramsArray select 28;
_pengineer	= paramsArray select 29;
_pexplspec	= paramsArray select 30;
_pmedic		= paramsArray select 31;
_puavhacker	= paramsArray select 32;
_pua		= paramsArray select 33;
_pdiver		= paramsArray select 34;
_pintro		= paramsArray select 35;

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
if (isNil "paudible") then
{	
	switch (_paudible) do
	{
		case 1: {paudible = 0.10};
		case 2: {paudible = 0.40};
		case 3: {paudible = 0.70};
		case 4: {paudible =    1};
	};	 
	_player setUnitTrait ["audibleCoef",paudible];
	publicvariable "paudible";
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
if (isNil "pua") then
{
	switch (_pua) do
	{
		case 1: {pua = false};
		case 2: {pua = true};
	};
	missionNamespace setVariable ["UnlimitedAmmo", pua];
	publicvariable "pua";
};
if (isNil "pdiver") then
{
	switch (_pdiver) do
	{
		case 1: {pdiver = false};
		case 2: {pdiver = true};
	};
	missionNamespace setVariable ["SF_diver", pdiver];
	publicvariable "pdiver";
};
if (isNil "pintro") then
{
	switch (_pintro) do
	{
		case 1: {pintro = false};
		case 2: {pintro = true};
	};
	missionNamespace setVariable ["Pintro", pintro];
	publicvariable "pintro";
};
if (!isDedicated) then
{
	waitUntil {!isNull player};
	waitUntil {player == player};
	waitUntil {!isNil "pfatigue"};
	waitUntil {!isNil "pstamina"};
	waitUntil {!isNil "precoil"};
	waitUntil {!isNil "psway"};
	waitUntil {!isNil "paudible"};
	waitUntil {!isNil "pcamocoef"};
	waitUntil {!isNil "ploadcoef"};
	waitUntil {!isNil "pengineer"};
	waitUntil {!isNil "pexplspec"};
	waitUntil {!isNil "pmedic"};
	waitUntil {!isNil "puavhacker"};
	waitUntil {!isNil "pua"};
	waitUntil {!isNil "pdiver"};
	waitUntil {!isNil "pintro"};
};

private _future = time + 5;
waitUntil { time >= _future };

_player enableFatigue pfatigue;
_player enableStamina pstamina;
_player setUnitRecoilCoefficient precoil;
_player setCustomAimCoef psway;
_player setUnitTrait ["audibleCoef",paudible];
_player setUnitTrait ["camouflageCoef",pcamocoef];
_player setUnitTrait ["loadCoef",ploadcoef];
_player setUnitTrait ["Engineer",pengineer];
_player setUnitTrait ["ExplosiveSpecialist",pexplspec];
_player setUnitTrait ["Medic",pmedic];
_player setUnitTrait ["UAVHacker",puavhacker];
missionNamespace setVariable ["UnlimitedAmmo", pua];
missionNamespace setVariable ["SF_diver", pdiver];
missionNamespace setVariable ["PIntro", pintro];

_player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];

	_pfatigue 	= paramsArray select 22;
	_pstamina 	= paramsArray select 23;
	_precoil 	= paramsArray select 24;
	_psway   	= paramsArray select 25;
	_paudible	= paramsArray select 26;
	_pcamocoef	= paramsArray select 27;
	_ploadcoef	= paramsArray select 28;
	_pengineer	= paramsArray select 29;
	_pexplspec	= paramsArray select 30;
	_pmedic		= paramsArray select 31;
	_puavhacker	= paramsArray select 32;
	_pua		= paramsArray select 33;
	_pdiver		= paramsArray select 34;
	_pintro		= paramsArray select 35;

	_unit enableFatigue pfatigue;
	_unit enableStamina pstamina;
	_unit setUnitRecoilCoefficient precoil;
	_unit setCustomAimCoef psway;
	_unit setUnitTrait ["audibleCoef",paudible];
	_unit setUnitTrait ["camouflageCoef",pcamocoef];
	_unit setUnitTrait ["loadCoef",ploadcoef];
	_unit setUnitTrait ["Engineer",pengineer];
	_unit setUnitTrait ["ExplosiveSpecialist",pexplspec];
	_unit setUnitTrait ["Medic",pmedic];
	_unit setUnitTrait ["UAVHacker",puavhacker];

	if (isPlayer _unit) then {

	[playerSide, "HQ"] commandChat format ["%1, Player Settings installed!",name _unit];

	};

}];

if (isPlayer _player) then {

[playerSide, "HQ"] commandChat format ["%1, Player Settings Installed!",name _player];

};

