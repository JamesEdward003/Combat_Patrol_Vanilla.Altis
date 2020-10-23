// ParamsPlus\Params.hpp //

 class Params {
	 
    	class PFatigue    {  
        	title = "Enable/Disable Player's Fatigue System";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};  
    	class PStamina    {  
  
        	title = "Enable/Disable Player's Stamina System";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};    
    	class PRecoil    {    

        	title = "Player's Weapon Recoil";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No recoil","Poor recoil","Standard recoil","Intensive recoil"};
        	default = 3;
    	};    
    	class PAimCoef    {  

        	title = "Player's Weapon Sway";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No sway","Poor sway","Standard sway","Intensive sway"};
        	default = 3;
    	};
    	class PAudibleCoef    {    

        	title = "Player's Stealth (Audible) Value";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No value","Low value","Standard value","High value"};
        	default = 3;
    	};    
    	class PCamouflageCoef    {    

        	title = "Player's Stealth (Visible) Value";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No value","Low value","Standard value","High value"};
        	default = 3;
    	};
    	class PLoadCoef    {   

        	title = "Player's Load Carrying Value";
        	values[] = {1, 2, 3, 4};
        	texts[] = {"No value","Low value","Standard value","High value"};
        	default = 3;
    	}; 
    	class PEngineer    {   

        	title = "Enable/Disable Player's Repair Ability";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};  
    	class PExplosiveSpecialist   {   
 
        	title = "Enable/Disable Player's Defuse Ability";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};    
    	class PMedic    {   

        	title = "Enable/Disable Player's Medic Ability";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 2;
    	};  
    	class PUAVHacker   {    

        	title = "Enable/Disable Player's UAV Ability";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};  
    	class PUA   {    

        	title = "Enable/Disable Unlimited Ammo";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};
    	class PDiver   {    

        	title = "Enable/Disable SpecOp Divers";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};
    	class PIntro   {    

        	title = "Enable/Disable Altis Intro";
        	values[] = {1, 2};
        	texts[] = {"Disable","Enable"};
        	default = 1;
    	};
};

