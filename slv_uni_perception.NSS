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

 string sCandidate;
     if(Random(4) < 2)
     {sCandidate = "Aislinn";}
     else if (Random(8) < 3)
     {sCandidate = "Arizma";}
     else if (Random(8) < 4)
     {sCandidate = "Glaustigan";}
     else if (Random(8) < 5)
     {sCandidate = "John Walker";}
     

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
			
			
			   {if(Random(150) < 8)
				     {ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 16)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Hello.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 18)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I know it says it's working for a couple of professors, but, really, do you trust a mephit?" , TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 20)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Funny, every candle in the ritual kept guttering out.", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 21)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Are you following the progress of the Dean's Quest candidates?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 22)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Yes, I said Hornblade. He was visiting the Dean, only this morning!", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 23)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("There's something strange about that kid I see around Illusion so often.", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 24)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Good " + sDay, TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((Random(150) < 25)  && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Can I borrow your notes?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((Random(150) < 26) && (GetGender(OBJECT_SELF) == GENDER_FEMALE))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I don't really care for the new Spellguard, how about you?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((Random(150) < 27) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("How did you do on " +sTeach + "'s last test?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			
			      else if((Random(150) < 28) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Should we work on that spell together later?", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 29)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Vorn's old news. Ashton, too. I hope nobody else dies.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if((Random(150) < 30) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you get a chance to rest before the test?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 31)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("The written exams are too hard!  I don't care what he says!", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 32)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you hear about Lani, that elven divination student? Shame, isn't it.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if((Random(150) < 33) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you study?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 34)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I miss Dean Vihuel. I don't think the tragedy will ever fade.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 35)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I'll meet you in class.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 36)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Sorry I'm late. I had trouble with keeping a fire lit this morning and it's too cold without one!", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			
			     else if(Random(150) < 37)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Glad to see you have recovered. Did Dr. Augustine heal you up?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if((Random(150) < 38) && (GetStringLeft(GetTag(oPerceived), 14)  != "003_cr_slv_prof"))
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString(sTeach + " wants to see you, you know.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 39)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I heard that Riverrun is the odds on favorite to win.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 40)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Yes, Alastrarra. She's up on the Master's Hall all the time. Special treatment for some, don't you know.", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			      else if(Random(150) < 41)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("It's nice that they're letting the familiars come back. I'm sure none of them will ever get into the pantry again.", TALKVOLUME_TALK));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 42)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_BORED, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 43)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_HELLO, OBJECT_SELF));
				     ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0);
				      SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 44)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_GROUP, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 45)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_LAUGH, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 46)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_TALKTOME, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 47)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_REST, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 48)
				     {DelayCommand(IntToFloat(Random(5)), PlayVoiceChat(VOICE_CHAT_MOVEOVER, OBJECT_SELF));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 49)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("Did you hear about " + sTeach + "'s class?", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
				     }
			     else if(Random(150) < 50)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString("I'm looking for " + sTeach +".", TALKVOLUME_TALK));
				     SetLocalInt(oPerceived, "Perceived" + GetTag(OBJECT_SELF), 1);
					 }
				 else if(Random(150) < 51)
				     {DelayCommand(IntToFloat(Random(5)), ActionSpeakString( sCandidate + " is doing quite well, from what I hear.", TALKVOLUME_TALK));
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