//Silvy Uni Trigger OnEnter. All triggers.
//Wynna September 2007


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "bbs_include"

void main()
{	
	ACR_TriggerOnEnter();
	object oStudent = GetEnteringObject();
    object oMod = GetModule();
	
	 SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion, OBJECT_SELF);
	 SetLocalString(oStudent, "sSchool", "Illusion");
			
			        
	

//Elementary Illusion

		if(GetName(OBJECT_SELF) == "Illusion1") 
			{if((GetIsPC(oStudent)) && (GetLocalInt(oStudent, "Change1") == 1))
					    {object oMyChair1 = GetLocalObject(OBJECT_SELF, "oMyChair1");
						 if (oMyChair1 == OBJECT_INVALID)
								{oMyChair1 = GetObjectByTag("slv_ill100_chair1");
								SetLocalObject(OBJECT_SELF, "oMyChair1", oMyChair1);
								 }
						 object oMyChair2 = GetLocalObject(OBJECT_SELF, "oMyChair2");
						 if (oMyChair2 == OBJECT_INVALID)
								{oMyChair2 = GetObjectByTag("slv_ill100_chair2");
								SetLocalObject(OBJECT_SELF, "oMyChair2", oMyChair2);
								 }
						 object oMyLowChair1 = GetLocalObject(OBJECT_SELF, "oMyLowChair1");
						 if (oMyLowChair1 == OBJECT_INVALID)
								{oMyLowChair1 = GetObjectByTag("slv_ill100_low_chair1");
								SetLocalObject(OBJECT_SELF, "oMyLowChair1", oMyLowChair1);
								 }
						 object oMyLowChair2 = GetLocalObject(OBJECT_SELF, "oMyLowChair2");
						 if (oMyLowChair2 == OBJECT_INVALID)
								{oMyLowChair2 = GetObjectByTag("slv_ill100_low_chair2");
								SetLocalObject(OBJECT_SELF, "oMyLowChair2", oMyLowChair2);
								 }
						 object oMyRug = GetLocalObject(OBJECT_SELF, "oMyRug");
						 if (oMyRug == OBJECT_INVALID)
								{oMyRug = GetObjectByTag("slv_ill100_rug");
								SetLocalObject(OBJECT_SELF, "oMyRug", oMyRug);
								 }
						 string sLow = "003_low_chair";
						 string sMid = "003_chair";
						 string sRug = "plc_mc_rug";
						 int nRandom = Random(5) + 2;
						 string sRandom = IntToString(nRandom);
						 int nRandomRug = Random(10) + 10;
						 string sRandomRug = IntToString(nRandomRug);
						 if(nRandomRug == 11)
							{sRandom = "19";}
						 if(Random(2) == 1)
							{object oMyChair1New = CreateObject(OBJECT_TYPE_PLACEABLE, sMid + IntToString(nRandom), GetLocation (oMyChair1));
							SetUseableFlag(oMyChair1New, FALSE);
							DestroyObject(oMyChair1);
							oMyChair1 = oMyChair1New;
							SetLocalObject(OBJECT_SELF, "oMyChair1", oMyChair1New);
							}
							
						 if(Random(2) == 1)
							{object oMyChair2New = CreateObject(OBJECT_TYPE_PLACEABLE, sMid + IntToString(nRandom), GetLocation (oMyChair2));
							SetUseableFlag(oMyChair2New, FALSE);
							DestroyObject(oMyChair2);
							oMyChair2 = oMyChair2New;
							SetLocalObject(OBJECT_SELF, "oMyChair2", oMyChair2New);
							}
							
						 if(Random(2) == 1)
							{object oMyLowChair1New = CreateObject(OBJECT_TYPE_PLACEABLE, sLow + IntToString(nRandom), GetLocation (oMyLowChair1));
							SetUseableFlag(oMyLowChair1New, FALSE);
							DestroyObject(oMyLowChair1);
							oMyLowChair1 = oMyLowChair1New;
							SetLocalObject(OBJECT_SELF, "oMyLowChair1", oMyLowChair1New);
							}
							
						 if(Random(2) == 1)
							{object oMyLowChair2New = CreateObject(OBJECT_TYPE_PLACEABLE, sLow + IntToString(nRandom), GetLocation (oMyLowChair2));
							SetUseableFlag(oMyLowChair2New, FALSE);
							DestroyObject(oMyLowChair2);
							oMyLowChair2 = oMyLowChair2New;
							SetLocalObject(OBJECT_SELF,"oMyLowChair2", oMyLowChair2New);
							}
							
						if(Random(2) == 1)
							{object oMyRugNew = CreateObject(OBJECT_TYPE_PLACEABLE, sRug + sRandomRug, GetLocation (oMyRug));
							DestroyObject(oMyRug);
							oMyRug = oMyRugNew;
							SetLocalObject(OBJECT_SELF,"oMyRug", oMyRugNew);
							}
						 if(GetLocalInt(oStudent, "Change1") == 1)
						 	{DelayCommand(10.0, ExecuteScript("slv_trg_onenterclassill1", OBJECT_SELF));
							}
						 }
					}
					
					
					
			if((GetName(OBJECT_SELF) == "Ill_Boy_Destroy") && ((GetTag(oStudent) == "003_cr_slv_ill100boy") || (GetTag(oStudent) == "003_cr_slv_ill100cub")))
					{    object oMyTrigAll = GetLocalObject(OBJECT_SELF, "Ill_All");
						 if(oMyTrigAll == OBJECT_INVALID)
							{oMyTrigAll = GetNearestObjectByTag("slv_in22.00", OBJECT_SELF, 1);
							 SetLocalObject(OBJECT_SELF, "Ill_All", oMyTrigAll);
						    }
						 object oMyTrig2 = GetLocalObject(OBJECT_SELF, "oMyTrig2");
						 if(oMyTrig2 == OBJECT_INVALID)
							{oMyTrig2 = GetObjectByTag("Illusion2_trig");
							 SetLocalObject(OBJECT_SELF, "oMyTrig2", oMyTrig2);
						    }
						 object oMyTrig3 = GetLocalObject(OBJECT_SELF, "oMyTrig3");
						 if(oMyTrig3 == OBJECT_INVALID)
							{oMyTrig3 = GetObjectByTag("Illusion3_trig");
							 SetLocalObject(OBJECT_SELF, "oMyTrig3", oMyTrig3);
						    }
						 object oMyCollBox2 = GetLocalObject(oMyTrigAll, "oMyCollBox2");
						 if(oMyCollBox2 == OBJECT_INVALID)
							{oMyCollBox2 = GetObjectByTag("Illusion2_trig_CollBox200");
							 SetLocalObject(oMyTrigAll, "oMyCollBox2", oMyCollBox2);
						    }
						 object oMyBoy = GetLocalObject(oMyTrigAll, "oMyBoy");
						 if (oMyBoy == OBJECT_INVALID)
							{oMyBoy = GetObjectByTag("003_cr_slv_ill100boy");
						 	 SetLocalObject(oMyTrigAll, "oMyBoy", oMyBoy);
							 }
						  object oMyBear = GetLocalObject(oMyTrigAll, "oMyBear");
						 if (oMyBear == OBJECT_INVALID)
							{oMyBear = GetObjectByTag("003_cr_slv_ill100cub");
						 	 SetLocalObject(oMyTrigAll, "oMyBear", oMyBear);
							 }
						 object oMyMirrorBlack = GetLocalObject(oMyTrigAll, "oMyMirrorBlack");
						 if (oMyMirrorBlack == OBJECT_INVALID)
								{oMyMirrorBlack = GetObjectByTag("slv_ill200_mirrorblack");
								 SetLocalObject(oMyTrigAll, "oMyMirrorBlack", oMyMirrorBlack);
								  }
						  //DestroyObject(oMyCollBox2);
						  SetLocalObject(OBJECT_SELF, "oMyCollBox2", OBJECT_INVALID);
						  SetLocalObject(oMyTrigAll, "oMyCollBox2", OBJECT_INVALID);
						  SetLocalObject(oMyTrig2, "oMyCollBox2", OBJECT_INVALID);
						  SetLocalObject(oMyTrig3, "oMyCollBox2", OBJECT_INVALID);
						  AssignCommand(oMyBear, ActionForceMoveToObject(oMyMirrorBlack, TRUE, 0.0));
		 				  DelayCommand(1.0, AssignCommand(oMyBoy, ActionForceMoveToObject(oMyMirrorBlack, TRUE, 0.0)));
		 				  DestroyObject(oMyBear, 10.0);
						  SetLocalObject(oMyTrigAll, "oMyBear", OBJECT_INVALID);
						  DestroyObject(oMyBoy, 10.0);
						  SetLocalObject(oMyTrigAll, "oMyBoy", OBJECT_INVALID);
						  	
						}	 

}