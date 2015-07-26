
//Wynna July 2015

 
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
		{oDean = GetObjectByTag("003_cr_slv_dean_Wand");
		 SetLocalObject(OBJECT_SELF, "oDean", oDean);
		}
    object oAbj = GetLocalObject(OBJECT_SELF, "oAbj");
	if(oAbj == OBJECT_INVALID)
		{oAbj = GetNearestObjectByTag("003_cr_slv_profabj_Wand");
		 SetLocalObject(OBJECT_SELF, "oAbj", oAbj);
		 }
	object oCon = GetLocalObject(OBJECT_SELF, "oCon");
	if(oCon == OBJECT_INVALID)
		{oCon = GetNearestObjectByTag("003_cr_slv_profcon_Wand");
		 SetLocalObject(OBJECT_SELF, "oCon", oCon);
		 }
	object oDiv = GetLocalObject(OBJECT_SELF, "oDiv");
	if(oDiv == OBJECT_INVALID)
		{oDiv = GetNearestObjectByTag("003_cr_slv_profdiv_Wand");
		 SetLocalObject(OBJECT_SELF, "oDiv", oDiv);
		 }
	object oEnc = GetLocalObject(OBJECT_SELF, "oEnc");
	if(oEnc == OBJECT_INVALID)
		{oEnc = GetNearestObjectByTag("003_cr_slv_profenc_Wand");
		 SetLocalObject(OBJECT_SELF, "oEnc", oEnc);
		 }
	object oEvo = GetLocalObject(OBJECT_SELF, "oEvo");
	if(oEvo == OBJECT_INVALID)
		{oEvo = GetNearestObjectByTag("003_cr_slv_profevo_Wand");
		 SetLocalObject(OBJECT_SELF, "oEvo", oEvo);
		 }
	object oIll = GetLocalObject(OBJECT_SELF, "oIll");
	if(oIll == OBJECT_INVALID)
		{oIll = GetNearestObjectByTag("003_cr_slv_profill_Wand");
		 SetLocalObject(OBJECT_SELF, "oIll", oIll);
		 }
	object oNec = GetLocalObject(OBJECT_SELF, "oNec");
	if(oNec == OBJECT_INVALID)
		{oNec = GetNearestObjectByTag("003_cr_slv_profnec_Wand");
		 SetLocalObject(OBJECT_SELF, "oNec", oNec);
		 }
	object oTra = GetLocalObject(OBJECT_SELF, "oTra");
	if(oTra == OBJECT_INVALID)
		{oTra = GetNearestObjectByTag("003_cr_slv_proftra_Wand");
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
	object oHellgate = GetObjectByTag("deandragon_orc");
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
	object oEverfireWP = GetLocalObject(OBJECT_SELF, "oEverfireWP");
	if(oEverfireWP == OBJECT_INVALID)
		{oEverfireWP = GetWaypointByTag("slv_roof_everfire");
		 SetLocalObject(OBJECT_SELF, "oEverfireWP", oEverfireWP);
		 }
	object oConWP = GetLocalObject(OBJECT_SELF, "oConWP");
	if(oConWP == OBJECT_INVALID)
		{oConWP = GetWaypointByTag("deandragon_y_con");
		 SetLocalObject(OBJECT_SELF, "oConWP", oConWP);
		 }
			  
	DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSmoke, GetLocation(oStudent), 10.0));
			 		 	 
		if(iRep == 10)
			{ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 DelayCommand(5.0, FloatingTextStringOnCreature("*The phoenix fades, and the mountain dissipates. There is a brief silence, and then the Dean speaks quietly.", oStudent, TRUE, 15.0));
			 SetLocalInt(oModule, "Deandragon_Y_Rep", 0);
			 DelayCommand(15.0, AssignCommand(oDean, ActionSpeakString("Why you? Think on this, and think well. Is it your part to give your knowledge, your efforts, your abilities and perhaps your death to this fiery cycle?", TALKVOLUME_TALK)));
			 DelayCommand(25.0, AssignCommand(oDean, ActionSpeakString("Sera decided that she would return to her home, to preserve the phoenix, and the students involved in attempting its theft. Think on your part. The keyword you seek now, though, is 'Yard'.", TALKVOLUME_TALK)));
			 DelayCommand(550.0, SetPlotFlag(oCon, FALSE));
			 DelayCommand(550.0, SetPlotFlag(oNec, FALSE));
			 
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
				{DelayCommand(30.0, ACR_AddPersistentJournalQuestEntry("slv_deandragon_y", 3, oStudent, FALSE, FALSE, FALSE, FALSE));
			 	 }
		}
		if(iRep == 9)
			{ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oEverfire = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_everfire_image", GetLocation(oEverfireWP));
			 object oSmoke = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "slv_tra100_smoke", GetLocation(oEverfireWP));
			 object oPhoenix = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deanphoenix_fire", GetLocation(oSkyWP2));
			 DelayCommand(5.0, SoundObjectPlay(oDragon));
			 DelayCommand(5.0, AssignCommand(oDean, ActionSpeakString("The apprentice became the new Forgemaster. The humans took up residence in the dwarven citadel and from them are most of today's inhabitants of Sundabar descended.", TALKVOLUME_TALK)));
			 DelayCommand(15.0, AssignCommand(oDean, ActionSpeakString("The phoenix was reborn, and has been reborn many times since then. It has become a legend around Sundabar, rarely seen, even forgotten.", TALKVOLUME_TALK)));
			 DelayCommand(25.0, AssignCommand(oDean, ActionSpeakString("Those of us who study history, and magical beasts, know, though, that a bond has been forged between the fate of Sundabar and the life of the phoenix.", TALKVOLUME_TALK)));
			 DelayCommand(35.0, AssignCommand(oDean, ActionSpeakString("The Everfire always rumbles when the life cycle of the bird is coming full circle. It is the seal of the deal with Kossoth. The promise, and the payment.", TALKVOLUME_TALK)));
			 DelayCommand(45.0, AssignCommand(oDean, ActionSpeakString("It is both restraint and replenishment of the elemental power that abides within the Everfire.", TALKVOLUME_TALK)));
			 DestroyObject(oEverfire, 50.0);
			 DestroyObject(oSmoke, 50.0);
			 DestroyObject(oPhoenix, 50.0);
			 DelayCommand(53.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 8)
			{object oForgemaster = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_sund_hoaraxe", GetLocation(oSkyWP2));
			 object oEverfire = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_everfire_image", GetLocation(oEverfireWP));
			 object oSmoke = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "slv_tra100_smoke", GetLocation(oEverfireWP));
			 object oHellgate1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
			 object oHellgate2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
			 object oPrince = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_astalmo", GetLocation(oSkyWP2));
		     SetFirstName(oForgemaster, "Sundabar Forgemaster");
			 DelayCommand(1.0, AssignCommand(oDean, ActionSpeakString("Oh, history records it as the heroic Foregemaster going to the rescue of a prince of Ascalhorn, while Sundabar huddled behind walls of molten rock. And so he did. And so it did.", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 DelayCommand(10.0, AssignCommand(oDean, ActionSpeakString("While they fought at Turnstone, back at home lava flowed freely, in the walls, in the sky. The phoenix mounted to the clouds and though the fact was lost to many, when the Forgemaster fell at Turnstone, never again to return to his city, the bird plunged deep into a vent belching lava onto the surface, into the rift, to self-immolate.", TALKVOLUME_TALK)));
			 DelayCommand(20.0, AssignCommand(oDean, ActionSpeakString("Cause or effect, whether the death of the bird celebrated the end of the demons or mourned the death of the Forgemaster, is unknown.", TALKVOLUME_TALK)));
			 DelayCommand(20.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMeteor, oEverfire, 5.0));
			 DelayCommand(26.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMeteor, oEverfire, 3.0));
			 DestroyInventory(oPrince);
			 DestroyInventory(oForgemaster);
			 DestroyInventory(oHellgate1);
			 DestroyInventory(oHellgate2);
			 DestroyObject(oForgemaster, 30.0);
			 DestroyObject(oPrince, 30.0);
			 DestroyObject(oHellgate1, 30.0);
			 DestroyObject(oHellgate2, 30.0);
			 DestroyObject(oEverfire, 30.0);
			 DestroyObject(oSmoke, 30.0);
			 DelayCommand(36.0, AssignCommand(oDean, ActionSpeakString("What is known is that Sundabar prospered.", TALKVOLUME_TALK)));
			 DelayCommand(39.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 7)
			{DelayCommand(27.0, SoundObjectStop(oPanic));
			 DelayCommand(5.0, SoundObjectStop(oBattle));
			 DelayCommand(8.0, SoundObjectStop(oBattle));
			 DelayCommand(15.0, SoundObjectStop(oBattle));
			 DelayCommand(20.0, SoundObjectStop(oBattle));
			 DelayCommand(15.0, AssignCommand(oDean, ActionSpeakString("*Ruefully* Kossoth, it seems, was willing to listen, and flex a fiery muscle.", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oHellgate1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
			 object oHellgate2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
			 object oHellgate3 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
			 object oHellgate4 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
			 SetImmortal(oHellgate1, TRUE);
			 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oHellgate1, 3.0);
			 DestroyInventory(oHellgate1);
			 DestroyInventory(oHellgate2);
			 DestroyInventory(oHellgate3);
			 DestroyInventory(oHellgate4);
			 DelayCommand(20.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oHellgate1, 3.0));
			 DelayCommand(22.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHolyStrike, oHellgate2, 3.0));
			 DelayCommand(24.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEarthquake, oHellgate1, 3.0));
			 DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oStudent));
			 DelayCommand(26.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMeteor, oHellgate3, 3.0));
			 DelayCommand(27.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, oStudent));
			 DelayCommand(29.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHolyStrike, oHellgate1, 3.0));
			 DelayCommand(29.0, SetImmortal(oHellgate1, FALSE));
			 DelayCommand(30.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMeteor, oHellgate4, 3.0));
			 DestroyObject(oHellgate1, 30.0);
			 DestroyObject(oHellgate2, 30.0);
			 DestroyObject(oHellgate3, 30.0);
			 DestroyObject(oHellgate4, 30.0);
			 DelayCommand(33.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 6)
			{object oForgemaster = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_sund_hoaraxe", GetLocation(oSkyWP));
			 object oApprentice = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_sund_hoaraxe", GetLocation(oSkyWP));
			 object oEverfire = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_everfire_image", GetLocation(oEverfireWP));
			 object oSmoke = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "slv_tra100_smoke", GetLocation(oEverfireWP));
			 SetFirstName(oApprentice, "Everfire Apprentice");
			 SetFirstName(oForgemaster, "Sundabar Forgemaster");
			 SoundObjectPlay(oScream);
			 DelayCommand(3.0, SoundObjectStop(oScream));
			 DelayCommand(5.0, SoundObjectPlay(oPanic));
			 DelayCommand(1.0, AssignCommand(oDean, ActionSpeakString("The Forgemaster of Sundabar, though, knew that gates and walls alone would not keep out this enemy. If mighty Ascalhorn could fall, Sundabar was doomed.", TALKVOLUME_TALK)));
			 DelayCommand(10.0, AssignCommand(oDean, ActionSpeakString("Legend spoke of a power tapped deep inside the volcano, the essence of elemental fire, but sentient. Alive.", TALKVOLUME_TALK)));
			 DelayCommand(20.0, FloatingTextStringOnCreature("*They will follow us into the depths and herd us into the volcanic rift if we retreat, for anywhere we may survive will only find them stronger! We must wake the volcano to our need. We must turn nature to sentient defense. We must rouse the phoenix!", oForgemaster, TRUE, 15.0));
			 DelayCommand(30.0, AssignCommand(oDean, ActionSpeakString("Long had it been known that the phoenixes found in the region were aspects of this power, the smallest of sparks cast off from its essence.", TALKVOLUME_TALK)));
			 DelayCommand(40.0, AssignCommand(oDean, ActionSpeakString("They were a sentience, the minds tied to the bodily cycle of the volcano, to the ebbs and flows that were its heartbeat and the sulferous fumes that were its breath.", TALKVOLUME_TALK)));
			 DelayCommand(50.0, AssignCommand(oDean, ActionSpeakString("The Forgemaster determined to go out to meet the enemy, but meanwhile he sent an apprentice deep into the Everfire, beyond the lavas tamed for use in citadel forges, into the very rift beneath.", TALKVOLUME_TALK)));
			 DelayCommand(60.0, AssignCommand(oDean, ActionSpeakString("While his master fought demons in Turnstone Pass, the apprentice sought out the phoenix, to plead with it to bring the volcano's power to the defense of Sundabar.", TALKVOLUME_TALK)));
			 DelayCommand(70.0, AssignCommand(oDean, ActionSpeakString("He took with him a specially fashioned harness for the bird, a magical jess, to both damp down and bind the powers of fire. He took also such tokens of elemental fire as could be found, to placate whatever he might find below.", TALKVOLUME_TALK)));
			 DelayCommand(80.0, AssignCommand(oDean, ActionSpeakString("A brave plan, a visionary plan! What was not known then was that the power behind the phoenix, the power so long sensed within the Everfire was a manifestation...of Kossoth.", TALKVOLUME_TALK)));
			 DestroyInventory(oApprentice);
			 DestroyInventory(oForgemaster);
			 DestroyObject(oForgemaster, 55.0);
			 DestroyObject(oApprentice, 85.0);
			 DestroyObject(oEverfire, 85.0);
			 DestroyObject(oSmoke, 85.0);
			 DelayCommand(85.0, SoundObjectStop(oPanic));
			 DelayCommand(90.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 5)
			{DelayCommand(1.0, AssignCommand(oDean, ActionSpeakString("Ascalhorn, now called Hellgate Keep, had fallen. There was terror, as demons pursued the refugees through Turnstone Pass.", TALKVOLUME_TALK)));
			 object oPrince = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_astalmo", GetLocation(oSkyWP2));
		     object oCommoner = CreateObject(OBJECT_TYPE_CREATURE, "03_silvy_commoner_uu", GetLocation(oSkyWP2));
			 object oCommoner2 = CreateObject(OBJECT_TYPE_CREATURE, "03_silvy_commoner_ii", GetLocation(oSkyWP2));
			 object oCommoner3 = CreateObject(OBJECT_TYPE_CREATURE, "03_silvy_commoner_vv", GetLocation(oSkyWP2));
			 object oHellgate1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
		     object oHellgate2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
		     DestroyInventory(oPrince);
			 DestroyInventory(oCommoner);
			 DestroyInventory(oCommoner2);
			 DestroyInventory(oCommoner3);
			 DestroyInventory(oHellgate1);
			 DestroyInventory(oHellgate2);
			 DelayCommand(10.0, AssignCommand(oDean, ActionSpeakString("Their prince led them, making for Sundabar, hoping they could get there and that the gates would not be closed to them.", TALKVOLUME_TALK)));
			 DestroyObject(oPrince, 30.0);
			 DestroyObject(oCommoner, 30.0);
			 DestroyObject(oCommoner2, 30.0);
			 DestroyObject(oCommoner3, 30.0);
			 DestroyObject(oHellgate1, 30.0);
			 DestroyObject(oHellgate2, 30.0);
			 DelayCommand(33.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 4)
			{SoundObjectPlay(oBattle);
			 FloatingTextStringOnCreature("*Peace is shattered elsewhere, though, in regions where not goddesses but demons walked the world.", oStudent, TRUE, 15.0);
			 DelayCommand(10.0, AssignCommand(oDean, ActionSpeakString("Cast your attention more widely, to the fringes of what is now known as Luruar. A dwarven citadel, far to the east, Sundabar...and the volcano that seethes at its heart!", TALKVOLUME_TALK)));
			 DelayCommand(20.0, AssignCommand(oDean, ActionSpeakString("In the days when cities fell and Hellgate Keep arose, Citadel Sundabar alone survived, and even took in refugees from Ascalhorn.", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 object oHellgate1 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_astalmo", GetLocation(oSkyWP2));
		     object oHellgate2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_sund_hoaraxe", GetLocation(oSkyWP2));
			 object oHellgate3 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
		     object oHellgate4 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_ou_tanarri_palrethee", GetLocation(oSkyWP2));
			 SetFirstName(oHellgate2, "Sundabar Forgemaster");
			 DestroyInventory(oHellgate1);
			 DestroyInventory(oHellgate2);
			 DestroyInventory(oHellgate3);
			 DestroyInventory(oHellgate4);
			 DestroyObject(oHellgate1, 30.0);
			 DestroyObject(oHellgate2, 30.0);
			 DestroyObject(oHellgate3, 30.0);
			 DestroyObject(oHellgate4, 30.0);
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
			{FloatingTextStringOnCreature("*With the squawl of a newborn babe, images begin to flicker across the sky as if formed by the smoke, but more solid, more real than that. Alustriel?", oStudent, TRUE, 15.0);
			 object oAlustriel = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_silverhand_alustriel", GetLocation(oSkyWP));
			 DelayCommand(10.0, AssignCommand(oDean, ActionSpeakString("Ah...the great lady. I recall that blessed moment. Where were you? Were you alive? Were your parents or grandparents?", TALKVOLUME_TALK)));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 DestroyInventory(oAlustriel);
			 DelayCommand(20.0, AssignCommand(oAlustriel, ActionSpeakString("From this point onward, let our halls of learning be joined as one! I name this united center of learning...the Conclave of Silverymoon!", TALKVOLUME_TALK)));
			 DelayCommand(30.0, AssignCommand(oAlustriel, ActionSpeakString("*A much younger Alustriel* I do solemnly swear by the name of the goddess of mysteries to uphold my duties as High Mage of Silverymoon.", TALKVOLUME_TALK)));
			 DelayCommand(40.0, AssignCommand(oAlustriel, ActionSpeakString("*Alustriel as frightened, bloodied novice, long ago.* Hold the wall! Hold it! Here they come!", TALKVOLUME_TALK)));
			 DelayCommand(40.0, AssignCommand(oAlustriel, ActionCastFakeSpellAtLocation(SPELL_METEOR_SWARM, GetLocation(oAlustriel), PROJECTILE_PATH_TYPE_DEFAULT)));
			 DestroyObject(oAlustriel, 45.0);
			 DelayCommand(48.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
		if(iRep == 1)
			{FloatingTextStringOnCreature("*Older memories speed through each viewer's mind: adventures of late, travels, youth, first loves. Childhood seems vivid, as if lived again, then memories from so long ago that can surely not be remembered: first steps, first words...and then....a burst of nothingness that is everything! Consciousness expands to the size of the world, of the planes, of all existence.", oStudent, TRUE, 15.0);
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 DelayCommand(15.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
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
			  
			 FloatingTextStringOnCreature("*Smoke spreads across the platform, clinging to ground and person alike. It has a pungent, woody scent, and it goes straight to the senses, dulling them and imparting light-headedness.", oStudent, TRUE, 15.0);
			 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSmoke, oStudent, 10.0));
			 DelayCommand(30.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSmoke, oStudent));
			 DelayCommand(15.0, AssignCommand(oDean, ActionSpeakString("Turn to the north. Breathe deeply and do not fear. The dizziness you feel will pass. The visions you will see will as well, so pay close attention.", TALKVOLUME_TALK)));
			 DelayCommand(25.0, FloatingTextStringOnCreature("*Numbness spreads through the body. Movement is difficult and there is a sensation of not feeling part of this world at all anymore. Memories of recent events flash through each viewer's mind.", oStudent, TRUE, 15.0));
			 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHolyPulse, oStudent);
			 DelayCommand(41.0, ExecuteScript("i_slv_deandragon_y_censor_ac", oStudent));
			 }
			
		 iRep++;
		 SetLocalInt(oModule, "Deandragon_Y_Rep", iRep);
		  
			 
				 
			 
		 
		 
	
				
					
						 
}			  