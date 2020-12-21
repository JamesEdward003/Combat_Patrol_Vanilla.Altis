// "CtrlZ_Lightning.sqf" ///////////////////////////////////////////////////
// =======================================================================================
// LIGHTNING WILL STRIKE WHAT THE PLAYER IS LOOKING AT 
// =======================================================================================
//===DisplayAddEventHandler===//===To find the number on YOUR keyboard===//
//	waituntil {!(IsNull (findDisplay 46))};
//	_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "hint str _this"];
//===Add an EventHandler to the main display to view chosen objects...with additions :)
//(findDisplay 46) displayRemoveEventHandler ["KeyDown", _KeyDown];
//(findDisplay 46) displayRemoveEventHandler ["KeyUp", _KeyUp];
_PLightning = "PLightning" call BIS_fnc_getParamValue;
if (_PLightning isEqualTo 1) exitWith {};
tempctrlz = true;
LIGTNING_KEYDOWN_FNC = {
private["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt", "_handled"];
params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt", ["_handled", false, [false]]];
//params["_ctrl","_dikCode","_shift","_ctrlKey", "_alt", ["_handled",false], ["_display", displayNull, [displayNull]]];
    	
	switch (_dikCode) do {
	
			//Ctrl-Z
		case 44 : {
        
			if (_ctrlKey) then {
        
     			if (tempctrlz) then {  
          
					tempctrlz = false;
					
					_strikeTarget = cursorObject;
					
					_strikeLoc =  (getPos _strikeTarget);
					
					if (_strikeLoc isequalto [0,0,0]) then {
						
						hint "!";
					
					}else{

						[_strikeTarget,nil,true] call BIS_fnc_moduleLightning;

						hint "";
						
					};
				};    	     
				_handled = true;	
			};	
		};	            	
	};     
}; 
        
//==And the key EventHandler to execute the script...
waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call LIGTNING_KEYDOWN_FNC;false;"];

waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyUp", "tempctrlz = true;false;"];

//while {alive player} do {
//uisleep 20;
//private ["_strikeTarget","_dummy"];
//_strikeTarget = cursorObject;
//_strikeLoc =  (getPos _strikeTarget);
//if (_strikeLoc isequalto [0,0,0]) then {
//hint "!";
//}else{

//[_strikeTarget,nil,true] call BIS_fnc_moduleLightning;

//hint "";
//	};
//};


