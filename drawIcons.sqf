// execVM "drawIcons.sqf"; //
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", "
	_display = _this#0;
	{
		_icon = getText (configfile >> 'CfgVehicles' >> typeof _x >> 'icon');
	    	_display drawIcon [
	    		_icon,
	    		[0,0,1,1],
	    		getPosVisual _x,
	    		24,
	    		24,
	    		getDirVisual _x,
	    		name _x,
	    		1,
	    		0.03,
	    		'TahomaB',
	    		'right'
	    	];
		_display drawLine [
			getPosVisual _x,
			getPosVisual leader _x,
			[0,0,1,1]
		];
	} forEach allUnits;

	{

		_offSet = [50,50,0];
		_iconPos = getPosVisual leader _x vectorAdd _offSet;
		_icon = getText (configfile >> 'cfgGroupIcons' >> _x getVariable ['GOM_fnc_groupIcon','b_inf'] >> 'icon');
		_grpInfoText = _x getVariable ['GOM_fnc_groupInfoText','Unnamed'];
    	_display drawIcon [
    		_icon,
    		[1,1,1,1],
    		_iconPos,
    		24,
    		24,
    		0,
    		_grpInfoText,
    		1,
    		0.03,
    		'TahomaB',
    		'left'
    	];
		_display drawLine [
			_iconPos,
			getPosVisual leader _x,
			[0,0,1,1]
		];


	} forEach allGroups;


"];


