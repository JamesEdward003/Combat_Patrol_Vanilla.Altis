///////////////////////////////////////
_object = _this select 0;
_dist = [_object,player] call BIS_fnc_distance2D;

titleText [format ["%1 is %2 meters from %3", typeOf _object, round(_dist)/1.0, name player],"plain down"];

if (daytime >= 19 || daytime <= 5) then {camUseNVG true} else {camUseNVG false};

ShowCinemaborder false;

enableRadio false;

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

_camera = "seagull" camCreate (_object modelToWorld [0,0,100]);
_camera cameraEffect ["FIXED", "LEFT TOP"];
_camera camCommand "MANUAL ON";
_camera switchCamera "Internal";
_camera CamCommit 0.01;

waituntil {(camCommitted _camera)};
titleText [format ["Press Home To Return"],"plain down"];
waitUntil {!alive _object};
uisleep 2;

titleText [format ["Switching to player - %1",name player],"plain down"];

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,4];
_camera camCommit 6;
waituntil {(camCommitted _camera)};

//_camera camSetTarget player
player cameraEffect ["terminate","back"];

vehicle player switchCamera "INTERNAL";

camDestroy _camera;

enableRadio true;

/*
_camera = "camera" camcreate position _object;
_camera CameraEffect ["EXTERNAL","Back"];
_camera CamSetTarget _object;
_camera camSetRelPos [0,0,10];
_camera attachTo [_object, [0,0,10]];
_camera CamCommit 0.01;
*/