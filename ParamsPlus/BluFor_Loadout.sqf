//  _this execVM "ParamsPlus\BluFor_Loadout.sqf"; //
_unit = _this;

_unit setUnitLoadout selectRandom ["B_engineer_F","B_soldier_mine_F","B_medic_F","B_Soldier_A_F","B_Soldier_LAT_F","B_Soldier_M_F","B_Soldier_AR_F","B_Soldier_TL_F","B_Soldier_SL_F"]; 
[_unit, selectRandom ["B_engineer_F","B_soldier_mine_F","B_medic_F","B_Soldier_A_F","B_Soldier_LAT_F","B_Soldier_M_F","B_Soldier_AR_F","B_Soldier_TL_F","B_Soldier_SL_F"]] remoteExec ["setIdentity", 0, _unit]; 
_unit setVariable ["LoadoutDone", true]; 
_unit action ["WEAPONONBACK", _unit];
_unit execVM "ParamsPlus\nightvision.sqf";
_unit execVM "ParamsPlus\silencers.sqf";
_unit execVM "ParamsPlus\regen_health.sqf";
_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
_unit execVM "ParamsPlus\markers.sqf";
_unit execVM "ParamsPlus\playerSettings.sqf";
_unit addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],100,false,true,""];

