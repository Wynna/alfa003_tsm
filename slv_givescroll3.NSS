#include "silvy_univ_inc"
#include "acr_db_persist_i"

void main()
{
if(GetTag(OBJECT_SELF) == "003_cr_slv_profabj")
  {CreateItemOnObject("abr_scroll_1_protfrmalign", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profcon")
  {CreateItemOnObject("abr_scroll_1_smncreat1", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profdiv")
  {CreateItemOnObject("abr_scroll_1_detectundead", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profenc")
  {CreateItemOnObject("abr_scroll_0_daze", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profevo")
  {CreateItemOnObject("abr_scroll_1_magicmissile", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profill")
  {CreateItemOnObject("abr_scroll_2_ghostlyvisage", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profnec")
  {CreateItemOnObject("abr_scroll_2_scare", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_proftra")
  {CreateItemOnObject("abr_scroll_1_magicweapon", GetPCSpeaker(), 1);}
}