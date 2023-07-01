//  "init_newunit.sqf"  //
_unit = _this;
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
_grpCount = (units group _unit) find _unit;
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

switch (side _unit) do {
	case west: {

		_unit execVM "ParamsPlus\loadouts_diver.sqf";
		_unit execVM "ParamsPlus\loadouts.sqf";	
		_unit execVM "ParamsPlus\nightvision.sqf";
		_unit execVM "ParamsPlus\silencers.sqf";
		_unit execVM "ParamsPlus\regen_health.sqf";
		_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
		_unit execVM "ParamsPlus\markers.sqf";
		_unit execVM "ParamsPlus\playerSettings.sqf";
			
	};
	case east: {

		_unit execVM "ParamsPlus\loadouts_e_diver.sqf";
		_unit execVM "ParamsPlus\loadouts_e.sqf";	
		_unit execVM "ParamsPlus\nightvision.sqf";
		_unit execVM "ParamsPlus\silencers.sqf";
		_unit execVM "ParamsPlus\regen_health.sqf";
		_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
		_unit execVM "ParamsPlus\markers.sqf";
		_unit execVM "ParamsPlus\playerSettings.sqf";
			
	};
	case resistance: {

		_unit execVM "ParamsPlus\loadouts_r_diver.sqf";
		_unit execVM "ParamsPlus\loadouts_r.sqf";	
		_unit execVM "ParamsPlus\nightvision.sqf";
		_unit execVM "ParamsPlus\silencers.sqf";
		_unit execVM "ParamsPlus\regen_health.sqf";
		_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
		_unit execVM "ParamsPlus\markers.sqf";
		_unit execVM "ParamsPlus\playerSettings.sqf";
			
	};
	case civilian: {

		_unit execVM "ParamsPlus\loadouts_c_diver.sqf";
		_unit execVM "ParamsPlus\loadouts_c.sqf";	
		_unit execVM "ParamsPlus\nightvision.sqf";
		_unit execVM "ParamsPlus\silencers.sqf";
		_unit execVM "ParamsPlus\regen_health.sqf";
		_unit execVM "ParamsPlus\UnlimitedAmmo.sqf";
		_unit execVM "ParamsPlus\markers.sqf";
		_unit execVM "ParamsPlus\playerSettings.sqf";
			
	};
};

_unit addAction ["<t color='#00FFFF'>Dismiss</t>",BON_RECRUIT_PATH+"dismiss.sqf",[],100,false,true,""];

//_displayNames = [];
//for "_i" from 0 to (count (units group player)) -1 do {
//_unit = (units group player) select _i;
//_classname  = format ["%1", typeOf _unit];
//_displayname = gettext (configfile >> "CfgVehicles" >> _className >> "displayName");
//_displayNames = _displayNames + [_displayName];};
//hint format ["%1",_displayNames]; copyToClipboard format ["%1",_displayNames];








