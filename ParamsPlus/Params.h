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
		values[] = {1, 0};
		texts[] = {$STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_yes_0, $STR_A3_cfgvehicles_modulestrategicmapimage_f_arguments_shadow_values_no_0};
		default = 0;
	};
	class BIS_CP_tickets
	{
		title = $STR_A3_combatpatrol_params_18;
		values[] = {5, 10, 20, 50, 100};
		texts[] = {"5", "10", "20", "50", "100"};
		default = 20;
	};
	class BIS_CP_locationSelection
	{
		title = $STR_A3_combatpatrol_params_20;
		values[] = {0, 1};
		texts[] = {$STR_A3_combatpatrol_params_21, $STR_A3_bis_fnc_respawnmenuposition_random};
		default = 0;
	};
	class BIS_CP_objective
	{
		title = $STR_A3_combatpatrol_params_22;
		values[] = {-1, 1, 2, 3, 4, 5};
		texts[] = {$STR_A3_bis_fnc_respawnmenuposition_random, $STR_A3_combatpatrol_params_26, $STR_A3_combatpatrol_params_27, $STR_A3_combatpatrol_params_28, $STR_customcombatpatrol_params_2, $STR_customcombatpatrol_params_4};
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
		default = 1;
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
  	class PLoadOut
	{
        	title = "Scripted Loadouts";
       	values[] = {1, 2, 3};
        	texts[] = {"Playable or Switchable Units","Units Group Player","Disabled"};
        	default = 2;
        	file = "ParamsPlus\loadout_selection.sqf";
        	isGlobal = 1;
	};			
    	class PDiverEquip   {    

        	title = "Diver Equipment";
        	values[] = {1, 2, 3};
        	texts[] = {"Playable or Switchable Units","Units Group Player","Disabled"};
        	default = 3;
        	file = "ParamsPlus\loadouts_diver_selection.sqf";
        	isGlobal = 1;
    	};
    	class PloadoutAdjustments   {    

        	title = "Night Vision and Silencer Adjustments";
        	values[] = {1, 2, 3};
        	texts[] = {"Playable or Switchable Units","Units Group Player","Disabled"};
        	default = 2;
        	file = "ParamsPlus\loadoutAdjustments_Group.sqf";
        	isGlobal = 1;
    	};
    	class PMarkers   {    

        	title = "Group Markers";
        	values[] = {1, 2, 3};
        	texts[] = {"Playable or Switchable Units","Units Group Player","Disabled"};
        	default = 3;
        	file = "ParamsPlus\GroupMarkers.sqf";
        	isGlobal = 1;
    	};
    	class PRegenHealth   {    

        	title = "Health Regeneration";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"Fair","Middlin","Good","Disabled"};
        	default = 3;
        	file = "ParamsPlus\regen_health_group.sqf";
        	isGlobal = 1;
    	};
    	class PAiMedic   {    

        	title = "Keypress Ai Medic";
        	values[] = {1, 2};
        	texts[] = {"Enabled","Disabled"};
        	default = 1;
        	file = "ParamsPlus\Heal_Keypress.sqf";
        	isGlobal = 1;
    	};
    	class PRallyPoint   {    

        	title = "Group Leader Rally Point";
        	values[] = {1, 2};
        	texts[] = {"Enabled","Disabled"};
        	default = 1;
        	file = "ParamsPlus\Rally.sqf";
        	isGlobal = 1;
    	};
    	class PGiGoEH   {    

        	title = "Group Leader Vehicle AmmoBox and Respawn Point";
        	values[] = {1, 2};
        	texts[] = {"Enabled","Disabled"};
        	default = 1;
        	file = "ParamsPlus\GiGoEH.sqf";
        	isGlobal = 1;
   	};
	class Pskill	 {

        	title = "Blufor Skill";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"Below Average", "Average", "Above Average", "Excellent"};
        	default = 3;
        	file = "ParamsPlus\BluSkill.sqf";
        	isGlobal = 0;
	};
	class Eskill	 {

        	title = "Opfor Skill";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"Below Average", "Average", "Above Average", "Excellent"};
        	default = 3;
       	file = "ParamsPlus\OpSkill.sqf";
        	isGlobal = 0;
	};
    	class PFatigue    {  
        	title = "Enable/Disable Player's Fatigue System";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};  
    	class PStamina    {  
  
        	title = "Enable/Disable Player's Stamina System";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};    
    	class PRecoil    {    

        	title = "Player's Weapon Recoil";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No recoil","Poor recoil","Standard recoil","Intensive recoil"};
        	default = 3;
    	};    
    	class PAimCoef    {  

        	title = "Player's Weapon Sway";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No sway","Poor sway","Standard sway","Intensive sway"};
        	default = 3;
    	};
    	class PAudibleCoef    {    

        	title = "Player's Stealth (Audible) Value";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No value","Low value","Standard value","High value"};
        	default = 3;
    	};    
    	class PCamouflageCoef    {    

        	title = "Player's Stealth (Visible) Value";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No value","Low value","Standard value","High value"};
        	default = 3;
    	};
    	class PLoadCoef    {   

        	title = "Player's Load Carrying Value";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No value","Low value","Standard value","High value"};
        	default = 3;
    	}; 
    	class PEngineer    {   

        	title = "Enable/Disable Player's Repair Ability";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};  
    	class PExplosiveSpecialist   {   
 
        	title = "Enable/Disable Player's Defuse Ability";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};    
    	class PMedic    {   

        	title = "Enable/Disable Player's Medic Ability";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 2;
    	};  
    	class PUAVHacker   {    

        	title = "Enable/Disable Player's UAV Ability";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};  
    	class PUA   {    

        	title = "Enable/Disable Unlimited Ammo";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};
    	class PDiver   {    

        	title = "Enable/Disable SpecOp Divers";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};
    	class PIntro   {    

        	title = "Enable/Disable Altis Intro";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};
};

