// "GarageVehicleEH.sqf" //
_textvehicle = "";
_unit = (_this select 0);

_vehicle = getText (configFile >> "cfgVehicles" >> typeof _unit >> "displayname");                     
_picture = getText (configFile >> "cfgVehicles" >> typeof _unit  >> "picture");

_textvehicle = parsetext format ["<img size='2' image='%1'/><t size='1.2'><br/> %2 <t size='1'><br/> %3 Crew", _picture,_vehicle,count crew _unit];

hint _textvehicle;