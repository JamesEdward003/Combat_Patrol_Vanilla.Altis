//////////////////////////////////////////////////////////////////
// Function file for ArmA 2 and Arma 3
//////////////////////////////////////////////////////////////////

 _unit = player;
 _veh = vehicle _unit;
 _pilot = driver _veh;
 _gunner = gunner _veh;
 _hov = getPosATL _veh select 2;
 _actionArray = _this select 3;
 _action = _actionArray select 0;

 if (_hov > 2) then
 {
	 hint format ["Too high to perform that action!"];
	 
	 } else {
	 
     if (_action == "pilot") then
     {
         if (!isplayer _pilot) then
             {
        	_pilot action ["eject", _veh];  
            _unit action ["eject", _veh];
            sleep .5;
            _unit assignasdriver _veh;
            _unit moveindriver _veh;
            _unit action ["engineOn", _veh];
          	_pilot assignAsCargo _veh;
          	_pilot moveInCargo _veh;
             hint format ["You are now pilot!"];
         } else {
             sleep 0.1;
             hint format ["There is already a pilot inside!"];
         };
     };
 
     if (_action == "back") then
     {
         if (isplayer _pilot) then
             {
        	_pilot action ["eject", _veh];  
            _randomCrew = (selectRandom (fullCrew _veh));
          	_randomCrew action ["eject", _veh];
            _pilot assignAsCargo _veh;
            _pilot moveInCargo _veh;
          	sleep .5;
          	_randomCrew assignasdriver _veh;
          	_randomCrew moveindriver _veh;
          	_randomCrew action ["engineOn", _veh];
            hint format ["Ai pilot is now pilot!"];
         } else {
             sleep 0.1;
             hint format ["There is already a pilot inside!"];

         };
     };
 
     if (_action == "gunner") then
     {
         if (isplayer _pilot) then
             {
        	_gunner action ["eject", _veh];  
            _pilot action ["eject", _veh];
            sleep .5;
          	_pilot assignasgunner _veh;
          	_pilot moveingunner _veh;
            _gunner assignasdriver _veh;
            _gunner moveindriver _veh;
          	_gunner action ["engineOn", _veh];
             hint format ["You are now gunner!"];
         } else {
             sleep 0.1;
             hint format ["There is already a gunner inside!"];

         };
     };
 };