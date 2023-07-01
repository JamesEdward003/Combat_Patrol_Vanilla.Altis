//////////////////////////////////////////////////////////////////
hintSilent parseText format ["<t size='1.25' color='#00FFFF'>Mapclick location!</t>"];
WaitUntil {openMap true}; onmapsingleclick {player setpos _pos; openmap false; onmapsingleclick {}};