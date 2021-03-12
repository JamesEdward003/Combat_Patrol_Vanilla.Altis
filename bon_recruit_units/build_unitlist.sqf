// by Bon_Inf*
//Modified by Moser -- 07/18/2014
#include "dialog\definitions.sqf";
disableSerialization;

if (bon_dynamic_list isEqualTo true) then {
	_scripthandler =[] execVM "bon_recruit_units\recruitable_units.sqf"; 	//executes dynamic arrray builder to find units of player's subfaction
	waitUntil{ ScriptDone _scripthandler  };								//MUST wait for script to finish
} else {
			
	switch (side player) do {
			
		case WEST: {
			
			if (((typeOf player) == "B_Officer_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_regular.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "B_Soldier_SL_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_regular.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "B_Soldier_TL_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_regular.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "B_recon_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_recon.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "B_diver_TL_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_diver.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "B_Captain_Pettka_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_story.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};	
			if (((typeOf player) == "B_CTRG_Sharphooter_F") isEqualTo true) then 
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_story.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
		};

		case EAST: {

			if (((typeOf player) == "O_diver_TL_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_opfor_diver.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "O_G_Soldier_TL_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_opfor.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "O_recon_TL_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_opfor.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "O_Story_Colonel_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_opfor_story.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "O_Story_CEO_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_opfor_story.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
		};

		case RESISTANCE: {

			if (((typeOf player) == "I_diver_TL_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_resistance.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "I_Story_Colonel_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_resistance.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "I_Soldier_SL_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_resistance.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "I_officer_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_resistance.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
		};
		
		case CIVILIAN: {

			if (((typeOf player) == "c_nikos") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_civilian.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
			if (((typeOf player) == "C_man_p_shorts_1_F") isEqualTo true) then
				{
					_scripthandler =[] execVM "bon_recruit_units\recruitable_units_static_civilian.sqf";
					waitUntil{ ScriptDone _scripthandler  };
			};
		};
	};
};

_display = findDisplay BON_RECRUITING_DIALOG;
_unitlist = _display displayCtrl BON_RECRUITING_UNITLIST;
_queuelist = _display displayCtrl BON_RECRUITING_QUEUE;

_queuelist ctrlSetText format["Units queued: %1",count bon_recruit_queue];

_weaponstring = "";
{
	_displname = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
	_picture = getText (configFile >> "CfgVehicles" >> _x >> "portrait");
	_weaponstring = format["%1",_displname,_picture];
	_unitlist lbAdd _weaponstring;
} foreach bon_recruit_recruitableunits;
