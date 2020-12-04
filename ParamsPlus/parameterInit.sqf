//###Parameter Storage and Loading by NeoArmageddon.###

//Load default params for SP && Editor
if (isNil "paramsArray") then
{
   private ["_c", "_i", "_paramName"];
   paramsArray=[];

   if (isClass (missionConfigFile/"Params")) then
   {
       _c=count (missionConfigFile/"Params");
       for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do
       {
           _paramName = (configName ((missionConfigFile >> "Params") select _i));
           paramsArray=paramsArray+[ getNumber (missionConfigFile >> "Params" >> _paramName >> "default") ];
       };
   };
};
fnc_ParamsToVar = {
	//Compile params into real variables:
	private["_c","_paramName"];
	_c=count (missionConfigFile/"Params");
	for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do
	{
		_paramName = (configName ((missionConfigFile >> "Params") select _i));
		call compile format["%1 = %2;publicVariable '%1';",_paramName,paramsArray select _i];

	};
};

//Compile Params into Variables
call fnc_ParamsToVar;

private["_paramLoading","_params"];
_paramLoading = Param_Loadparams;
switch (_paramLoading) do 
{ 
 case 1: 
 {
   uiNamespace setVariable ["SavedParams", paramsArray];    
 }; 
 case 2: 
 {
     //Load params if existing in UINamespace
     _params = uiNamespace getVariable ["SavedParams",[]];
     if(count(_params)==0 || count(_params)!=count(paramsArray)) then {
         uiNamespace setVariable ["SavedParams", paramsArray];
     } else {
         paramsArray = _params;
         publicvariable "paramsArray";
     };
 }; 
 case 3: 
 {
    //Use paramsArray, do nothing
 }; 
};

//Reompile Params into Variables because they may have changed.
call fnc_ParamsToVar;

ParamsParsed = true;
publicVariable "ParamsParsed";
[playerSide, "HQ"] commandChat "Params Parsed!";

//execVM "ParamsPlus\parameterBriefing.sqf";

_PSaves = "PSaves" call BIS_fnc_getParamValue;

switch (_psaves) do
{
	case 1: {_psaves = [false, false];};	// saving disabled, doesn't autosave
	case 2: {_psaves = [false, true];};	// saving disabled, does autosave
	case 3: {_psaves = [true, false];};	// saving enabled, doesn't autosave
	case 4: {_psaves = [true, true];};		// saving enabled, does autosave
};
enableSaving _psaves;
	
_BI_CP_startLocation = "BI_CP_startLocation" call BIS_fnc_getParamValue;	

if (_BI_CP_startLocation isEqualTo 1) exitWith {};
if (_BI_CP_startLocation isEqualTo 2) then {
	_pos = getPos leader player;
	waitUntil {!isNil "BIS_CP_initDone"};
	{
	if ( _x != leader player) then {
		_relDis = _x distance leader player;
		_relDir = [leader player, _x] call BIS_fnc_relativeDirTo;
		_x setPos ([_pos, _relDis, _relDir] call BIS_fnc_relPos);
	}; 
	}forEach units group player;
	leader player setPos _pos;
};	

{if (!( isPlayer _x ) and !(_x in (units group player))) then  {deleteVehicle _x}} forEach (if ismultiplayer then {playableunits} else {switchableunits});

{if (!( isPlayer _x ) and (_x in (units group player))) then  {_x addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],-100,false,true,""];}} forEach (if ismultiplayer then {playableunits} else {switchableunits});
	
enableRadio false;
enableSentences false;
{_x disableConversation true} forEach units group player;


//[1,1,1,1,0,20,0,1,2,-1,1,0,0,0,3,3,2,1,1,1,1,1,2,2,2,2,2,3,2,2,2,1,1,1,2,1,1,1,4,4,4,2,1,1], 44
//[1,1,1,1,0,20,0,1,2,-1,1,0,0,0,3,3,2,1,1,1,1,1,2,2,2,2,2,3,2,2,2,1,1,1,2,1,1,1,4,4,4,2,1,1], 44
//[1,1,1,1,0,20,0,1,2,-1,1,0,0,0,3,3,2,1,2,1,1,1,2,2,2,2,2,3,2,2,2,1,1,1,2,1,1,1,4,4,4,2,1,1], 44	
	
//[1,1,1,1,0,20,0,1,2,-1,1,0,0,0,3,3,2,1,2,1,1,1,2,2,2,2,2,3,2,2,2,1,1,1,2,1,1,1,4,4,4,2,1,1], 44	
	
	