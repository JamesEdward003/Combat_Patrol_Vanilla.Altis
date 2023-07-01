///////////////////////////////////////////////////////////////////////////////
// _nul = [_object] execVM "snapShot4.sqf";

private ["_object","_nameObject","_x","_y","_camera","_dx","_dy","_dz"];
_object 		= _this select 0;
_nameObject	= vehicleVarName _object;

if (daytime > 18.75 || daytime < 4.75) then {camUseNVG true};

ShowCinemaborder false;

_x = getPos _object select 0;
_y = getPos _object select 1;

_camera = "camera" camCreate [_x+10,_y+10,25];
_camera cameraEffect ["internal","back"];
_camera camSetTarget _object;
_camera camSetRelPos [10, 25, 15];
_camera camSetFOV 1;
_camera camCommit 5;

WaitUntil{camCommitted _camera};
sleep 2;

// _object disableAI "MOVE";

//**************//
//FOLLOWOBJECT
//**************//
//if(not alive _object) then{
//		playMusic "Lose";
//		cutText ["Captain has been killed. You failed.", "BLACK OUT",15];
//		CaptainKilled = true;
//}
//	else{
//		playMusic "Win";
//		cutText ["Congratulations. Mission accomplished.", "BLACK OUT",15];
//};

_dx = 5;
_dy = 5;
_dz = 5.5;
_x = getPos _object select 0;
_y = getPos _object select 1;

_camera camSetPos [_x + _dx*sin(getDir _object) - _dy*cos(getDir _object), _y + _dx*cos(getDir _object) + _dy*sin(getDir _object), (getpos _object select 2)+_dz];
_camera camSetTarget _object;
_camera camSetFOV 1;
_camera camCommit 5;
WaitUntil{camCommitted _camera};
sleep 2;

_dx = 50; _dy = 50; _dz = 35;
_camera camSetPos [_x + _dx*sin(getDir _object) - _dy*cos(getDir _object), _y + _dx*cos(getDir _object) + _dy*sin(getDir _object), (getpos _object select 2)+_dz];
_camera camSetTarget _object;
_camera camSetFOV 1;
_camera camCommit 5;
WaitUntil{camCommitted _camera};
sleep 2;

player cameraEffect ["terminate","back"];
camDestroy _camera;

enableRadio true;

Disableuserinput false;

//_trgObj = createTrigger ["EmptyDetector", position Captain];
//_trgObj setTriggerActivation["ANY", "PRESENT", false];
//_trgObj setTriggerArea[2000,2000,0,true];
//_trgObj setTriggerType "END1";
