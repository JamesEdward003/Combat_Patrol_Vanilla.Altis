//////////////////////////////////////////////////////////////////
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location!</t>"];
WaitUntil {openMap true}; onMapSingleClick {{_x setPosATL _pos} forEach units player; openmap false; onmapsingleclick {}};