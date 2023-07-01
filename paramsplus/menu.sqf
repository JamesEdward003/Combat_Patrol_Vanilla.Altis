///////////////////////////////////////////////////////////
PlayerSupport_Menu1 = 
[
	["Player Support 1",False],
	["Unit Cursor Arrest",[2],"",-5,[["expression","_null=[cursorTarget,player] execvm '008\ArrestScript.sqf'"]],"1","1"],
	["Unit Cursor Marker",[3],"",-5,[["expression","_null=[] execvm '008\twirlyMrkrCursor.sqf'"]],"1","1"],
	["Unit Cursor Dismiss",[4],"",-5,[["expression","_null=[] execvm '008\dismissCursor.sqf'"]],"1","1"],
	["Unit Cursor Heal By Player",[5],"",-5,[["expression","_null=[player] execvm '008\heal\heal.sqf'"]],"1","1"],
	["Unit Cursor Destroy",[6],"",-5,[["expression","_null=[] execvm '008\destroy.sqf'"]],"1","1"],
	["Unit Cursor Join Player Group",[7],"",-5,[["expression","_null=[cursorTarget,player] execvm '008\joinGrpPlayer.sqf'"]],"1","1"],
	["Units Area 20m Join Player",[8],"",-5,[["expression","_null=[20] execvm '008\joinPlayerArea.sqf'"]],"1","1"],
	["Units Area 100m Join Player",[9],"",-5,[["expression","_null=[100] execvm '008\joinPlayerArea.sqf'"]],"1","1"],
	["Player Heal Self",[10],"",-5,[["expression","_null=[player] execvm '008\healSelf\healSelf.sqf'"]],"1","1"]
];

PlayerSupport_Menu2 = 
[
	["Player Support 2",False],
	["Respawn Marker Player",[2],"",-5,[["expression","_null=[player] execvm '008\RallyPoint.sqf'"]],"1","1"],
	["Respawn Marker On MapClick",[3],"",-5,[["expression","_null=[] execvm '008\RallyPointOMC.sqf'"]],"1","1"],
	["Player TaskCheck",[4],"",-5,[["expression","_null=[player] execvm 'taskCheck.sqf'"]],"1","1"],/////
	["Player Call BIS_fnc_help",[5],"",-5,[["expression","_null=[] call BIS_fnc_help"]],"1","1"],/////
	["Vehicle Cursor Unlock",[6],"",-5,[["expression","_null=[] execvm '008\unlock.sqf'"]],"1","1"],
	["Vehicle Cursor Service",[7],"",-5,[["expression","_null=[cursorTarget] execvm '008\vehicleService.sqf'"]],"1","1"],
	["Teleport Player",[8],"",-5,[["expression","_null=[player] execvm '008\teleport.sqf'"]],"1","1"],
	["Teleport Group Player",[9],"",-5,[["expression","_null=[player] execvm '008\teleportGroup.sqf'"]],"1","1"],
	["HALO Player",[10],"",-5,[["expression","_null=[] execvm '008\HaloPlayer.sqf'"]],"1","1"]
];

WeaponSupport_Menu1 = 
[
	["Weapon Support Player",False],
	["Rifleman(AT)",[2],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_soldier_LAT_F')"]],"1","1"],
	["Repair Specialist",[3],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_soldier_repair_F')"]],"1","1"],
	["Combat Life Saver",[4],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_medic_F')"]],"1","1"],
	["Engineer",[5],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_engineer_F')"]],"1","1"],
	["Explosive Specialist",[6],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_soldier_exp_F')"]],"1","1"],
	["Grenadier",[7],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_Soldier_GL_F')"]],"1","1"],
	["Heavy Gunner",[8],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_HeavyGunner_F')"]],"1","1"],
	["Marksman",[9],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_soldier_M_F')"]],"1","1"],
	["Sharpshooter",[10],"",-5,[["expression","player setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_Sharpshooter_F')"]],"1","1"],
	["SAVE LOADOUT",[11],"",-5,[["expression","_null=[player] execvm 'cly_addweapon\saveLoadout_init.sqf'"]],"1","1"]
];

WeaponSupport_Menu2 =
[
	["Weapon Support CursorTarget",False],
	["Rifleman(AT)",[2],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_soldier_LAT_F')"]],"1","1"],
	["Repair Specialist",[3],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_soldier_repair_F')"]],"1","1"],
	["Combat Life Saver",[4],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_medic_F')"]],"1","1"],
	["Engineer",[5],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_engineer_F')"]],"1","1"],
	["Explosive Specialist",[6],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_soldier_exp_F')"]],"1","1"],
	["Grenadier",[7],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_Soldier_GL_F')"]],"1","1"],
	["Heavy Gunner",[8],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_HeavyGunner_F')"]],"1","1"],
	["Marksman",[9],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_soldier_M_F')"]],"1","1"],
	["Sharpshooter",[10],"",-5,[["expression","cursorTarget setUnitLoadout (configFile >> 'CfgVehicles' >> 'B_Sharpshooter_F')"]],"1","1"],
	["SAVE LOADOUT",[11],"",-5,[["expression","_null=[cursorTarget] execvm 'cly_addweapon\saveLoadout_init.sqf'"]],"1","1"]
];	

MusicSupport_Menu1 = 
[
	["Music Support 1",False],
	["Born On The Bayou",[2],"",-5,[["expression","_null=[] execvm 'Music\BornOnTheBayou.sqf'"]],"1","1"],
	["Fortunate Son",[3],"",-5,[["expression","_null=[] execvm 'Music\FortunateSon.sqf'"]],"1","1"],
	["Fortunate Son 2",[4],"",-5,[["expression","_null=[] execvm 'Music\FortunateSon2.sqf'"]],"1","1"],
	["Good Golly Miss Molly",[5],"",-5,[["expression","_null=[] execvm 'Music\GoodGollyMissMolly.sqf'"]],"1","1"],
	["Keep On Chooglin",[6],"",-5,[["expression","_null=[] execvm 'Music\KeepOnChooglin.sqf'"]],"1","1"],
	["Run Through The Jungle",[7],"",-5,[["expression","_null=[] execvm 'Music\RunThroughTheJungle.sqf'"]],"1","1"],
	["Did You Ever Have To Make Up Your Mind",[8],"",-5,[["expression","_null=[] execvm 'Music\DidYouEverHaveToMakeUpYourMind.sqf'"]],"1","1"],
	["Up On The Roof",[9],"",-5,[["expression","_null=[] execvm 'Music\UpOnTheRoof.sqf'"]],"1","1"],
	["The Magdalene Laundries",[10],"",-5,[["expression","_null=[] execvm 'Music\TheMagdaleneLaundries.sqf'"]],"1","1"]
];

MusicSupport_Menu2 =
[
	["Music Support 2",False],
	["AM92Intro",[2],"",-5,[["expression","_null=[] execvm 'Music\AM92Intro.sqf'"]],"1","1"],
	["DirtyCity",[3],"",-5,[["expression","_null=[] execvm 'Music\DirtyCity.sqf'"]],"1","1"],
	["Fortunate Son 2",[4],"",-5,[["expression","_null=[] execvm 'Music\FortunateSon2.sqf'"]],"1","1"],
	["Good Golly Miss Molly",[5],"",-5,[["expression","_null=[] execvm 'Music\GoodGollyMissMolly.sqf'"]],"1","1"],
	["Keep On Chooglin",[6],"",-5,[["expression","_null=[] execvm 'Music\KeepOnChooglin.sqf'"]],"1","1"],
	["Run Through The Jungle",[7],"",-5,[["expression","_null=[] execvm 'Music\RunThroughTheJungle.sqf'"]],"1","1"],
	["Did You Ever Have To Make Up Your Mind",[8],"",-5,[["expression","_null=[] execvm 'Music\DidYouEverHaveToMakeUpYourMind.sqf'"]],"1","1"],
	["Up On The Roof",[9],"",-5,[["expression","_null=[] execvm 'Music\UpOnTheRoof.sqf'"]],"1","1"],
	["The Magdalene Laundries",[10],"",-5,[["expression","_null=[] execvm 'Music\TheMagdaleneLaundries.sqf'"]],"1","1"]
];	

MusicSupport_Menu3 =
[
	["Music Support 3",False],
	["OM_Intro",[2],"",-5,[["expression","playMusic 'OM_Intro'"]],"1","1"],
	["OM_Music01",[3],"",-5,[["expression","playMusic 'OM_Music01'"]],"1","1"],
	["OM_Music02",[4],"",-5,[["expression","playMusic 'OM_Music02'"]],"1","1"],
	["OM_Music03",[5],"",-5,[["expression","playMusic 'OM_Music03'"]],"1","1"],
	["LeadTrack02_F_Bootcamp",[6],"",-5,[["expression","playMusic 'LeadTrack02_F_Bootcamp'"]],"1","1"],
	["LeadTrack03_F_Bootcamp",[7],"",-5,[["expression","playMusic 'LeadTrack03_F_Bootcamp'"]],"1","1"],
	["Track_C_01",[8],"",-5,[["expression","playMusic 'Track_C_01'"]],"1","1"],
	["Track_C_02",[9],"",-5,[["expression","playMusic 'Track_C_02'"]],"1","1"],
	["Track_C_03",[10],"",-5,[["expression","playMusic 'Track_C_03'"]],"1","1"]
];

AirSupport_Menu1 = 
[
	["Air Support 1",False],
	["CameraSQF",[2],"",-5,[["expression","_null=player execVM '008\snapshots\CameraSQF.sqf'"]],"1","1"],
	["Camera Mapclick",[3],"",-5,[["expression","_null=[player] execVM '008\snapshots\onMapClickCamera.sqf'"]],"1","1"],
	["Group Halo",[4],"",-5,[["expression","_null=[player] execVM '008\HaloGroup.sqf'"]],"1","1"],
	["Player Halo",[5],"",-5,[["expression","_null=[player] execvm '008\HaloPlayer.sqf'"]],"1","1"],
	["Air Transport",[6],"",-5,[["expression","_null=[player] execVM '008\plannedExtraction.sqf'"]],"1","1"],
	["Air Strike",[7],"",-5,[["expression","_null=[player] execvm '008\airStrike.sqf'"]],"1","1"],
	["Missile Strike",[8],"",-5,[["expression","_null=[player] execvm '008\MissileStrike\missile_airstrike_init.sqf'"]],"1","1"],
	["Fixed-Wing CAS",[9],"",-5,[["expression","_null=[player] execvm '008\plannedFixedWing.sqf'"]],"1","1"],
	["Rotary-Wing CAS",[10],"",-5,[["expression","_null=[player] execvm '008\plannedRotaryWing.sqf'"]],"1","1"]
];

AirSupport_Menu2 =
[
	["Air Support 2",False],
	["Vehicle AltLZ",[2],"",-5,[["expression","_null=[objNull,player] execvm '008\altLZalt.sqf'"]],"1","1"],
	["Vehicle LAND",[3],"",-5,[["expression","_null=[objNull,player] execvm '008\land.sqf'"]],"1","1"],
	["Vehicle Unlock",[4],"",-5,[["expression","_null=[objNull,player] execvm '008\unlock.sqf'"]],"1","1"],
	["Vehicle Lock",[5],"",-5,[["expression","_null=[objNull,player] execvm '008\lock.sqf'"]],"1","1"],
	["Vehicle Repair",[6],"",-5,[["expression","_null=[objNull,player] execvm '008\repair.sqf'"]],"1","1"],
	["Vehicle Service Addaction",[7],"",-5,[["expression","_null=[objNull,player] execvm '008\vehicleService.sqf'"]],"1","1"],
	["LaserTarget OnMapClick",[8],"",-5,[["expression","_null=[] execvm '008\laseTargetOnMapClick.sqf'"]],"1","1"],
	["LaserTarget CursorTarget",[9],"",-5,[["expression","_null=[player] execvm '008\laseTargetCursor.sqf'"]],"1","1"]
];	

GroundSupport_Menu = 
[
	["Ground Support",False],
	["Arma2 Infantry On MapClick",[2],"",-5,[["expression","_null=[player] execvm '008\createInfantry.sqf'"]],"1","1"],
	["Arma2 Special Infantry On MapClick",[3],"",-5,[["expression","_null=[player] execvm '008\createRazorInfantry.sqf'"]],"1","1"],
	["Arma2 Motorized Infantry On MapClick",[4],"",-5,[["expression","_null=[player] execvm '008\createMotorizedInfantry.sqf'"]],"1","1"],
	["Arma2 Mechanized Infantry On MapClick",[5],"",-5,[["expression","_null=[player] execvm '008\createMechanizedInfantry.sqf'"]],"1","1"],
	["Arma2 Armored Infantry On MapClick",[6],"",-5,[["expression","_null=[player] execvm '008\createArmoredInfantry.sqf'"]],"1","1"],
	["Arma2 OA Infantry On MapClick",[7],"",-5,[["expression","_null=[player] execvm '008\createOAInfantry.sqf'"]],"1","1"],
	["Arma2 OA Motorized Infantry On MapClick",[8],"",-5,[["expression","_null=[player] execvm '008\createOAMotorizedInfantry.sqf'"]],"1","1"],
	["Arma2 OA Mechanized Infantry On MapClick",[9],"",-5,[["expression","_null=[player] execvm '008\createOAMechanizedInfantry.sqf'"]],"1","1"],
	["Arma2 OA Armored Infantry On MapClick",[10],"",-5,[["expression","_null=[player] execvm '008\createOAArmoredInfantry.sqf'"]],"1","1"]
];

[] call BIS_fnc_commsMenuCreate; 

Custom_Main_Menu =
[
	["Support Menu",False],
	["Player Support 1",[2],"#USER:PlayerSupport_Menu1",-5,[["expression",""]],"1","1"],
	["Player Support 2",[3],"#USER:PlayerSupport_Menu2",-5,[["expression",""]],"1","1"],
	["Weapon Support 1",[4],"#USER:WeaponSupport_Menu1",-5,[["expression",""]],"1","1"],
	["Weapon Support 2",[5],"#USER:WeaponSupport_Menu2",-5,[["expression",""]],"1","1"],
	["Music Support 1",[6],"#USER:MusicSupport_Menu1",-5,[["expression",""]],"1","1"],
	["Music Support 2",[7],"#USER:MusicSupport_Menu2",-5,[["expression",""]],"1","1"],
	["Music Support 3",[8],"#USER:MusicSupport_Menu3",-5,[["expression",""]],"1","1"],
	["Air Support 1",[9],"#USER:AirSupport_Menu1",-5,[["expression",""]],"1","1"],
	["Air Support 2",[10],"#USER:AirSupport_Menu2",-5,[["expression",""]],"1","1"],	
	["Ground Support Options",[11],"#USER:GroundSupport_Menu",-5,[["expression",""]],"1","1"]
];

BIS_MENU_GroupCommunication = 
[
	[localize "STR_SOM_COMMUNICATIONS", false],
	["Support Menu",[11],"#USER:Custom_Main_Menu",-5,[["expression",""]],"1","1"]
];

//hint "MENU SUPPORT\nAVAILABLE";

//BIS_MENU_GroupCommunication =+ MY_MENU_communication
//showCommandingMenu "#USER:Custom_Main_Menu";
//waituntil {!isnil "BIS_MENUS"};
/*
BIS_MENU_GroupCommunication = 
[
	[localize "STR_SOM_COMMUNICATIONS", true],
	["Support Menu",[2],"#USER:Custom_Main_Menu",-5,[["expression",""]],"1","1"]
];
*/