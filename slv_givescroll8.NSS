#include "silvy_univ_inc"
#include "acr_db_persist_i"

void main()
{
object oScroll;
if(GetTag(OBJECT_SELF) == "003_cr_slv_profevo")
  {oScroll = CreateItemOnObject("abr_scroll_2_gedleeelectloop", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profcon")
  {oScroll = CreateItemOnObject("abr_scroll_2_web", GetPCSpeaker(), 1);}

if(GetTag(OBJECT_SELF) == "003_cr_slv_profnec")
  {oScroll = CreateItemOnObject("abr_scroll_2_ghoultouch", GetPCSpeaker(), 1);}

SetIdentified(oScroll, 1);
}