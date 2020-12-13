/////////   execVM "bon_sf_loadouts.sqf"   ///////////
_unit 		= _this select 0;
_loadout 	= [];

waitUntil {!isNil "pdiver"};

if (missionNamespace getVariable "SF_diver" isEqualTo true) then
{
	switch (typeOf _unit) do {

	         case "B_recon_TL_F":		{_loadout = _unit call SF_TeamLeader_diver_wet};
	         case "B_diver_exp_F":		{_loadout = _unit call SF_Explosives_diver_wet};
	         case "B_diver_F":			{_loadout = _unit call SF_Assault_diver_wet};
	         case "B_engineer_F":		{_loadout = _unit call SF_Explosives2_diver_wet};
	};

uisleep 1;

_unit setVariable ["loadoutDone", true, true];
};

if (missionNamespace getVariable "SF_diver" isEqualTo false) then
{
	switch (typeOf _unit) do {

	         case "B_recon_TL_F":		{_loadout = _unit call SF_TeamLeader_diver_dry};
	         case "B_diver_exp_F":		{_loadout = _unit call SF_Explosives_diver_dry};
	         case "B_diver_F":			{_loadout = _unit call SF_Assault_diver_dry};
	         case "B_engineer_F":		{_loadout = _unit call SF_Explosives2_diver_dry};
	};

uisleep 1;

_unit setVariable ["loadoutDone", true, true];
};


