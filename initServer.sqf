/////////////  "initServer.sqf"  ////////////
[playerSide, "HQ"] commandChat "Initiating InitServer!";

call compile preprocessFileLineNumbers "briefing.sqf";

call compile preprocessFileLineNumbers "bon_recruit_units\init.sqf";

call compile preprocessFileLineNumbers "ParamsPlus\mortarBag.sqf";

["Preload"] call BIS_fnc_arsenal;


