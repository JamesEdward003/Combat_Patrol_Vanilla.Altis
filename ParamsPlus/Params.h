////////////  "ParamsPlus\Params.h"  /////////////

class Params
{
	class BIS_CP_startingDaytime
	{
		title = $STR_A3_combatpatrol_params_1;
		values[] = {-1, 0, 1, 2, 3, 4};
		texts[] = {$STR_A3_bis_fnc_respawnmenuposition_random, $STR_A3_combatpatrol_params_2, $STR_A3_combatpatrol_params_3, $STR_A3_combatpatrol_params_4, $STR_A3_combatpatrol_params_5, $STR_A3_combatpatrol_params_6};
		default = 1;
	};
	class BIS_CP_weather
	{
		title = $STR_A3_rscattributeovercast_title;
		values[] = {-1, 0, 1, 2, 3};
		texts[] = {$STR_A3_bis_fnc_respawnmenuposition_random, $STR_A3_combatpatrol_params_7, $STR_A3_combatpatrol_params_8, $STR_A3_combatpatrol_params_9, $STR_A3_combatpatrol_params_10};
		default = 1;
	};
	class BIS_CP_garrison
	{
		title = $STR_A3_combatpatrol_params_11;
		values[] = {0, 1, 2};
		texts[] = {$STR_A3_combatpatrol_params_12, $STR_A3_combatpatrol_params_13, $STR_A3_combatpatrol_params_14};
		default = 1;
	};
	class BIS_CP_reinforcements
	{
		title = $STR_A3_combatpatrol_params_15;
		values[] = {0, 1, 2};
		texts[] = {$STR_A3_combatpatrol_params_12, $STR_A3_combatpatrol_params_13, $STR_A3_combatpatrol_params_16};
		default = 1;
	};
	class BIS_CP_showInsertion
	{
		title = $STR_A3_combatpatrol_params_17;
		values[] = {0, 1};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0};
		default = 0;
	};
	class BIS_CP_tickets
	{
		title = $STR_A3_combatpatrol_params_18;
		values[] = {5, 10, 20, 50, 100};
		texts[] = {"5", "10", "20", "50", "100"};
		default = 20;
	};
	class BIS_CP_enemyFaction
	{
		title = $STR_A3_combatpatrol_params_19;
		values[] = {0, 1, 2};
		texts[] = {$STR_A3_cfgfactionclasses_opf_f0, $STR_A3_cfgfactionclasses_ind_f0, $STR_A3_bis_fnc_respawnmenuposition_random};
		default = 2;
	};
	class BIS_CP_locationSelection
	{
		title = $STR_A3_combatpatrol_params_20;
		values[] = {0, 1};
		texts[] = {$STR_A3_combatpatrol_params_21, $STR_A3_bis_fnc_respawnmenuposition_random};
		default = 1;
	};
	class BIS_CP_objective
	{
		title = $STR_A3_combatpatrol_params_22;
		values[] = {-1, 1, 2, 3};
		texts[] = {$STR_A3_bis_fnc_respawnmenuposition_random, $STR_A3_combatpatrol_params_26, $STR_A3_combatpatrol_params_27, $STR_A3_combatpatrol_params_28};
		default = -1;
	};
	class BAS_CCP_respawnInsertion
	{
		title = $STR_customcombatpatrol_params_1;
		values[] = {1, 0};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0};
		default = 1;
	};
	class BAS_CCP_fatigueEnabled
	{
		title = $STR_customcombatpatrol_params_3;
		values[] = {1, 0};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0};
		default = 0;
	};
	class BAS_CCP_insRadiusMul
	{
		title = $STR_customcombatpatrol_params_5;
		values[] = {0, 1, 2, 3, 4};
		texts[] = {"x1", "x1.5", "x2", "x2.5", "x3"};
		default = 0;
	};
	class BAS_CCP_sandStorm
	{
		title = $STR_customcombatpatrol_params_6;
		values[] = {1, 0};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0};
		default = 0;
	};
    class PCivilians      
	{ 
        title = "Civilians";
        values[] = {1, 2, 3, 4};
        texts[] = {"Civilian Town Only","Island_Wide & Unarmed","Island_Wide, Unarmed & Talkative","Island_Wide, Armed & Talkative"};
        default = 1;
       	file = "cos\cosInit.sqf";
        isGlobal = 0;
    };
	class BI_CP_startLocation
	{
		title = "Start At Base Station";
		values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 1;
		isGlobal = 0;
	};
	class Bskill	 
	{
        title = "Blufor Skill";
        values[] = {1, 2, 3, 4, 5};
        texts[] = {"Rookie", "Recruit", "Veteran", "Expert", "Random"};
        default = 3;
        file = "ParamsPlus\BluSkill.sqf";
        isGlobal = 0;
	};
	class Oskill	 
	{
        title = "Opfor Skill";
        values[] = {1, 2, 3, 4, 5};
        texts[] = {"Rookie", "Recruit", "Veteran", "Expert", "Random"};
        default = 3;
       	file = "ParamsPlus\OpSkill.sqf";
        isGlobal = 0;
	};
    class PSymbols       
	{
        title = "Military Symbols";
        values[] = {1, 2, 3, 4};
        texts[] = {"Disabled","Map Only","3d Only","Both"};
        default = 2;
        file = "ParamsPlus\Military_Symbol_Module.sqf";
        isGlobal = 0;
    };
    class PIntro      
	{ 
        title = "Intro";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 1;
       	file = "ParamsPlus\Intro.sqf";
        isGlobal = 0;
    };
  	class PRespawnLoadOut
	{
        title = "Dead Loadouts on Respawn";
       	values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 1;
//	    file = "ParamsPlus\RespawnInventory.sqf";
        isGlobal = 0;
	};
	class PDiverEquip       
	{
		title = "Diver Loadouts";
		values[] = {1, 2, 3};
		texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
		default = 1;
		file = "ParamsPlus\loadouts_diver_selection.sqf";
		isGlobal = 1;
	};
  	class PLoadOut
	{
        title = "Custom Loadouts";
       	values[] = {1, 2, 3};
        texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
        default = 2;
        file = "ParamsPlus\loadout_selection.sqf";
        isGlobal = 1;
	};	
  	class PLoadOutsGroupUnit
	{
        title = "Player Group Loadouts by Group Number";
       	values[] = {1, 2, 3};
        texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
        default = 1;
        file = "ParamsPlus\loadOut_group_selection.sqf";
        isGlobal = 1;
	};
  	class PLoadOutsWeaponsUnit
	{
        title = "Player Group Weapons by Group Number";
       	values[] = {1, 2, 3};
        texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
        default = 1;
        file = "ParamsPlus\loadouts_weapons_selection.sqf";
        isGlobal = 1;
	};
    class PUA       
	{
        title = "Unlimited Ammo";
        values[] = {1, 2, 3};
        texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
        default = 2;
		file = "ParamsPlus\UnlimitedAmmo_Group.sqf";
		isGlobal = 1;
    };		
    class PNightVision       
	{
        title = "Night Vision Adjustments";
        values[] = {1, 2, 3, 4};
        texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units","All Units None"};
        default = 2;
        file = "ParamsPlus\nightvision_Group.sqf";
        isGlobal = 1;
    };
    class PSilencers       
	{
        title = "Silencer Adjustments";
        values[] = {1, 2, 3, 4};
        texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units","All Units None"};
        default = 2;
        file = "ParamsPlus\silencers_Group.sqf";
        isGlobal = 1;
    };
    class PMarkers       
	{
        title = "Group Markers";
        values[] = {1, 2, 3, 4};
        texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units","All Units"};
        default = 2;
        file = "ParamsPlus\markers_Group.sqf";
        isGlobal = 1;
    };
    class PRegenHealth       
	{
    	title = "Health Regeneration";
        values[] = {1, 2, 3, 4};
        texts[] = {"Disabled","Fair","Middlin","Good"};
        default = 4;
        file = "ParamsPlus\regen_health_Group.sqf";
        isGlobal = 1;
    };
    class PAiMedic       
	{
        title = "Ctrl-Z Medic";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 2;
        file = "ParamsPlus\CtrlZ_Medic.sqf";
        isGlobal = 1;
    };
    class PLightning       
	{
        title = "Ctrl-Z Lightning";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 1;
        file = "ParamsPlus\CtrlZ_Lightning.sqf";
        isGlobal = 1;
    };
    class PGiGoEH       
	{
        title = "Group Leader Vehicle AmmoBox and Rally Point";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 2;
        file = "ParamsPlus\GiGoEH_Group.sqf";
        isGlobal = 1;
   	};
    class PRallyPoint      
	{ 
        title = "Group Leader UAV Backpack and Rally Point";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 2;
        file = "ParamsPlus\RallyPoint_Group.sqf";
        isGlobal = 1;
    };
    class PUAVHacker       
	{
        title = "Enable/Disable Player's UAV Ability";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 1;
    }; 
    class PEngineer       
	{
        title = "Enable/Disable Player's Repair Ability";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 1;
    };  
    class PExplSpec      
 	{
        title = "Enable/Disable Player's Defuse Ability";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 1;
    };    
    class PMedic       
	{
        title = "Enable/Disable Player's Medic Ability";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 2;
    };  
    class PRecoil        
	{
        title = "Player's Weapon Recoil";
        values[] = {1, 2, 3, 4};
        texts[] = {"No recoil","Poor recoil","Standard recoil","Intensive recoil"};
        default = 1;
    };    
    class PSway     
	{
        title = "Player's Weapon Sway";
        values[] = {1, 2, 3, 4};
        texts[] = {"No sway","Poor sway","Standard sway","Intensive sway"};
        default = 1;
    };
    class PStamina       
	{
        title = "Enable/Disable Player's Stamina System";
        values[] = {1, 2};
        texts[] = {"Disabled","Enabled"};
        default = 1;
    }; 
    class PLoadCoef       
	{
        title = "Player's Load Carrying Ability";
        values[] = {1, 2, 3, 4};
        texts[] = {"No ability","Low ability","Standard ability","High ability"};
        default = 4;
    };  
    class PAudibleCoef        
	{
        title = "Player's Stealth (Audible) Ability";
        values[] = {1, 2, 3, 4};
        texts[] = {"No ability","Low ability","Standard ability","High ability"};
        default = 4;
    };    
    class PCamoCoef        
	{
        title = "Player's Stealth (Visible) Ability";
        values[] = {1, 2, 3, 4};
        texts[] = {"No ability","Low ability","Standard ability","High ability"};
        default = 4;
    }; 
  	class PSettings
	{
        title = "Settings";
       	values[] = {1, 2, 3};
        texts[] = {"Disabled","Units Group Player","All Playable or Switchable Units"};
        default = 2;
        file = "ParamsPlus\playerSettings_Group.sqf";
        isGlobal = 1;
	};  
    class PSaves      
	{ 
        title = "Saves";
        values[] = {1, 2, 3, 4};
        texts[] = {"Saving Disabled, No Autosave","Saving Disabled, Autosave","Saving Enabled, No Autosave","Saving Enabled, Autosave"};
        default = 4;
		isGlobal = 0;
    };
 	class Param_Loadparams
   	{
		title = "Parameter Loading";
		values[] = {1, 2, 4};
		texts[] = {"Use above and save", "Load existing (Use above if not found)", "Use above without save"};
		default = 1;
		file = "ParamsPlus\parameterInit.sqf";
		isGlobal = 0;
	};
};


