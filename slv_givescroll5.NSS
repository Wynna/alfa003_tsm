#include "silvy_univ_inc"
#include "acr_db_persist_i"

void main()
{
object oScroll;
if(GetTag(OBJECT_SELF) == "003_cr_slv_profabj")
  {oScroll = CreateItemOnObject("abr_scroll_2_lesserdispel", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profcon")
  {oScroll = CreateItemOnObject("abr_scroll_0_rayfrost", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profevo")
  {oScroll = CreateItemOnObject("abr_scroll_2_cloudbewilder", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profill")
  {oScroll = CreateItemOnObject("abr_scroll_2_mirrorimage", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profnec")
  {oScroll = CreateItemOnObject("abr_scroll_2_impblades", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_proftra")
  {oScroll = CreateItemOnObject("abr_scroll_1_lowlightvis", GetPCSpeaker(), 1);}

SetIdentified(oScroll, 1);
}