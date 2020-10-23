//////////////////////////////////////////////////////////////////
/*************************************************************************************************
Wind Speed Indicator

-- Anyone for halo ???		
  -- Wouldn't that be nice ?
    -- Bullet drift ?
      -- Cargo drop ?

Setup:
for trigger
  -- if trigger and you do not want to broadcast the message to everyone 
    	-- add to trigger Condition: 
		"player in thislist" replacing "this"
		and to On Activation:
		windspeed = [[player,[("<t color=""#00FFFF"">" + ("Check Wind Speed") + "</t>"),{_this execVM "misc\windSpeed.sqf"},[],0,false,true, "",'_this ==_target']],"addAction",true,true,false] call BIS_fnc_MP;
		
for action
  -- add to initPlayerLocal
	windspeed = [[player,[("<t color=""#00FFFF"">" + ("Check Wind Speed") + "</t>"),{_this execVM "misc\windSpeed.sqf"},[],0,false,true, "",'_this ==_target']],"addAction",true,true,false] call BIS_fnc_MP;
	
for CfgCommunicationMenu
  -- add below to description
class CfgCommunicationMenu
{
	class WindSpeed
	{
		text = "Wind Speed";
		submenu = "";
		expression = "_this execVM 'misc\windSpeed.sqf'"; // [caller, pos, target, is3D, id]
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";
		cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa";
		enable = "1";
		removeAfterExpressionCall = 0;
//		[player,"WindSpeed"] call BIS_fnc_addCommMenuItem;
	};
};
  and to trigger On Activation or initPlayerLocal:
    [player,"WindSpeed"] call BIS_fnc_addCommMenuItem;
***********************************************************************************************************************/
//private ["_caller","_target","_is3D","_id","_windSpeed","_windDir","_player","_position","_actions","_array","color"];
params ["_caller","_position","_target","_is3D","_id"];
_player 		= _this select 0;
_position 	= _this select 1;
_target 		= _this select 2;
_is3D		= _this select 3;
_id			= _this select 4;

//setWind [10, 10, true];
//1800 setWindForce 0.5;
//60 setWindDir 180;
//60 setGusts 0.75;
//-- Alternate windDir through missionNameSpace variable
//switch (true) do
//    {
//    case (windDir >= 348.75 && windDir <= 11.25):{winDir = "N"};
//    case (windDir >= 11.25 && windDir <= 33.75):{winDir = "NNE"};
//    case (windDir >= 33.75 && windDir <= 56.25):{winDir = "NE"};
//    case (windDir >= 56.25 && windDir <= 78.75):{winDir = "ENE"};
//    case (windDir >= 78.75 && windDir <= 101.25):{winDir = "E"};
//    case (windDir >= 101.25 && windDir <= 123.75):{winDir = "ESE"};
//    case (windDir >= 123.75 && windDir <= 146.25):{winDir = "SE"};
//    case (windDir >= 146.25 && windDir <= 168.75):{winDir = "SSE"};
//    case (windDir >= 168.75 && windDir <= 191.25):{winDir = "S"};
//    case (windDir >= 191.25 && windDir <= 213.75):{winDir = "SSW"};
//    case (windDir >= 213.75 && windDir <= 236.25):{winDir = "SW"};
//    case (windDir >= 236.25 && windDir <= 258.75):{winDir = "WSW"};
//    case (windDir >= 258.75 && windDir <= 281.25):{winDir = "W"};
//    case (windDir >= 281.25 && windDir <= 303.75):{winDir = "WNW"};		
//    case (windDir >= 303.75 && windDir <= 326.25):{winDir = "NW"};
//    case (windDir >= 326.25 && windDir <= 348.75):{winDir = "NNW"};	
//    default {winDir = " ";};
//    };
//	  missionNameSpace setVariable ["WinDir",winDir];
		
if (_position isEqualTo []) then {
	
	"SmokeShellGreen" createVehicle [(getPosATL player select 0) + 10,(getPosATL player select 1) + 10,+50];
	
} else {
	
	"SmokeShellGreen" createVehicle [_position select 0,_position select 1,+50];
};

fn_WindSpeed_Message = {

    params["_windSpeed","_windDir","_color"];

    _windSpeed = _this select 0;
    _windDir = _this select 1;
    _color = _this select 2;

	hint parseText format[ "Wind Direction and Speed:<br /><t color='%3' size='2'>%2  </t><t color='%3' size='2'>%1</t><t color='%3' size='2'>kph</t>",_windSpeed,_windDir,_color];
};

fn_WindSpeed = {

windSpeed = vectorMagnitude wind;
windSpeed = round(windSpeed * (10 ^ 1)) / (10 ^ 1);

switch (true) do
    {
    case (windDir >= 348.75 && windDir <= 11.25):{winDir = "N"};
    case (windDir >= 11.25 && windDir <= 33.75):{winDir = "NNE"};
    case (windDir >= 33.75 && windDir <= 56.25):{winDir = "NE"};
    case (windDir >= 56.25 && windDir <= 78.75):{winDir = "ENE"};
    case (windDir >= 78.75 && windDir <= 101.25):{winDir = "E"};
    case (windDir >= 101.25 && windDir <= 123.75):{winDir = "ESE"};
    case (windDir >= 123.75 && windDir <= 146.25):{winDir = "SE"};
    case (windDir >= 146.25 && windDir <= 168.75):{winDir = "SSE"};
    case (windDir >= 168.75 && windDir <= 191.25):{winDir = "S"};
    case (windDir >= 191.25 && windDir <= 213.75):{winDir = "SSW"};
    case (windDir >= 213.75 && windDir <= 236.25):{winDir = "SW"};
    case (windDir >= 236.25 && windDir <= 258.75):{winDir = "WSW"};
    case (windDir >= 258.75 && windDir <= 281.25):{winDir = "W"};
    case (windDir >= 281.25 && windDir <= 303.75):{winDir = "WNW"};		
    case (windDir >= 303.75 && windDir <= 326.25):{winDir = "NW"};
    case (windDir >= 326.25 && windDir <= 348.75):{winDir = "NNW"};	
    default {winDir = " ";};
    };

switch (true) do
    {
	    case (windSpeed > 8):{color = "#FF0000";};//Red
	    case (windSpeed > 5 && windSpeed < 8):{color = "#EDED00";};//Yellow
	    default {color = "#00FFFF";};//Green
    };  
      
//     winDir = missionNameSpace getVariable "WinDir";  
	[windSpeed,winDir,color] call fn_WindSpeed_Message;	
};	

if ( isNil{_player getVariable "windspeed"} ) then
{	
	[[_player,[("<t color=""#00FFFF"">" + ("Check Wind Speed") + "</t>"),{_this call fn_WindSpeed},[],0,false,true, "",'_this ==_target']],"addAction",true,true,false] call BIS_fnc_MP;
	
	_player addEventHandler
	[
		"respawn",
		{
		  windspeed = [[_player,[("<t color=""#00FFFF"">" + ("Check Wind Speed") + "</t>"),{_this execVM "misc\windSpeed.sqf"},[],0,false,true, "",'_this ==_target']],"addAction",true,true,false] call BIS_fnc_MP;
		}
	];
	_player setVariable ["windspeed", true];
};
            
