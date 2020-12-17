// ClearZone.sqf //
ZoneClear = { playSound "emp_blast"; 
  
_nearMen = (vehicle player) nearEntities [["Man", "Air", "Car", "Tank"], 1000]; 
{ 
 if ((side _x == east) || (side_x == resistance)) then { 
   _x setDamage 1.0; 
 }; 
} forEach (_nearMen); }; call ZoneClear;

