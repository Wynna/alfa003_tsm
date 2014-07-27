#include "silvy_univ_inc"
#include "acr_db_persist_i"

void main()
{
if(GetTag(OBJECT_SELF) == "003_cr_slv_profabj")
  {CreateItemOnObject("abr_scroll_1_shield", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profcon")
  {CreateItemOnObject("abr_scroll_0_acidsplash", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profdiv")
  {CreateItemOnObject("abr_scroll_2_seeinvis", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profenc")
  {CreateItemOnObject("abr_scroll_2_touchidiocy", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profevo")
  {CreateItemOnObject("abr_scroll_0_light", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profill")
  {CreateItemOnObject("abr_scroll_2_invisibility", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profnec")
  {CreateItemOnObject("abr_scroll_0_touchfatigue", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_proftra")
  {CreateItemOnObject("abr_scroll_1_enlarge", GetPCSpeaker(), 1);}


}