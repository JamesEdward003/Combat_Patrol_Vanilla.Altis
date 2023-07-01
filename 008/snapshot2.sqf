///////////////////////////////////////
_target = _this select 0;
_object = _this select 1;
_type = typeOf _target;
_dist = _target distance _object;
_vehicleVarName = vehicleVarname _object;

titleText [format ["%1 is %2 meters from %3.", _vehicleVarName,round(_dist)/1.0, _type],"plain down"];

if (daytime >= 19 || daytime <= 5) then {camUseNVG true} else {camUseNVG false};

ShowCinemaborder false;

[] spawn {
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displaySetEventHandler ["KeyDown","_this call keyspressed"];

	keyspressed = {
	    _keyDik = _this select 1;
	    _shift =_this select 2;
	    _ctrl = _this select 3;
	    _alt = _this select 4;
	    _handled = false;
	    switch (_this select 1) do {

	    case 199: {//Home key
            	execVM "008\snapTerminate.sqf";
            	enableRadio true;
                //hintSilent "handled";
	        };
	    };
	    _handled;
	};
};

_object switchCamera "INTERNAL";

enableRadio true;

titleText [format ["Press Home To Return"],"plain down"];

/*
player cameraEffect ["terminate","back"];

_camera = "camera" camcreate position _object;
_camera CameraEffect ["EXTERNAL","Back"];
_camera CamSetTarget _object;
_camera camSetRelPos [0,-25,6];
_camera attachTo [_object, [0,-25,6]];
_camera CamCommit 0.01;

*/


