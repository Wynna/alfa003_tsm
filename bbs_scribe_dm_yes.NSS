int StartingConditional()
{
  if (GetLocalString(OBJECT_SELF, "#DM") != "") {
    return TRUE;
  }
  return FALSE;
}