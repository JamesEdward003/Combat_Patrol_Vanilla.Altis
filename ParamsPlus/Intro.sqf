// "Intro.sqf" //

_null = [] execVM "a3\missions_f_epa\Campaign_shared\Functions\Timeline\fn_camp_showOSD.sqf";

[
    [
      player call BIS_fnc_locationDescription
    ]
] spawn BIS_fnc_EXP_camp_SITREP;


