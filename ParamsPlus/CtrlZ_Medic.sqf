////////////////////////////////////////////////////////////////////////////
// =======================================================================================
// SCRIPT INTENT: Selected units will form a 360 around the player and heal player
// =======================================================================================
//===DisplayAddEventHandler===//===To find the number on YOUR keyboard===//
//	waituntil {!(IsNull (findDisplay 46))};
//	_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "hint str _this"];
//===Add an EventHandler to the main display to view chosen objects...with additions :)
//(findDisplay 46) displayRemoveEventHandler ["KeyDown", _KeyDown];
//(findDisplay 46) displayRemoveEventHandler ["KeyUp", _KeyUp];
_PAiMedic = "PAiMedic" call BIS_fnc_getParamValue;
if (_PAiMedic isEqualTo 1) exitWith {};
tempheal = true;
HEAL_KEYDOWN_FNC = {
private["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt", "_handled"];
params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt", ["_handled", false, [false]]];
//params["_ctrl","_dikCode","_shift","_ctrlKey", "_alt", ["_handled",false], ["_display", displayNull, [displayNull]]];
    	
    switch (_dikCode) do {
			
                	//Ctrl-Z
        case 44 : {
	        
	        if (_ctrlKey) then {
	        
	     		if (tempheal) then {tempheal = false;execVM "ParamsPlus\HealPlayer.sqf";};
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

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit execVM "ParamsPlus\CtrlZ_Medic.sqf";
}];

//hint composeText ["HEAL keypress installed", lineBreak, "Ctrl-M"];

//[playerSide, "HQ"] commandChat "HEAL Keypress Installed!";

//uisleep 6;
//hintSilent "";

