//////////////////////////////////////////////
// _nul = [_object] execVM "snapShot4.sqf"; // 
private ["_object","_nameObject","_typeObject"];
_object = _this select 0;
_varName = vehicleVarName _object;
_type = typeOf _object;
_dist = player distance _object;

titleText [format ["%1 is %2 meters from %3.", _varName,round(_dist)/1.0, _type],"plain down"];

if (daytime >= 19 || daytime <= 5) then {camUseNVG true} else {camUseNVG false};

ShowCinemaborder false;

_object execVM "camera.sqf";

titleText [format ["Press NumPad 0 To Return"],"plain down"];

/*
Camera.sqs
Jump to navigationJump to search

Contents
1	Usage
1.1	Controls
1.1.1	Introduced in Armed Assault
1.1.2	Introduced in Arma 2: Operation Arrowhead
1.2	Using in Script
2	Notes
3	External links
It won't take you long to discover that the original Operation Flashpoint camera options which are found in the editor don't give you the same versatility that you have seen in the official missions or quality user-created cutscenes. The "editor driven cutscene" has long been frowned upon by serious mission makers and for good reason. Seeing the same spinning camera shot and slow zooms over and over make the editor driven cutscene instantly recognisable as novice and that's without mentioning the annoying split second delay before the cutscene gets going.

Thankfully BI accounted for this by having its own method of creating camera cutscenes bypassing the editor options altogether. It is a script which simulates a real camera, which literally lets you point and click your angles, thus allowing you to create cutscenes with minimum fuss.

This script already exists within Flashpoint. By executing the script in-game you can activate a camera which is controlled using the keyboard. It can be moved into practically any position, and a 'snapshot' can be taken containing all the relevant information for that shot. The information can then be pasted into your cutscene script.


Usage
To execute the script create an object - doesn't need to be a soldier - and in its init field type

this exec "camera.sqs"
Now when you preview the mission you will see the cinematic border at the top and bottom of the screen and a view looking North from the object you created. There will be a crosshair in the centre of the screen. If you fail to execute the script from an object, or the object doesn't exist, the camera will be created at 0,0,0 on the map.

Controls
Most of following controls can be easily changed in 'Options -> Controls -> Buldozer controls' menu.

Camera movement is controlled using the following keys:

W	Forward
E	Fast forward
A	Left
D	Right
S	Backwards
Q	Up
Z	Down
The camera can be rotated and tilted using the numeric keyboard:

NUM 8	Tilt upward
NUM 2	Tilt downward
NUM 4	Rotate left
NUM 6	Rotate right
There is also a zoom function, again using the numeric keyboard:

NUM +	Zoom in
NUM -	Zoom out
Remaining functions:

L	Toggle crosshair (and tracked target box)
NUM /
Space	Target nearest object OR position on ground
Del	Turn on/off floating mode
Introduced in Armed Assault
F	(same as NUM / / Space) tracks targeted object OR position on ground nearest to crosshair
Targeted objects are indicated with a red crosshair box.
Targeted ground position is indicated with a yellow crosshair box.
Moving objects will be tracked by camera.
Pressing any camera movement key will cancel object/ground tracking
A/D	rotate camera around focused object or position on ground (used after F option)
⇧ Shift + WASD	Faster camera movement
Introduced in Arma 2: Operation Arrowhead
N	Cycle between normal view / NVG / TI BW / TI WB
M	Open/Close map
Left Mouse Button	in map - teleport camera to given location
Ctrl + Left Mouse Button	in map - teleport player to given location
NUM .	Teleport camera to position where it was previously terminated
NUM *	Copy cursor's position to clipboard
Ctrl + NUM *	Teleport player under cursor
;	Disable camera postprocess
1..9	Set pre-defined camera postprocess (stored in BIS_DEBUG_CAM_PPEFFECTS array, cen be rewritten)
Mouse Scrollwheel	Modify focus length
starting at 0, moving up will increase distance
decreasing it back to 0 will reset to effect and enable autofocus
Pressing V will cancel the camera view and return back to normal control.

Using in Script
Finally, once you have framed your shot, press the Fire key (Ctrl key in Operation Flashpoint or Left Mouse Button in Arma). This stores the camera information in the clipboard. You can then press Alt + ↹ Tab to return to the desktop, and paste the camera information into a text-editor such as Notepad using Ctrl + V. Text is also saved into the clipboard.txt file in OFP main directory.

For every click you will get an entry in this file that will look something like this:

;=== 22:11:02
_camera camPrepareTarget [684.73,98559.95,-27662.98]
_camera camPreparePos [2545.07,2486.85,9.91]
_camera camPrepareFov 0.700
_camera camCommitPrepared 0
@camCommitted _camera
Note that the keyboard controls above are the default settings. If you have reconfigured your keyboard controls you'll have to find the equivalent keys.

Notes
In ArmA: Armed Assault the clipboard.txt file is created in your user\application data folder.

Example:

C:\Documents and Settings\WINDOWSUSERNAME\Local Settings\Application Data\ArmA\clipboard.txt
*/
