#include "silvy_univ_inc"
#include "silvy_univ_func"

 


void main()
{
    object oItem = OBJECT_SELF;
    object oUser = GetItemActivator();
    object oStudent = oUser;
    string sSchool = GetLocalString(oStudent, "sSchool");
	object oTrig = GetLocalObject(oStudent, "LastTrig");
	int nSchool = GetSilvyUniversitySchool(oTrig);
	string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
    int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
    string sLevel = IntToString(nLevel);
    effect eShimmer = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE, FALSE);
    effect eGlimmer = EffectVisualEffect(VFX_DUR_PIXIEDUST, FALSE);
    
   //Elementary Divination 
 
    string sTag = GetTag(OBJECT_SELF);
   
        DelayCommand(0.5, SendMessageToPC(oStudent, "The scroll shimmers in your hand and words appear across it."));

         if((sSchool == "Abjuration") && (nLevel == 100)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Abjuration 101:  Protect thyself from the cold."));
              }
         else if((sSchool == "Conjuration") && (nLevel == 100)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Conjuration 101:  Summon a creature to depress the floor plate...and then let it rise again."));
              }
         else if((sSchool == "Divination") && (nLevel == 100)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Divination 101:  Use this scroll once a day as close to the center of any classroom as possible to divine your purpose.  It began with 40 charges on it."));
               SetCampaignString("SLV_UNI", "Elementary Divination", "Elementary Divination", oStudent);
              }
         else if((sSchool == "Enchantment") && (nLevel == 100)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Enchantment 101:  Let sleeping giants lie...but lull instead the Floating Eyes to sleep."));
              }
         else if((sSchool == "Evocation") && (nLevel == 100)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Evocation 101:  A spark of electricity will power the crystal ball."));
              }
         else if((sSchool == "Illusion") && (nLevel == 100)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Illusion 101:  Simply sit, and consider what is true and what illusionary, and what clues there might be to either."));
              }
         else if((sSchool == "Necromancy") && (nLevel == 100)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Necromancy 101:  After preparing the body physically, a spark of negative energy will charge the bodily vessel."));
              }
         else if((sSchool == "Transmutation") && (nLevel == 100)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Transmutation 101:  Burn as quickly as a flame through fuel."));
              }
         else if((sSchool == "Abjuration") && (nLevel == 200)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Abjuration 201:  Protect yourself against the opposing alignment.  If neutral, choose either."));
              }
         else if((sSchool == "Conjuration") && (nLevel == 200)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Conjuration 201:  A thorny problem, or is it slippery?  Every good armor requires a little oiling now and then."));
              }
         else if((sSchool == "Divination") && (nLevel == 200)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Divination 201:  Strike a match, truly."));
              }
         else if((sSchool == "Enchantment") && (nLevel == 200)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Enchantment 201:  A charming example of the power of charms."));
              }
         else if((sSchool == "Evocation") && (nLevel == 200)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Evocation 201:  You may light upon a poisonous reaction suddenly.  Take precautions against poison."));
              }
         else if((sSchool == "Illusion") && (nLevel == 200)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Illusion 201:  Proper preparation will reflect upon you well."));
              }
         else if((sSchool == "Necromancy") && (nLevel == 200)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Necromancy 201:  A good scare can leave you weak."));
              }
         else if((sSchool == "Transmutation") && (nLevel == 200)) 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "Step up and fire when ready."));
              }
		 else if(nLevel == 300)
              {DelayCommand(5.0, SendMessageToPC(oStudent, sSchool + " 301:  Sorry, all written tests must be taken without cheat sheets."));
              }
         else 
              {DelayCommand(5.0, SendMessageToPC(oStudent, "'Location, location, location. You  must stand near the center of the room you wish to enquire about to receive an answer."));
              }
       
         
}