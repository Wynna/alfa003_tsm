#include "acr_spawn_i"
#include "acr_db_persist_i"
 
void main()
{

         
	if(GetTag(OBJECT_SELF)== "003_cr_delzoun_listen")
        {object oUser = GetLocalObject(OBJECT_SELF, "oUser");
         
				 
			 
         AssignCommand(OBJECT_SELF, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectTrueSeeing(),OBJECT_SELF));
         SetListenPattern(OBJECT_SELF, "**uldar**", 4000);
         SetListenPattern(OBJECT_SELF, "**arak**", 4001);
         SetListenPattern(OBJECT_SELF, "**lith**", 4002);
         SetListenPattern(OBJECT_SELF, "**unedar**", 4003);
         SetListenPattern(OBJECT_SELF, "**lander**", 4004);
         SetListening(OBJECT_SELF, TRUE);
         DestroyObject(OBJECT_SELF, 1800.0);
         }
		 
		 
	
		 
        }