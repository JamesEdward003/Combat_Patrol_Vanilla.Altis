_round = _this select 0;
_thingsNotToBe = ["BulletBase","ShotgunBase","MissleBase"];

_parent = (configName (inheritsFrom (configfile >> "cfgAmmo" >> _round)));

while {!(_parent in _thingsNotToBe)} do
{
	_round = _parent;
	_parent = (configName (inheritsFrom (configfile >> "cfgAmmo" >> _round)));
};

_techLevel = 
switch (_round) do 
{
	case "B_127x108_Ball" : 	{5};
	case "B_127x33_Ball" : 		{4};
	case "B_127x99_Ball" : 		{5};
	case "B_12Gauge_Pellets" : 	{2};
	case "B_12Gauge_Slug" : 	{2};
	case "B_408_Ball" : 		{5};
	case "B_45ACP_Ball" : 		{2};
	case "B_556x45_Ball" :	 	{3};
	case "B_556x45_dual" : 		{4};
	case "B_56x15_dual" : 		{4};
	case "B_65x39_Case" : 		{3};
	case "B_65x39_Caseless" : 	{3};
	case "B_762x51_Ball" : 		{3};
	case "B_9x21_Ball" : 		{1};
	case "B_coil_5g_spike" : 	{1};
	default						{10};
};

if (_techLevel == 10) then {player sideChat ("fnc_get_techLevel didn't recognise for ") + (str(_round));};

_techLevel