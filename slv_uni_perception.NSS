////////////////////////////////////////////////////////////////////////////////
//
//     Filename : slv_uni_perception
//      Version : 1.1
//         Date : 2008-2-4
//       Author : Wynna
//
//  Description
//  This handles NPC recognition patterns in SLV Uni

////////////////////////////////////////////////////////////////////////////////
#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "silvy_univ_inc"

void main()
{

	object oWynna = GetLocalObject(OBJECT_SELF, "Wynna");
	object oArea = GetArea(OBJECT_SELF);
	
		
   string sDay;
     if(GetIsDay())
     {sDay = "day.";}
     else
     {sDay = "evening.";}
    string sTeach;
     if(Random(8) < 2)
     {sTeach = "Professor Melindia";}
     else if (Random(8) < 3)
     {sTeach = "Professor Gasen";}
     else if (Random(8) < 4)
     {sTeach = "Professor Clarvue";}
     else if (Random(8) < 5)
     {sTeach = "Professor Silverbrook";}
     else if (Random(8) < 6)
     {sTeach = "Professor Arcadavera";}
     else if (Random(8) < 7)
     {sTeach = "Professor Volebane";}
     else if (Random(8) < 8)
     {sTeach = "Professor Ostelle";}
     else if (Random(8) < 9)
     {sTeach = "Professor Auroneus";}

 

object oPerceived = GetLastPerceived();
if(GetIsPC(oPerceived))
	{return;}
	
object oNearest = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF, 1);
 if((!GetIsDM(oNearest)) && (!GetIsPC(oNearest)) &&(GetDistanceBetween(OBJECT_SELF, oNearest) < 5.0 ) )
	 {DelayCommand(3.0, AssignCommand(oNearest, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF)))));
	  DelayCommand(3.2, SetFacingPoint(GetPositionFromLocation(GetLocation(oNearest))));
	    
	   if((GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, 1)) != GetTag(OBJECT_SELF) + "_Class")
	   	    && ((GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_class_lvl") || (GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_grd_lvl"))
			&& (GetTag(oPerceived) != "003_cr_slv_bookwyrm") && (GetTag(oPerceived) != "003_cr_slv_deanvoice")
			&& (GetTag(oPerceived) != "003_cr_slv_dean") && (GetTag(oPerceived) != "003_cr_slv_recordsclerk")
			&& (GetTag(oPerceived) != "003_cr_slv_arken") && (GetTag(oPerceived) != "003_cr_slv_miresk")
			&& (GetTag(oPerceived) != "003_cr_slv_librarian") && (GetTag(oPerceived) != "003_cr_slv_Spellguard")
			&& (GetTag(oPerceived) != "003_cr_slv_scribe") && (GetTag(oPerceived) != "003_cr_slv_scribe2")
			&& (GetTag(oPerceived) != "003_cr_slv_mothermay") && (GetTag(oPerceived) != "003_cr_slv_belad")
			&& (GetLocalInt(OBJECT_SELF, "Spoken") != 1)
			)
			
			
			   {if(Random(100) < 8)
				     {ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 16)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Hello.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 24)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Good " + sDay, TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((Random(100) < 25)  && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Can I borrow your notes?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((Random(100) < 26) && (GetGender(OBJECT_SELF) == GENDER_FEMALE))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I don't really care for the new Spellguard, how about you?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((Random(100) < 27) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("How did you do on " +sTeach + "'s last test?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			
			      else if((Random(100) < 28) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Should we work on that spell together later?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 29)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Vorn's old news. Ashton, too. I hope nobody else dies.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((Random(100) < 30) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you get a chance to rest before the test?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 31)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("The written exams are too hard!  I don't care what he says!", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 32)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Greetings.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if((Random(100) < 33) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you study?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(100) < 34)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I miss Dean Vihuel. I don't think the tragedy will ever fade.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(100) < 35)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I'll meet you in class.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(100) < 36)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Awful, isn't it?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			
			     else if(Random(100) < 37)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Glad to see you have recovered. Did Dr. Augustine heal you up?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if((Random(100) < 38) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString(sTeach + " wants to see you, you know.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(100) < 39)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I heard that Laniara is Master Clarvue's favorite.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(100) < 40)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Yes, Alastrarra. She's up on the Master's Hall all the time. Special treatment for some, don't you know.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(100) < 41)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("It's nice that they're letting the familiars come back. I'm sure none of them will ever get into the pantry again.", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 42)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_BORED, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 43)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_HELLO, OBJECT_SELF));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 44)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_GROUP, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 45)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_LAUGH, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 46)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_TALKTOME, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 47)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_REST, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 48)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_MOVEOVER, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 49)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you hear about " + sTeach + "'s class?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(100) < 50)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I'm looking for " + sTeach +".", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			 	
			
			SetLocalInt(OBJECT_SELF, "Spoken", 1); 
		    
			if((GetLocalInt(oPerceived, "InClass") != 1) && (Random(10) < 5))
				{DelayCommand(1.0, ActionForceMoveToLocation(GetLocation(oPerceived), FALSE, 30.0));
			     DelayCommand(1.2, AssignCommand(oPerceived, ActionWait(30.0 + IntToFloat(Random(300)))));
				 DelayCommand(5.1, ActionWait(30.0 + IntToFloat(Random(300))));
				 }
			 float fRandReset = IntToFloat(Random(600) + 30);
			 DelayCommand(fRandReset, SetLocalInt(OBJECT_SELF, "Spoken", 0));
			 }	
	}
}