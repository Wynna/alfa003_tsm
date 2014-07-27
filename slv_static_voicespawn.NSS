#include "acr_spawn_i"
#include "silvy_univ_inc"
#include "acr_db_persist_i"
#include "silvy_univ_func"
 
void main()
{

         
	if(GetTag(OBJECT_SELF)== "003_cr_slv_deanvoice")
        {object oStudent = GetLocalObject(OBJECT_SELF, "oStudent");
         string sFullName = GetName(oStudent);
         string sFirstName;
         string sLastName;
         string sMiddleName;
         string sMiddleName2;
         int nSpace = FindSubString(sFullName, " ");
         if (nSpace > -1)
            {
            sFirstName = GetStringLeft(sFullName, nSpace);
            sLastName = GetStringRight(sFullName, GetStringLength(sFullName) - nSpace);
            if(GetStringLeft(sLastName, 1) == " ")
                {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                }
                {}
                int nSpace2 = FindSubString(sLastName, " ");
                if(nSpace2 > -1)
                        {sMiddleName = GetStringLeft(sLastName, nSpace2);
                         sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - nSpace2);
                         if(GetStringLeft(sLastName, 1) == " ")
                            {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                            }
                            {}
                            int nSpace3 = FindSubString(sLastName, " ");
                            if(nSpace3 > -1)
                                {sMiddleName2 = GetStringLeft(sLastName, nSpace3);
                                 sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - nSpace3);
                                if(GetStringRight(sMiddleName2, 1) == ",")
                                   {sMiddleName2 = GetStringLeft(sMiddleName2, GetStringLength(sMiddleName2) - 1);
                                   }
                                   {}
                                if(GetStringLeft(sLastName, 1) == " ")
                                   {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                                    }
                                    {}
                                }
                                {}
                          }
                         {}
             }
            else
            {sFirstName = GetName(oStudent);
             sLastName = GetName(oStudent);
             sFullName = GetName(oStudent);
             sMiddleName = GetName(oStudent);
             sMiddleName2 = GetName(oStudent);
             }

		string sDeity = GetDeity(oStudent);
		
				 
			 
         AssignCommand(OBJECT_SELF, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectTrueSeeing(),OBJECT_SELF));
        // SetListeningPatterns();
         SetListenPattern(OBJECT_SELF, sFullName, 4999);
         SetListenPattern(OBJECT_SELF, sFirstName, 5000);
         SetListenPattern(OBJECT_SELF, sMiddleName, 5001);
         SetListenPattern(OBJECT_SELF, sMiddleName2, 5002);
         SetListenPattern(OBJECT_SELF, sLastName, 5003);
         SetListenPattern(OBJECT_SELF, "**reschedule**", 5004);
         SetListenPattern(OBJECT_SELF, "**submit**", 5005);
         SetListenPattern(OBJECT_SELF, "**receive**", 5006);
         SetListenPattern(OBJECT_SELF, "**enter**", 5007);
         SetListenPattern(OBJECT_SELF, "**Alustriel**", 5008);
         SetListenPattern(OBJECT_SELF, "**Barbarous Ways**", 5009);
         SetListenPattern(OBJECT_SELF, "**Crown Wars**", 5010);
         SetListenPattern(OBJECT_SELF, "**Deszeldaryndun Silverwing**", 5011);
         SetListenPattern(OBJECT_SELF, "**Elestar**", 5012);
         SetListenPattern(OBJECT_SELF, "**Felbar**", 5013);
         SetListenPattern(OBJECT_SELF, "**Gond**", 5014);
         SetListenPattern(OBJECT_SELF, "**Hornblade**", 5015);
         SetListenPattern(OBJECT_SELF, "**Imvaernarho**", 5016);
         SetListenPattern(OBJECT_SELF, "**Jotun Dictionary**", 5017);
         SetListenPattern(OBJECT_SELF, "**Kiira**", 5018);
         SetListenPattern(OBJECT_SELF, "**Labelas**", 5019);
         SetListenPattern(OBJECT_SELF, "**Mythal**", 5020);
         SetListenPattern(OBJECT_SELF, "**Null**", 5021);
         SetListenPattern(OBJECT_SELF, "**On the Rise and Fall**", 5022);
         SetListenPattern(OBJECT_SELF, "**Peers of the Realm**", 5023);
         SetListenPattern(OBJECT_SELF, "**Quills and Quests**", 5024);
         SetListenPattern(OBJECT_SELF, "**Rage of Dragons**", 5025);
         SetListenPattern(OBJECT_SELF, "**Sundered World**", 5026);
         SetListenPattern(OBJECT_SELF, "**Time's Witness**", 5027);
         SetListenPattern(OBJECT_SELF, "**Uthgar's Legacy**", 5028);
         SetListenPattern(OBJECT_SELF, "**Valamaradace**", 5029);
         SetListenPattern(OBJECT_SELF, "**Wearers of Purple**", 5030);
         SetListenPattern(OBJECT_SELF, "**Xorn**", 5031);
         SetListenPattern(OBJECT_SELF, "**Yalathanil**", 5032);
         SetListenPattern(OBJECT_SELF, "**Zombies, Skeletons, Ghosts and Wights**", 5033);
         SetListenPattern(OBJECT_SELF, "**Academic**", 5034);
         SetListenPattern(OBJECT_SELF, "**Bridge**", 5035);
         SetListenPattern(OBJECT_SELF, "**Crossings**", 5036);
         SetListenPattern(OBJECT_SELF, "**Distinguish**", 5037);
         SetListenPattern(OBJECT_SELF, "**Educated**", 5038);
         SetListenPattern(OBJECT_SELF, "**Futures**", 5039);
         SetListenPattern(OBJECT_SELF, "**Goal**", 5040);
         SetListenPattern(OBJECT_SELF, "**Harvest**", 5041);
         SetListenPattern(OBJECT_SELF, "**Intertemporal**", 5042);
         SetListenPattern(OBJECT_SELF, "**Journey**", 5043);
         SetListenPattern(OBJECT_SELF, "**Knowledge**", 5044);
         SetListenPattern(OBJECT_SELF, "**Location**", 5045);
         SetListenPattern(OBJECT_SELF, "**Miles**", 5046);
         SetListenPattern(OBJECT_SELF, "**Neath**", 5047);
         SetListenPattern(OBJECT_SELF, "**Occidian**", 5048);
         SetListenPattern(OBJECT_SELF, "**Passage**", 5049);
         SetListenPattern(OBJECT_SELF, "**Questers**", 5050);
         SetListenPattern(OBJECT_SELF, "**Return**", 5051);
         SetListenPattern(OBJECT_SELF, "**Serves**", 5052);
         SetListenPattern(OBJECT_SELF, "**Time's**", 5053);
         SetListenPattern(OBJECT_SELF, "**Ultimate**", 5054);
         SetListenPattern(OBJECT_SELF, "**Victory**", 5055);
         SetListenPattern(OBJECT_SELF, "**While**", 5056);
         SetListenPattern(OBJECT_SELF, "**eXtracting**", 5057);
         SetListenPattern(OBJECT_SELF, "**Youthful**", 5058);
         SetListenPattern(OBJECT_SELF, "**Zeal**", 5059);
         SetListenPattern(OBJECT_SELF, "**academic bridge crossings distinguish educated futures goal harvest intertemporal journey knowledge location miles neath occidian passage questers return serves times ultimate victory while extracting youthful zeal**", 5060);
         SetListenPattern(OBJECT_SELF, sDeity, 5061);
         SetListenPattern(OBJECT_SELF, "**Auril**", 5062);
         SetListenPattern(OBJECT_SELF, "**Mystra**", 5063);
         SetListenPattern(OBJECT_SELF, "**Flit**", 5064);
         SetListenPattern(OBJECT_SELF, "**Academic Bridge Crossings Distinguish Educated Futures Goal Harvest Intertemporal Journey Knowledge Location Miles Neath Occidian Passage Questers Return Serves Times Ultimate Victory While Extracting Youthful Zeal**", 5065);
         SetListenPattern(OBJECT_SELF, "**Yes**", 5998);
         SetListenPattern(OBJECT_SELF, "**No**", 5999);
         SetListenPattern(OBJECT_SELF, "**", 6000);
         SetListening(OBJECT_SELF, TRUE);
         DestroyObject(OBJECT_SELF, 1800.0);
         }
		 
		 
		if(GetTag(OBJECT_SELF)== "003_cr_slv_deandragon_golem")
        	{int iInc = GetLocalInt(OBJECT_SELF, "iInc");
			 if(iInc == 7)
			 	{iInc = 1;}
			 else
			 	{iInc ++;}
			 SetLocalInt(OBJECT_SELF, "iInc", iInc);
			 iInc = GetLocalInt(OBJECT_SELF, "iInc");
			 object oWaypoint = GetWaypointByTag("WP_" + GetTag(OBJECT_SELF) + IntToString(iInc));
			 ClearAllActions(TRUE);
			 ActionMoveToObject(oWaypoint, TRUE, 0.5);
			 DelayCommand(10.0, ExecuteScript("slv_static_voicespawn", OBJECT_SELF));
			 
			 }
         
		 
        }