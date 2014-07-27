#include "silvy_univ_inc"
#include "acr_db_persist_i"

void main()
{
if(GetTag(OBJECT_SELF) == "003_cr_slv_profabj")
  {CreateItemOnObject("abr_scroll_0_resistance", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profcon")
  {CreateItemOnObject("abr_scroll_1_magearmor", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profdiv")
  {CreateItemOnObject("abr_scroll_1_truestrike", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profenc")
  {CreateItemOnObject("abr_scroll_1_sleep", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profevo")
  {CreateItemOnObject("abr_scroll_1_shockgrasp", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profill")
  {CreateItemOnObject("abr_scroll_2_bilinddeaf", GetPCSpeaker(), 2);}
 
if(GetTag(OBJECT_SELF) == "003_cr_slv_profnec")
  {CreateItemOnObject("abr_scroll_1_rayenfeeble", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_proftra")
  {CreateItemOnObject("abr_scroll_1_expedretreat", GetPCSpeaker(), 1);}
}