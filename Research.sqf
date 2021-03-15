// Research.sqf //
hint format ["%1",getdammage player]; 

[] spawn { private _future = time + 10; 
waitUntil { time >= _future }; 

a = []; for "_i" from (0) to ((count paramsArray) - 1) do {_paramName = (configName ((missionConfigFile >> "Params") select _i)); 
_paramValue = call compile format["%1 = %2;publicVariable '%1';",_paramName,paramsArray select _i];  
a = a + [paramsArray select _i];}; 
hint format ["%1",a]; 
copyToClipboard format ["%1, %2",a,count paramsarray]; };

removeUniform player; 
player setUnitLoadout "U_NikosAgedBody";
player forceAddUniform "U_NikosAgedBody";















