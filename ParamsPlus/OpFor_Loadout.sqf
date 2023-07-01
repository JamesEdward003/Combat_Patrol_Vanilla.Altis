//  _this execVM "ParamsPlus\OpFor_Loadout.sqf"; //
_unit = _this;

_unit setUnitLoadout selectRandom ["O_engineer_F","O_soldier_mine_F","O_medic_F","O_Soldier_A_F","O_Soldier_LAT_F","O_Soldier_M_F","O_Soldier_AR_F","O_Soldier_TL_F","O_Soldier_SL_F"]; 
[_unit, selectRandom ["O_engineer_F","O_soldier_mine_F","O_medic_F","O_Soldier_A_F","O_Soldier_LAT_F","O_Soldier_M_F","O_Soldier_AR_F","O_Soldier_TL_F","O_Soldier_SL_F"]] remoteExec ["setIdentity", 0, _unit]; 
_unit setVariable ["LoadoutDone", true]; 
_unit action ["WEAPONONBACK", _unit];
_unit execVM "ParamsPlus\nightvision.sqf";
_unit execVM "ParamsPlus\silencers.sqf";
_unit execVM "ParamsPlus\regen_health.sqf";
_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
_unit execVM "ParamsPlus\markers.sqf";
_unit execVM "ParamsPlus\playerSettings.sqf";
_unit addAction ["<t color='#00FFFF'>Dismiss</t>","ParamsPlus\dismiss.sqf",[],100,false,true,""];

