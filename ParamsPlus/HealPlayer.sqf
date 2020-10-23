// =======================================================================================
//							INSTRUCTIONS
// =======================================================================================
// SCRIPT: [] execVM "ParamsPlus\HealPlayer.sqf"
// =======================================================================================
// SCRIPT INTENT: Selected units will form a 360 around the player and heal player
// =======================================================================================

// =======================================================================================
// =======================================  SETUP  ======================================= 
// =======================================================================================

// =======================================================================================
// DECLARE VARIABLES
// =======================================================================================

private ["_Player", "_Location", "_Group", "_Units", "_ValidArray", "_ValidArrayCount", "_Interval"];
private ["_CenterX", "_CenterY", "_Perimeter"];
private ["_Angle", "_PosX", "_PosY", "_Position", "_Member"];

// =======================================================================================
// DEFINE VARIABLES 
// =======================================================================================

_Player 			= Player;
_Location		= getPos _Player;
_Group 			= group _Player;
_Units			= units _Group;
_ValidArray		= [];
_ValidArrayCount	= 0;	
_ValidMedicArray		= [];
_ValidMedicArrayCount	= 0;	
	
// =======================================================================================
// ======================================  SCRIPT  ======================================= 
// =======================================================================================

// =======================================================================================
// ESTABLISH THE PLAYER'S X AND Y POSITIONS AND A PERIMETER DISTANCE
// =======================================================================================

if (alive _Player) then
{
	_CenterX	= _Location select 0;
	_CenterY	= _Location select 1;
	_Perimeter	= 3; // is 6 meters in diameter

// =======================================================================================
// GRAB ONLY VALID UNITS BY CHECKING IF THEY ARE ON FOOT AND ARE NOT PLAYERS
// =======================================================================================
	_MedicArray = ["B_medic_F","B_recon_medic_F","B_CTRG_soldier_M_medic_F","B_G_medic_F","B_T_Medic_F","B_T_Recon_Medic_F","B_CTRG_Soldier_Medic_tna_F","B_Patrol_Medic_F","B_W_Medic_F"];	
    {if ((vehicle _x == _x) && (_x != player) && (_x in _MedicArray)) then {_ValidArray = _ValidArray + [_x];};} forEach _Units;

// =======================================================================================
// EVERY VALID UNIT AND SUBSEQUENT ONE WILL MOVE TO THE PLAYER AND PERFORM A HEAL ACTION
// =======================================================================================
	
	if (_ValidArrayCount > 0) then {
		
		_ValidArrayCount = count _ValidArray;
		_Interval = 360/(_ValidArrayCount);
	
	for [{_i = _ValidArrayCount},{_i > 0},{_i =_i-1}] do
	{
		_Angle		= 0 + (_Interval*_i);
		_PosX 		= _CenterX + _Perimeter * cos(_Angle);
		_PosY 		= _CenterY + _Perimeter * sin(_Angle);
		_Position	= [_PosX,_PosY];
			
		_Member 	= (_ValidArray select _i-1);
		_Member		doMove _Position;
		_Member		moveTo _Position;
		_Member		setBehaviour "AWARE";
		_Member		setCombatMode "YELLOW";
		_Member		setSpeedMode "FULL";
		_Member 		setUnitPos "MIDDLE";
		_Member 		action ["Heal", _Player];
		
	};	

} else {
	
	_validMedicArray 	= player nearEntities [_MedicArray, 50];
	_ValidMedicArrayCount = count _validMedicArray;
	_Interval = 360/(_ValidMedicArrayCount);
		
	for [{_i = _ValidMedicArrayCount},{_i > 0},{_i =_i-1}] do
	{
		_Angle		= 0 + (_Interval*_i);
		_PosX 		= _CenterX + _Perimeter * cos(_Angle);
		_PosY 		= _CenterY + _Perimeter * sin(_Angle);
		_Position	= [_PosX,_PosY];
			
		_Member 	= (_ValidMedicArray select _i-1);
		_Member		doMove _Position;
		_Member		moveTo _Position;
		_Member		setBehaviour "AWARE";
		_Member		setCombatMode "YELLOW";
		_Member		setSpeedMode "FULL";
		_Member 		setUnitPos "MIDDLE";
		_Member 		action ["HealSoldier", _Player];
		
		};	
	
	};		

};

