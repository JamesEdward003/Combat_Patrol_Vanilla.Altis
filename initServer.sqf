/////////////  "initServer.sqf"  ////////////
// _Base = [playerSide, "PAPA_BEAR"] commandChat "Initiating InitServer!";
 _CROSSROAD = [playerSide, "HQ"] commandChat "Initiating InitServer!";
// _Base = [playerSide, "Base"] commandChat "Initiating InitServer!";
// _Base = [playerSide, "AirBase"] commandChat "Initiating InitServer!";
// _Broadway = [playerSide, "BLU"] commandChat "Initiating InitServer!";
// _Griffin = [playerSide, "OPF"] commandChat "Initiating InitServer!";
// _Phalanx = [playerSide, "IND"] commandChat "Initiating InitServer!";
// _Slingshot = [playerSide, "IND"] commandChat "Initiating InitServer!";

// Headquarters Entity module
//  BIS_hqWest, BIS_hqEast, BIS_hqGuer
        	
call compile preprocessFileLineNumbers "briefing.sqf";

call compile preprocessFileLineNumbers "bon_recruit_units\init.sqf";

call compile preprocessFileLineNumbers "ParamsPlus\mortarBag.sqf";

["Preload"] call BIS_fnc_arsenal;

Civilian setFriend [East, 0];
East setFriend [Civilian, 0];
Civilian setFriend [West, 0];
West setFriend [Civilian, 0];
Civilian setFriend [Resistance, 0];
Resistance setFriend [Civilian, 0];
West setFriend [East, 0];
East setFriend [West, 0];
West setFriend [Resistance, 0];
Resistance setFriend [West, 0];

