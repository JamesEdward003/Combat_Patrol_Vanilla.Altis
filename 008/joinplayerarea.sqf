// joinPlayerArea.sqf //
private ["_dist"];
_dist = _this select 0;

hintSilent parseText format ["<t color='#00FF00' size='2.0'>Area Units Join Player!</t>"];
{
    if ((side _x == playerSide) and ((_x distance player) <= _dist)) then
    {
        [_x] join grpNull;
        [_x] joinSilent (group player);
        doStop _x;
        (group player) selectLeader player;
    };
} forEach allUnits;

uisleep 6;

hintSilent parseText format ["<t color='#00FF00' size='2.0'>Regroup!</t>"];

