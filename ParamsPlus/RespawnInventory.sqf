// "RespawnInventory.sqf" //
_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 2) exitWith {
//_classname 	= format ["%1", typeOf player];
//_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");

//[west, _displayname] call BIS_fnc_addRespawnInventory;

//[missionNamespace,[_displayname,0,1]] call BIS_fnc_addRespawnInventory;

[west, "Squadleader"] call BIS_fnc_addRespawnInventory;

[west, "Marksman"] call BIS_fnc_addRespawnInventory;

//[west, ["PETTKA",1]] call BIS_fnc_addRespawnInventory;
//[west, ["NORTHGATE",1]] call BIS_fnc_addRespawnInventory;
//[west, ["KERRY",1]] call BIS_fnc_addRespawnInventory;
//[west, ["MCKAY",1]] call BIS_fnc_addRespawnInventory;
//[west, ["JAMES",1]] call BIS_fnc_addRespawnInventory;
//[west, ["HARDY",1]] call BIS_fnc_addRespawnInventory;
//[west, ["JAY",1]] call BIS_fnc_addRespawnInventory;
//[west, ["DWARDEN",1]] call BIS_fnc_addRespawnInventory;     
     
//[missionNamespace,["PETTKA",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["NORTHGATE",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["KERRY",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["MCKAY",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["JAMES",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["HARDY",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["JAY",1,1]] call BIS_fnc_addRespawnInventory;
//[missionNamespace,["DWARDEN",1,1]] call BIS_fnc_addRespawnInventory;

////*******************
//// Standard equipment
////*******************
//class B_SquadLeader
//{
//	displayName = $STR_b_soldier_sl_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManLeader_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"Rangefinder",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierSpec_tna_F",
//		"H_HelmetB_Enh_tna_F",
//		"optic_Nightstalker",
//		"acc_pointer_IR",
//		"NVGoggles_tna_F",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//};
//class B_Marksman
//{
//	displayName = $STR_b_soldier_m_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"srifle_EBR_F",
//		"Rangefinder",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier1_tna_F",
//		"H_HelmetB_Light_tna_F",
//		"optic_Nightstalker",
//		"acc_pointer_IR",
//		"bipod_01_F_blk",
//		"NVGoggles_tna_F",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//};
//class B_Autorifleman
//{
//	displayName = $STR_b_soldier_ar_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManMG_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"LMG_03_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"200Rnd_556x45_Box_F",
//		"200Rnd_556x45_Box_F",
//		"200Rnd_556x45_Box_F",
//		"200Rnd_556x45_Box_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"bipod_01_F_blk",
//		"optic_Aco",
//		"acc_pointer_IR",
//		"NVGoggles_tna_F",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//class B_Grenadier
//{
//	displayName = $STR_b_soldier_gl_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"HandGrenade",
//		"HandGrenade",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierGL_tna_F",
//		"H_HelmetB_tna_F",
//		"optic_Aco",
//		"acc_pointer_IR",
//		"NVGoggles_tna_F",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//class B_Rifleman
//{
//	displayName = $STR_A3_cfgvehicles_b_soldier_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"optic_Aco",
//		"acc_pointer_IR",
//		"NVGoggles_tna_F",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//        class B_AT
//{
//	displayName = $STR_b_soldier_lat_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManAT_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F",
//		"launch_NLAW_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade",
//		"NLAW_F",
//		"NLAW_F"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"optic_Aco",
//		"acc_pointer_IR",
//		"NVGoggles_tna_F",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//	backpack = "B_AssaultPack_tna_F";
//};
//        class B_Engineer
//{
//	displayName = $STR_b_engineer_f0;
//	role = "Support";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManEngineer_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"DemoCharge_Remote_Mag",
//		"DemoCharge_Remote_Mag"
//	};
//	items[] = {
//		"FirstAidKit",
//		"Toolkit",
//		"MineDetector"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier1_tna_F",
//		"H_HelmetB_Light_tna_F",
//		"optic_aco",
//		"acc_pointer_IR",
//		"NVGoggles_tna_F",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//	backpack = "B_AssaultPack_tna_F";
//};
//class B_CombatLifesaver
//{
//	displayName = $STR_b_medic_f0;
//	role = "Support";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManMedic_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F"
//	};
//	items[] = {
//		"FirstAidKit",
//		"Medikit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierSpec_tna_F",
//		"H_HelmetB_Enh_tna_F",
//		"optic_aco",
//		"acc_pointer_IR",
//		"NVGoggles_tna_F",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//	backpack = "B_AssaultPack_tna_F";
//};
////******************
//// Limited equipment
////******************
//class B_SquadLeader_L
//{
//	displayName = $STR_b_soldier_sl_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManLeader_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"Binocular",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierSpec_tna_F",
//		"H_HelmetB_Enh_tna_F",
//		"optic_Nightstalker",
//		"acc_flashlight",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//};
//class B_Marksman_L
//{
//	displayName = $STR_b_soldier_m_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"srifle_EBR_F",
//		"Binocular",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier1_tna_F",
//		"H_HelmetB_Light_tna_F",
//		"optic_Nightstalker",
//		"acc_flashlight",
//		"bipod_01_F_blk",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//};
//class B_Autorifleman_L
//{
//	displayName = $STR_b_soldier_ar_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManMG_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"LMG_03_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"200Rnd_556x45_Box_F",
//		"200Rnd_556x45_Box_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"bipod_01_F_blk",
//		"optic_Aco",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//class B_Grenadier_L
//{
//	displayName = $STR_b_soldier_gl_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"HandGrenade",
//		"HandGrenade",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierGL_tna_F",
//		"H_HelmetB_tna_F",
//		"optic_Aco",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//class B_Rifleman_L
//{
//	displayName = $STR_A3_cfgvehicles_b_soldier_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"optic_Aco",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//        class B_AT_L
//{
//	displayName = $STR_b_soldier_lat_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManAT_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F",
//		"launch_NLAW_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade",
//		"NLAW_F",
//		"NLAW_F"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"optic_Aco",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//	backpack = "B_AssaultPack_tna_F";
//};
//        class B_Engineer_L
//{
//	displayName = $STR_b_engineer_f0;
//	role = "Support";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManEngineer_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"DemoCharge_Remote_Mag",
//		"DemoCharge_Remote_Mag"
//	};
//	items[] = {
//		"FirstAidKit",
//		"Toolkit",
//		"MineDetector"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier1_tna_F",
//		"H_HelmetB_Light_tna_F",
//		"optic_Aco",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//	backpack = "B_AssaultPack_tna_F";
//};
//class B_CombatLifesaver_L
//{
//	displayName = $STR_b_medic_f0;
//	role = "Support";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManMedic_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F"
//	};
//	items[] = {
//		"FirstAidKit",
//		"Medikit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierSpec_tna_F",
//		"H_HelmetB_Enh_tna_F",
//		"optic_aco",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//	backpack = "B_AssaultPack_tna_F";
//};
////*********
//// Survivor
////*********
//class B_SquadLeader_S
//{
//	displayName = $STR_b_soldier_sl_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManLeader_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"Binocular",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"30Rnd_556x45_Stanag_Tracer_Red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierSpec_tna_F",
//		"H_HelmetB_Enh_tna_F",
//		"acc_flashlight",
//		"ItemGPS",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//};
//class B_Marksman_S
//{
//	displayName = $STR_b_soldier_m_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"srifle_DMR_03_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"20Rnd_762x51_Mag",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier1_tna_F",
//		"H_HelmetB_Light_tna_F",
//		"acc_flashlight",
//		"bipod_01_F_blk",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//};
//class B_Autorifleman_S
//{
//	displayName = $STR_b_soldier_ar_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManMG_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"LMG_03_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"200Rnd_556x45_Box_F",
//		"200Rnd_556x45_Box_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"bipod_01_F_blk",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//class B_Grenadier_S
//{
//	displayName = $STR_b_soldier_gl_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"HandGrenade",
//		"HandGrenade",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierGL_tna_F",
//		"H_HelmetB_tna_F",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//class B_Rifleman_S
//{
//	displayName = $STR_A3_cfgvehicles_b_soldier_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconMan_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//};
//        class B_AT_S
//{
//	displayName = $STR_b_soldier_lat_f0;
//	role = "Assault";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManAT_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F",
//		"launch_NLAW_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"HandGrenade",
//		"HandGrenade",
//		"NLAW_F",
//		"NLAW_F"
//	};
//	items[] = {
//		"FirstAidKit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier2_tna_F",
//		"H_HelmetB_tna_F",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//	backpack = "B_AssaultPack_tna_F";
//};
//        class B_Engineer_S
//{
//	displayName = $STR_b_engineer_f0;
//	role = "Support";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManEngineer_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShell",
//		"SmokeShell",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F",
//		"DemoCharge_Remote_Mag",
//		"DemoCharge_Remote_Mag"
//	};
//	items[] = {
//		"FirstAidKit",
//		"Toolkit",
//		"MineDetector"
//	};
//	linkedItems[] = {
//		"V_PlateCarrier1_tna_F",
//		"H_HelmetB_Light_tna_F",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_AR_F";
//	backpack = "B_AssaultPack_tna_F";
//};
//class B_CombatLifesaver_S
//{
//	displayName = $STR_b_medic_f0;
//	role = "Support";
//	icon = "\A3\ui_f\data\map\VehicleIcons\iconManMedic_ca.paa";
//	show = "side group _this == west";
//	weapons[] = {
//		"arifle_Mk20_GL_MRCO_pointer_F",
//		"hgun_P07_khk_F"
//	};
//	magazines[] = {
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"SmokeShellBlue",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"16Rnd_9x21_Mag",
//		"30Rnd_556x45_Stanag_red",
//		"30Rnd_556x45_Stanag_red",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_Smoke_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"1Rnd_HE_Grenade_shell",
//		"UGL_FlareWhite_F",
//		"UGL_FlareGreen_F"
//	};
//	items[] = {
//		"FirstAidKit",
//		"Medikit"
//	};
//	linkedItems[] = {
//		"V_PlateCarrierSpec_tna_F",
//		"H_HelmetB_Enh_tna_F",
//		"acc_flashlight",
//		"ItemMap",
//		"ItemCompass",
//		"ItemWatch",
//		"ItemRadio"
//	};
//	uniformClass = "U_B_T_Soldier_SL_F";
//	backpack = "B_AssaultPack_tna_F";
//};     

