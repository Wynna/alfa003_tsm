//Conversation driven for all RM Quests 
//Wynna August 2008


#include "acr_creature_i"
#include "acr_quest_i"

void main()
{
	object oQuester = GetPCSpeaker();
    effect eKnockdown = EffectKnockdown();
	effect eStruck = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);			

	
	if((GetTag(OBJECT_SELF) == "003_cr_silvy_hornhard") || (GetTag(OBJECT_SELF) == "003_cr_qvr_smith_halfling") || (GetTag(OBJECT_SELF) == "003_cr_travel_kaspar") || (GetTag(OBJECT_SELF) == "003_cr_felbarr_letha"))
		{float fHuntPay=GetLocalFloat(OBJECT_SELF, "hunt_pay");
		 string sHuntPelt=GetLocalString(OBJECT_SELF, "hunt_pelt");
		 int iPelt=0;
		 int iPay=0;
		 object oPelt=GetFirstItemInInventory(oQuester);
		 if(fHuntPay>=1.0)
		 	{while(oPelt!=OBJECT_INVALID)
				{if(GetTag(oPelt)==sHuntPelt)
					{iPelt++;
					 DestroyObject(oPelt);
					}
				 oPelt=GetNextItemInInventory(oQuester);
				}
			 iPay=FloatToInt(iPelt*fHuntPay);
			 }	
		 
		 else
		 	{int iMin=FloatToInt(1/fHuntPay);
			 while((oPelt!=OBJECT_INVALID)&& (iPelt<iMin))
				{if(GetTag(oPelt)==sHuntPelt)
					{iPelt++;}
				 oPelt=GetNextItemInInventory(oQuester);
				}
			 if(iPelt >= iMin)
			 	{int iDestroy=0;
				 object oDestroy=GetFirstItemInInventory(oQuester);
		 		 while((oDestroy!=OBJECT_INVALID)&& (iDestroy<iMin))
						{if(GetTag(oDestroy)==sHuntPelt)
							{iDestroy++;
							 DestroyObject(oDestroy);
							 }
						 oDestroy=GetNextItemInInventory(oQuester);
						}
				iPay = FloatToInt(fHuntPay*iMin);
				}
			else{SpeakString("You haven't got enough of those to be worth my while.", TALKVOLUME_TALK);}
			}
	    GiveGoldToCreature(oQuester, iPay, TRUE);
		}
	
	   

	
	//KiS_patrol_01	
	//Sernius Alathar, Knight Grand Commander
	
	if(GetTag(OBJECT_SELF) == "003_cr_kis_commander_alathar")
		{if(GetLocalInt(oQuester, "Alathar_dez") == 0)
			{SetLocalInt(oQuester, "Alathar_dez", 1);
			 object oDez = GetObjectByTag("003_cr_dragon_dez_human");
			 DelayCommand(3.0, AssignCommand(oDez, ActionStartConversation(oQuester, "", FALSE, TRUE, TRUE, TRUE)));
			}
		 if(GetLocalInt(oQuester, "Alathar_will") == 0)
			{SetLocalInt(oQuester, "Alathar_will", 1);
			 if(WillSave(oQuester, 18, SAVING_THROW_TYPE_LAW, OBJECT_SELF))
				{SetLocalInt(oQuester, "Alathar_WillSave", 1);
				}
			}
		}
   
	//Mother May

	if(GetTag(OBJECT_SELF) == "003_cr_foch_mothermay") 
		{if(GetLocalInt(OBJECT_SELF, "kis_escort_01") == 1)
			 {ActionForceFollowObject(GetPCSpeaker(), 0.5, 0);
			  }
		 else if (GetLocalInt(OBJECT_SELF, "kis_escort_01") == 0)
			 {SetLocalInt(OBJECT_SELF, "kis_escort_01", 1);
			  ActionForceFollowObject(GetPCSpeaker(), 0.5, 0);
			  SetLocalObject(GetPCSpeaker(), "oHench", OBJECT_SELF);
			  SetLocalObject(GetPCSpeaker(), "oMaster", GetPCSpeaker());
			  SetLocalObject(OBJECT_SELF, "oHench", OBJECT_SELF);
			  SetLocalObject(OBJECT_SELF, "oMaster", GetPCSpeaker());
			  }
		}
				
	//KiS_patrol_02
	//Arthur Firebrand, High Priest of Tempus
	
	if(GetTag(OBJECT_SELF) == "003_cr_tempus_firebrand")
		{if(GetLocalInt(GetPCSpeaker(), "Convert") == 1)
			{SetDeity(GetPCSpeaker(), "Tempus");
			 AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 5);
			}
	 	 if ((GetLocalInt(OBJECT_SELF, "kis_escort_02") == 0) && (GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_silverguardfort"))
				 {SetLocalInt(OBJECT_SELF, "kis_escort_02", 1);
				  ActionForceFollowObject(GetPCSpeaker(), 0.5, 0);
				  SetLocalObject(GetPCSpeaker(), "oHench", OBJECT_SELF);
				  SetLocalObject(GetPCSpeaker(), "oMaster", GetPCSpeaker());
				  SetLocalObject(OBJECT_SELF, "oHench", OBJECT_SELF);
				  SetLocalObject(OBJECT_SELF, "oMaster", GetPCSpeaker());
				  }
		 else if(GetLocalInt(OBJECT_SELF, "kis_escort_02") == 1)
		 	{ActionForceFollowObject(GetPCSpeaker(), 0.5, 0);
				  	  
			}
		}
		
		//KiS_patrol_03
	//Marilee Stallings, sister of Lieutenant Stallings of Rauvenwatch Keep
	if((GetTag(OBJECT_SELF) == "003_cr_argent_lt_stallings") || (GetTag(OBJECT_SELF) == "003_cr_argent_lt_lairdmoor"))
		{object oHench = GetLocalObject(GetPCSpeaker(), "oHench");
		 AssignCommand(oHench, ClearAllActions(TRUE));
		 }
			 
	
	if(GetTag(OBJECT_SELF) == "003_cr_argent_marilee_stallings")
		
			{if(GetLocalInt(OBJECT_SELF, "Mastered") != 1)
				{SetLocalInt(OBJECT_SELF, "Mastered", 1);
				 SetLocalObject(GetPCSpeaker(), "oHench", OBJECT_SELF);
				 SetLocalObject(GetPCSpeaker(), "oMaster", GetPCSpeaker());
				 SetLocalObject(OBJECT_SELF, "oHench", OBJECT_SELF);
				 SetLocalObject(OBJECT_SELF, "oMaster", GetPCSpeaker());
				 ActionForceFollowObject(GetPCSpeaker(), 0.5, 0);
				 }
			 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
			 string sMarilee;	
			 int iInc = GetLocalInt(OBJECT_SELF, "iInc");
			 SetLocalInt(OBJECT_SELF, "iInc", iInc + 1);	
			 if(iInc == 1)
			 	{sMarilee = "The fastest way to Rauvenwatch Keep is through the Moorgate. You are going through the Moorgate, aren't you? I won't go any other way.";
				}
			 else if(iInc == 2)
			 	{sMarilee = "Did you hear me say that the fastest way to Rauvenwatch Keep is through the Moorgate?";
				}
			 else if(iInc == 3)
			 	{sMarilee = "Is that man staring at me? I think he's staring at me. Gareth wouldn't like that.";
				}
			 else if(iInc == 4)
			 	{sMarilee = "Oh, he was packing his mule. What a cute mule! What a sweet spot of white on his nose. Sweety-pie, don't you think? That's what I shall name him. I'll have a servant inform the man later.";
				}
			 else if(iInc == 5)
			 	{sMarilee = "My brother will be so happy to see me. He never does seem to get time off duty to come visit, even though it's relatively close. *Pout*";
				}
			 else if(iInc == 6)
			 	{sMarilee = "Are you stationed at Rauvenwatch Keep, like Gareth and my brother? Are they all as cute as you?  You're very cute, you know, if you like the type.";
				}
			 else if(iInc == 7)
			 	{sMarilee = "Oooh, look! Hi, Maisy! *Waves madly* That's Maisy Bellflower, the silly cow. She said Emmy Taylor said Carinna Muliman said that I henna my hair.";
				}
			  else if(iInc == 8)
			 	{sMarilee = "That's a pretty blue jay. Gareth says they're just the color of my eyes. What do you think? Oh, never mind. He's right. Gareth is always right. *Sighs dreamily*";
				}
			 else if(iInc == 9)
			 	{sMarilee = "Ouch! Oh, ouch! That hurts! Oh, there. It's out. I had a pebble in my shoe.";
				}
			 else if(iInc == 10)
			 	{sMarilee = "The air is so dry. I hope it doesn't damage my skin. How long are you generally outside? Judging by your skin, I want to make sure I'm out less.";
				}
			 else if(iInc == 11)
			 	{sMarilee = "I do wish I'd brought a parasol. I have the sweetest pink one from Kara Tur. That's someplace far away that somebody like you wouldn't have heard of. It's pink with little clouds and birds all over it. The parasol, not Kara Tur, although I guess it has clouds and birds, too. But I'm not sure about the pink. And I doubt it has tassles.";
				}
			 else if(iInc == 12)
			 	{sMarilee = "Why is that boy looking at me? I wonder if he likes my dress. Do you like my dress? I do look pretty, don't I? I really want to look pretty today.";
				}
			 else if(iInc == 13)
			 	{sMarilee = "Daddy says I can have any man I want, you know, but he really means I can have any man he wants.";
				}
			 else if(iInc == 14)
			 	{sMarilee = "These roads are so dusty and smelly. Good thing I brought rosewater. *Splashes herself from a small bottle.* You need some, too, you know. *Splashes you and giggles* Now we both smell much nicer.";
				}
			 else if(iInc == 15)
			 	{sMarilee = "Oh no! Oh NO! This is a disaster! I can't bear it! I'm ruined! I've ripped my stockings! Oh, how will I present myself in society. I think...I think I'm going to be all right. It's just military society. Mostly men. I'll just die if the General's wife or Lady Irizarry are there. Die, I tell you!";
				}
			 else if(iInc == 16)
			 	{sMarilee = "Are those dog droppings on the side of the road? How can people let their servants get away with not cleaning up after their hounds? This is Silverymoon, after all.";
				}
			 else if(iInc == 17)
			 	{sMarilee = "When I get married, I'm going to wear a white gown, with pink slashing and gold gussets. Solid gold. And a veil of pink lace.";
				}
			 else if(iInc == 18)
			 	{sMarilee = "You're certainly a quiet one. Doesn't your training bring you into contact with the nobility often? I would have thought a Knight would be more comfortable with the upper class.";
				}
			 else if(iInc == 19)
			 	{sMarilee = "I don't know why Daddy doesn't let me have a carriage for these visits. It takes so much longer this way.";
				}
			 else if(iInc == 20)
			 	{sMarilee = "When Gareth marries me, he'll be Lord Lieutenant Lairdmoor.  I think he likes that, but I'm not so sure Daddy does.";
				}
			 else if(iInc == 21)
			 	{sMarilee = "Did you hear a rustling? Do you think it's a bear? Caroline Temperman saw a dancing bear, once. She said it was terribly scary. And cute at the same time. Kinda like Knight Grand Commander Alathar.";
				}
			 else if((iInc == 22) && (Random(2) == 1) && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1))
			 	{	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Look at those dogs. Nice doggy woggy, nice puppy wuppy. Sweetums puppy so huggable and snuggly....";
					 effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vDog = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lDog = Location(GetArea(OBJECT_SELF), vDog, GetFacing(OBJECT_SELF));
					 object oDog1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_garygan", lDog);
					 SetFirstName(oDog1, "Feral Dog");
					 AssignCommand(oDog1, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog1, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oDog1, STANDARD_FACTION_HOSTILE);
					 object oDog2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_ahrnhand ", lDog);
					 SetFirstName(oDog2, "Feral Dog");
					 AssignCommand(oDog2, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog2, ActionAttack(oMaster, FALSE));
					 ActionMoveAwayFromObject(oDog1, TRUE, 20.0);
					 ChangeToStandardFaction(oDog2, STANDARD_FACTION_HOSTILE);
					 DelayCommand(20.0, ActionSpeakString("I hope you didn't hurt them badly! I love puppies!", TALKVOLUME_TALK));
				
			 		 }
					 
				else if((iInc == 22)  && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1)) 
			 	{  	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Oh, look. Does that man want something? Go see.";
				     effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vBandit = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lBandit = Location(GetArea(OBJECT_SELF), vBandit, GetFacing(OBJECT_SELF));
					 object oBandit = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_norsecommonerm", lBandit);
					 SetFirstName(oBandit, "Bandit");
					 AssignCommand(oBandit, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oBandit, ActionSpeakString("Your money or your life!", TALKVOLUME_TALK));
					 AssignCommand(oBandit, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oBandit, STANDARD_FACTION_HOSTILE);
					 ActionMoveAwayFromObject(oBandit, TRUE, 20.0);
					 DelayCommand(20.0, ActionSpeakString("What did that beggar want? Did you have to hit him quite so hard? Which way does this gown look better? Hiked up or with the bodice pulled down? Maybe both.", TALKVOLUME_TALK));
				}
					
			 else if(iInc == 22)
			 	{sMarilee = "I was reading a book the other day -- well, listening to Mummy's bard -- and the hero was a knight in silver and he carried his lady love when she swooned from...um...I think it was jaundice or maybe that was her name but he carried her through a raging river and some sort of snowstorm on a mountain and he had to keep her warm with his own body. *Giggles* Not that it would be appropriate for you to do so. *Giggles*";
				}
			 else if(iInc == 23)
			 	{sMarilee = "Are we almost there? I'm nearly fainting with exertion. Gareth had better appreciate what I do for him.";
				}
			else if((iInc == 24) && (Random(2) == 1) && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1))
			 	{	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Look at those dogs. Nice doggy woggy, nice puppy wuppy. Sweetums puppy so huggable and snuggly....";
					 effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vDog = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lDog = Location(GetArea(OBJECT_SELF), vDog, GetFacing(OBJECT_SELF));
					 object oDog1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_garygan", lDog);
					 SetFirstName(oDog1, "Feral Dog");
					 AssignCommand(oDog1, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog1, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oDog1, STANDARD_FACTION_HOSTILE);
					 object oDog2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_ahrnhand ", lDog);
					 SetFirstName(oDog2, "Feral Dog");
					 AssignCommand(oDog2, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog2, ActionAttack(oMaster, FALSE));
					 ActionMoveAwayFromObject(oDog1, TRUE, 20.0);
					 ChangeToStandardFaction(oDog2, STANDARD_FACTION_HOSTILE);
					 DelayCommand(20.0, ActionSpeakString("I hope you didn't hurt them badly! I love puppies!", TALKVOLUME_TALK));
				
			 		 }
					 
				else if((iInc == 24)  && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1)) 
			 	{  	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Oh, look. Does that man want something? Go see.";
				     effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vBandit = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lBandit = Location(GetArea(OBJECT_SELF), vBandit, GetFacing(OBJECT_SELF));
					 object oBandit = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_norsecommonerm", lBandit);
					 SetFirstName(oBandit, "Bandit");
					 AssignCommand(oBandit, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oBandit, ActionSpeakString("Your money or your life!", TALKVOLUME_TALK));
					 AssignCommand(oBandit, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oBandit, STANDARD_FACTION_HOSTILE);
					 ActionMoveAwayFromObject(oBandit, TRUE, 20.0);
					 DelayCommand(20.0, ActionSpeakString("What did that beggar want? Did you have to hit him quite so hard? Which way does this gown look better? Hiked up or with the bodice pulled down? Maybe both.", TALKVOLUME_TALK));
				}
			 else if(iInc == 24)
			 	{sMarilee = "I should have worn the pink ribbon, not the blue.";
				}
			 else if(iInc == 25)
			 	{sMarilee = "This must be the last part of the walk? I will need to have the house cobbler resole my slippers again.";
				}
			 else if((iInc == 26) && (Random(2) == 1) && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1))
			 	{	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Look at those dogs. Nice doggy woggy, nice puppy wuppy. Sweetums puppy so huggable and snuggly....";
					 effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vDog = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lDog = Location(GetArea(OBJECT_SELF), vDog, GetFacing(OBJECT_SELF));
					 object oDog1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_garygan", lDog);
					 SetFirstName(oDog1, "Feral Dog");
					 AssignCommand(oDog1, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog1, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oDog1, STANDARD_FACTION_HOSTILE);
					 object oDog2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_ahrnhand ", lDog);
					 SetFirstName(oDog2, "Feral Dog");
					 AssignCommand(oDog2, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog2, ActionAttack(oMaster, FALSE));
					 ActionMoveAwayFromObject(oDog1, TRUE, 20.0);
					 ChangeToStandardFaction(oDog2, STANDARD_FACTION_HOSTILE);
					 DelayCommand(20.0, ActionSpeakString("I hope you didn't hurt them badly! I love puppies!", TALKVOLUME_TALK));
				
			 		 }
					 
				else if((iInc == 26)  && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1)) 
			 	{  	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Oh, look. Does that man want something? Go see.";
				     effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vBandit = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lBandit = Location(GetArea(OBJECT_SELF), vBandit, GetFacing(OBJECT_SELF));
					 object oBandit = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_norsecommonerm", lBandit);
					 SetFirstName(oBandit, "Bandit");
					 AssignCommand(oBandit, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oBandit, ActionSpeakString("Your money or your life!", TALKVOLUME_TALK));
					 AssignCommand(oBandit, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oBandit, STANDARD_FACTION_HOSTILE);
					 ActionMoveAwayFromObject(oBandit, TRUE, 20.0);
					 DelayCommand(20.0, ActionSpeakString("What did that beggar want? Did you have to hit him quite so hard? Which way does this gown look better? Hiked up or with the bodice pulled down? Maybe both.", TALKVOLUME_TALK));
				}
			else if(iInc == 26)
			 	{sMarilee = "I want some iced wine. I hope the Keep servants have it waiting.";
				}
			 else if(iInc == 27)
			 	{sMarilee = "When will this walk ever end!";
				}
			 else if((iInc == 28) && (Random(2) == 1) && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1))
			 	{	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Look at those dogs. Nice doggy woggy, nice puppy wuppy. Sweetums puppy so huggable and snuggly....";
					 effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vDog = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lDog = Location(GetArea(OBJECT_SELF), vDog, GetFacing(OBJECT_SELF));
					 object oDog1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_garygan", lDog);
					 SetFirstName(oDog1, "Feral Dog");
					 AssignCommand(oDog1, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog1, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oDog1, STANDARD_FACTION_HOSTILE);
					 object oDog2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_ahrnhand ", lDog);
					 SetFirstName(oDog2, "Feral Dog");
					 AssignCommand(oDog2, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog2, ActionAttack(oMaster, FALSE));
					 ActionMoveAwayFromObject(oDog1, TRUE, 20.0);
					 ChangeToStandardFaction(oDog2, STANDARD_FACTION_HOSTILE);
					 DelayCommand(20.0, ActionSpeakString("I hope you didn't hurt them badly! I love puppies!", TALKVOLUME_TALK));
				
			 		 }
					 
				else if((iInc == 28)  && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1)) 
			 	{  	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Oh, look. Does that man want something? Go see.";
				     effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vBandit = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lBandit = Location(GetArea(OBJECT_SELF), vBandit, GetFacing(OBJECT_SELF));
					 object oBandit = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_norsecommonerm", lBandit);
					 SetFirstName(oBandit, "Bandit");
					 AssignCommand(oBandit, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oBandit, ActionSpeakString("Your money or your life!", TALKVOLUME_TALK));
					 AssignCommand(oBandit, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oBandit, STANDARD_FACTION_HOSTILE);
					 ActionMoveAwayFromObject(oBandit, TRUE, 20.0);
					 DelayCommand(20.0, ActionSpeakString("What did that beggar want? Did you have to hit him quite so hard? Which way does this gown look better? Hiked up or with the bodice pulled down? Maybe both.", TALKVOLUME_TALK));
				}
			else if(iInc == 28)
			 	{sMarilee = "Are we almost there?";
				}
			 else if(iInc == 29)
			 	{sMarilee = "I'm tired.";
				}
			 else if((iInc == 30) && (Random(2) == 1) && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1))
			 	{	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Look at those dogs. Nice doggy woggy, nice puppy wuppy. Sweetums puppy so huggable and snuggly....";
					 effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vDog = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lDog = Location(GetArea(OBJECT_SELF), vDog, GetFacing(OBJECT_SELF));
					 object oDog1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_garygan", lDog);
					 SetFirstName(oDog1, "Feral Dog");
					 AssignCommand(oDog1, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog1, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oDog1, STANDARD_FACTION_HOSTILE);
					 object oDog2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_ahrnhand ", lDog);
					 SetFirstName(oDog2, "Feral Dog");
					 AssignCommand(oDog2, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog2, ActionAttack(oMaster, FALSE));
					 ActionMoveAwayFromObject(oDog1, TRUE, 20.0);
					 ChangeToStandardFaction(oDog2, STANDARD_FACTION_HOSTILE);
					 DelayCommand(20.0, ActionSpeakString("I hope you didn't hurt them badly! I love puppies!", TALKVOLUME_TALK));
				
			 		 }
					 
				else if((iInc == 30)  && (GetTag(GetArea(OBJECT_SELF)) == "6d_ext_rauvenwatchkeep") && (GetLocalInt(OBJECT_SELF, "Combat") != 1)) 
			 	{  	 SetLocalInt(OBJECT_SELF, "Combat", 1);
					 sMarilee = "Oh, look. Does that man want something? Go see.";
				     effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
					 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFreeze, OBJECT_SELF, 15.0));
					 object oMaster = GetLocalObject(OBJECT_SELF, "oMaster");
					 location lEscort = GetLocation(oMaster);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vBandit = Vector(vEscort.x - 10.0, vEscort.y - 10.0, vEscort.z);
					 location lBandit = Location(GetArea(OBJECT_SELF), vBandit, GetFacing(OBJECT_SELF));
					 object oBandit = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_norsecommonerm", lBandit);
					 SetFirstName(oBandit, "Bandit");
					 AssignCommand(oBandit, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oBandit, ActionSpeakString("Your money or your life!", TALKVOLUME_TALK));
					 AssignCommand(oBandit, ActionAttack(oMaster, FALSE));
					 ChangeToStandardFaction(oBandit, STANDARD_FACTION_HOSTILE);
					 ActionMoveAwayFromObject(oBandit, TRUE, 20.0);
					 DelayCommand(20.0, ActionSpeakString("What did that beggar want? Did you have to hit him quite so hard? Which way does this gown look better? Hiked up or with the bodice pulled down? Maybe both.", TALKVOLUME_TALK));
				}
			else if(iInc == 30)
			 	{sMarilee = "My feet hurt.";
				}
			 else if(iInc == 31)
			 	{sMarilee = "*Trudges along, drooping*";
				 SetLocalInt(OBJECT_SELF, "iInc", 27);
				}
				
			 ClearAllActions(TRUE);
			 ActionSpeakString(sMarilee, TALKVOLUME_TALK);
			 ActionForceFollowObject(oMaster, 0.5, 0);
			 DelayCommand(25.0, ExecuteScript("sm_quest_convdriven", OBJECT_SELF));	
			 
			 
			
		}
		
		
		if(GetTag(OBJECT_SELF) == "003_cr_kis_sgt_parade")
			{effect eFreeze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
			 object oPC = GetLocalObject(OBJECT_SELF, "oPC");
			 if(oPC == OBJECT_INVALID)
			 	{oPC = GetPCSpeaker();
				 SetLocalObject(OBJECT_SELF, "oPC", oPC);
				 }
			 object oKiS1 = GetLocalObject(OBJECT_SELF, "oKiS1");
			 if(oKiS1 == OBJECT_INVALID)
			 	{oKiS1 = GetNearestObjectByTag("003_cr_kis_atarms_parade", OBJECT_SELF, 1);
				 SetLocalObject(OBJECT_SELF, "oKiS1", oKiS1);
				 }
			 object oKiS2 = GetLocalObject(OBJECT_SELF, "oKiS2");
			 if(oKiS2 == OBJECT_INVALID)
			 	{oKiS2 = GetNearestObjectByTag("003_cr_kis_atarms_parade", OBJECT_SELF, 2);
				 SetLocalObject(OBJECT_SELF, "oKiS2", oKiS2);
				 }
			 object oKiS3 = GetLocalObject(OBJECT_SELF, "oKiS3");
			 if(oKiS3 == OBJECT_INVALID)
			 	{oKiS3 = GetNearestObjectByTag("003_cr_kis_atarms_parade", OBJECT_SELF, 3);
				 SetLocalObject(OBJECT_SELF, "oKiS3", oKiS3);
				 }
			 object oKiS4 = GetLocalObject(OBJECT_SELF, "oKiS4");
			 if(oKiS4 == OBJECT_INVALID)
			 	{oKiS4 = GetNearestObjectByTag("003_cr_kis_atarms_parade", OBJECT_SELF, 4);
				 SetLocalObject(OBJECT_SELF, "oKiS4", oKiS4);
				 }
			 object oKiS5 = GetLocalObject(OBJECT_SELF, "oKiS5");
			 if(oKiS5 == OBJECT_INVALID)
			 	{oKiS5 = GetNearestObjectByTag("003_cr_kis_atarms_parade", OBJECT_SELF, 5);
				 SetLocalObject(OBJECT_SELF, "oKiS5", oKiS5);
				 }
			 object oKiSX1 = GetLocalObject(OBJECT_SELF, "oKiSX1");
			 if(oKiSX1 == OBJECT_INVALID)
			 	{oKiSX1 = GetNearestObjectByTag("003_cr_kis_xbow", OBJECT_SELF, 1);
				 SetLocalObject(OBJECT_SELF, "oKiSX1", oKiSX1);
				 }
			 object oKiSX2 = GetLocalObject(OBJECT_SELF, "oKiSX2");
			 if(oKiSX2 == OBJECT_INVALID)
			 	{oKiSX2 = GetNearestObjectByTag("003_cr_kis_xbow", OBJECT_SELF, 5);
				 SetLocalObject(OBJECT_SELF, "oKiSX2", oKiSX2);
				 }
				 
			 object oKiS;
			 int iInc = GetLocalInt(OBJECT_SELF, "iInc") + 1;
			 if(iInc == 1)
			 	{oKiS = oKiS1;
				}
			else if(iInc == 2)
			 	{oKiS = oKiS2;
				}	
			else if(iInc == 3)
			 	{oKiS = oKiS3;
				}	
			else if(iInc == 4)
			 	{oKiS = oKiS4;
				}	
			else if(iInc == 5)
			 	{oKiS = oKiS5;
				 iInc = 1;
				}	
				
			if((_GetNLDState(oPC) != 2) && (GetLocalInt(oPC, "kis_combat_03_win") < 5))
				  	{if(_GetNLDMode(oKiS) == FALSE)
					 	{ACR_ToggleNLDMode(oKiS);
						 }
					 if(GetLocalInt(oKiS, "Subdued") != 1)
					 	{AssignCommand(oKiS, ActionAttack(oPC, FALSE));
						}
					 SetLocalInt(OBJECT_SELF, "iInc", iInc);
					 DelayCommand(5.0, ExecuteScript("sm_quest_convdriven", OBJECT_SELF));
					}
			 if(GetLocalInt(oPC, "kis_combat_03_win") >= 5)
			 	{ActionSpeakString("Halt the fight! Victory to the recruit! Get over here, recruit!", TALKVOLUME_TALK);
				 ACR_AddPersistentJournalQuestEntry("kis_combat_03", 3, oPC, FALSE, FALSE, FALSE, FALSE);
				 }
			 if(_GetNLDState(oPC) == 2)
			 	{ActionSpeakString("Halt the fight! Swords down! When you are done with that cobblestone nap, come talk to me, recruit!", TALKVOLUME_TALK);
				 ACR_AddPersistentJournalQuestEntry("kis_combat_03", 3, oPC, FALSE, FALSE, FALSE, FALSE);
				 }	
			
			}
}			 			 