//////////////////////////////////////////////////////////////////
// Set AI Hostage Script 
// By Galactic Twinkles
// Define Captive
_captive = _this select 0;
// Select random animation
_anim = ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05","Acts_ExecutionVictim_Loop"] selectRandomWeighted [1,1,1,1,1,.5];
// Set Captive Settings
_captive setCaptive true;
// Remove Items
removeAllWeapons _captive;
removeBackpack _captive;
removeVest _captive;
removeAllAssignedItems _captive;
_captive switchMove _anim; // SwitchMove to random animation
// Set unit as hurt if it's the Execution animation
if (_anim == "Acts_ExecutionVictim_Loop") then {
	_captive setDamage .5;
};
_captive disableAI "MOVE"; // Disable AI Movement
_captive disableAI "PATH";
_captive disableAI "AUTOTARGET"; // Disable AI Autotarget
_captive disableAI "ANIM"; // Disable AI Behavioural Scripts
_captive allowFleeing 0; // Disable AI Fleeing
_captive setBehaviour "Careless"; // Set Behaviour to Careless because, you know, ARMA AI.

// Add Hold Action to Free Hostage
[
/* 0 object */				        _captive,
/* 1 action title */				"Free Hostage",
/* 2 idle icon */				"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
/* 3 progress icon */				"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
/* 4 condition to show */			"true",
/* 5 condition for action */			"true",
/* 6 code executed on start */			{},
/* 7 code executed per tick */			{},
/* 8 code executed on completion */      	{
						        if (_this select 3 select 0 == "Acts_ExecutionVictim_Loop") then {
								_this select 0 playMove "Acts_ExecutionVictim_Unbow";
							} else {
								_this select 0 switchMove "Acts_AidlPsitMstpSsurWnonDnon_out";
							};
							_anim = ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05","Acts_ExecutionVictim_Loop"] selectRandomWeighted [1,1,1,1,1,.5];
							_complMessage = ["My humblest regards, kind sir.","Thank you very much.","Thanks, got a smoke?","What day is this?","I'M FREE, LORD GOD ALMIGHTY, I'M FREE!","Where am I?"] selectRandomWeighted [1,1,1,1,1,.5];
							["Hostage", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
							sleep 5.5;
							(_this select 0) enableAI "MOVE";
							(_this select 0) enableAI "PATH";
							(_this select 0) enableAI "AUTOTARGET";
							(_this select 0) enableAI "ANIM";
							(_this select 0) setBehaviour "AWARE";
							[(_this select 0)] joinSilent player;
							[(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true];

						},
/* 9 code executed on interruption */       {
						_intrMessage = ["Hey! I don't wanna stay here!","Don't leave me here! Please!","They're alright guys, but...GET ME OUT OF HERE!","Take me to your leader."] selectRandomWeighted [1,1,1,.5];
						["Hostage", _intrMessage] remoteExec ["BIS_fnc_showSubtitle"];
					    },
/* 10 arguments */			    [_anim],
/* 11 action duration */		    3,
/* 12 priority */			    0,
/* 13 remove on completion */		    true,
/* 14 show unconscious */		    false
] remoteExec ["BIS_fnc_holdActionAdd",[0,-2] select isDedicated,true];


