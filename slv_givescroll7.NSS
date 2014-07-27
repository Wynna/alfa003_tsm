#include "silvy_univ_inc"
#include "acr_db_persist_i"

void main()
{

if(GetTag(OBJECT_SELF) == "003_cr_slv_profabj")
  {CreateItemOnObject("abr_scroll_2_resistelements", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profcon")
  {CreateItemOnObject("abr_scroll_2_summoncreat02", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profevo")
  {CreateItemOnObject("abr_scroll_2_fireburst", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profnec")
  {CreateItemOnObject("abr_scroll_2_falselife", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_proftra")
  {CreateItemOnObject("abr_scroll_2_blindsight", GetPCSpeaker(), 1);}


}