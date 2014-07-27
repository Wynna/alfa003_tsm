// Argent Legion Supply Quest to High Hold, pay and exp
#include "acr_db_persist_i"
#include "acr_xp_i"
void main()
{   
    
object oPC = GetPCSpeaker();
    
ACR_AwardStaticQuestXP(oPC, "003_kis_patrol", 25);
	  
    
}	
 