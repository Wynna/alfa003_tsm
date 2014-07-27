
#include "silvy_univ_inc"
#include "acr_quest_i"
 

void ActionCreateWyn(string sCreature, location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, sCreature, lLoc);
}

void ActionCreateWynPlace(string sPlace, location lLocPlace)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, sPlace, lLocPlace);
}
 
void main()
{
    object oStudent = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1);
    effect eGhostly = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);
    effect eBard = EffectVisualEffect(VFX_DUR_BARD_SONG);
    effect eCutScene = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY); 
    effect eSun = EffectVisualEffect(VFX_FNF_SUNBEAM, FALSE);
    effect eDeath = EffectDeath(TRUE);





   //Halls of Artifice

  
    if((GetTag(OBJECT_SELF) == "003_cr_dug_xothor") || (GetTag(OBJECT_SELF) == "003_cr_dug_xothor_war")|| (GetTag(OBJECT_SELF) == "003_cr_dug_mallechenith") )
        {ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhostly, OBJECT_SELF);
         ActionRandomWalk();
         DelayCommand(43.0, ClearAllActions());
         if((GetTag(OBJECT_SELF) == "003_cr_dug_xothor") || (GetTag(OBJECT_SELF) == "003_cr_dug_xothor_war"))
            {DestroyObject(OBJECT_SELF, 300.0);
            }
            else
            {DestroyObject(OBJECT_SELF, 300.0);
            }
         }
        


   if(GetTag(OBJECT_SELF) == "003_cr_slv_haellech")
     {if(GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_class_lvl")

        {object oProfTra = GetObjectByTag("003_cr_slv_proftra");
		 object oProfEvo = GetObjectByTag("003_cr_slv_profevo");
		 object oMirror = GetObjectByTag("slv_h_artifice_mirror");
         location lMirror2 = GetLocation(GetWaypointByTag("h_artifice_mirror"));
         object oMirror2 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_h_artifice_mirror", lMirror2, FALSE, "slv_h_artifice_mirror2");
         SetUseableFlag(oMirror2, TRUE);
		 DestroyObject(oMirror2, 500.0);
		 location lXothor1 = GetLocation(GetWaypointByTag("Xothor1"));
         location lXothor2 = GetLocation(GetWaypointByTag("Xothor2"));
         location lXothor3 = GetLocation(GetWaypointByTag("Xothor3"));
         location lXothor4 = GetLocation(GetWaypointByTag("Xothor4"));
         location lXothor5 = GetLocation(GetWaypointByTag("Xothor5"));
         location lMallechenith = GetLocation(GetWaypointByTag("Mallechenith"));
		 
		 ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhostly, OBJECT_SELF);
         ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF);
         DelayCommand(1.0, SetFacing(180.0));
         DelayCommand(4.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         AssignCommand(oMirror, DelayCommand(5.0, SpeakString("*The mirror now reflects...someone else, someone not with you, a one-eyed dwarf in battle gear. Behind him is somewhere else, as well, a mining cavern shaped into a great hall, but ruined by battle.", TALKVOLUME_TALK)));
         DelayCommand(14.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(15.0, SpeakString("I am Haellech, sudden Xothor and recorder of doom.  You stand here, thus the Gleam in the Eye has fallen on you...and allowed you to review our tragic history.  Dugmaren allow me the hope that this performance comes soon, and that I play to myself, with reinforcements and defenders surrounding as audience, too.  For now I am all there is left -- hero, hapless and historian, all in one.", TALKVOLUME_TALK));
         DelayCommand(24.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(30.0, SpeakString("Three years ago, they came upon us by stealth. I was practicing to play for Highharvestide.  High Priest Mallechenith and the brothers and sisters of the Halls went about their own preparations. The Halls, then, were always thrown open, and the coming feast had distracted all, including, it seems, the greeters at the great doors of the Entry Chambers.  The first we knew of attack was here...", TALKVOLUME_TALK));
         DelayCommand(31.0, ActionCreateWyn("003_cr_dug_xothor", lXothor1));
         DelayCommand(33.0, ActionCreateWyn("003_cr_dug_xothor_war", lXothor1));
         DelayCommand(36.0, ActionCreateWyn("003_cr_dug_xothor_war", lXothor2));
         DelayCommand(39.0, ActionCreateWyn("003_cr_dug_xothor", lXothor3));
         DelayCommand(42.0, ActionCreateWyn("003_cr_dug_xothor_war", lXothor4));
         DelayCommand(45.0, ActionCreateWyn("003_cr_dug_xothor", lXothor5));
         DelayCommand(48.0, ActionCreateWyn("003_cr_dug_mallechenith", lMallechenith));
         AssignCommand(oMirror, DelayCommand(45.0, SpeakString("*Haellech fades away and the reflection in the mirror darkens...", TALKVOLUME_TALK)));
         DelayCommand(46.0,  ActionJumpToLocation(GetLocation(GetWaypointByTag("slv_deandragon_t_enter"))));
         DelayCommand(446.0,  ActionJumpToLocation(GetLocation(GetWaypointByTag("slv_deandragon_t_exit"))));
         DelayCommand(475.0, SetFacing(180.0));
		 int nInc = 1;
		 object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, nInc);
         while(oPC != OBJECT_INVALID)
		 	{DelayCommand(50.0, FadeToBlack(oPC, FADE_SPEED_SLOWEST));
        	 DelayCommand(52.0,  AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("slv_deandragon_t_enter")))));
             DelayCommand(265.0, FadeToBlack(oPC, FADE_SPEED_SLOWEST));
             DelayCommand(445.0, FadeToBlack(oPC, FADE_SPEED_SLOWEST));
             DelayCommand(448.0,  AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("slv_deandragon_t_exit")))));
             nInc++;
			 oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, nInc);
			}
		 DelayCommand(91.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCutScene, OBJECT_SELF));
         AssignCommand(oMirror2, DelayCommand(100.0, SpeakString("*...the reflection in the mirror fades back in, and though it shows the same room, it reflects more than just Haellech.  There are Xothor of Dugmaren reflected in that mirror, an everyday scene of bustle and good cheer in a hall not yet ruined.  A dignified elder cleric walks among them, admonishing and approving by turns, clearly a higher cleric.  He is addressed as Mallechenith by many.", TALKVOLUME_TALK)));
         DelayCommand(101.0, PlaySound("as_pl_chantingm1"));
         DelayCommand(106.0, PlaySound("as_pl_noblaughi1"));
         DelayCommand(111.0, PlaySound("as_pl_chantingm1"));
         DelayCommand(112.0, PlaySound("as_pl_laughingm1"));
         DelayCommand(116.0, SpeakString("There were shrieks in the stairwell, and the undead came pouring in.  We should have known.  That is when we should have known...", TALKVOLUME_TALK));
         DelayCommand(118.0, PlaySound("as_pl_shriekm1"));
         DelayCommand(118.0, ActionCreateWyn("abr_cr_un_zombie_soldier01", lXothor5));
         DelayCommand(120.0, ActionCreateWyn("abr_cr_un_zombie_soldier04", lXothor5));
         DelayCommand(122.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard02", lXothor5));
         DelayCommand(124.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard01", lXothor2));
         DelayCommand(126.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard03", lXothor5));
         DelayCommand(128.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard02", lXothor2));
         DelayCommand(130.0, ActionCreateWyn("abr_cr_un_skeleton_giant", lXothor2));
         DelayCommand(132.0, ActionCreateWyn("abr_cr_un_zombie_soldier02", lXothor5));
         DelayCommand(132.0, PlaySound("as_pl_panicgrp2"));
         DelayCommand(137.0, ActionCreateWyn("abr_cr_un_zombie_soldier01", lXothor2));
         DelayCommand(140.0, ActionCreateWyn("abr_cr_un_zombie_soldier03", lXothor5));
         DelayCommand(141.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ClearAllActions(TRUE)));
         DelayCommand(142.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ActionCastSpellAtObject(SPELL_SUNBEAM, GetObjectByTag("nw_skelwarrkis", 0), METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
         DelayCommand(143.0, PlaySound("as_pl_panicgrp1"));
         DelayCommand(145.0, ActionCreateWyn("abr_cr_un_skeleton_sorcerer", lXothor5));
         DelayCommand(146.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard02", lXothor2));
         DelayCommand(148.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard03", lXothor5));
         DelayCommand(150.0, ActionCreateWyn("003_cr_dug_xothor_war", lXothor5));
         DelayCommand(150.0, PlaySound("as_pl_screamm1"));
         DelayCommand(153.0, ActionCreateWyn("abr_cr_un_zombie_soldier03", lXothor2));
         DelayCommand(157.0, ActionCreateWyn("abr_cr_un_zombie_soldier01", lXothor5));
         DelayCommand(160.0, ActionCreateWyn("003_cr_dug_xothor", lXothor2));
         DelayCommand(165.0, ActionCreateWyn("abr_cr_un_skeleton_icy", lXothor5));
         DelayCommand(167.0, AssignCommand(GetObjectByTag("abr_cr_un_skeleton_icy", 0), ClearAllActions(TRUE)));
         DelayCommand(168.0, AssignCommand(GetObjectByTag("abr_cr_un_skeleton_icy", 0), ActionMoveToLocation(GetLocation(GetWaypointByTag("Mallechenith")))));
         DelayCommand(169.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ClearAllActions(TRUE)));
         DelayCommand(170.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ActionJumpToLocation(GetLocation(GetWaypointByTag("Mallechenith")))));
         DelayCommand(170.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSun, GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, 1)));
         DelayCommand(175.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSun, GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, 2)));
         DelayCommand(180.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSun, GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, 3)));
         DelayCommand(185.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSun, GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, 4)));
         DelayCommand(172.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, 1)));
         DelayCommand(177.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, 2)));
         DelayCommand(182.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, 3)));
         DelayCommand(187.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, OBJECT_SELF, 4)));
         DelayCommand(190.0, AssignCommand(GetObjectByTag("abr_cr_un_skeleton_sorcerer", 0), ClearAllActions(TRUE)));
         DelayCommand(191.0, AssignCommand(GetObjectByTag("abr_cr_un_skeleton_sorcerer", 0), ActionJumpToLocation(GetLocation(GetWaypointByTag("Mallechenith")))));
         DelayCommand(192.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ClearAllActions(TRUE)));
         DelayCommand(193.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ActionJumpToLocation(GetLocation(GetWaypointByTag("Mallechenith")))));
         DelayCommand(194.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ActionCastSpellAtObject(SPELL_SUNBEAM, GetObjectByTag("abr_cr_un_skeleton_sorcerer", 0), METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
         DelayCommand(196.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, GetObjectByTag("abr_cr_un_skeleton_sorcerer", 0)));
         DelayCommand(197.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(200.0, SpeakString("Mallechenith was mighty in the defense of his god's temple.", TALKVOLUME_TALK));
         DelayCommand(212.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(215.0, SpeakString("T'was not the end, though.  The dead attacked for days, then tendays, then months.  It was a war of attrition, weighted against us, for the undead that were slain -- and our own dead -- rose again to fight against us, wearing the mark of Gargauth.  Clearly, living foes with the power to create the unliving, lurked somewhere.  We sent for aid, but it never came.", TALKVOLUME_TALK));
         DelayCommand(228.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(230.0, SpeakString("Mallechenith designed a protection, an edifice through which any attacker must pass, an archway in the Great Entry that did not suffer the tread of abominations.  With mighty prayer and the skills of mechanical artifice that raised him head and shoulders above the greatest designer of wonders even among the Xothor, he made it self-sufficient.", TALKVOLUME_TALK));
         DelayCommand(243.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(245.0, SpeakString("A stone he had discovered beneath the Halls, a stone that when crushed released power.  Xothor had been experimenting with it for years.  Recognizing that it must store power first, he...enhanced...it, and built of it.  The clergy were exhausted, and grateful to shift some of the weight of defense to this obsidious sentinal, but others wondered how he had done it or even muttered that /it/ echoed the undead itself in the way that it sucked the very power from living things around it, to use for itself.", TALKVOLUME_TALK));
         DelayCommand(258.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(262.0, SpeakString("*Softly*  But we needed it.  And it saved us when the mummy came...", TALKVOLUME_TALK));
         AssignCommand(oMirror2, DelayCommand(265.0, SpeakString("*The reflection in the mirror darkens...", TALKVOLUME_TALK)));
         
		 object oUndead = GetFirstObjectInArea(GetArea(OBJECT_SELF));
		 while(oUndead != OBJECT_INVALID)
		 	{if((GetObjectType(oUndead) == OBJECT_TYPE_CREATURE) && (GetRacialType(oUndead) == RACIAL_TYPE_UNDEAD))
				{DestroyObject(oUndead, 265.0);
         		 oUndead = GetNextObjectInArea(GetArea(OBJECT_SELF));
				}
			}
		 DelayCommand(269.0, ClearAllActions(TRUE));
		 DelayCommand(270.0, PlaySound("as_pl_chantingm1"));
         DelayCommand(273.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(275.0, SpeakString("They came at night, through the Great Door....", TALKVOLUME_TALK));
         DelayCommand(280.0, ActionCreateWyn("abr_cr_un_zombie_soldier01", lXothor5));
         DelayCommand(282.0, ActionCreateWyn("abr_cr_un_zombie_soldier04", lXothor5));
         DelayCommand(284.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard02", lXothor5));
         DelayCommand(286.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard01", lXothor2));
         DelayCommand(288.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard03", lXothor5));
         DelayCommand(290.0, ActionCreateWyn("abr_cr_un_skeleton_tombguard02", lXothor1));
         DelayCommand(295.0, ActionCreateWyn("abr_cr_un_skeleton_giant", lXothor5));
         DelayCommand(297.0, ActionCreateWyn("abr_cr_un_zombie_soldier02", lXothor5));
         DelayCommand(299.0, PlaySound("as_pl_panicgrp2"));
         DelayCommand(300.0, ActionCreateWyn("abr_cr_un_zombie_soldier01", lXothor4));
         DelayCommand(302.0, ActionCreateWyn("abr_cr_un_zombie_soldier03", lXothor5));
         DelayCommand(305.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ClearAllActions()));
         DelayCommand(306.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ActionCastSpellAtObject(SPELL_SUNBEAM, GetObjectByTag("nw_skelwarrkis", 0), METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
         DelayCommand(310.0, PlaySound("as_pl_panicgrp1"));
         DelayCommand(312.0, ActionCreateWyn("003_cr_ud_mummy", lXothor5));
         DelayCommand(315.0, PlaySound("as_pl_screamm1"));
         DelayCommand(317.0, AssignCommand(GetObjectByTag("003_cr_ud_mummy", 0), ClearAllActions()));
         DelayCommand(318.0, AssignCommand(GetObjectByTag("003_cr_ud_mummy", 0), ActionAttack(GetObjectByTag("003_cr_dug_mallechenith", FALSE))));
         DelayCommand(320.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ClearAllActions()));
         DelayCommand(321.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ActionCastSpellAtObject(SPELL_SUNBEAM, GetObjectByTag("abr_cr_un_skeleton_giant", 0), METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
         DelayCommand(325.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, GetObjectByTag("abr_cr_un_skeleton_giant", 0)));
         DelayCommand(327.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ClearAllActions()));
         DelayCommand(329.0, AssignCommand(GetObjectByTag("003_cr_dug_mallechenith", 0), ActionCastSpellAtObject(SPELL_SUNBEAM, GetObjectByTag("003_cr_ud_mummy", 0), METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE)));
         DelayCommand(330.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, GetObjectByTag("003_cr_ud_mummy", 0)));
         DelayCommand(334.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(336.0, SpeakString("There were those who said that the mummy struck Mallechenith, and those who claimed they saw him rebuke it before he slew it.  The whispers were lost, though, in the tumultuous joy that arose when the undead came no more.  The temple siege was over; the Xothor had won.", TALKVOLUME_TALK));
         DelayCommand(348.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(350.0, SpeakString("I wrote songs, paeons of praise such had never been written, and being a vain and lazy man, took them outside, to the wider audience of the world.  The Xothor set about rebuilding their Hall.  I returned two years later -- mere months ago -- expecting growth and rebirth, and found instead, disaster.", TALKVOLUME_TALK));
         DelayCommand(365.0, ActionCreateWynPlace("hrv_plc_rock_tall_black", lXothor1));
         DelayCommand(367.0, ActionCreateWynPlace("hrv_plc_rock_tall_black", lXothor2));
         DelayCommand(370.0, ActionCreateWynPlace("hrv_plc_rock_tall_black", lXothor3));
         DelayCommand(372.0, ActionCreateWynPlace("hrv_plc_rock_tall_black", lXothor4));
         DelayCommand(375.0, ActionCreateWynPlace("hrv_plc_rock_tall_black", lXothor5));
         DelayCommand(378.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(380.0, SpeakString("The obsidious material had /grown/.  It had multiplied, expanding, running wild, if stone may be said to do so.  The Halls of Artifice were soaked with magic both divine and arcane, and Mallechenith's arch had sucked it all up and used it to make more of itself that needed more power that made more crystal that needed more power that....  *Voice falters*  It had taken over, thrusting up through the very floor from the pits in which Mallechenith had once mined it.", TALKVOLUME_TALK));
         DelayCommand(393.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(395.0, SpeakString("Worse than that, not only did it suck the power from all around it, it /gorged/ itself on it, continuing to absorb whatever power it could until it overloaded and caused explosions of power.  Random waves of whatever sources it had consumed were liable to sweep the Halls at any time as it /vented/ power, before beginning to absorb more again.  A deadly cycle.  Considering some of the artifacts the Xothor had either studied or created, this blinded or killed as many as had the undead.", TALKVOLUME_TALK));
         DelayCommand(408.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(410.0, SpeakString("Mallechenith had gone mad, I was told, with shame and grief.  He had decreed the Halls lost, commanded the creation of crystal tombs that he said would preserve living guardians against some far-future day in which aid might come.  Then he had ordered himself wrapped with winding cloths like a mummy and before his acolyte's eyes had slain himself ritually.  They had tombed him in the obsidious pits beneath the Halls, honoring his last request.", TALKVOLUME_TALK));
         DelayCommand(423.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(425.0, SpeakString("On the second night after I had returned, so did Mallechenith.", TALKVOLUME_TALK));
         DelayCommand(430.0, ActionCreateWyn("003_cr_ud_mummy_priest", lMallechenith));
         DelayCommand(438.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(440.0, SpeakString("There is very little else to say, after that. The greatest chambers were destroyed, utterly, consumed by blackness. The very walls closed in, crushing those within them.", TALKVOLUME_TALK));
         
		 
		 object oEnter = GetLocalObject(OBJECT_SELF, "oEnter");
		    if(oEnter == OBJECT_INVALID)
			 	{oEnter = GetWaypointByTag("slv_deandragon_t_exit");
				 SetLocalObject(OBJECT_SELF, "oEnter", oEnter);
				}
		    
		 DestroyObject(oProfTra, 490.0);
		 DelayCommand(491.0, ActionCreateWyn("003_cr_slv_proftra", GetLocation(oEnter)));
		 DestroyObject(oProfEvo, 490.0);
		 DelayCommand(491.0, ActionCreateWyn("003_cr_slv_profevo", GetLocation(oEnter)));
		 DelayCommand(492.0, SetLocalInt(GetObjectByTag("003_cr_slv_profevo"), "Walk_Off",1));
		 DelayCommand(492.0, SetLocalInt(GetObjectByTag("003_cr_slv_proftra"), "Walk_Off",1));
		 AssignCommand(oMirror, DelayCommand(495.0, SpeakString("*The mirror once again reflects Haellech and the ruined cavern.", TALKVOLUME_TALK)));
         DelayCommand(496.0, RemoveEffect(OBJECT_SELF, eCutScene));
		 DelayCommand(497.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhostly, OBJECT_SELF));
         DelayCommand(498.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(500.0, SpeakString("We have come to see that Mallechenith was the unseen foe the whole time.  He it was who brought the dead among us.  He it was who raised the first mummy.  When he created the arch, his prayers went to Gargauth, not Dugmaren.  The obsidious material from which he built his own crypt have powered his transformation into a monster.  The Halls are indeed lost...befouled by treachery and the ancient enemy.", TALKVOLUME_TALK));
         DelayCommand(513.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(515.0, SpeakString("We are few left, a handful only.  Mallechenith cannot enter the upper Halls because of his own device, but 'tis hard to take cheer from this, as we are trapped in these upper levels with surges of magic scything through them at random intervals.", TALKVOLUME_TALK));
         DelayCommand(528.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(530.0, SpeakString("The surges are down to every few days, since we recognized that the more magic we try to cast, the more frequently the obsidious towers overload.  We none of us care to be randomly teleported by a damaged transport ring or seared by gouts of fire from the evercooking pot or have random physical and mental senses destroyed by power sourced from the illithid chair.", TALKVOLUME_TALK));
         DelayCommand(543.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(545.0, SpeakString("The real Xothor cannot defeat Mallechenith while the obsidious columns suck the power from us, or, worse, strike us down.  They cannot even defeat him after, perhaps, though that does not stop them from concentrating on trying to rid the Halls of the obsidious material.  Only then can the battle be won or lost for all time.  They will bring the Halls down upon themselves before ceding this once holy place to the demon god.", TALKVOLUME_TALK));
         DelayCommand(556.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(560.0, SpeakString("They have created this.  *Lifts the silver horn in his hand*  The crystal, like all crystals, may shatter, like a singer shattering a tavern window with a long, sustained and well trained note.  They have used it already to clear the upper levels, though not to venture down to the arch itself, where Mallechenith waits.  For that they are creating a vastly more powerful instrument of music, a gong that will shake the foundations of the mountains and destroy anything created of this material.", TALKVOLUME_TALK));
         DelayCommand(573.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(575.0, SpeakString("I will not see that, however.  The front doors are guarded by Mallechenith and his horde of undead, but a back door may exist.  The crystals thrusting up through the floor from the pits below have cracked a wall asunder and through it have wandered myconids of late, peaceful creatures who may not even comprehend the horrors that strike them down immediately.  Perhaps a great communicator such as I can convince them to help.  Perhaps they know a way out.", TALKVOLUME_TALK));
         DelayCommand(588.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(590.0, SpeakString("I am to take the horn and some of the smallest seeds of crystal for study and try to sneak through for aid from the great dwarven citadels.  *Softly*  I suspect the Xothor merely pity me and allow me to flee while they fight on, and I, the coward, accept.  They will fight a diversion as I flee, collapsing the Great Doors themselves on the heads of the undead, sealing themselves in.  Victory or death.", TALKVOLUME_TALK));
         DelayCommand(603.0, (ApplyEffectToObject(DURATION_TYPE_INSTANT, eBard, OBJECT_SELF)));
         DelayCommand(605.0, SpeakString("*Glances back*  The time comes. I will play this horn as never has bard played before, and I pray to Dugmaren that the first sound you heard upon entering here was the echo of its larger cousin, and that I, among you, hear it too.  Praise be to Dugmaren.", TALKVOLUME_TALK));
         AssignCommand(oMirror, DelayCommand(610.0, SpeakString("*The images in the mirror fade, and reflect only the room around you.", TALKVOLUME_TALK)));
         DelayCommand(610.0, AssignCommand(GetObjectByTag("003_cr_slv_proftra", 0), ActionJumpToLocation(GetLocation(oEnter))));
         DelayCommand(611.0, AssignCommand(GetObjectByTag("003_cr_slv_profevo", 0), ActionJumpToLocation(GetLocation(oEnter))));
         
		 AssignCommand(GetObjectByTag("003_cr_slv_proftra", 0), DelayCommand(612.0, SpeakString("Poor Haellech. His body was found freeze dried on the slopes of the Nether Mountains, not far from the 'back door' of the Halls. *Shakes head* He never made it, but those who found him found the way in, and the lost Halls of Artifice, thanks to him.  A little bit later we had quite an exciting first Dean's Exam to recover some of the artefacts, this among them.  *Pats the mirror.* Our current proctors were all survivors of that quest. *Cheerfully*", TALKVOLUME_TALK)));
         DelayCommand(624.0, AssignCommand(GetObjectByTag("003_cr_slv_proftra", 0), ActionJumpToLocation(GetLocation(oEnter))));
         AssignCommand(GetObjectByTag("003_cr_slv_proftra", 0), DelayCommand(625.0, SpeakString("Well done, Arky!  *Claps Arcadavera on his back.*", TALKVOLUME_TALK)));
         DelayCommand(639.0, AssignCommand(GetObjectByTag("003_cr_slv_profevo", 0), ActionJumpToLocation(GetLocation(oEnter))));
         AssignCommand(GetObjectByTag("003_cr_slv_profevo", 0), DelayCommand(640.0, SpeakString("Did you see them engender? Fabulous! Wondrous! An emphatic YES on the spontaneous manipulation of carboniferous lattice! Eh, eh? *Shouting and gesturing, he vanishes.*", TALKVOLUME_TALK)));
         DestroyObject(oProfEvo, 645.0);
         DelayCommand(654.0, AssignCommand(GetObjectByTag("003_cr_slv_proftra", 0), ActionJumpToLocation(GetLocation(oEnter))));
         AssignCommand(GetObjectByTag("003_cr_slv_proftra", 0), DelayCommand(655.0, SpeakString("*Chuckles* Well, you certainly endeared yourself to Arky, I would say. And I would say you earned this temporal stasis resonance circuit, also. How fitting that we derived it from study of this very mirror. Take it to Imogene and she'll give you a keyword, if I recall how this exam goes.", TALKVOLUME_TALK)));
         DelayCommand(667.0, ActionGiveItem(GetObjectByTag("slv_deandragon_t_tsrc"), oStudent));
		 DelayCommand(674.0, AssignCommand(GetObjectByTag("003_cr_slv_proftra", 0), ActionJumpToLocation(GetLocation(oEnter))));
         AssignCommand(GetObjectByTag("003_cr_slv_proftra", 0), DelayCommand(675.0, SpeakString("Now, if you'll excuse me, I'd best take the mirror and go see what epiphany Arky has had. *Vanishes*", TALKVOLUME_TALK)));
         DestroyObject(oProfTra, 680.0);
         DestroyObject(oMirror, 681.0);
         DestroyObject(OBJECT_SELF, 682.0);
         }

       }
 
}