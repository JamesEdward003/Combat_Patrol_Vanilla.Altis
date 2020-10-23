/////////////   "Launch.sqf";   ////////////////
        params["_carrier","_plane", "_catapult"];


        private _carrierObj = "Land_Carrier_01_hull_07_F";

        if (_catapult in ["Catapult1", "Catapult2"]) then {
            _carrierObj = "Land_Carrier_01_hull_04_F";
        };

        if (_catapult in ["Catapult3", "Catapult4"]) then {
            _carrierObj = "Land_Carrier_01_hull_07_F";
        };

        (driver _plane) disableAI "PATH";

        sleep 10;

        _carrierObjects = _carrier nearObjects [_carrierObj, 100];

        _CarrierPart = _carrierObjects param [0, objNull];

        _carrierPartCfgCatapult = configfile >> "CfgVehicles" >> _carrierObj >> "Catapults" >> _catapult;
        _CarrierPartanimations = getArray (_carrierPartCfgCatapult >> "animations");
        [_CarrierPart, _CarrierPartanimations, 10] spawn BIS_fnc_Carrier01AnimateDeflectors;

        sleep 14;
        _plane engineOn true;

        [_plane] call BIS_fnc_AircraftCatapultLaunch;

        sleep 4;
        (driver _plane)  enableAI "PATH";
        sleep 6;
        [_CarrierPart, _CarrierPartanimations, 0] spawn BIS_fnc_Carrier01AnimateDeflectors;
        
        
        