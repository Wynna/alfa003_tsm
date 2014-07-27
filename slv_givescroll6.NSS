#include "silvy_univ_inc"
#include "acr_db_persist_i"

void main()
{

if(GetTag(OBJECT_SELF) == "003_cr_slv_profabj")
  {CreateItemOnObject("abr_scroll_2_protectfromarrows", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profcon")
  {CreateItemOnObject("abr_scroll_2_melfacidarrow", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profevo")
  {CreateItemOnObject("abr_scroll_2_combust", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profnec")
  {CreateItemOnObject("abr_scroll_2_deatharmor", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_proftra")
  {CreateItemOnObject("abr_scroll_2_blgironhorn", GetPCSpeaker(), 1);}


}