/*
Add Script to vehicles spawned by COS.
_veh = Vehicle. Refer to vehicle as _veh.
*/

_veh =(_this select 0);

_text1 = "The rain in Spain falls mainly on the plain.";
_text2 = "It rains in Spain as much as it does in Venezuela.";
0=[[_text1,1,4,1],[_text2,1,4,1]] spawn BIS_fnc_EXP_camp_SITREP;


