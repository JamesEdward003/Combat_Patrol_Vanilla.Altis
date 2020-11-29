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

//execVM "ParamsPlus\parameterBriefing.sqf";

