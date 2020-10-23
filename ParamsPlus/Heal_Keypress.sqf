////////////////////////////////////////////////////////////////////////////
//===DisplayAddEventHandler===//===To find the number on YOUR keyboard===//
//	waituntil {!(IsNull (findDisplay 46))};
//	_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "hint str _this"];
//===Add an EventHandler to the main display to view chosen objects...with additions :)
//(findDisplay 46) displayRemoveEventHandler ["KeyDown", _KeyDown];
//(findDisplay 46) displayRemoveEventHandler ["KeyUp", _KeyUp];
_PAiMedic = "PAiMedic" call BIS_fnc_getParamValue;
if (_PAiMedic isEqualTo 2) exitWith {};
tempheal = true;
HEAL_KEYDOWN_FNC = {
private["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt", "_handled"];
params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt", ["_handled", false, [false]]];
//params["_ctrl","_dikCode","_shift","_ctrlKey", "_alt", ["_handled",false], ["_display", displayNull, [displayNull]]];
    	
    switch (_dikCode) do {
			
                	//NumPad - [/-Divide]
        case 181 : {
	        
	        if (_shift) then {
	        
	     		if (tempheal) then {tempheal = false;[player] execVM "paramsplus\HealPlayer.sqf";};
				_handled = true;		
			};	
	            	
        };
     
    }; 
        
};
        


//==And the key EventHandler to execute the script...
waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call HEAL_KEYDOWN_FNC;false;"];

waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyUp", "tempheal = true;false;"];

//hint composeText ["HEAL keypress installed", lineBreak, "NumPad - [/-Divide]"];

//[playerSide, "HQ"] commandChat "HEAL Keypress Installed!";

//uisleep 6;
//hintSilent "";

