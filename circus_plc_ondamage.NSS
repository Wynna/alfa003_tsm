//OnDamage for all Silvy Uni placeables outside the classrooms
//Wynna February 2008


#include "acr_placeable_i"

void main()
{
	ACR_PlaceableOnDamaged();
    object oPC = GetLastDamager();
    effect eHeal= EffectHeal(GetMaxHitPoints(OBJECT_SELF) - GetCurrentHitPoints(OBJECT_SELF));
		
	//Break the glass cage to release angry pixies
	if(GetTag(OBJECT_SELF)=="003_plc_circus_feycage")
		{effect eExplode = EffectVisualEffect(VFX_COM_CHUNK_STONE_MEDIUM, FALSE);
		 effect eSound = EffectVisualEffect(VFX_FNF_SOUND_BURST, FALSE);
		 object oCollision = GetLocalObject(OBJECT_SELF, "oCollision");
		 DestroyObject(oCollision);
		 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eExplode, OBJECT_SELF, 3.0);
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eSound, OBJECT_SELF);
		 
		 int nInc = 0;
		 while(nInc < 10)
			 {object oPixie=GetNearestObjectByTag("003_cr_fy_pixie", OBJECT_SELF, nInc);
			  if(GetIsObjectValid(oPixie))
			  	{ChangeToStandardFaction(oPixie, STANDARD_FACTION_HOSTILE);}
			  nInc++;
			 }
		 DestroyObject(OBJECT_SELF, 3.0);
		 }

		 
	//PC's test the amount of damage they can do to a stone
	if(GetTag(OBJECT_SELF)=="003_plc_circus_str")
		{int nDamage = GetTotalDamageDealt();
		 ActionSpeakString("*A ball is propelled upward through the tower of strength, driven by the force of your blow. A flag pops up at the top of the tower. The flag reads:*", TALKVOLUME_TALK);
		 string sRating = "";
		 if(nDamage < 1)
		 	{sRating = "Milksop!";}
		 else if(nDamage < 2)
		 	{sRating = "Weakling!";}
		 else if(nDamage < 3)
		 	{sRating = "Humdrum!";}
		 else if(nDamage < 4)
		 	{sRating = "Mediocre!";}
		 else if(nDamage < 5)
		 	{sRating = "So-So!";}
		 else if(nDamage < 6)
		 	{sRating = "Adequate!";}
		 else if(nDamage < 7)
		 	{sRating = "Decent!";}
		 else if(nDamage < 8)
		 	{sRating = "Stalwart!";}
		 else if(nDamage < 9)
		 	{sRating = "Strapping!";}
		 else if(nDamage < 10)
		 	{sRating = "Forceful!";}
		 else if(nDamage < 11)
		 	{sRating = "Doughty!";}
		 else if(nDamage < 12)
		 	{sRating = "Bruising!";}
		 else if(nDamage < 13)
		 	{sRating = "Powerful!";}
		 else if(nDamage < 14)
		 	{sRating = "Ogre Strength!";}
		 else if(nDamage < 15)
		 	{sRating = "Giant Strength!";}
		else
			{sRating = "Do you want a job?";}
		
		DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF));
		DelayCommand(3.0, ActionSpeakString(sRating, TALKVOLUME_TALK));
		}
		
		//Target practice for a score
		if(GetTag(OBJECT_SELF)=="003_plc_circus_target")
		{object oDamager = GetLastDamager();
		 
		 ActionSpeakString("*Your projectile flies through the air.*", TALKVOLUME_TALK);
		 int nDex = Random(21) + GetAbilityModifier(ABILITY_DEXTERITY, oDamager);
		 string sRating = "";
		 if(nDex < 2)
		 	{sRating = "You miss the target completely!";}
		 else if(nDex < 5)
		 	{sRating = "You strike on the outer rim of the target!";}
		 else if(nDex < 10)
		 	{sRating = "You strike a quarter of the way in from the edge of the target!";}
		 else if(nDex < 15)
		 	{sRating = "You strike halfway in from the edge of the target!";}
		 else if(nDex < 20)
		 	{sRating = "You strike near the center of the target!";}
		else
			{sRating = "Bull's Eye!";}
			
		DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF));
		DelayCommand(3.0, ActionSpeakString(sRating, TALKVOLUME_TALK));
		}
		
}			 			 