 for [{_loop1=0},{_loop1>=0},{_loop1=_loop1}] do
{
   waitUntil {alive player};
   _muzzles = [];
   _weapons = weapons (vehicle player);
   _ammo = 10000;
   for [{_x=0},{_x<(count _weapons)},{_x=_x+1}] do
   {
       _weaponMuzzles = getArray (configFile >> "CfgWeapons" >> (_weapons select _x) >> "muzzles");
       if ((_weaponMuzzles select 0)=="this") then 
       {
           _muzzles = _muzzles + [_weapons select _x];
       } 
       else 
       {
           _muzzles = _muzzles + _weaponMuzzles;
       };
   };
   (vehicle player) setvehicleammo 1;
   for [{_x=0},{_x<(count _muzzles)},{_x=_x+1}] do
   {
       _mxammo = ((vehicle player) ammo (_muzzles select _x));
       if (_mxammo<_ammo && _mxammo>0) then 
       {
           _ammo=((vehicle player) ammo (_muzzles select _x));
       };
   };

   for [{_loop2=0},{_loop2>=0},{_loop2=_loop2}] do
   {
       if (_ammo>0) then {(vehicle player) setvehicleammo (1/_ammo);};
       sleep 0.01;
       if (!(alive player) || ((_weapons select 0)!=(weapons (vehicle player) select 0))) then {_loop2=-1;};
   };
};