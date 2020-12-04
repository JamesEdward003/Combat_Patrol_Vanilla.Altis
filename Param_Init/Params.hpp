// "Params.hpp" //

Params_Default = [1,1,1,1,0,20,0,1,-1,1,0,0,0,3,3,2,1,1,1,2,2,2,2,2,3,2,2,2,1,1,1,2,1,1,1,1,1,1,1,1,1], 41;
				[1,1,1,1,0,20,0,1,-1,1,0,0,0,3,3,2,1,1,1,2,2,2,2,2,3,2,2,2,1,1,1,2,1,1,1,1,1,1,1,1,1], 41
				[1,1,1,1,0,20,0,1,-1,1,0,0,0,3,3,2,1,1,1,2,2,2,2,2,3,2,2,2,1,1,1,2,1,1,1,1,1,1,1,1,1], 41
				[1,1,1,1,0,20,0,1,-1,1,0,0,0,3,3,2,1,1,1,2,2,2,2,2,3,2,2,2,1,1,1,2,1,1,1,4,4,4,2,2,1], 41
class Params
{
	class BIS_CP_startingDaytime
	{
		title = $STR_A3_combatpatrol_params_1;
		values[] = {-1, 0, 1, 2, 3, 4};
		texts[] = {$STR_A3_bis_fnc_respawnmenuposition_random, $STR_A3_combatpatrol_params_2, $STR_A3_combatpatrol_params_3, $STR_A3_combatpatrol_params_4, $STR_A3_combatpatrol_params_5, $STR_A3_combatpatrol_params_6};
		default = Params_Default select 0;
	};
	class BIS_CP_weather
	{
		title = $STR_A3_rscattributeovercast_title;
		values[] = {-1, 0, 1, 2, 3};
		texts[] = {$STR_A3_bis_fnc_respawnmenuposition_random, $STR_A3_combatpatrol_params_7, $STR_A3_combatpatrol_params_8, $STR_A3_combatpatrol_params_9, $STR_A3_combatpatrol_params_10};
		default = Params_Default select 1;
	};
	class BIS_CP_garrison
	{
		title = $STR_A3_combatpatrol_params_11;
		values[] = {0, 1, 2};
		texts[] = {$STR_A3_combatpatrol_params_12, $STR_A3_combatpatrol_params_13, $STR_A3_combatpatrol_params_14};
		default = Params_Default select 2;
	};
	class BIS_CP_reinforcements
	{
		title = $STR_A3_combatpatrol_params_15;
		values[] = {0, 1, 2};
		texts[] = {$STR_A3_combatpatrol_params_12, $STR_A3_combatpatrol_params_13, $STR_A3_combatpatrol_params_16};
		default = Params_Default select 3;
	};
	class BIS_CP_showInsertion
	{
		title = $STR_A3_combatpatrol_params_17;
		values[] = {1, 0};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0};
		default = Params_Default select 4;
	};
	class BIS_CP_tickets
	{
		title = $STR_A3_combatpatrol_params_18;
		values[] = {5, 10, 20, 50, 100};
		texts[] = {"5", "10", "20", "50", "100"};
		default = Params_Default select 5;
	};
	class BIS_CP_enemyFaction
	{
		title = $STR_A3_combatpatrol_params_19;
		values[] = {0, 1, 2};
		texts[] = {$STR_A3_cfgfactionclasses_opf_f0, $STR_A3_cfgfactionclasses_ind_f0, $STR_A3_bis_fnc_respawnmenuposition_random};
		default = Params_Default select 6;
	};
	class BIS_CP_locationSelection
	{
		title = $STR_A3_combatpatrol_params_20;
		values[] = {0, 1};
		texts[] = {$STR_A3_combatpatrol_params_21, $STR_A3_bis_fnc_respawnmenuposition_random};
		default = Params_Default select 7;
	};
	class BIS_CP_objective
	{
		title = $STR_A3_combatpatrol_params_22;
		values[] = {-1, 1, 2, 3, 4, 5};
		texts[] = {$STR_A3_bis_fnc_respawnmenuposition_random, $STR_A3_combatpatrol_params_26, $STR_A3_combatpatrol_params_27, $STR_A3_combatpatrol_params_28, $STR_customcombatpatrol_params_2, $STR_customcombatpatrol_params_4};
		default = Params_Default select 8;
	};
	class BAS_CCP_respawnInsertion
	{
		title = $STR_customcombatpatrol_params_1;
		values[] = {1, 0};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0};
		default = Params_Default select 9;
	};
	class BAS_CCP_fatigueEnabled
	{
		title = $STR_customcombatpatrol_params_3;
		values[] = {1, 0};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0};
		default = Params_Default select 10;
	};
	class BAS_CCP_insRadiusMul
	{
		title = $STR_customcombatpatrol_params_5;
		values[] = {0, 1, 2, 3, 4};
		texts[] = {"x1", "x1.5", "x2", "x2.5", "x3"};
		default = Params_Default select 11;
	};
	class BAS_CCP_sandStorm
	{
		title = $STR_customcombatpatrol_params_6;
		values[] = {1, 0};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0};
		default = Params_Default select 12;
	};
	class Bskill	 
	{
        	title = "Blufor Skill";
        	values[] = {1, 2, 3, 4, 5};
        	texts[] = {"Rookie", "Recruit", "Veteran", "Expert", "Random"};
        	default = Params_Default select 13;
        	file = "ParamsPlus\BluSkill.sqf";
        	isGlobal = 0;
	};
	class Oskill	 
	{
        	title = "Opfor Skill";
        	values[] = {1, 2, 3, 4, 5};
        	texts[] = {"Rookie", "Recruit", "Veteran", "Expert", "Random"};
        	default = Params_Default select 14;
       	file = "ParamsPlus\OpSkill.sqf";
        	isGlobal = 0;
	};
    class PSymbols       
	{
        	title = "Military Symbols";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"Disabled","Map Only","3d Only","Both"};
        	default = Params_Default select 15;
        	file = "ParamsPlus\Military_Symbol_Module.sqf";
        	isGlobal = 0;
    };
    class PIntro      
	{ 
        	title = "Intro";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 16;
       	file = "ParamsPlus\Intro.sqf";
        	isGlobal = 0;
    };
  	class PRespawnLoadOut
	{
        	title = "Dead Loadouts on Respawn";
       	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 17;
	    file = "ParamsPlus\RespawnInventory.sqf";
        	isGlobal = 1;
	};
	class PDiverEquip       
	{
		title = "Diver Loadouts";
		values[] = {1, 2, 3};
		texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
		default = Params_Default select 18;
		file = "ParamsPlus\loadouts_diver_selection.sqf";
		isGlobal = 1;
	};
  	class PLoadOut
	{
        	title = "Custom Loadouts";
       	values[] = {1, 2, 3};
        	texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
        	default = Params_Default select 19;
        	file = "ParamsPlus\loadout_selection.sqf";
        	isGlobal = 1;
	};	
    class PUA       
	{
        	title = "Unlimited Ammo";
        	values[] = {1, 2, 3};
        	texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
        	default = Params_Default select 20;
		file = "ParamsPlus\UnlimitedAmmo_Group.sqf";
		isGlobal = 1;
    };		
    class PNightVision       
	{
        	title = "Night Vision Adjustments";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units","All Units None"};
        	default = Params_Default select 21;
        	file = "ParamsPlus\nightvision_Group.sqf";
        	isGlobal = 1;
    };
    class PSilencers       
	{
        	title = "Silencer Adjustments";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units","All Units None"};
        	default = Params_Default select 22;
        	file = "ParamsPlus\silencers_Group.sqf";
        	isGlobal = 1;
    };
    class PMarkers       
	{
        	title = "Group Markers";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units","All Units"};
        	default = Params_Default select 23;
        	file = "ParamsPlus\markers_Group.sqf";
        	isGlobal = 1;
    };
    class PRegenHealth       
	{
    	title = "Health Regeneration";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"Disabled","Fair","Middlin","Good"};
        	default = Params_Default select 24;
        	file = "ParamsPlus\regen_health_Group.sqf";
        	isGlobal = 1;
    };
    class PAiMedic       
	{
        	title = "Ctrl-M Medic";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 25;
        	file = "ParamsPlus\CtrlM_Medic.sqf";
        	isGlobal = 1;
    };
    class PGiGoEH       
	{
        	title = "Group Leader Vehicle AmmoBox and Rally Point";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 26;
        	file = "ParamsPlus\GiGoEH_Group.sqf";
        	isGlobal = 1;
   	};
    class PRallyPoint      
	{ 
        	title = "Group Leader UAV Backpack and Rally Point";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 27;
        	file = "ParamsPlus\RallyPoint_Group.sqf";
        	isGlobal = 1;
    };
    class PUAVHacker       
	{
        	title = "Enable/Disable Player's UAV Ability";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 28;
    }; 
    class PEngineer       
	{
        	title = "Enable/Disable Player's Repair Ability";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 29;
    };  
    class PExplSpec      
 	{
        	title = "Enable/Disable Player's Defuse Ability";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 30;
    };    
    class PMedic       
	{
        	title = "Enable/Disable Player's Medic Ability";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 31;
    };  
    class PRecoil        
	{
        	title = "Player's Weapon Recoil";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No recoil","Poor recoil","Standard recoil","Intensive recoil"};
        	default = Params_Default select 32;
    };    
    class PSway     
	{
        	title = "Player's Weapon Sway";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No sway","Poor sway","Standard sway","Intensive sway"};
        	default = Params_Default select 33;
    };
    class PStamina       
	{
        	title = "Enable/Disable Player's Stamina System";
        	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 34;
    }; 
    class PLoadCoef       
	{
        	title = "Player's Load Carrying Ability";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No ability","Low ability","Standard ability","High ability"};
        	default = Params_Default select 35;
    };  
    class PAudibleCoef        
	{
        	title = "Player's Stealth (Audible) Ability";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No ability","Low ability","Standard ability","High ability"};
		default = Params_Default select 36;
    };    
    class PCamoCoef        
	{
        	title = "Player's Stealth (Visible) Ability";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No ability","Low ability","Standard ability","High ability"};
		default = Params_Default select 37;
    }; 
  	class PSettings
	{
        	title = "Settings";
		values[] = {1, 2, 3};
        	texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
        	default = Params_Default select 38;
        	file = "ParamsPlus\playerSettings_Group.sqf";
        	isGlobal = 1;
	};  
    class PSaves      
	{ 
	    	title = "Saves";
	    	values[] = {1, 2};
        	texts[] = {"Disabled","Enabled"};
        	default = Params_Default select 39;
        	function = enableSaving;
		isGlobal = 1;
    };
 	class Param_Loadparams
   	{
		title = "Parameter Loading";
		values[] = {1, 2, 4};
		texts[] = {"Use above and save", "Load existing (Use above if not found)", "Use above without save"};
		default = Params_Default select 40;
		file = "ParamsPlus\parameterInit.sqf";
		isGlobal = 0;
	};
};


