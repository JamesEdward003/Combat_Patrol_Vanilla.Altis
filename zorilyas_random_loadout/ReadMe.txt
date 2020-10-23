Hi there, i've been working on this little thing for my own pleasure and mission making and it was asked of me to release it... so here we are!

HOW TO USE
place all three files into your mission folder and then you can use it in 1 of 2 ways.... 
either you can change the loadout of an already created unit by using the "fnc_generate_loadout.sqf"

nul = [_unit,_level] execVM "fnc_generate_loadout.sqf"; // where 
_unit is the dude who is getting a new look and gear and 
_level is the a number representing the level at which he is to be equiped (1 - 3, 1 being Civ, 2 being militia, 3 being military).

or

you can generate an entire squad of dudes using the "fnc_spawn_unit.sqf"

nul = [_pos,_noOfUnits,_level,_side] execVM "fnc_spawn_unit.sqf"; // where 
_pos is an array containing the coordinates where you would like the group to be spawned,
_noOfUnits in a number representing the number of units you would like to spawn in the group,
_level is the a number representing the level at which he is to be equiped (1 - 3, 1 being Civ, 2 being militia, 3 being military) and finally...
_side is the side of the group (normally EAST or WEST);

I personaly use the fnc_spawn_unit.sqf.... it's less hassle :).

changelog

v1.01
added : restriction on the scopes for sniper rifles.
added : restricted underwear so it is not selected as uniform.
fixed : didn't upload the correct files for tech level calculation.


v1.00
initial release