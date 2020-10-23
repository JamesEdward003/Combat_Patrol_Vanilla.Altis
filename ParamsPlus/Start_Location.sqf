/////--"ParamsPlus\Start_Location.sqf"--/////
switch (_this select 0) do
{
	case 1: 	{	
				for "_i" from 0 to count (units group player) - 1 do
				{
					_dir = getDir player;
					
					_unit = (units group player) select _i;
					
					_unit setPosASLW [(getPosASLW westbase select 0)-2*sin(_dir),(getPosASLW westbase select 1)-2*cos(_dir),(getPosASLW US_depot_ammobox_1 select 2)];	
					
					doStop _unit;	
				};									
			};
	case 2: 	{
				for "_i" from 0 to count (units group player) - 1 do
				{
					_dir = getDir player;
					
					_unit = (units group player) select _i;
					
					_unit setPosASLW [(getPosASLW USSFreedom select 0)-1*sin(_dir),(getPosASLW USSFreedom select 1)-1*cos(_dir),(getPosASLW USS_FREEDOM_ammobox_1 select 2)];
					
					doStop _unit;	
				};			
			};
	case 3: 	{
				for "_i" from 0 to count (units group player) - 1 do
				{
					_dir = getDir player;
					
					_unit = (units group player) select _i;
					
					_unit setPosASLW [(getPosASLW USSLiberty select 0)-1*sin(_dir),(getPosASLW USSLiberty select 1)-1*cos(_dir),(getPosASLW USS_LIBERTY_ammobox_1 select 2)];
					
					doStop _unit;		
				};									
			};
	case 4: 	{
				for "_i" from 0 to count (units group player) - 1 do
				{
					_dir = getDir player;
					
					_unit = (units group player) select _i;
					
//					_unit setPosASLW [(getPosASLW port select 0)-2*sin(_dir),(getPosASLW port select 1)-2*cos(_dir),(getPosASLW port select 2)];
					
					_unit execVM "misc\atm_airdrop\atm_airdrop_startgame.sqf";		
				};			
			};
};



//private _future = time + 12;
//waitUntil { time >= _future };

//[playerSide, "HQ"] commandChat "REGENERATIVE HEALTH ADJUSTMENTS SET!";
//uisleep 4;
//[playerSide, "HQ"] commandChat "Let the game begin!";
