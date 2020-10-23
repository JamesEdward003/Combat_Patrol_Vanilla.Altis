//  recruitable_units_static.sqf  //
switch {typeOf player} do {

	case "B_officer_F": {bon_recruit_recruitableunits = ["B_Soldier_SL_F","B_Soldier_TL_F","B_engineer_F","B_soldier_exp_F","B_medic_F","B_Helipilot_F","B_Soldier_F","B_soldier_AT_F","B_soldier_LAT_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_AR_F","B_Soldier_A_F","B_sniper_F","B_spotter_F"];};
	
	case "B_Soldier_SL_F": {bon_recruit_recruitableunits = ["B_officer_F","B_Soldier_TL_F","B_engineer_F","B_soldier_exp_F","B_medic_F","B_Helipilot_F","B_Soldier_F","B_soldier_AT_F","B_soldier_LAT_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_AR_F","B_Soldier_A_F","B_sniper_F","B_spotter_F"];};
	
	case "B_Soldier_TL_F": {bon_recruit_recruitableunits = ["B_officer_F","B_Soldier_SL_F","B_engineer_F","B_soldier_exp_F","B_medic_F","B_Helipilot_F","B_Soldier_F","B_soldier_AT_F","B_soldier_LAT_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_AR_F","B_Soldier_A_F","B_sniper_F","B_spotter_F"];};
		
	case "B_recon_F": {bon_recruit_recruitableunits = ["B_recon_F","B_recon_LAT_F","B_recon_exp_F","B_soldier_exp_F","B_recon_medic_F","B_recon_TL_F","B_recon_M_F","B_recon_JTAC_F","B_Soldier_GL_F"];};
	
	case "B_diver_TL_F":	{bon_recruit_recruitableunits = ["B_diver_TL_F","B_diver_exp_F","B_diver_F","B_engineer_F","B_recon_medic_F"];};
	
	case "B_Captain_Pettka_F": {bon_recruit_recruitableunits = ["B_Captain_Pettka_F","B_Captain_Jay_F","B_CTRG_soldier_GL_LAT_F","B_Story_Protagonist_F","B_CTRG_soldier_AR_A_F","B_CTRG_soldier_M_medic_F","B_CTRG_soldier_engineer_exp_F"];};
};

