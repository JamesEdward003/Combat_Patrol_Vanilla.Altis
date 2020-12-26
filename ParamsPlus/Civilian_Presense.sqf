//  _this execVM "ParamsPlus\Civilian_Presense.sqf"; //
_unit = _this;

_unit setUnitLoadout selectRandom ["I_engineer_F","I_soldier_mine_F","I_medic_F","I_Soldier_A_F","I_Soldier_LAT_F","I_Soldier_M_F","I_Soldier_AR_F","I_Soldier_TL_F","I_Soldier_SL_F"]; 
[_unit, selectRandom ["I_engineer_F","I_soldier_mine_F","I_medic_F","I_Soldier_A_F","I_Soldier_LAT_F","I_Soldier_M_F","I_Soldier_AR_F","I_Soldier_TL_F","I_Soldier_SL_F"]] remoteExec ["setIdentity", 0, _unit]; 
_unit setVariable ["LoadoutDone", true]; 
_unit action ["WEAPONONBACK", _unit];
_unit execVM "ParamsPlus\nightvision.sqf";
_unit execVM "ParamsPlus\silencers.sqf";
_unit execVM "ParamsPlus\regen_health.sqf";
_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
_unit execVM "ParamsPlus\markers.sqf";
_unit execVM "ParamsPlus\playerSettings.sqf";
_unit addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],-100,false,true,""];

//_civSuitArray = ["U_NikosAgedBody","U_OrestesBody","U_C_Poor_1","U_C_Poor_2","U_C_Poloshirt_burgundy","U_C_WorkerCoveralls","U_C_Poor_shorts_1"];
//			
//player addEventHandler ["InventoryOpened", {
//  	if (uniform player in _civSuitArray) then {
//		player forceAddUniform "U_B_CombatUniform_mcam";
//       	hint "Regulation uniform!";
//   	} else {
//       	player forceAddUniform random _civSuitArray;
//        	hint "Non-regulation uniform!";			  
//	};
//}];

//if !(player getVariable ["civSuitPowers_eh",false]) then
//{
//	[
//		"checkEquippedUniform",
//		"onEachFrame",
//		{
//			params ["_unit"];
//			_civSuitArray = [U_NikosAgedBody,U_OrestesBody,U_C_Poor_1,U_C_Poor_2,U_C_Poloshirt_burgundy,U_C_WorkerCoveralls,U_C_Poor_shorts_1];
//			if (uniform _unit in _civSuitArray) then
//			{
//				[ [], "fnc_civSuitPowers", _unit ] call BIS_fnc_MP;
//				Civilian setFriend [East, 1];
//				East setFriend [Civilian, 1];
//				Civilian setFriend [West, 1];
//				West setFriend [Civilian, 1];
//				Civilian setFriend [Resistance, 1];
//				Resistance setFriend [Civilian, 1];
//			}
//			else
//			{
//				Civilian setFriend [East, 0];
//				East setFriend [Civilian, 0];
//				Civilian setFriend [West, 0];
//				West setFriend [Civilian, 0];
//				Civilian setFriend [Resistance, 0];
//				Resistance setFriend [Civilian, 0];
//			};
//		},
//		[player]
//	] call BIS_fnc_addStackedEventHandler;
//	player setVariable ["civSuitPowers_eh",true];
//};

