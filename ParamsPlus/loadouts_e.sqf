///////  [_unit] execVM "paramsplus\loadouts_e.sqf";  ///////
_unit = _this;
_typeUnit = typeOf _unit;

//_recruitableunits = ["O_diver_TL_F","O_diver_exp_F","O_diver_F","O_medic_F","O_soldier_exp_F","O_engineer_F","O_soldier_mine_F","O_Story_Colonel_F","O_Story_CEO_F","O_officer_F","O_A_soldier_TL_F","O_Soldier_GL_F","O_Soldier_AT_F","O_soldier_M_F","O_A_soldier_F"];

switch (_typeUnit) do {

	case "O_diver_TL_F": { 		//  (GREYWOLF_1) TeamLeader-Diver

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_DMS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
_unit addItemToVest "Laserbatteries";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
_unit addItemToVest "HandGrenade";
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
_unit setName ["Tung Farsi","Tung","Farsi"]; 
[_unit,"AsianHead_A3_03","male01per",1,"GreyWolf"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_diver_exp_F": {		// (GREYWOLF_2) ExplosivesSpecialist-Diver

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
_unit addItemToVest "HandGrenade";
for "_i" from 1 to 5 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
_unit setName ["Faisal Khusraw","Faisal","Khusraw"];
[_unit,"PersianHead_A3_03","male03per",1,"GreyWolf"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_diver_F": {	//  (GREYWOLF_3) AT-Diver

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_DMS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addWeapon "launch_RPG32_F";
_unit addSecondaryWeaponItem "RPG32_F";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addWeapon "Rangefinder";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addItemToVest "FirstAidKit";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "APERSMine_Range_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "RPG32_F";};
_unit addItemToBackpack "RPG32_HE_F";
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
_unit setName ["Sadat Mohammadi","Sadat","Mohammadi"];
[_unit,"PersianHead_A3_03","male03per",1,"GreyWolf"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_medic_F": {		//  (GREYWOLF_4) CombatLifeSaver-Diver

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "srifle_EBR_F";
_unit addPrimaryWeaponItem "muzzle_snds_B";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "20Rnd_762x51_Mag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addWeapon "Rangefinder";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 5 do {_unit addItemToVest "20Rnd_762x51_Mag";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "Medikit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
_unit setName ["Majeed Saikal","Majeed","Saikal"];
[_unit,"PersianHead_A3_02","male02per",1,"GreyWolf"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_soldier_exp_F": {	//  Explosives Specialist

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "MineDetector";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Laserbatteries";
for "_i" from 1 to 3 do {_unit addItemToVest "APERSMine_Range_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "Chemlight_red";
_unit addItemToVest "30Rnd_65x39_caseless_green";
for "_i" from 1 to 5 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 3 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 3 do {_unit addItemToBackpack "APERSBoundingMine_Range_Mag";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";};
_unit addItemToBackpack "DemoCharge_Remote_Mag";
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
_unit setName ["Hafiz Kushan","Hafiz","Kushan"];
[_unit,"PersianHead_A3_03","male03per",1,"GreyWolf"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_engineer_F": {		// Engineer

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_MX_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";;

comment "Set identity";
_unit setName ["Abbas Yousuf","Abbas","Yousuf"];
[_unit,"PersianHead_A3_03","male03per",1,"GreyWolf"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

case "O_soldier_mine_F": {	 // Mine Specialist

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_MX_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_MRD";
_unit addHandgunItem "11Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
for "_i" from 1 to 3 do {_unit addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
_unit addItemToVest "B_UavTerminal";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareGreen_F";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
for "_i" from 1 to 7 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";

comment "Set identity";
_unit setName ["Hafiz Kohzad","Hafiz","Kohzad"];
[_unit,"PersianHead_A3_01","male01per",1,"GreyWolf"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_Story_Colonel_F": { 	//  Namdar

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_Yorris_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_BandollierB_khk";
_unit addBackpack "B_TacticalPack_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 5 do {_unit addItemToUniform "6Rnd_45ACP_Cylinder";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToVest "Laserbatteries";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
_unit addHeadgear "H_Beret_ocamo";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
	
comment "Set identity";
_unit setName ["Faisal Yusufzai","Faisal","Yusufzai"];
[_unit,"PersianHead_A3_01","male02per",1,"IRIA"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_Story_CEO_F": { 	//  Attar 

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_Yorris_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_BandollierB_khk";
_unit addBackpack "B_TacticalPack_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 5 do {_unit addItemToUniform "6Rnd_45ACP_Cylinder";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToVest "Laserbatteries";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
_unit addHeadgear "H_Beret_ocamo";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
	
comment "Set identity";
_unit setName ["Hafiz Haidari","Hafiz","Haidari"];
[_unit,"PersianHead_A3_02","male02per",1,"IRIA"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};	

	case "O_officer_F": { 	// Officer

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_Yorris_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_BandollierB_khk";
_unit addBackpack "B_TacticalPack_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 5 do {_unit addItemToUniform "6Rnd_45ACP_Cylinder";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToVest "Laserbatteries";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
_unit addHeadgear "H_Beret_ocamo";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
	
comment "Set identity";
_unit setName ["Umar Yusufzai","Umar","Yusufzai"];
[_unit,"PersianHead_A3_01","male02per",1,"IRIA"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_A_soldier_TL_F": { 	//  TeamLeader

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_Yorris_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_BandollierB_khk";
_unit addBackpack "B_TacticalPack_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 5 do {_unit addItemToUniform "6Rnd_45ACP_Cylinder";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToVest "Laserbatteries";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
_unit addHeadgear "H_Beret_ocamo";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
	
comment "Set identity";
_unit setName ["Umar Haidari","Umar","Haidari"];
[_unit,"PersianHead_A3_03","male02per",1,"IRIA"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_Soldier_GL_F": { 	// Grenadier

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
_unit addItemToVest "HandGrenade";
for "_i" from 1 to 5 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
_unit addItemToBackpack "Medikit";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";
	
comment "Set identity";
_unit setName ["Sibhatullah Muhtaram","Sibhatullah","Muhtaram"];
[_unit,"PersianHead_A3_01","male02per",1,"IRIA"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_Soldier_AT_F": { 	// 	AT Specialist

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_DMS";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addWeapon "launch_RPG32_F";
_unit addSecondaryWeaponItem "RPG32_F";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "9Rnd_45ACP_Mag";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_TacVest_brn";
_unit addBackpack "B_Carryall_ocamo";

comment "Add binoculars";
_unit addWeapon "Rangefinder";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
_unit addItemToVest "FirstAidKit";
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "APERSMine_Range_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "RPG32_F";};
_unit addItemToBackpack "RPG32_HE_F";
_unit addHeadgear "H_Cap_brn_SPECOPS";
_unit addGoggles "G_Goggles_VR";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
_unit linkItem "NVGoggles";
	
comment "Set identity";
_unit setName ["Majeed Aybak","Majeed","Aybak"];
[_unit,"PersianHead_A3_01","male02per",1,"IRIA"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_soldier_M_F": { 	//  Marksman

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_Yorris_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_BandollierB_khk";
_unit addBackpack "B_TacticalPack_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 5 do {_unit addItemToUniform "6Rnd_45ACP_Cylinder";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToVest "Laserbatteries";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
_unit addHeadgear "H_Beret_ocamo";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
	
comment "Set identity";
_unit setName ["Qadeer Masood","Qadeer","Masood"];
[_unit,"PersianHead_A3_03","male01per",1,"IRIA"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};

	case "O_A_soldier_F": { 	//  Rifleman  

comment "Exported from Arsenal by DIEHARD";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local _unit) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_Katiba_GL_F";
_unit addPrimaryWeaponItem "muzzle_snds_H";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "hgun_Pistol_heavy_02_Yorris_F";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "optic_Yorris";
_unit addHandgunItem "6Rnd_45ACP_Cylinder";

comment "Add containers";
_unit forceAddUniform "U_O_OfficerUniform_ocamo";
_unit addVest "V_BandollierB_khk";
_unit addBackpack "B_TacticalPack_ocamo";

comment "Add binoculars";
_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator";

comment "Add items to containers";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 5 do {_unit addItemToUniform "6Rnd_45ACP_Cylinder";};
for "_i" from 1 to 2 do {_unit addItemToUniform "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
_unit addItemToVest "MineDetector";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addItemToVest "Laserbatteries";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 12 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "HandGrenade";};
_unit addHeadgear "H_Beret_ocamo";
_unit addGoggles "G_Aviator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "O_UavTerminal";
	
comment "Set identity";
_unit setName ["Rahim Siddiqi","Rahim","Siddiqi"];
[_unit,"PersianHead_A3_01","male03per",1,"IRIA"] call BIS_fnc_setIdentity;
[_unit,"Curator"] call BIS_fnc_setUnitInsignia;
};
};

if (((dayTime > ((date call BIS_fnc_sunriseSunsetTime) select 0) - 0.5) && (dayTime < ((date call BIS_fnc_sunriseSunsetTime) select 1) + 0.5)) isEqualTo false) then {_unit action ["nvGoggles", _unit]};

_PRespawnLoadOut = "PRespawnLoadOut" call BIS_fnc_getParamValue;

if (_PRespawnLoadOut isEqualTo 2) then {

_unitlo	= getUnitLoadout _unit;

_unit setVariable ["LoadoutDone", _unitlo, true];

} else {

_unit addEventHandler ["Respawn",{_this execVM "paramsplus\loadouts_e.sqf"}];

_unit setVariable ["LoadoutDone", true];

};

_unit action ["WEAPONONBACK", _unit];

if (isPlayer _unit) then {

[playerSide, "HQ"] commandChat "Loadouts Done!"

};

