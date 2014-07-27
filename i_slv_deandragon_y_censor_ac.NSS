
//Wynna September 2009

 
#include "acr_items_i"
#include "acr_db_persist_i"
#include "acr_quest_i"

void main()
{	
	object oModule = GetModule();
	object oStudent = OBJECT_SELF;
		if(GetIsPC(oStudent) != TRUE)
		{SendMessageToAllDMs("GetIsPC(oStudent) != TRUE");
		 oStudent = GetItemActivator();
		 }
	object oDean = GetLocalObject(OBJECT_SELF, "oDean");
	if(oDean == OBJECT_INVALID)
		{oDean = GetObjectByTag("003_cr_slv_dean");
		 SetLocalObject(OBJECT_SELF, "oDean", oDean);
		}
    object oAbj = GetLocalObject(OBJECT_SELF, "oAbj");
	if(oAbj == OBJECT_INVALID)
		{oAbj = GetNearestObjectByTag("003_cr_slv_profabj");
		 SetLocalObject(OBJECT_SELF, "oAbj", oAbj);
		 }
	object oCon = GetLocalObject(OBJECT_SELF, "oCon");
	if(oCon == OBJECT_INVALID)
		{oCon = GetNearestObjectByTag("003_cr_slv_profcon");
		 SetLocalObject(OBJECT_SELF, "oCon", oCon);
		 }
	object oDiv = GetLocalObject(OBJECT_SELF, "oDiv");
	if(oDiv == OBJECT_INVALID)
		{oDiv = GetNearestObjectByTag("003_cr_slv_profdiv");
		 SetLocalObject(OBJECT_SELF, "oDiv", oDiv);
		 }
	object oEnc = GetLocalObject(OBJECT_SELF, "oEnc");
	if(oEnc == OBJECT_INVALID)
		{oEnc = GetNearestObjectByTag("003_cr_slv_profenc");
		 SetLocalObject(OBJECT_SELF, "oEnc", oEnc);
		 }
	object oEvo = GetLocalObject(OBJECT_SELF, "oEvo");
	if(oEvo == OBJECT_INVALID)
		{oEvo = GetNearestObjectByTag("003_cr_slv_profevo");
		 SetLocalObject(OBJECT_SELF, "oEvo", oEvo);
		 }
	object oIll = GetLocalObject(OBJECT_SELF, "oIll");
	if(oIll == OBJECT_INVALID)
		{oIll = GetNearestObjectByTag("003_cr_slv_profill");
		 SetLocalObject(OBJECT_SELF, "oIll", oIll);
		 }
	object oNec = GetLocalObject(OBJECT_SELF, "oNec");
	if(oNec == OBJECT_INVALID)
		{oNec = GetNearestObjectByTag("003_cr_slv_profnec");
		 SetLocalObject(OBJECT_SELF, "oNec", oNec);
		 }
	object oTra = GetLocalObject(OBJECT_SELF, "oTra");
	if(oTra == OBJECT_INVALID)
		{oTra = GetNearestObjectByTag("003_cr_slv_proftra");
		 SetLocalObject(OBJECT_SELF, "oTra", oTra);
		 }
		
			  

	int iRep = GetLocalInt(oModule, "Deandragon_Y_Rep");
	effect eGlobe = EffectVisualEffect(553, FALSE);
	effect ePatterns = EffectVisualEffect(VFX_AOE_WEB_OF_PURITY, FALSE);
	effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE, FALSE);
	effect eSmoke = EffectVisualEffect(476, FALSE);
	effect eParalyze = EffectParalyze(50, SAVING_THROW_WILL, FALSE);
	effect eHolyStrike = EffectVisualEffect(626, FALSE);
	effect eHolyPulse = EffectVisualEffect(277, FALSE);
	effect eEarthquake = EffectVisualEffect(VFX_SPELL_HIT_EARTHQUAKE, FALSE);
	effect eMeteor = EffectVisualEffect(VFX_FNF_METEOR_SWARM, FALSE);
	effect eFireStorm = EffectVisualEffect(564, FALSE);
	effect eIceStorm = EffectVisualEffect(507, FALSE);
	object oPanic = GetObjectByTag("deandragon_panic");
	object oForest = GetObjectByTag("deandragon_forest");
	object oBattle = GetObjectByTag("deandragon_battle");
	object oScream = GetObjectByTag("deandragon_scream");
	object oOrc = GetObjectByTag("deandragon_orc");
	object oDragon = GetObjectByTag("deandragon_dragon");
	object oSkyWP = GetLocalObject(OBJECT_SELF, "oSkyWP");
	if(oSkyWP == OBJECT_INVALID)
		{oSkyWP = GetWaypointByTag("slv_roof_skywp");
		 SetLocalObject(OBJECT_SELF, "oSkyWP", oSkyWP);
		 }
	object oSkyWP2 = GetLocalObject(OBJECT_SELF, "oSkyWP2");
	if(oSkyWP2 == OBJECT_INVALID)
		{oSkyWP2 = GetWaypointByTag("slv_roof_skywp2");
		 SetLocalObject(OBJECT_SELF, "oSkyWP2", oSkyWP2);
		 }
			  
	DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSmoke, GetLocation(oStudent), 10.0));
			 		 	 
		if(iRep == 10)
			{FloatingTextStringOnCreature("*The raging dragons fade, to be replaced by a woman of otherworldly beauty, her fey heritage obvious in the delicate bones and glinting eyes. She holds a snaking silver staff and wears a mask with a gem inset into the brow. Close beside her stands a small but protective golden dragon.", oStudent, TRUE, 15.0);
			 DelayCommand(10.0, AssignCommand(oDean, ActionSpeakString("And there we have the source. Lady Elesta. The first to partner with a Gold, the wyrmling Ardeorowym. The founder of House Elesta and an enchantress of almost incomprehensible power. Look on the face of greatness.", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oElesta = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_elesta", GetLocation(oSkyWP));
			 object oArdeorowym = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deandragon_y_dragon", GetLocation(oSkyWP)); 
			 DestroyObject(oElesta, 30.0);
			 DestroyObject(oArdeorowym, 30.0);
			 DelayCommand(35.0, FloatingTextStringOnCreature("*The smoke has dissipated, how long ago you don't know. As the images fade, there is a brief silence, and then the Dean speaks quietly.", oStudent, TRUE, 15.0));
			 SetLocalInt(oModule, "Deandragon_Y_Rep", 0);
			 DelayCommand(45.0, AssignCommand(oDean, ActionSpeakString("Why you? Think on this, and think well. Is it your part to give your knowledge, your efforts, your youth and death to this timeline? Think on it. The keyword you seek now, though, is 'Youthful'.", TALKVOLUME_TALK)));
			 DestroyObject(oDean, 600.0);
			 DestroyObject(oAbj, 600.0);
			 DestroyObject(oCon, 600.0);
			 DestroyObject(oDiv, 600.0);
			 DestroyObject(oEnc, 600.0);
			 DestroyObject(oEvo, 600.0);
			 DestroyObject(oIll, 600.0);
			 DestroyObject(oNec, 600.0);
			 DestroyObject(oTra, 600.0);
			 
		 if(ACR_RetrieveQuestState("slv_deandragon_y", oStudent) == 2)
				{DelayCommand(50.0, ACR_AddPersistentJournalQuestEntry("slv_deandragon_y", 3, oStudent, FALSE, FALSE, FALSE, FALSE));
			 	 }
		}
		if(iRep == 9)
			{ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oRhespen = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_rhespen", GetLocation(oSkyWP2));
			 object oWinterflower = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_winterflower", GetLocation(oSkyWP2));
			 object oDragonRed = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deandragon_h_dragon", GetLocation(oSkyWP2));
			 object oDragonGold = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deandragon_y_dragon", GetLocation(oSkyWP2));
			 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePatterns, oRhespen, 5.0);
			 ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, ePatterns, GetLocation(oRhespen), 15.0);
			 DelayCommand(5.0, SoundObjectPlay(oDragon));
			 DelayCommand(7.0, SoundObjectStop(oDragon));
			 DelayCommand(5.0, AssignCommand(oDean, ActionSpeakString("Occidian and all of Elven civilization would have been impossible, were it not for Winterflower and Rhespen Ash. Watch, as they raise the Dracorage Mythal.", TALKVOLUME_TALK)));
			 DelayCommand(15.0, AssignCommand(oDean, ActionSpeakString("And then watch, as the dragons rage for the first time.", TALKVOLUME_TALK)));
			 DelayCommand(17.0, ChangeToStandardFaction(oDragonRed, STANDARD_FACTION_HOSTILE));
			 DestroyObject(oRhespen, 30.0);
			 DestroyObject(oWinterflower, 30.0);
			 DestroyObject(oDragonRed, 30.0);
			 DestroyObject(oDragonGold, 30.0);
			 DelayCommand(33.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 8)
			{DelayCommand(1.0, AssignCommand(oDean, ActionSpeakString("Further back to happier times. The heyday of Occidian. *Sad smile* A center of learning and power, and Eleshor Elestar discovers the Elestar Patterns.", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oEleshor = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_eleshor", GetLocation(oSkyWP));
			 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePatterns, oEleshor, 5.0);
			 DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePatterns, oEleshor, 5.0));
			 DelayCommand(15.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePatterns, oEleshor, 5.0));
			 DelayCommand(20.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePatterns, oEleshor, 5.0));
			 DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePatterns, oEleshor, 5.0));
			 DestroyObject(oEleshor, 30.0);
			 DelayCommand(33.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 7)
			{SoundObjectPlay(oOrc);
			 DelayCommand(27.0, SoundObjectStop(oOrc));
			 DelayCommand(5.0, SoundObjectStop(oBattle));
			 DelayCommand(8.0, SoundObjectStop(oBattle));
			 DelayCommand(15.0, SoundObjectStop(oBattle));
			 DelayCommand(20.0, SoundObjectStop(oBattle));
			 FloatingTextStringOnCreature("*A crystal tower rises against the sky, with an orc horde assailing it and elven mages in fierce masks defending And then the tower shatters, exploding from within!", oStudent, TRUE, 15.0);
			 DelayCommand(15.0, AssignCommand(oDean, ActionSpeakString("The fall of Occidian. *Watching closely* After this, the survivors of homeless House Elestar left behind a single sage and departed their ruined civilization, taking with them the seeds of the yearning that caused the Sundering and the pride that caused the Crown Wars.", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oOrc1 = CreateObject(OBJECT_TYPE_CREATURE, "003_orc_captain_02", GetLocation(oSkyWP2));
			 object oOrc2 = CreateObject(OBJECT_TYPE_CREATURE, "003_orc_captain_02", GetLocation(oSkyWP2));
			 object oOrc3 = CreateObject(OBJECT_TYPE_CREATURE, "003_orc_captain_02", GetLocation(oSkyWP2));
			 object oOrc4 = CreateObject(OBJECT_TYPE_CREATURE, "003_orc_captain_02", GetLocation(oSkyWP2));
			 object oElfMage1 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_male", GetLocation(oSkyWP2));
			 object oElfMage2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_fem", GetLocation(oSkyWP2));
		     SetImmortal(oOrc1, TRUE);
			 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oOrc1, 3.0);
			 DestroyInventory(oOrc1);
			 DestroyInventory(oOrc2);
			 DestroyInventory(oOrc3);
			 DestroyInventory(oOrc4);
			 DelayCommand(20.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oOrc1, 3.0));
			 DelayCommand(24.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oOrc1, 3.0));
			 DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oStudent));
			 DelayCommand(29.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oOrc1, 3.0));
			 DelayCommand(29.0, SetImmortal(oOrc1, FALSE));
			 DestroyObject(oOrc1, 30.0);
			 DestroyObject(oOrc2, 30.0);
			 DestroyObject(oOrc3, 30.0);
			 DestroyObject(oOrc4, 30.0);
			 DestroyObject(oElfMage1, 30.0);
			 DestroyObject(oElfMage2, 30.0);
			 DelayCommand(33.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 6)
			{SoundObjectPlay(oScream);
			 DelayCommand(3.0, SoundObjectStop(oScream));
			 DelayCommand(5.0, SoundObjectPlay(oPanic));
			 DelayCommand(5.0, AssignCommand(oDean, ActionSpeakString("Mystra protect us.  *Face pale and stern. A tear shines unheeded in the corner of his eye.*  The Sundering, as those who lived through it experienced. See them flee from what they have done....", TALKVOLUME_TALK)));
			 DelayCommand(29.0, SoundObjectStop(oPanic));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eEarthquake, oStudent);
			 object oSundering1 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_male", GetLocation(oSkyWP));
			 object oSundering2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_fem", GetLocation(oSkyWP));
		     object oSundering3 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_male", GetLocation(oSkyWP));
			 object oSundering4 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_fem", GetLocation(oSkyWP));
		     object oSundering5 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_male", GetLocation(oSkyWP));
			 object oSundering6 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_fem", GetLocation(oSkyWP));
		     AssignCommand(oSundering1, ActionRandomWalk());
			 AssignCommand(oSundering2, ActionRandomWalk());
			 AssignCommand(oSundering3, ActionRandomWalk());
			 AssignCommand(oSundering4, ActionRandomWalk());
			 AssignCommand(oSundering5, ActionRandomWalk());
			 AssignCommand(oSundering6, ActionRandomWalk());
			 DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eEarthquake, oSundering1));
			 DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oStudent, 5.0));
			 DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eEarthquake, oStudent));
			 DelayCommand(15.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oSundering1, 5.0));
			 DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oSundering1, 5.0));
			 DestroyObject(oSundering1, 30.0);
			 DestroyObject(oSundering2, 30.0);
			 DestroyObject(oSundering3, 30.0);
			 DestroyObject(oSundering4, 30.0);
			 DestroyObject(oSundering5, 30.0);
			 DestroyObject(oSundering6, 30.0);
			 DelayCommand(33.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 5)
			{DelayCommand(1.0, AssignCommand(oDean, ActionSpeakString("But before there was war, there was peace, as elves established vast kingdoms. House Elestar, already a great clan, settled the North with their gold dragon allies. It was at this time that Hhora Elestar rediscovered the since lost again Elestar Patterns.", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oDragonGold = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deandragon_y_dragon", GetLocation(oSkyWP));
			 object oHhoraElestar = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_male", GetLocation(oSkyWP));
			 DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePatterns, oHhoraElestar, 10.0));
			 SetFirstName(oHhoraElestar, "Hhora Elestar");
			 DestroyObject(oDragonGold, 30.0);
			 DestroyObject(oHhoraElestar, 30.0);
			 DelayCommand(33.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 4)
			{SoundObjectPlay(oBattle);
			 FloatingTextStringOnCreature("*Peace is shattered as time rewinds further, into the battle of elf versus elf.", oStudent, TRUE, 15.0);
			 string sTelQuessir = "Younger races had not arrived, save the dwarves, and they were new to the world. There were the dragons...and the People. Where does your bloodline flow during these 3000 years of conflict?";
			 if((GetRacialType(oStudent) != RACIAL_TYPE_ELF) ||(GetRacialType(oStudent) != RACIAL_TYPE_HALFELF))
			   {sTelQuessir = "Your people had not yet arrived in this world, but time had stretched from long before this point. Where would you have stood? With whom would you have warred?";
				}
			 if(GetRacialType(oStudent) == RACIAL_TYPE_DWARF)
			   {sTelQuessir = "Your people had just arrived in this world, but time had stretched from long before this point. Where did your dwarfkin stand? With whom would you have warred?";
				}
			 DelayCommand(10.0, AssignCommand(oDean, ActionSpeakString("The Crown Wars raged here and everywhere in the North, when it was called Aryvandaar. *Softly* " + sTelQuessir, TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oCrownWars1 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_fem", GetLocation(oSkyWP2));
		     object oCrownWars2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_occ_mage_male", GetLocation(oSkyWP2));
			 object oCrownWars3 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_drow_wizard03", GetLocation(oSkyWP2));
		     object oCrownWars4 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_drow_wizard03", GetLocation(oSkyWP2));
			 SetFirstName(oCrownWars3, "Illytheri");
			 SetFirstName(oCrownWars4, "Illytheri");
			 DestroyInventory(oCrownWars1);
			 DestroyInventory(oCrownWars2);
			 DestroyInventory(oCrownWars3);
			 DestroyInventory(oCrownWars4);
			 DestroyObject(oCrownWars1, 30.0);
			 DestroyObject(oCrownWars2, 30.0);
			 DestroyObject(oCrownWars3, 30.0);
			 DestroyObject(oCrownWars4, 30.0);
			 DelayCommand(29.0, SoundObjectStop(oBattle));
			 DelayCommand(33.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 3)
			{SoundObjectPlay(oForest);
			 DelayCommand(3.0, SoundObjectStop(oForest));
			 FloatingTextStringOnCreature("*Peace...peace and pastoral beauty, as Mielikki and Lurue walk beside the Rauven in the place that will become Silverymoon.", oStudent, TRUE, 15.0);
			 DelayCommand(15.0, AssignCommand(oDean, ActionSpeakString("All reverence to the goddesses.  *Bows aged head, a smile of utter peace on his face.* Where were your ancestors at the time? What gods did they worship? Did they ever witness the gods walking among us?", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oLurueWP = GetWaypointByTag("slv_roof_luruewp");
		     object oMielikki = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deity_mielikki", GetLocation(oSkyWP));
			 object oLurue = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deity_lurue", GetLocation(oSkyWP));
			 DelayCommand(25.0, AssignCommand(oMielikki, ActionSpeakString("We shall call this place the Silver Ford, my love, and meet here forthwith with every turning of the cycle.", TALKVOLUME_TALK)));
			 DestroyObject(oMielikki, 35.0);
			 DestroyObject(oLurue, 35.0);
			 DelayCommand(38.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 2)
			{FloatingTextStringOnCreature("*The image vanishes with the squawl of a newborn babe, and images begin to flicker across the sky as if formed by the smoke, but more solid, more real than that. Alustriel?", oStudent, TRUE, 15.0);
			 DelayCommand(5.0, AssignCommand(oDean, ActionSpeakString("Ah...the great lady. I recall that blessed moment. Where were you? Were you alive? Were your parents or grandparents?", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oAlustriel = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_silverhand_alustriel", GetLocation(oSkyWP));
			 DestroyInventory(oAlustriel);
			 DelayCommand(10.0, AssignCommand(oAlustriel, ActionSpeakString("From this point onward, let our halls of learning be joined as one! I name this united center of learning...the Conclave of Silverymoon!", TALKVOLUME_TALK)));
			 DelayCommand(20.0, AssignCommand(oAlustriel, ActionSpeakString("*A much younger Alustriel* I do solemnly swear by the name of the goddess of mysteries to uphold my duties as High Mage of Silverymoon.", TALKVOLUME_TALK)));
			 DelayCommand(28.0, SoundObjectPlay(oOrc));
			 DelayCommand(30.0, AssignCommand(oAlustriel, ActionSpeakString("*Alustriel as frightened, bloodied novice, long ago.* Hold the wall! Hold it! Here they come!", TALKVOLUME_TALK)));
			 DelayCommand(32.0, AssignCommand(oAlustriel, ActionCastFakeSpellAtLocation(SPELL_METEOR_SWARM, GetLocation(oAlustriel), PROJECTILE_PATH_TYPE_DEFAULT)));
			 DelayCommand(34.0, SoundObjectStop(oOrc));
			 DestroyObject(oAlustriel, 35.0);
			 DelayCommand(38.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 1)
			{SendMessageToPC(oStudent, "Older memories speed through your mind: your adventures of late, your travels, your youth, your first love. Your childhood seems vivid, as if you live it now, then memories from so long ago you can surely not remember: your first steps, your first word...and then....a burst of nothingness that is everything! Your consciousness expands to the size of the world, of the planes, of all existence.");
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 string sYoungMale = "abr_cr_child_male";
			 string sYoungFemale = "abr_cr_child_fem";
			 object oYounger;
			 if(GetGender(oStudent) == GENDER_FEMALE)
			 	{object oYounger = CreateObject(OBJECT_TYPE_CREATURE, sYoungFemale, GetLocation(oStudent));
			 	}
			else
				{object oYounger = CreateObject(OBJECT_TYPE_CREATURE, sYoungMale, GetLocation(oStudent));
			 	}
			 SetFirstName(oYounger, GetName(oStudent) + " as a child");
			 SetScale(oYounger, 0.95, 0.95, 0.95);
			 DelayCommand(2.0, SetScale(oYounger, 0.9, 0.9, 0.9));
			 DelayCommand(4.0, SetScale(oYounger, 0.85, 0.85, 0.85));
			 DelayCommand(6.0, SetScale(oYounger, 0.8, 0.8, 0.8));
			 DelayCommand(8.0, SetScale(oYounger, 0.75, 0.75, 0.75));
			 DestroyObject(GetObjectByTag("abr_cr_child_male"), 20.0);
			 DestroyObject(GetObjectByTag("abr_cr_child_fem"), 20.0);
			 DelayCommand(23.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			  }
		if(iRep == 0)
			{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oAbj, 600.0);
			  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oCon, 600.0);
			  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oDiv, 600.0);
			  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oEnc, 600.0);
			  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oEvo, 600.0);
			  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oIll, 600.0);
			  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oNec, 600.0);
			  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oTra, 600.0);
			  
			 FloatingTextStringOnCreature("*Smoke spreads across the platform, clinging to ground and person alike. It has a pungent, woody scent, and it goes straight to the senses, dulling them and imparting light-headedness. Next to the person who broke the seal, a vision of a younger self appears, growing steadily younger!", oStudent, TRUE, 15.0);
			 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSmoke, oStudent, 10.0));
			 DelayCommand(30.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSmoke, oStudent));
			 DelayCommand(15.0, AssignCommand(oDean, ActionSpeakString("Breathe deeply and do not fear. The dizziness you feel will pass. The visions you will see will as well, so pay close attention.", TALKVOLUME_TALK)));
			 DelayCommand(25.0, SendMessageToPC(oStudent, "Numbness spreads through your body. You cannot move and do not feel part of this world at all anymore. Memories of recent events flash through your head."));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oStudent, 380.0));
			 object oYoung = CopyObject(oStudent, GetLocation(oStudent), OBJECT_INVALID, GetName(oStudent) + "_Copy");
			 ChangeToStandardFaction(oYoung, STANDARD_FACTION_COMMONER);
			 SetFirstName(oYoung, "Younger " + GetName(oStudent));
			 DestroyInventory(oYoung);
			 SetScale(oYoung, 0.95, 0.95, 0.95);
			 DelayCommand(4.0, SetScale(oYoung, 0.9, 0.9, 0.9));
			 DelayCommand(12.0, SetScale(oYoung, 0.85, 0.85, 0.85));
			 DelayCommand(20.0, SetScale(oYoung, 0.8, 0.8, 0.8));
			 DelayCommand(28.0, SetScale(oYoung, 0.75, 0.75, 0.75));
			 DelayCommand(36.0, SetScale(oYoung, 0.7, 0.7, 0.7));
			 DestroyObject(GetObjectByTag(GetName(oStudent) + "_Copy"), 38.0);
			 DelayCommand(41.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
			
		 iRep++;
		 SetLocalInt(oModule, "Deandragon_Y_Rep", iRep);
		  
			 
				 
			 
		 
		 
	
				
					
						 
}			  