_unit = _this select 0;

/*****************************************************************
	following section to run only on server.
	Note: duplicate respective code in the pve in the init.sqf
******************************************************************/
if(isServer) then{
	[_unit] execFSM (BON_RECRUIT_PATH+"unit_lifecycle.fsm");
} else {
	bon_recruit_newunit = _unit;
	publicVariable "bon_recruit_newunit";
};

/*****************************************************************
	Client Stuff
******************************************************************/
_group = group (leader _unit);
_grpCount = count (units _group);
//_typename = _unit getVariable "codeName";
//_nameUnit = name _unit;
//_typename = lbtext [BON_RECRUITING_UNITLIST,_unit];
//hint format ["%1",_typename];
_classname 	= format ["%1", typeOf _unit];
_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");

_text = toArray(str _group);
_text set[0,"**DELETE**"];
_text set[1,"**DELETE**"];
_text = _text - ["**DELETE**"];
_grp = toString(_text);

_varname = format ["%1_"+"%2",_grp,_grpCount];

_unit setVehicleVarname _varname;

[_unit, _displayname] remoteExec ["setName", groupOwner _group];

addswitchableunit _unit;

_pdiverequip = "pdiverequip" call BIS_fnc_getParamValue;
_ploadout = "ploadout" call BIS_fnc_getParamValue;
_prespawnLoadout = "prespawnloadout" call BIS_fnc_getParamValue;
_pua = "pua" call BIS_fnc_getParamValue;
_pmarkers = "pmarkers" call BIS_fnc_getParamValue;
_pregenhealth = "pregenhealth" call BIS_fnc_getParamValue;
_pnightVision = "pnightvision" call BIS_fnc_getParamValue;
_psilencers = "psilencers" call BIS_fnc_getParamValue;

_puavhacker	= "puavhacker" call BIS_fnc_getParamValue;
_pengineer	= "pengineer" call BIS_fnc_getParamValue;
_pexplspec	= "pexplspec" call BIS_fnc_getParamValue;
_pmedic		= "pmedic" call BIS_fnc_getParamValue;
_precoil 	= "precoil" call BIS_fnc_getParamValue;
_psway   	= "psway" call BIS_fnc_getParamValue;
_ploadcoef	= "ploadcoef" call BIS_fnc_getParamValue;
_paudible	= "paudible" call BIS_fnc_getParamValue;
_pcamocoef	= "pcamocoef" call BIS_fnc_getParamValue;
_psettings	= "psettings" call BIS_fnc_getParamValue;

switch (side _unit) do {
	case west: {
		[_unit] execVM "ParamsPlus\loadouts.sqf";
		[_unit] execVM "ParamsPlus\loadouts_diver.sqf";
	};
	case east: {
		[_unit] execVM "ParamsPlus\loadouts_e.sqf";
		[_unit] execVM "ParamsPlus\loadouts_e_diver.sqf";
	};
	case resistance: {
		[_unit] execVM "ParamsPlus\loadouts_g.sqf";
		[_unit] execVM "ParamsPlus\loadouts_g_diver.sqf";
	};
};
[_unit] execVM "ParamsPlus\nightvision.sqf";
[_unit] execVM "ParamsPlus\silencers.sqf";
[_unit] execVM "ParamsPlus\markers.sqf";
[_unit,0.15,.01] execVM "ParamsPlus\regen_health.sqf";
_unit addAction ["<t color='#00FFFF'>Dismiss</t>",BON_RECRUIT_PATH+"dismiss.sqf",[],-100,false,true,""];

