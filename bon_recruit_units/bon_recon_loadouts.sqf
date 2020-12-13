/////////   execVM "bon_recon_loadouts.sqf"   ///////////
_unit 		= _this select 0;
_loadout 	= [];
	
	switch (typeOf _unit) do {

	         case "B_recon_TL_F":		{_loadout = _unit call Recon_TeamLeader};
	         case "B_recon_F":			{_loadout = _unit call Recon_Scout};
	         case "B_recon_LAT_F":		{_loadout = _unit call Recon_AT};
	         case "B_recon_exp_F":		{_loadout = _unit call Recon_Demolition};
	         case "B_recon_medic_F":	{_loadout = _unit call Recon_Paramedic};
	         case "B_recon_M_F":		{_loadout = _unit call Recon_Marksman};
	         case "B_recon_JTAC_F":		{_loadout = _unit call Recon_JTAC};
	         case "B_soldier_exp_F":	{_loadout = _unit call Recon_Demolition};
	         case "B_Soldier_GL_F":		{_loadout = _unit call Recon_Grenadier};
	};

uisleep 1;

_unit setVariable ["loadoutDone", true, true];
